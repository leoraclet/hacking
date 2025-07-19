cipher = "381fc4da98a6250435d19b6bc31208cf83c6dd1cd4d6798c2cda196402ea20e806acff71a586cac548b6d4a763bda6328bd9d9d8a15cd205d540e803040a6cd69541f8a0fd3c98bf58644ae4b4"
cipher = bytes.fromhex(cipher)
FLAG_START = b"Hero{"

print(cipher)
print(len(cipher))


def xor_bytes(data, key):
    return bytes(a ^ b for a, b in zip(data, key))


key = FLAG_START
decrypted = xor_bytes(cipher[: len(key)], key)
print(decrypted)

# E ^ P1 = C1
# E ^ P2 = C2
# P1 = C1 ^ C2 ^ P2

print("\n\n")
from pwn import connect

r = connect("crypto.heroctf.fr", 9001)
t = r.recvuntil(b"\n")
enc_flag = bytes.fromhex(t.decode().split("sp00")[1].split("00ky")[0])
print(enc_flag, len(enc_flag))
for i in range(256):
    r.sendline(b"00" * len(enc_flag))
    t = r.recvuntil(b"\n")
    print(i)

print(xor_bytes(bytes.fromhex(t.decode()), enc_flag))
