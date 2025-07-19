import struct
import numpy as np
import matplotlib.pyplot as plt

flag = None

with open('flag.raw','rb') as f:
    flag = f.read()


def get_blocks(data,block_size):
	return [data[i:i+block_size] for i in range(0,len(data),block_size)]

print(len(flag))

data = get_blocks(flag, 4)
print(len(data))
data = [struct.unpack('f', e)[0] for e in data]
print()

values = np.linspace(0, 1, 256)

final_data = get_blocks(data, 350)
print(len(final_data))

max_vals = [max(e) for e in final_data]

all_bytes = []

for val in max_vals:
    index = np.absolute(values - val).argmin()
    all_bytes.append(index)

string = b''.join([int(e).to_bytes(1, 'big')  for e in all_bytes])
print(string.hex())
print(all_bytes)

with open('lol.png', 'wb') as f:
    f.write(string)

plt.plot(data)
plt.show()

# 404CTF{L4_m0dUlAt1oN_3sT_4sS3z_maUV41s3}