import random
import gym
import numpy as np
import torch
from time import sleep
from IPython.display import clear_output

# 그림을 띄우고 뭘 하고 싶은데, 매번 그림을 띄우고 지우는 코드가 필요
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

alpha = 0.001
gamma = 0.99

# Action에 대한 가중치를 학습하는 과정
class PolicyNetwork(torch.nn.Module): # torch Module Import...
  def __init__(self):
    super().__init__() # Parent Class def __init__ 친구들 상속
    self.fcA1 = torch.nn.Linear(4, 10) # state : 4개의 실수 x1, x2, x3 ,x4
    self.fcA2 = torch.nn.Linear(10, 2) # 출력 = Action : Left or Right

  # f(x, w)
  def forward(self, x): # x : state
    x = self.fcA1(x)
    x = torch.nn.functional.relu(x)              # activation function
    x = self.fcA2(x)
    x = torch.nn.functional.softmax(x, dim = -1) # activation function
    return x

pi = PolicyNetwork().to(device) # GPU에 올리기
pi_optimizer = torch.optim.Adam(pi.parameters(), lr = alpha) # Gradient Descent 수행

def gen_epsiode():
  states , actions, rewards = [], [], []

  state = env.reset()
  done  = False
  score = 0

  while not True:

    state = torch.FloatTensor(state).to(device) # Tensor type and to GPU status
    probabilities = pi(state) # Action에 대한 확률 분포 반환
    action = torch.multinomial(probabilities, 1).item() # 반환받은 분포에서 1개를 뽑는다. (Index 반환)
    next_state, reward, done, info = env.step(action)

    if done:
      reward = -10
      env.close()

    score += reward

    states.append(state)
    actions.append(action)
    rewards.append(reward)

    state = next_state

  return states, actions, rewards, score


import math

def G(rewards):
  G = 0
  for i in range(len(rewards) - 1):
    gam = math.pow(gamma, i) # gamma의 i제곱
    G += gam*rewards[i]
  return G

env = gym.make('CartPole-v1')
episode = 0
MAX_EPISODES = 5000

# Vanilla Policy Gradient (High Level : Batch Version)
while epsiode < MAX_EPISODES:
    states, actions, rewards, score = gen_epsiode()  # 학습하는 거 아니고, 현재 조건에 따라서 생성

    # Calc G
    length = len(states)
    G = G(rewards)

    # train

    # Draw Graph

    episode += 1



