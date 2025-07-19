import sys
from PIL import Image
import random

sys.set_int_max_str_digits(100000)

WIDTH = 400
HEIGHT = 200

def convert_image(image_path):
    image = Image.open(image_path).convert('L')
    pixels = list(image.getdata())
    binary_representation = ''.join(['1' if pixel == 255 else '0' for pixel in pixels])
    return int(binary_representation,2)

def encrypt_number(number,key):
    new_number = 0
    shift = 0
    while number:
        bloc = (number & 0xFFFF_FFFF_FFFF_FFFF) ^ key
        new_number |= (bloc << shift)
        number >>= 64
        shift += 64
    return new_number

# key = random.randint(0, 0xFFFF_FFFF_FFFF_FFFF)
# number = convert_image('flag.png')
# new_number = encrypt_number(number,key)

# with open('number.txt', 'w') as file:
#     file.write(str(new_number))


number = int(open('number.txt').read())
print(number.bit_length())

image_64bits_blocks = [(number >> i) & 0xFFFF_FFFF_FFFF_FFFF for i in range(0, number.bit_length(), 64)]
print(len(image_64bits_blocks))

key = image_64bits_blocks[0]
new_number = 0
shift = 0
new_number |= image_64bits_blocks[0] ^ key
for i in range(1, len(image_64bits_blocks)):
    new_number |= (image_64bits_blocks[i] ^ key) << shift
    shift += 64

pixels = []
nb = bin(new_number)[2:]
for e in nb:
    if e == '1':
        pixels.append(255)
    else:
        pixels.append(0)


image = Image.new('L', (WIDTH, HEIGHT))
image.putdata(pixels)
image.show()