import random as rd

charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}_-!"

def f(a,b,n,x):
	return (a*x+b)%n

def encrypt(message,a,b,n):
	encrypted = ""
	for char in message:
		x = charset.index(char)
		x = f(a,b,n,x)
		encrypted += charset[x]

	return encrypted

n = len(charset)
a = rd.randint(2,n-1)
b = rd.randint(1,n-1)

#print(encrypt(FLAG,a,b,n))

FLAG = "-4-c57T5fUq9UdO0lOqiMqS4Hy0lqM4ekq-0vqwiNoqzUq5O9tyYoUq2_"

# ENCRYPTED FLAG : -4-c57T5fUq9UdO0lOqiMqS4Hy0lqM4ekq-0vqwiNoqzUq5O9tyYoUq2_
# DECRYPTED FLAG : 404CTF{                                                 }

print(charset.index("4"))
print(charset.index("-"))
print()
print(charset.index("4"))
print(charset.index("0"))
print()
print(charset.index("C"))
print(charset.index("c"))
print()
print(charset.index("T"))
print(charset.index("5"))
print()
print(charset.index("F"))
print(charset.index("7"))
print(n)

A = 19
B = 6

msg = ""

for char in FLAG:
    for c in charset:
        if charset[f(A, B, n, charset.index(c))] == char:
            msg += c

print(msg)