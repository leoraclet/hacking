import random as rd

charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}_-!"
n = len(charset)
p = [4, 3, 0, 5, 1, 2, 10, 9, 6, 11, 7, 8, 16, 15, 12, 17, 13, 14, 22, 21, 18, 23, 19, 20, 28, 27, 24, 29, 25, 26, 34, 33, 30, 35, 31, 32, 40, 39, 36, 41, 37, 38, 46, 45, 42, 47, 43, 44]
p_inv = [2, 4, 5, 1, 0, 3, 8, 10, 11, 7, 6, 9, 14, 16, 17, 13, 12, 15, 20, 22, 23, 19, 18, 21, 26, 28, 29, 25, 24, 27, 32, 34, 35, 31, 30, 33, 38, 40, 41, 37, 36, 39, 44, 46, 47, 43, 42, 45]


def f(a,b,n,x):
	return (a*x+b)%n


def permute(message):
	permuted = [ message[p[i]] for i in range(len(message))]
	return ''.join(permuted)

def round(message,A,B,n):
	encrypted = ""
	for i in range(len(message)):
		x = charset.index(message[i])
		a = A[i%6]
		b = B[i%6]
		x = f(a,b,n,x)
		encrypted += charset[x]
	return permute(encrypted)

def encrypt(message):
	encrypted = message
	for k in range(6):
		A = [ rd.randint(2,n-1) for i in range(6)]
		B = [ rd.randint(1,n-1) for i in range(6)]
		encrypted = round(encrypted,A,B,n)
	return encrypted

# print(encrypt(FLAG))

# OUTPUT : C_ef8K8rT83JC8I0fOPiN6P!liE03W2NXFh1viJCROAqXb6o
# INPUT  : 404CTF{tHe_c                                   }

# Correct
def unpermute(message):
    return ''.join([message[p_inv[i]] for i in range(len(message))])


print('\n')
"""
cipher_flag = "C_ef8K8rT83JC8I0fOPiN6P!liE03W2NXFh1viJCROAqXb6o"
first_step = unpermute(cipher_flag)
print(first_step)
print()
print(charset.index(first_step[0]))
print(charset.index(first_step[6]))
print(charset.index(first_step[12]))
"""

p = "404CTF{tHe_c"
c = "C_ef8K8rT83J"
c = unpermute(c)

print(len(c))

# 1: c1 = a11 * x1 + b11
#    c7 = a11 * x7 + b11
# 2: c1 = a21 * (a15 * x5 + b15) + b21
#    c7 = a21 * (a111 * x)
