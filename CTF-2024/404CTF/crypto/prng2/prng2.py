from LFSR import LFSR
from generator import CombinerGenerator
import random as rd


def xor(b1, b2):
	return bytes(a ^ b for a, b in zip(b1, b2))


#Polynomial representation
poly1 = [19,5,2,1] # x^19+x^5+x^2+x
poly2 = [19,6,2,1] # x^19+x^6+x^2+x
poly3 = [19,9,8,5] # x^19+x^9+x^8+x^5

# initialize states
state1 = [rd.randint(0,1) for _ in range(19)] 
state2 = [rd.randint(0,1) for _ in range(19)]
state3 = [rd.randint(0,1) for _ in range(19)]

#combine function
combine = lambda x1,x2,x3 : (x1 and x2)^(x1 and x3)^(x2 and x3)

# 0 0 0  =>  0
# 0 0 1  =>  0
# 0 1 0  =>  0
# 0 1 1  =>  1
# 1 0 0  =>  0
# 1 0 1  =>  1
# 1 1 0  =>  1
# 1 1 1  =>  1

# output probability same as x1 (0.75)
# output probability same as x2 (0.75)
# output probability same as x3 (0.75)

print('-' * 50)
for x1 in range(2):
    for x2 in range(2):
        for x3 in range(2):
            print(x1,x2,x3,combine(x1, x2, x3))
print('-' * 50)
print('LFSR Cycle Lenght: ', 2**19 - 1)
print('Combinator Cycle Lenght: ', (2**19 - 1)**3)
print('-' * 50)


#Create LFSRs
L1 = LFSR(poly1,state1)
L2 = LFSR(poly2,state2)
L3 = LFSR(poly3,state3)

#Create (secure) generator
generator = CombinerGenerator(combine,L1,L2,L3)

# =============================== MY PART =============================== #

flag = None
encrypted = None

with open("flag.png.part", 'rb') as f:
    flag = f.read()
    
with open("flag.png.enc", 'rb') as f:
    encrypted = f.read()


key = b""
for i in range(len(flag)):
	key += xor(flag[i:i+1],encrypted[i:i+1])

print(key.hex())

all_bits = []
for b in key:
    for i in range(8):
        all_bits.append((b >> (7-i)) & 1)

print(len(all_bits))

# =========================== FUNCTIONS =========================== #

def guess(beg, end, data, poly_coeffs):

    now = 0
    true = 0
    for i in range(beg, end):

        r = i
        cnt = 0
        lfsr = LFSR(poly_coeffs, [int(e) for e in "{:019b}".format(i)])

        for j in range(len(data)):

            lastbit = lfsr.generateBit()
            cnt += (lastbit == data[j])

        if cnt > now:
            now = cnt
            res = i
            print(now, res, now/len(data))
 
    return res


def bruteforce(s1, s2, data):

    lfsr_1 = LFSR(poly1, [int(e) for e in "{:019b}".format(s1)])
    lfsr_2 = LFSR(poly2, [int(e) for e in "{:019b}".format(s2)])
    
    for y in range(pow(2, 18), pow(2, 19)):
        
        flag = True
        lfsr_3 = LFSR(poly1, [int(e) for e in "{:019b}".format(y)])
        gen = CombinerGenerator(combine, lfsr_1, lfsr_2, lfsr_3)

        for i in range(len(data)):
            out = gen.generateBit()
            if out != data[i]:
                flag = False
                break

        if y % 10000 == 0:
            print('now: ', s1, s2, y)

        if flag:
            print('ans: ', s1, s2, y)
            break


# =========================== FUNCTIONS =========================== #

R1 = 359839
R2 = 277622
R3 = 430367

"""
n = 19
guess(0, 2**19, all_bits, poly1)
print()
guess(0, 2**19, all_bits, poly2)
print()
guess(0, 2**19, all_bits, poly3)
#bruteforce(R2, R3, all_bits)
"""

s1 = [int(e) for e in "{:019b}".format(R1)]
s2 = [int(e) for e in "{:019b}".format(R2)]
s3 = [int(e) for e in "{:019b}".format(R3)]

assert len(s1) == 19
assert len(s2) == 19
assert len(s3) == 19


#Create LFSRs
L1 = LFSR(poly1,s1)
L2 = LFSR(poly2,s2)
L3 = LFSR(poly3,s3)

#Create (secure) generator
generator = CombinerGenerator(combine,L1,L2,L3)

cnt = 0
for i in range(len(all_bits)):
    if generator.generateBit() == all_bits[i]:
        cnt += 1
    else:
        print('lol')
        break

print("CNT: ", cnt)
for i in range(len(flag), len(encrypted)):
	flag += xor(generator.generateByte(),encrypted[i:i+1])

with open('solution.png', 'wb') as f:
    f.write(flag)
