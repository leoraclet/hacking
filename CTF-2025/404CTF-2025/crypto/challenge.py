

charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}-!"
n = len(charset)

# def encrypt(message):
#     encrypted = []
#     for char in message:
#         if char in charset:
#             x = charset.index(char)
#             y = pow(2, x, n+1)
#             encrypted.append(charset[y])
#     return ''.join(encrypted)

# print("ENCRYPTED FLAG : ", encrypt(FLAG))


# ENCRYPTED FLAG : 828x6Yvx2sOnzMM4nI2sQ

cipher = "828x6Yvx2sOnzMM4nI2sQ"
n = len(charset) + 1

for i in range(len(cipher)):
    x = charset.index(cipher[i])
    for char in charset:
        y = pow(2, charset.index(char), n)
        if y == x:
            print(char, end="")
            break