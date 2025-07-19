
i = 0

with open("all_packets.txt", "r") as f:
    lines = f.readlines()
    for line in lines:
        i += 1
        if ('DATA0' in line or 'DATA1' in line) and i >= 19:
            lol = line.split("[ ")[1].split(']')[0]
            print(chr(int(lol, 16)), end="")