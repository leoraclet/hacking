start = [42, 17, 99, 84, 63, 19, 88, 7, 31, 55, 91, 12, 33, 20, 75, 11]
end = [93, 72, 28, 24, 67, 23, 98, 58, 35, 75, 98, 87, 68, 30, 97, 33]

mdp = ""
for e in range(len(start)):
    for i in range(169):
        lol = ((i ^ start[e]) - 9) % 169
        if lol < 0:
            lol += 169
        if lol == end[e]:
            mdp += chr(i)

print("404CTF{" + mdp + "}")