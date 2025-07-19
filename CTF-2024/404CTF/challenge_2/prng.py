from my_random import Generator


def xor(b1, b2):
    return bytes(a ^ b for a, b in zip(b1, b2))

def get_blocks(data,block_size):
	return [data[i:i+block_size] for i in range(0,len(data),block_size)]

def pad(data,block_size):
	return data+b'\x00'*(block_size-len(data)%block_size)


flag = None
encrypted = None

with open("flag.png", 'rb') as f:
    flag = f.read()
    
with open("flag.png.enc", 'rb') as f:
    encrypted = f.read()
    

print(len(flag[:-1]))
print(len(encrypted))
print()

flag_blocks = get_blocks(flag[:-1], 4)
print(len(flag_blocks))

encrypted_blocks = get_blocks(encrypted, 4)
print(len(encrypted_blocks))

keys_blocks = []

for i in range(len(flag_blocks)):
    keys_blocks.append(xor(flag_blocks[i], encrypted_blocks[i]))

all_bytes = []
for e in keys_blocks:
    for a in e:
        all_bytes.append(a)

print()
print(b"lolol\x00")

gen = Generator()
gen.feed = all_bytes.copy()[-2000:]

for j in range(573, len(encrypted_blocks)):
    flag_blocks.append(xor(gen.get_random_bytes(4), encrypted_blocks[j]))
    if j % 1000 == 0:
        print(j)

flag_data = b''.join(flag_blocks)
flag_data.rstrip(b'\0')

with open("flag_final.png",'wb') as f:
	f.write(flag_data)