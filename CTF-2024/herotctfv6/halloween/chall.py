#!/usr/bin/env python3
import os
import gostcrypto

with open("flag.txt", "rb") as f:
    flag = f.read()

key, iv = os.urandom(32), os.urandom(8)
cipher = gostcrypto.gostcipher.new(
    "kuznechik", key, gostcrypto.gostcipher.MODE_CTR, init_vect=iv
)

def xor_bytes(a, b):
    return bytes(x ^ y for x, y in zip(a, b))


block_size = 16

counters = [cipher.counter.hex()]
enc_flag = cipher.encrypt(flag)
print(len(enc_flag))

print(f"It's almost Halloween, time to get sp00{enc_flag.hex()}00ky 👻!")

i = 0
while True:
    print(i)
    i += 1
    counter_now = cipher.counter.hex()
    encrypted = cipher.encrypt(bytes.fromhex("00" * len(enc_flag)))
    if counter_now not in counters:
        counters.append(counter_now)
    else:
        print(counter_now, len(counters))
        print(xor_bytes(encrypted, enc_flag))
        break


# You can ask as many encryptions as you want, but you can't decrypt the flag without the key and iv.

# Chosen plaintext attack
# Diffrential cryptanalysis
