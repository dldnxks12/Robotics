import numpy as np

# np.convolue : 1D Convolution
# array를 뒤집어서 sliding 연산

# default : boundary까지 다해서 return
test1 = np.convolve([1, 2, 3], [0, 1, 0.5]) # sling에서 middle value만 가져옴

# same : Input array와 같은 크기로 return
test2 = np.convolve([1, 2, 3], [0, 1, 0.5], 'same') # sling에서 middle value만 가져옴

# valid : 완전히 겹치는 부분만 return
test3 = np.convolve([1, 2, 3], [0, 1, 0.5], 'valid') # sling에서 middle value만 가져옴

print(test1)
print(test2)
print(test3)

'''

print(test1) [0.  1.  2.5 4.  1.5]
print(test2) [1.  2.5 4. ]
print(test3) [2.5]

'''

# mask


test_arr = np.array([1,2,3,4,5, 6, 7, 8, 9, 10, 11, 12, 13])

mask = np.ma.masked_where(test_arr >= 10  , test_arr)

print(test_arr)
print(mask)

slices = np.ma.notmasked_contiguous(mask)

print(slices)
print(slices[0].start)
print(slices[0].stop)


