import json
import os

from Crypto.Cipher import AES
from Crypto.Util.number import bytes_to_long
from Crypto.Util.Padding import pad

# from sage.all import GF, matrix

p = 0xFFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
a = [
    [
        0xDE1533013558164D934FA0134C9C4B3A9500F655DF6A4937B4C669677D023A20,
        0x8C5D44464B1A1A3D48692E75DEA661B2449544045F33A22232AFEE63A0EC4BFF,
    ],
    [
        0x67D896CFD5EAC1F9B094878C8A6749A1A9E4D7AACA1976839F53960CB943D5D1,
        0x21EACCFDCAA7E9B36CB05FECB363B4C56AFF09AB2095B6C84B39969882FDC5D9,
    ],
]
b = [
    [
        0xAD2399F1AAF01FDD1EE3D761B4062B7371DD94AEBB0998305DC172D295D92FA3,
        0x7464B901322EFF93A7E4BA22D08E9463FBA806DAFA6EB4165FFF9F8BAC28B2A6,
    ],
    [
        0xE2B6B627EE02684E1A1307AE91A806E5C5E1A0ACCDD17A1EAC5E7E1919809DAB,
        0x868D1BFA98507F248F3A349392AE205585C78B2DD9DC9BC19DB05A9B9CB90F3,
    ],
]
G = (
    [
        [
            0x92E3EB48B64015D9E97EDDAEF80972C0DB33B47A0680C917B2A59C2AFC380FF6,
            0x4743E3D5A3299E0ACF4293DFBAD3561F71446D9CC3BCBD7646CE0131C7E99F81,
        ],
        [
            0xB035CFE26A719A31D38C1C6593FBF4354C5E0C77B04CCB3AF613415A654CD0F9,
            0x188429C90317BB3A982D6874955C8F007F54915695461588E3BF1AF688F3C83E,
        ],
    ],
    [
        [
            0xF1E23FD5A6B794C046089A0970FE639B5354BBC3044C7B85B844703DCE827E87,
            0x65D3B53A742099885F0DF83EB329B98A96FF30F80608F742353258CC9625F535,
        ],
        [
            0x1D296D4EBF85B0F20EF4A4AB908B4C4FEAB127DF91531ACF96208D6B1BB7625,
            0xFFFD5DD6471622566C1845D016A471CEAEE3A2C265A3A49335CA0A518262B529,
        ],
    ],
)

# Fp = GF(p)


class ECM:
    def __init__(self, a, b, G):
        self.a = matrix(Fp, a)
        self.b = matrix(Fp, b)
        self.G = (matrix(Fp, G[0]), matrix(Fp, G[1]))
        assert self.isOnCurve(self.G)

    def isOnCurve(self, P):
        return P[1] ** 2 == P[0] ** 3 + self.a * P[0] + self.b

    def double(self, P):
        if P == "O":
            return "O"
        lbda = (3 * P[0] ** 2 + self.a) / (2 * P[1])
        xr = lbda**2 - 2 * P[0]
        return (xr, lbda * (P[0] - xr) - P[1])

    def add(self, P, Q):
        if P == "O":
            return Q
        if Q == "O":
            return P
        if P[0] == Q[0]:
            if P[1] == Q[1]:
                return self.double(P)
            else:
                return "O"

        lbda = (Q[1] - P[1]) / (Q[0] - P[0])
        xr = lbda**2 - P[0] - Q[0]
        return (xr, lbda * (P[0] - xr) - P[1])

    def mul(self, k, P):
        if P == "O" or k == 0:
            return "O"
        ret = self.double(self.mul(k >> 1, P))
        if k & 1:
            ret = self.add(ret, P)
        return ret

    def toList(self, P):
        return (
            [[int(k) for k in l] for l in P[0]],
            [[int(k) for k in l] for l in P[1]],
        )


if __name__ == "__main__":
    # E = ECM(a, b, G)
    # flag = b"404CTF{This_is_a_fake_flag_for_testing_purposes}"
    # key, iv = os.urandom(16), os.urandom(16)
    # S = E.toList(E.mul(bytes_to_long(key), E.G))
    # enc = AES.new(key, AES.MODE_CBC, iv=iv).encrypt(pad(flag, 16))

    # print(json.dumps({"G": G, "S": S, "enc": enc.hex(), "iv": iv.hex()}, indent=4))

    P = p
    A = a
    B = b
    data = json.loads(open("out.txt").read())
    G = data["G"]
    S = data["S"]
    enc = bytes.fromhex(data["enc"])
    iv = bytes.fromhex(data["iv"])
