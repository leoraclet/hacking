import random as rd

import numpy as np

FLAG = "404CTF{this_is_a_fake_flag}"


def ci(z: int, info_1: int, info_2: int) -> int:
    # assert info_1.bit_length() <= 511 and info_2.bit_length() <= 511
    return (z << 1022) | ((info_1 << 511)) | (info_2)


def ci_invers(z: int) -> tuple[int, int]:
    # assert info_1.bit_length() <= 511 and info_2.bit_length() <= 511
    info_1 = (z >> 511) & ((1 << 511) - 1)
    info_2 = z & ((1 << 511) - 1)
    return (info_1, info_2)


def encrypt_password(password):

    a = b""
    b, c = password[::2], password[1::2]

    b = int.from_bytes(b.encode(), "big")
    c = int.from_bytes(c.encode(), "big")

    d = b + c
    e = b * c
    r = []

    print(d)
    print(e)

    for i in range(3):
        x = rd.randint(0, 2 ** b.bit_length())
        y = x**2 - d * x + e # = y = (x - b)(x - c)
        z = y < 0
        print("z: ", z, y, x)
        t = ci(z, abs(y), x)
        r.append(t)

    print()
    for i in range(3):
        a += r[i].to_bytes((r[i].bit_length() + 7) // 8, "big").rjust(128, b"\x00")

    return a


if __name__ == "__main__":

    a = encrypt_password(FLAG)
    print(a.hex())
    print()
    print()

    ENCRYPED_FLAG = 0x40f1b6e577b2bb6aa703387a15d2738ad50c795972342bdbb4b32946bcf7b72fbbdfb41884883df6589bf0e1e73a01f4f0d13a60146ac87c146de846bb98407d80000000000000000000000000000000000000000000000000000000000000000c4df9ca82064c5b97e3e5013732439d6139195456b94e581b7a22f1510f926c4117ca4ed6a10c5d37b5d400dca883d001564774dbbce5c198c5ff83fe7af851fc3820a17947e71689812f6113dd3893250a14320a8f49c46bde754a188efd3000000000000000000000000000000000000000000000000000000000000000000f6336ee243e9a18cd74b182ff23f87f8bbac8912b57cd3ab25faffcaa18ea3940d748f2696de5597ec5df6d12826fc2b37d8e926af7a39afe74cb0950460da1a33112d89029e1a9334ea4c19d36cab027d4b360f240139de4ebd58ebfb05681800000000000000000000000000000000000000000000000000000000000000029e03851f31bd96e478b63347dc9a369a5d0569dc00ffe07cc3ad2d8293a9bf0
    ENCRYPED_FLAG = bytes.fromhex(hex(ENCRYPED_FLAG)[2:]).rjust(128, b"\x00")
    r = [ENCRYPED_FLAG[i : i + 128] for i in range(0, len(ENCRYPED_FLAG), 128)]
    x = []
    y = []
    for i in range(3):
        z = int.from_bytes(r[i], "big")
        info_1, info_2 = ci_invers(z)
        y_neg = z >> 1022
        if y_neg == 1:
            y.append(-info_1)
        else:
            y.append(info_1)
        x.append(info_2)

    from sympy import *
    from Crypto.Util.number import long_to_bytes

    a, b = symbols("a, b", integer=True)
    sol = solve([x[0]**2 - (a+b)  * x[0] + a*b - y[0], x[1]**2 - (a+b)  * x[1] + a*b - y[1], x[2]**2 - (a+b)  * x[2] + a*b - y[2]])
    sol = list(sol[0].values())

    l1, l2 = sol[0], sol[1]

    l1 = long_to_bytes(l1).decode()
    l2 = long_to_bytes(l2).decode()

    def reconstruct_password(b, c):
        result = []
        for i in range(max(len(b), len(c))):
            if i < len(b):
                result.append(b[i])
            if i < len(c):
                result.append(c[i])
        return ''.join(result)

    print(reconstruct_password(l1, l2))
    print(reconstruct_password(l2, l1))
