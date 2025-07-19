from itertools import permutations
from multiprocessing import process
from pwn import remote, ELF, process
from websocket import recv


def row_col_from_index(index):
    return index // 4, (index % 4)


k = 0
exe = ELF("game")
r = process("game")
r.recvuntil(b"Enter an action: ")

for p1 in permutations([1, 2, 3, 4]):
    for p2 in permutations([1, 2, 3, 4]):
        for p3 in permutations([1, 2, 3, 4]):
            for p4 in permutations([1, 2, 3, 4]):
                k += 1
                if k % 10000 == 0:
                    print(k)
                if k < 121000:
                    continue
                data = p1 + p1 + p3 + p4
                for i, e in enumerate(data):
                    x, y = row_col_from_index(int(i))
                    r.sendline(f"s".encode())
                    r.recvuntil(b"Enter row, column and value: ")
                    r.sendline(f"{x} {y} {e}".encode())
                    r.recvuntil(b"Enter an action: ")
                r.sendline("w".encode())
                try:
                    res = r.recvuntil(b"Enter an action: ").decode()
                except:
                    print(r.recv())
                print(res)
                if "Hero" in res:
                    print(res)
