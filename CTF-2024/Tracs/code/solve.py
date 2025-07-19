from torch import res
from groupe_permutations import GroupePermutations
import random

t = random.randint(2**4095, 2**4096)
gr = GroupePermutations(4096)


G = []
A = []
B = []

with open("message_point_A_vers_point_B.txt", "r") as file:
    lines = file.read().split("\n")
    G = [int(e) for e in lines[0][3:-1].split(", ")]
    A = [int(e) for e in lines[1][3:-1].split(", ")]

with open("message_point_B_vers_point_A.txt", "r") as file:
    lines = file.read().split("\n")
    B = [int(e) for e in lines[0][3:-1].split(", ")]

# print(G)
# print(A)
# print(B)

res1 = [i for i in range(4096)]
res2 = gr.operation(res1, res1)
res3 = gr.operation(res2, res2)
res4 = gr.operation(res3, res3)

print(res4 == res1)

res5 = gr.operation(res4, G)
print(res5 == G)
res6 = gr.operation(res5, res5)
res7 = gr.operation(res6, G)
print(res7 == G, res7 == res5)


# cle_puliqueA = G * clef_priveeA
# cle_puliqueB = G * clef_priveeB

# clef_partageeA = cle_puliqueB * clef_priveeA = G * clef_priveeB * clef_priveeA
# clef_partageeB = cle_puliqueA * clef_priveeB = G * clef_priveeA * clef_priveeB

x = [G[i] for i in range(4096)]
count = 0
while True:
    for i in range(4096):
        x[i] = G[x[i]]

    count += 1
    if count % 1000 == 0:
        print(count)
    if x == A:
        break

# z[i] = G[G[i]]
#  z = [G[G[i]] for i in range(4096)]

# z[i] = G[G[i]]
# z[z[i]] = z[G[G[i]]]
