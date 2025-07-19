import os
from Crypto.Util.number import getPrime, isPrime
from Crypto.Util.number import long_to_bytes
from math import gcd

s = 512

a, b, M = getPrime(64), getPrime(64), 2**s

seed = int.from_bytes(os.urandom(64), "big") % M

FLAG = "Flag{This_is_a_fake_flag_for_testing_purposes}"
seeds = []


def gen():
    global seed
    seed = (a * seed + b) % M
    seeds.append(seed)
    return seed


def genPrime():
    g = gen()
    while not isPrime(g):
        g += 1
    return g


# 305 269 125
gens = [
    3091366294781460143808787037925267530054168631683666413938437290522430334206270155383653186794430966926506391572528254632410108363924422322550988197421119,
    7471121600916443081609079818687357574031073429138181828517712806452422577587560633072612451601342659331981733826107672374745509090833245079597999738742037,
    6541825182444275970845615139510205178932610721818093785817148883151882535973033772245418283565599906052381058064228111216796652705064519885627744948966107,
][::-1]

n1 = 0xE0630764BA42714B674164DBF6E8315A00ADE4F0DC3915B390C0B79FC0872B9723FFE4DC52ED3366A24EA5D081D1F509B865791028A980E082FA1BC10A73500C4523B0E31904FC1A077EE5A88F5014C2763A369BC9F11176E410217E820C01DEDD0AA306CBF618278381A84382102B58D6E6E7EBE6BD32F5DC1D89F78C8D9B
c1 = 0x832CC4FF7BFF9E9C50F6211F407AE00F900E9CFBBAC758AD4FD0AB2FE8994ED1FBD2A0A51ED6E5083B7C776D51627454CC4C11A008BA6B45197E142B51A8F543607D3CDCED9CD4F73897F4C5D458B963CA8785DA6E3DEDC11E2A1E88CBF3F1E6F111ED5205EEEACEB6F94189448909231563E255579FC4BC3713B1D77F9C53
n2 = 0x428103BF0E862361374BC98D1800F07F2CB2D382056ADA66227CDCC5CC28054B155B67283A3E75320ED9765A977E45CF109FC4E70DAA140B23C736F2A5ED2E5DF0FA48ED0F6EAB007C59243BD84FD464B115F0F0334416A1535B5ABF99A369AA2556B8417FE312E7C7A0120043C3BB388C261B72D2B668BFFA59FD16C980952F
c2 = 0x1D59CB73737E09CB7BBF22C188412DA8A56490FB361984527918927A2E41C582CCDBF0565F0251AAC68EDF7E1C043C8D87DB88C0300C2018B50BBD61D62A974B751566B1FD1AA621B889AF2B461598C97BDDD2047F87699DF0D05D8C56F83D944D98D71E25F42E13E28CE1591A5AC458A45947C3D02E715C2721AFBDEDCF6EC4

# ranges = [1000] * 3

# while ranges[0] * ranges[1] * ranges[2] > 10000000:
#     seeds = []
#     ranges = []
#     gens[0] = genPrime()
#     gens[1] = genPrime()
#     gens[2] = genPrime()
#     gen_last_prime_before = []
#     for g in gens:
#         in_between_numbers = []
#         lol = g - 1
#         in_between_numbers.append(lol)
#         while not isPrime(lol):
#             lol -= 1
#             in_between_numbers.append(lol)
#         gen_last_prime_before.append(lol + 1)
#         ranges.append(g - lol)
#         for s in seeds:
#             if s in in_between_numbers:
#                 print("Index: ", in_between_numbers.index(s))

#     print(ranges)

# print("Seeds: ", seeds)
# print("Ranges: ", ranges)


# ranges = []
# gen_last_prime_before = []
# for g in gens:
#     in_between_numbers = []
#     lol = g - 1
#     in_between_numbers.append(lol)
#     while not isPrime(lol):
#         lol -= 1
#         in_between_numbers.append(lol)
#     gen_last_prime_before.append(lol + 1)
#     ranges.append(g - lol)

