import os
import pwn
import pickle
import random
import string
import numpy as np
from itertools import combinations
from Crypto.Util.number import bytes_to_long, long_to_bytes

Sbox = (
	0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
	0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
	0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
	0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
	0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
	0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
	0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
	0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
	0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
	0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
	0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
	0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
	0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
	0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
	0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
	0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
)

class Feistel:
    def __init__(self,SBox,key):
        self.ROUND_NB = 96
        self.BLOCK_SIZE = 8
        self.SBox = SBox
        self.key = key
        self.round_keys = [bytes_to_long(self.key[i:i+4]) for i in range(0, 8, 4)]
        self.state = None

    def check_keys(self,key1,key2):
        return key1 == self.round_keys[0] and key2 == self.round_keys[1]

    def left_state(self):
        return self.state >> 32

    def right_state(self):
        return self.state & 0xffffffff

    def f(self,block):
        
        b1 = (block>>24) & 0xff
        b2 = (block>>16) & 0xff
        
        b2 = self.SBox[b2 ^ b1]
        b1 = self.SBox[b1] ^ b2
        
        b3 = (block>>8) & 0xff
        b3 = self.SBox[b3 ^ b1]
        
        b4 = block & 0xff
        b4 = self.SBox[b4] ^ b3
        
        return (b4<<24)+(b3<<16)+(b2<<8)+b1
        
        
    def apply_round(self,round_number):
        # XOR Right state with round key
        f_input = self.right_state()^self.round_keys[round_number%2]
        
        # LEFT state
        left = self.left_state() ^ self.f(f_input)
        
        # RIGHT state
        right = self.right_state()
        
        self.state = (left << 32)+right

    def encrypt_block(self,block):

        self.state = bytes_to_long(block)
        
        for i in range(0,self.ROUND_NB):
            self.apply_round(i)
            self.state = (self.right_state() << 32) + self.left_state()
            
        return long_to_bytes(self.state, 8)

    def decrypt_block(self,block):

        self.state = bytes_to_long(block)
        
        for i in range(0,self.ROUND_NB):
            self.state = (self.right_state() << 32) + self.left_state()
            self.apply_round(self.ROUND_NB-i-1)
            
        return long_to_bytes(self.state, 8)


# ============================================================= #
# UTILITY FUNCTIONS
# ============================================================= #

def xor(var, key):
    return bytes(a ^ b for a, b in zip(var, key))


def f_inverse(block, delta):

    b4 = (block >> 24) & 0xff
    b3 = (block >> 16) & 0xff
    b2 = (block >>  8) & 0xff
    b1 = (block >>  0) & 0xff
    
    b4 = sboxinv[b4 ^ b3]       # Correct
    b3 = sboxinv[b3] ^ b1       # Correct
    b1 = sboxinv[b1 ^ b2]       # Correct
    b2 = sboxinv[b2] ^ Sbox[b1] ^ delta # Correct
    
    return (b1 << 24) + (b2 << 16) + (b3 << 8) + b4


# ============================================================= #
# MAIN PROGRAMM
# ============================================================= #

TEST_ATTACK = True
# Number of calls: 2^18 + 2
N = 262146
QUERIES = 2**17
# Key of 8 bytes => 64 bits
key = os.urandom(8)
# Cipher
cipher = Feistel(Sbox, key)

if TEST_ATTACK:
    pwn.log.info(f"Key : {key.hex()}")


assert len(set(Sbox)) == len(Sbox)
sboxinv = [-1] * len(Sbox)
for i in range(len(Sbox)):
    sboxinv[Sbox[i]] = i


# ============================================================= #
# TEST
# ============================================================= #

"""
test_key = bytes.fromhex("975b84e10ab3e119")
A1 = bytes.fromhex("30056aba01010101")
B1 = bytes.fromhex("23e8d897b6c4794b")
C1 = bytes.fromhex("6b0c76c4b6c4794b")
D1 = bytes.fromhex("895d216101010101")

A1 = bytes_to_long(A1)
B1 = bytes_to_long(B1)
C1 = bytes_to_long(C1)
D1 = bytes_to_long(D1)

cipher = Feistel(Sbox, test_key)

k0 = bytes_to_long(test_key) >> 32
k1 = bytes_to_long(test_key) & 0xffffffff

# pair plain/cipher => (A, B)  (C, D)
# A = <L, R>
# B = <M, N>
# C = <L', R'> = <M ⊕ f (K0 ⊕ N), N>
# D = <M', N'> = <L ⊕ f (K0 ⊕ R), R>

i1 = 0
i2 = 0x6

print()
print(test_key.hex())
print()
print(long_to_bytes(f_inverse((A1 >> 32) ^ (D1 >> 32), i2) ^ (A1 & 0xffffffff)).hex())
print(long_to_bytes(f_inverse((C1 >> 32) ^ (B1 >> 32), i2) ^ (B1 & 0xffffffff)).hex())
print(long_to_bytes(f_inverse((A1 >> 32) ^ (D1 >> 32), i2) ^ (A1 & 0xffffffff) ^ f_inverse((C1 >> 32) ^ (B1 >> 32), i2) ^ (B1 & 0xffffffff)).hex())
print()
print()
print(long_to_bytes((A1 >> 32) ^ cipher.f(_k0 ^ (A1 & 0xffffffff))).hex())
print(long_to_bytes((B1 >> 32) ^ cipher.f(_k0 ^ (B1 & 0xffffffff))).hex())
print(long_to_bytes(D1 >> 32).hex())
print(long_to_bytes(C1 >> 32).hex())
print()
"""

