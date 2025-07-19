lol = [0] * 20

lol[5] = 0x5a
lol[0xc] = 0x6f
lol[0] = 0x66
lol[0x12] = 0x31
lol[7] = 0x25
lol[3] = 0x4d
lol[9] = 0x79
lol[0x10] = 0x76
lol[0xe] = 0x6e
lol[1] = 0x61
lol[0x13] = 0x78
lol[6] = 0x61
lol[0xf] = 0x4d
lol[8] = 0x33
lol[4] = 0x50
lol[0xb] = 0x4b
lol[0xa] = 0x4e
lol[0x11] = 0x25
lol[2] = 0x56
lol[0xd] = 0x40

string = "\x52\x51\x62\x0e\x04\x1c\x1a\x66\x54\x49\x7e\x2f\x49\x33\x02\x20\x06\x69\x02\x05"
print(string)

def xor_strings(s1, s2):
    return bytes(a ^ b for a, b in zip(s1, s2))

print("".join([chr(e) for e in xor_strings(string.encode(), bytes(lol))]))