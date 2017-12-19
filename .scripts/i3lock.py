import os
from PIL import Image

def screenshot():
  os.system('import -window root /tmp/.i3lock.png')

def pixelate():
  backgroundColor = (0,)*3
  pixelSize = 9

  image = Image.open('/tmp/.i3lock.png')
  
  image = image.resize((int(image.size[0]/pixelSize), int(image.size[1]/pixelSize)), Image.NEAREST)
  image = image.resize((image.size[0]*pixelSize, image.size[1]*pixelSize), Image.NEAREST)
  pixel = image.load()

  for i in range(0,image.size[0],pixelSize):
    for j in range(0,image.size[1],pixelSize):
      for r in range(pixelSize):
        pixel[i+r,j] = backgroundColor
        pixel[i,j+r] = backgroundColor

  image.save('/tmp/.i3lock.png')

def lock():
  os.system('i3lock -u -i /tmp/.i3lock.png')

if __name__=='__main__':
  screenshot()

  pixelate()

  lock()