"""
A = (D1 >> 32)
B = (A1 >> 32)
C = (A1 & 0xffffffff)

for i in range(2**32):
    _k0 = f_inverse(A ^ B ^ i) ^ C
    if _k0 == k0 or _k0 == k1:
        print(long_to_bytes(_k0).hex())
        print(long_to_bytes(f_inverse((C1 >> 32) ^ (B1 >> 32) ^ i) ^ (B1 & 0xffffffff)).hex())
        print(i)
        print()
    if i % 10000000 == 0:
        print(i)
"""
#exit(1)


# ============================================================= #
# GENERATE DATA
# ============================================================= #

# Each round, RIGHT side is not modified

seen = set()
data = []
for _ in range(QUERIES):
    while (rand := os.urandom(4)) in seen:
        continue
    seen.add(rand)
    p = bytes([rand[0], rand[1], rand[2], rand[3], 1, 1, 1, 1])
    data.append(p)

pwn.log.info(f"Attack with {len(data)} chosen plaintexts !")

# ============================================================= #
# CONNECTION
# ============================================================= #

if not TEST_ATTACK:
    conn = pwn.remote("challenges.404ctf.fr", 31953)
    conn.recv()

encrypted = []
decrypted = []

# ============================================================= #
# ENCRYPTION
# ============================================================= #

pwn.log.info(f"Encryption Oracle with {QUERIES // 2} queries !")
for i, block in enumerate(data[:QUERIES // 2]):
    if TEST_ATTACK:
        encrypted.append(cipher.encrypt_block(block))
    else:
        block_to_send = "{:016x}".format(bytes_to_long(block))
        conn.send(b'encrypt ' + block_to_send.encode() + b'\n')
        encrypted.append(int(conn.recvuntil(b'\n').split(b'\n')[0].decode(), 16).to_bytes(8, 'big'))
    if i % 10000 == 0:
        pwn.log.info(f"Encrypted {i} blocks")


# ============================================================= #
# DECRYPTION
# ============================================================= #

pwn.log.info(f"Decryption Oracle with {QUERIES // 2} queries !")
for i, block in enumerate(data[QUERIES // 2:]):
    if TEST_ATTACK:
        decrypted.append(cipher.decrypt_block(block))
    else:
        block_to_send = "{:016x}".format(bytes_to_long(block))
        conn.send(b'decrypt ' + block_to_send.encode() + b'\n')
        decrypted.append(int(conn.recvuntil(b'\n').split(b'\n')[0].decode(), 16).to_bytes(8, 'big'))
    if i % 10000 == 0:
        pwn.log.info(f"Decrypted {i} blocks")


pwn.log.info(f"Encrypted blocks : {len(encrypted)}")
pwn.log.info(f"Decrypted blocks : {len(decrypted)}")


# ============================================================= #
# PAIRS
# ============================================================= #

pairs = []

# Encryption pairs
assert len(encrypted) == len(data[:QUERIES // 2])
for p, c in zip(data[:QUERIES // 2], encrypted):
    pairs.append((p, c))


# Decryption pairs
assert len(decrypted) == len(data[QUERIES // 2:])
for p, c in zip(decrypted, data[QUERIES // 2:]):
    pairs.append((p, c))


pwn.log.info(f"Key pairs : {len(pairs)}")


# ============================================================= #
# RECOVER KEY
# ============================================================= #


pwn.log.info(f"Recovering keys ...")
recovered_key = None

for (A, B), (C, D) in combinations(pairs, r=2):
    if A[4] != D[4] or A[5] != D[5] or A[6] != D[6] or A[7] != D[7]:
        continue
    if B[4] != C[4] or B[5] != C[5] or B[6] != C[6] or B[7] != C[7]:
        continue
    
    pwn.log.info(f"Found slide pair ! ({A.hex()}, {B.hex()}), ({C.hex()}, {D.hex()})")
    
    A = bytes_to_long(A)
    B = bytes_to_long(B)
    C = bytes_to_long(C)
    D = bytes_to_long(D)
    
    target = (D >> 32)
    k0 = None
    found = False
    
    for i in range(256):
        k0 = f_inverse((A >> 32) ^ (D >> 32), i) ^ (A & 0xffffffff)
        if (A >> 32) ^ cipher.f(k0 ^ (A & 0xffffffff)) == target:
            pwn.log.success(f"Found k0 : {long_to_bytes(k0).hex()} with i = {hex(i)[2:]}")
            found = True
            break
    
    if not found:
        pwn.log.warn("Coudn't find k0 !")
        continue
    
    pwn.log.info("Searching for k1 ...")

# ============================================================= #
# GET FLAG
# ============================================================= #

pwn.log.info(f"Getting flag !")

if TEST_ATTACK:
    if recovered_key == key:
        pwn.log.success(f"Sucessfully recovered the key !")
    else:
        pwn.log.failure(f"Failed to recover the key !")
