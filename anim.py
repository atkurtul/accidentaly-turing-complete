import numpy as np
import imageio

WIDTH =32
HEIGHT=32
SCALE = 16
states = []

for i in range(0,10000):
  try:
    f = open(f"./frames/gol{i}", "r").read()
    arr = np.zeros((WIDTH*SCALE, HEIGHT*SCALE, 3), dtype=np.uint8)
    for w in range(0,WIDTH):
      for h in range(0,HEIGHT):
        arr[w*SCALE:(w+1)*SCALE,h*SCALE:(h+1)*SCALE,:] = 255 if f[w+h*WIDTH] == '1' else 0
    states.append(arr)
  except:
    break


imageio.mimsave('gol.gif', states)
