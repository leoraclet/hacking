from Crypto.Util.number import long_to_bytes,bytes_to_long

flag = None

with open('chall.bin','rb') as f:
    flag = f.read()

print(flag)
print(len(flag))
flag = ["{:08b}".format(e) for e in flag]

flag = ''.join(flag)[::-1]
print(long_to_bytes(int(flag, 2)))
print()

start_flag = b"404CTF{}\n"
start_flag = ["{:07b}".format(e) for e in start_flag]

for e in start_flag:
    if e in flag:
        print(e, flag.rindex(e), flag.index(e), chr(int(e, 2)))


j = 464
sol = ""
while j >= 4:
    sol += chr(int(flag[j:j+7], 2))
    j -= 10


print(sol)