# A = 0
# c = 0
# tmp = [0] * 3
# found = 0
# cnt = 0
# first_seed = 0
# reel_seeds = []
# print(ranges)
# print(ranges[0] * ranges[1] * ranges[2])
# for i1 in range(0, ranges[0]):
#     if found == True:
#         break
#     tmp[0] = gen_last_prime_before[0] + i1
#     for i2 in range(0, ranges[1]):
#         if found == True:
#             break
#         tmp[1] = gen_last_prime_before[1] + i2
#         for i3 in range(0, ranges[2]):
#             tmp[2] = gen_last_prime_before[2] + i3
#             cnt += 1
#             # if cnt % 100000 == 0:
#             #     print(cnt)
#             if cnt <= 327200000:
#                 continue
#             try:
#                 # if not (tmp[1] in seeds and tmp[0] in seeds and tmp[2] in seeds):
#                 #     continue

#                 T0 = (tmp[1] - tmp[0]) % M
#                 T1 = (tmp[2] - tmp[1]) % M

#                 A = (T1 * pow(T0, -1, M)) % M
#                 C = tmp[1] - tmp[0] * A % M
#                 if (A.bit_length() <= 64 and C.bit_length() <= 64):
#                     print("Only 64 bits: ", A, C)
#                 else:
#                     continue

#                 if tmp[1] == (A * tmp[0] + C) % M:
#                     # print("Found it")
#                     reel_seeds = [tmp[0], tmp[1], tmp[2]]
#                     print(reel_seeds)
#                     print("A =", A)
#                     print("B =", C)
#                     found = True
#             except Exception as e:
#                 pass

#             if found == True:
#                 break

reel_seeds = [
    6541825182444275970845615139510205178932610721818093785817148883151882535973033772245418283565599906052381058064228111216796652705064519885627744948965999,
    7471121600916443081609079818687357574031073429138181828517712806452422577587560633072612451601342659331981733826107672374745509090833245079597999738742022,
    3091366294781460143808787037925267530054168631683666413938437290522430334206270155383653186794430966926506391572528254632410108363924422322550988197421089,
]
# a = int(A)
# b = int(C)
a = 12524217627123949597
b = 9947673229603647091

inv_mult = int(pow(a, -1, M))

assert reel_seeds[1] == inv_mult * (reel_seeds[2] - b) % M
assert reel_seeds[0] == inv_mult * (reel_seeds[1] - b) % M

seed = reel_seeds[1]
assert genPrime() == gens[2]
seed = reel_seeds[0]
assert genPrime() == gens[1]
seed = (inv_mult * (reel_seeds[0] - b)) % M
seed = (inv_mult * (seed - b)) % M
seed = (inv_mult * (seed - b)) % M
seed = (inv_mult * (seed - b)) % M
seed = (inv_mult * (seed - b)) % M

p1 = genPrime()
q1 = genPrime()
p2 = genPrime()
q2 = genPrime()

assert p1 * q1 == n1
assert p2 * q2 == n2

d1 = pow(65537, -1, (p1 - 1) * (q1 - 1))
d2 = pow(65537, -1, (p2 - 1) * (q2 - 1))

m1 = pow(c1, d1, n1)
m2 = pow(c2, d2, n2)

print(long_to_bytes(m1).decode() + long_to_bytes(m2).decode())

# for _ in range(4):
#     print("La Lunette Cosmico-Galactique est prête et pointée en direction du vaisseau ALIENS :")
#     print("1. Mesurer le champ électromagnétique émanant du vaisseau")
#     print("2. Intercepter une communication ALIEN")

#     try:
#         choice = int(input("Que faire ? :"))
#     except:
#         exit()

#     if choice == 1:
#         print("La lunette indique :", genPrime())
#     elif choice == 2:
#         seed = int.from_bytes(os.urandom(s // 8)) % M
#         print("Mince les ALIENS semblent réactualiser leurs signature électromagnétique, mince alors >:(")

#         e = 65537
#         n1 = genPrime()*genPrime()
#         n2 = genPrime()*genPrime()
#         c1 = pow(int.from_bytes(FLAG[:len(FLAG)//2]), e, n1)
#         c2 = pow(int.from_bytes(FLAG[len(FLAG)//2:]), e, n2)

#         print(f"Message intercepté : {hex(n1)[2:]}-{hex(c1)[2:]}-{hex(n2)[2:]}-{hex(c2)[2:]}")

# print("Les ALIENS se sont enfuis... ")
