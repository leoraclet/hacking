# Imports PIL module
from PIL import Image
import numpy as np

# open method used to open different extension image file
image = Image.open(r"secret.png")

image = image.convert("RGB")

# Split image to channels
r, g, b = image.split()

lol = np.array(b)

print(lol)
print(lol.shape)

bits = ""
for x in range(lol.shape[0]):
    bits += str(lol[x][x] & 1)

# Convert bits to string
chars = []
for i in range(0, len(bits), 8):
    byte = bits[i:i+8]
    chars.append(chr(int(byte, 2)))

decoded_string = ''.join(chars)
print(decoded_string)
