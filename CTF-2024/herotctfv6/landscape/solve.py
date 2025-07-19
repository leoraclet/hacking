from pwn import *


with open("sol.txt", "r") as f:
    data = f.read().strip().split("\n")


constraints = []

DATA_CHECK_4 = [2, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0]
DATA_CHECK_5 = [3, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0]
DATA_CHECK_6 = [3, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0]
DATA_CHECK_7 = [1, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0]

counter = 0
while True:
    if counter > 3:
        break
    for i in range(4):
        print(f"lol[{counter * 16 + i * 4}] != 0")
        assert data[counter * 16 + i * 4] != 0
        # constraints.append(f"lol[{counter * 16 + i * 4}] != 0")
    counter += 1

print()
counter = 0
while True:
    if counter > 3:
        break
    for i in range(3):
        for j in range(4):
            if i != j:
                print(f"lol[{counter * 16 + i * 4}] != lol[{counter * 16 + j * 4}]")
                assert data[counter * 16 + i * 4] != data[counter * 16 + j * 4]
                # constraints.append(f"lol[{counter * 16 + i * 4}] != lol[{counter * 16 + j * 4}]")
        for k in range(4):
            if counter != k:
                print(f"lol[{k * 16 + i * 4}] != lol[{counter * 16 + i * 4}]")
                assert data[k * 16 + i * 4] != data[counter * 16 + i * 4]
                # constraints.append(
                #     f"lol[{k * 16 + i * 4}] != lol[{counter * 16 + i * 4}]"
                # )
    counter += 1

print()
row = 0
while True:
    if row > 3:
        break
    counter = 0
    value = 0
    for i in range(4):
        if counter != DATA_CHECK_4[row * 4]:
            if counter == 0:
                print(f"lol[{row * 16 + i * 4}] > {value}")
                constraints.append(f"lol[{row * 16 + i * 4}] > {value}")
            else:
                print(f"lol[{row * 16 + i * 4}] > lol[{row * 16 + (i-1) * 4}]")
                constraints.append(
                    f"lol[{row * 16 + i * 4}] > lol[{row * 16 + (i-1) * 4}]"
                )
            counter += 1
    row += 1

print()
row = 0
while True:
    if row > 3:
        break
    counter = 0
    value = 0
    for i in range(3, -1, -1):
        if counter != DATA_CHECK_5[row * 4]:
            if counter == 0:
                print(f"lol[{row * 16 + i * 4}] > {value}")
                constraints.append(f"lol[{row * 16 + i * 4}] > {value}")
            else:
                print(f"lol[{row * 16 + i * 4}] > lol[{row * 16 + (i+1) * 4}]")
                constraints.append(
                    f"lol[{row * 16 + i * 4}] > lol[{row * 16 + (i+1) * 4}]"
                )
            counter += 1
    row += 1

print()
row = 0
while True:
    if row > 3:
        break
    counter = 0
    value = 0
    for i in range(4):
        if counter != DATA_CHECK_6[row * 4]:
            if counter == 0:
                print(f"lol[{i * 16 + row * 4}] > {value}")
                constraints.append(f"lol[{i * 16 + row * 4}] > {value}")
            else:
                print(f"lol[{i * 16 + row * 4}] > lol[{(i-1) * 16 + row * 4}]")
                constraints.append(
                    f"lol[{i * 16 + row * 4}] > lol[{(i-1) * 16 + row * 4}]"
                )
            counter += 1
    row += 1

print()
row = 0
while True:
    if row > 3:
        break
    counter = 0
    value = 0
    for i in range(3, -1, -1):
        if counter != DATA_CHECK_7[row * 4]:
            if counter == 0:
                print(f"lol[{i * 16 + row * 4}] > {value}")
                constraints.append(f"lol[{i * 16 + row * 4}] > {value}")
            else:
                print(f"lol[{i * 16 + row * 4}] > lol[{(i+1) * 16 + row * 4}]")
                constraints.append(
                    f"lol[{i * 16 + row * 4}] > lol[{(i+1) * 16 + row * 4}]"
                )
            counter += 1
    row += 1


def row_col_from_index(index):
    return index // 4, (index % 4)

# print()
# print()
# print("=" * 50)
# print()
# constraints = sorted(list(set(constraints)))

# reduced_constraints = []

# for constraint in constraints:
#     splited = constraint.split(" ")
#     lol = " ".join(splited[::-1])
#     if lol not in reduced_constraints and constraint not in reduced_constraints:
#         reduced_constraints.append(constraint)

# print("\n".join(reduced_constraints))

# print()


data = (1, 4, 3, 2, 3, 2, 4, 1, 2, 3, 1, 4, 4, 1, 2, 3)

r = remote("reverse.heroctf.fr", 4000)
r.recvuntil(b"Enter an action: ")

for i, e in enumerate(data):
    x, y = row_col_from_index(int(i))
    print(f"{x} {y} {e}".encode())
    r.sendline(f"s".encode())
    r.recvuntil(b"Enter row, column and value: ")
    r.sendline(f"{x} {y} {e}".encode())
    r.recvuntil(b"Enter an action: ")

r.sendline("w".encode())
print(r.recv())
