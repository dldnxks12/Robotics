import numpy as np


# Angle -> 왼쪽이 양수
class CustomDriver:
    PREPROCESS_CONV_SIZE = 3
    MAX_LIDAR_DIST = 3000000
    STRAIGHTS_STEERING_ANGLE = (np.pi / 18)  # 10 degrees

    # Custom Vars
    BUBBLE_RADIUS = 160
    BEST_POINT_CONV_SIZE = 100

    MOVING_LIST = []
    MOVING_LIST2 = []

    movingAV = 0
    movingAV2 = 0
    TIME = 0

    Flag = False
    Stable = False
    Final = False
    SemiFinal = False

    # WEIGHT
    b = 0.2

    def __init__(self):
        self.radians_per_elem = None

    def preprocess_lidar(self, ranges, x, y):

        self.radians_per_elem = (2 * np.pi) / len(ranges)
        proc_ranges = np.array(ranges[135:-135])
        proc_ranges = np.convolve(proc_ranges, np.ones(self.PREPROCESS_CONV_SIZE), 'same') / self.PREPROCESS_CONV_SIZE
        proc_ranges = np.clip(proc_ranges, 0, self.MAX_LIDAR_DIST)

        return proc_ranges

    def find_max_gap(self, free_space_ranges):

        masked = np.ma.masked_where(free_space_ranges == 0, free_space_ranges)
        slices = np.ma.notmasked_contiguous(masked)

        max_len = slices[0].stop - slices[0].start
        chosen_slice = slices[0]

        for sl in slices[1:]:
            sl_len = sl.stop - sl.start
            if sl_len > max_len:
                max_len = sl_len
                chosen_slice = sl

        return chosen_slice.start, chosen_slice.stop

    def find_best_point(self, start, end, ranges):
        avg_max_gap = np.convolve(ranges[start:end], np.ones(self.BEST_POINT_CONV_SIZE),
                                  'same') / self.BEST_POINT_CONV_SIZE

        return avg_max_gap.argmax() + start  # 가장 먼 Point return

    def get_angle(self, range_index, range_len):

        lidar_angle = (range_index - (range_len / 2)) * self.radians_per_elem
        steering_angle = lidar_angle / 2

        return steering_angle

    # Custom 1
    def DISTANCE_TEMP(self, current):

        WINSIZE = 30
        self.MOVING_LIST.append(current)
        if len(self.MOVING_LIST) <= WINSIZE:
            self.movingAV = np.sum(self.MOVING_LIST) / len(self.MOVING_LIST)
            return 0, self.movingAV

        self.BEFORE = self.movingAV
        self.movingAV = self.movingAV - (self.MOVING_LIST[0] / WINSIZE) + (current / WINSIZE)
        self.AFTER = self.movingAV

        del self.MOVING_LIST[0]

        DIFF = self.AFTER - self.BEFORE
        return DIFF, self.movingAV

    # Custom 2
    def LINE_TEMP(self, LINE):

        WINSIZE = 15
        self.MOVING_LIST2.append(LINE)
        if len(self.MOVING_LIST2) <= WINSIZE:
            self.movingAV2 = np.sum(self.MOVING_LIST2) / len(self.MOVING_LIST2)
            return self.movingAV2

        self.movingAV2 = self.movingAV2 - (self.MOVING_LIST2[0] / WINSIZE) + (LINE / WINSIZE)

        del self.MOVING_LIST2[0]

        return self.movingAV2

    def process_lidar(self, ranges, coordinate):

        # Map Info
        x_sim = coordinate[0]
        y_sim = coordinate[1]

        y_map = (y_sim + 121.23484964729177) / 0.08534
        x_map = (x_sim + 156.68159080844768) / 0.08534

        proc_ranges = self.preprocess_lidar(ranges, x_map, y_map)
        left_ = proc_ranges[120]
        right_ = proc_ranges[-120]
        LINE = abs(left_ - right_)

        LINE = self.LINE_TEMP(LINE)

        closest = proc_ranges.argmin()

        min_index = closest - self.BUBBLE_RADIUS
        max_index = closest + self.BUBBLE_RADIUS

        if min_index < 0:
            min_index = 0
        if max_index > len(proc_ranges):
            max_index = len(proc_ranges) - 1

        proc_ranges[min_index:max_index] = 0
        gap_start, gap_end = self.find_max_gap(proc_ranges)
        best = self.find_best_point(gap_start, gap_end, proc_ranges)
        steering_angle = self.get_angle(best, len(proc_ranges))

        # Weights
        a = 5.0
        self.b = 0.2
        d = 0.1

        DIFF, distance = self.DISTANCE_TEMP(proc_ranges[best])
        speed = (-a * abs(steering_angle)) + (self.b * distance) + (-d * LINE) + 5

        return speed, steering_angle
