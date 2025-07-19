import os

from cryptography.hazmat.primitives.ciphers import Cipher, modes
from cryptography.hazmat.primitives.ciphers.algorithms import AES, SM4

pt_banner = b"I don't trust governments, thankfully I've found smart a way to keep my data secure."
ct_banner = b"\xd5\xae\x14\x9de\x86\x15\x88\xe0\xdc\xc7\x88{\xcfy\x81\x91\xbaH\xb6\x06\x02\xbey_0\xa5\x8a\xf6\x8b?\x9c\xc9\x92\xac\xdeb=@\x9bI\xeeY\xa0\x8d/o\xfa%)\xfb\xa2j\xd9N\xf7\xfd\xf6\xc2\x0b\xc3\xd2\xfc\te\x99\x9aIG\x01_\xb3\xf4\x0fG\xfb\x9f\xab\\\xe0\xcc\x92\xf5\xaf\xa2\xe6\xb0h\x7f}\x92O\xa6\x04\x92\x88"
enc_flag = b"\xaf\xe0\xb8h=_\xb0\xfbJ0\xe6l\x8c\xf2\xad\x14\xee\xccw\xe9\xff\xaa\xb2\xe9c\xa4\xa0\x95\x81\xb8\x03\x93\x7fg\x00v\xde\xba\xfe\xb92\x04\xed\xc4\xc7\x08\x8c\x96C\x97\x07\x1b\xe8~':\x91\x08\xcf\x9e\x81\x0b\x9b\x15"
k0 = b'C\xb0\xc0f\xf3\xa8\n\xff\x8e\x96g\x03"'
k1 = b"Q\x95\x8b@\xfbf\xba_\x9e\x84\xba\x1a7"


def pad(data: bytes, bs: int):
    return data + (chr(bs - len(data) % bs) * (bs - len(data) % bs)).encode()


print(pt_banner, len(pt_banner))
print(ct_banner.hex(), len(ct_banner))
print(enc_flag.hex(), len(enc_flag))
print(k0.hex(), len(k0))
print(k1.hex(), len(k1))

FLAG = b"Hero{"

# Flag lenght: 48 -> 63 bytes
# Key lenght: 16 bytes

# The encryption is done in two steps:
# 1. AES encryption
# 2. SM4 encryption

# The encryption is done in ECB mode, which is not secure.
# The padding is done in a way that the padding is the same as the number of bytes to pad.

pt_banner_padded = pad(pt_banner, 16)
print(pt_banner_padded)
print("\n")

for i in range(0, len(ct_banner), 16):
    print(ct_banner[i : i + 16])

print("\n")
for i in range(0, len(enc_flag), 16):
    print(enc_flag[i : i + 16])


print('\n\n')
all_decrypted = {}

# for i in range(0, 2**24):
#     if i % 1000000 == 0:
#         print(i)
#     key = i.to_bytes(3) + k1
#     cipher = Cipher(SM4(key), modes.ECB())
#     decryptor = cipher.decryptor()
#     decrypted = decryptor.update(ct_banner) + decryptor.finalize()
#     all_decrypted[decrypted] = key

# with open("decrypted.txt", "w") as f:
#     for k, v in all_decrypted.items():
#         f.write(f"{k.hex()} : {v.hex()}\n")

# print("Reading decrypted file")
# with open("decrypted.txt", "r") as f:
#     for line in f.readlines():
#         k, v = line.split(" : ")
#         all_decrypted[bytes.fromhex(k)] = bytes.fromhex(v)


# for i in range(0, 2**24):
#     if i % 1000000 == 0:
#         print(i)
#     key = i.to_bytes(3) + k0
#     cipher = Cipher(AES(key), modes.ECB())
#     encryptor = cipher.encryptor()
#     encrypted = encryptor.update(pt_banner_padded) + encryptor.finalize()
#     if encrypted in all_decrypted:
#         print(f"Key0: {key.hex()}")
#         print(f"Key1: {all_decrypted[encrypted].hex()}")
#         break

Key0 = "49662d43b0c066f3a80aff8e96670322"
Key1 = "94cb9251958b40fb66ba5f9e84ba1a37"

Key0 = bytes.fromhex(Key0)
Key1 = bytes.fromhex(Key1)

cipher = Cipher(SM4(Key1), modes.ECB())
decryptor = cipher.decryptor()
decrypted = decryptor.update(enc_flag) + decryptor.finalize()

cipher = Cipher(AES(Key0), modes.ECB())
decryptor = cipher.decryptor()
decrypted = decryptor.update(decrypted) + decryptor.finalize()

print(decrypted)