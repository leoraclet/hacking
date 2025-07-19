tensions = [2.34, 3.9, 0.47, 0.78, 4.52, 2.96]
offset = 5.0 / 16

rep = "404CTF{"

for t in tensions:
    value = -1
    Vcc = 5.0 - offset
    for i in range(16):
        if i in [0, 4, 8, 12]:
            pass
        if t >= Vcc:
            # print(t, Vcc)
            value += 1
        Vcc -= offset

    # print(value)
    seq = ""
    if value & 1:
        seq += "1"
    else:
        seq += "0"

    value >>= 1
    if value & 1:
        seq += "1"
    else:
        seq += "0"

    value >>= 1
    if value & 1:
        seq += "1"
    else:
        seq += "0"

    value >>= 1
    if value & 1:
        seq += "1"
    else:
        seq += "0"

    rep += seq

rep += "}"
print(rep)
