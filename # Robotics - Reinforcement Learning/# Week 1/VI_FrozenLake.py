# Value Iteration for PE in Frozen Lake - V0
# Exercise 0
'''

Movement Direction of Agent is Uncertain ( Policy is not Optimal ... just random ! )

'''


import gym
from time import sleep
import sys

env = gym.make('FrozenLake-v1') # Frozon Lake Environment

#print("Action Space : {}".format(env.action_space)) # UP DOWN RIGHT LEFT
#print("State Space : {}".format(env.observation_space)) # Discrete 16

env = gym.wrappers.TimeLimit(env, max_episode_steps = 5)

env.reset()

s = 1
a = 1

print(env.P[s][a])

done = False

# sys.exit()
env.render() # 그리기

while not done:

    new_state, reward, done, info = env.step(env.action_space.sample()) # Random으로 Action 선택 (Random Policy)
    env.render()

    print("Reward {} : New_state : {} " .format(reward, new_state))
    sleep(.1)






