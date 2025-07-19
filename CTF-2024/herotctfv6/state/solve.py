from operator import xor

from numpy import char

flag_enc = "ed8cad8dd3853655e490988aedab6e07332aafb1995fe529f6f0d89b82fe"
flag_enc = bytes.fromhex(flag_enc)

# print(flag_enc)
# print(len(flag_enc))


def xor_bytes(a, b):
    return bytes(x ^ y for x, y in zip(a, b))


# chars = [i for i in range(256)]
# START_FLAG = b"Hero{"
# print(xor_bytes(flag_enc, START_FLAG).hex())

# bytes_array = []

with open("stack_2.bin", "rb") as file:
    data = file.read()

# for e in data:
#     if e in bytes_array:
#         if e != 0:
#             print(hex(e)[2:])
#     else:
#         bytes_array.append(e)

chars = [e for e in data]
print(len(data), data)

last_byte = flag_enc[-1] ^ ord("}")
tmp_1 = 30
char_tmp_2 = chars.index(last_byte) - chars[tmp_1]
tmp_2 = chars.index(char_tmp_2)

# Swap
_tmp = chars[tmp_1]
chars[tmp_1] = chars[tmp_2]
chars[tmp_2] = _tmp

flag = list([65] * 29 + [ord("}")])

def swap(array, i, j):
    k = array[i]
    array[i] = array[j]
    array[j] = k

    return array

# Loop
while tmp_1 >= 1:
    if tmp_2 < chars[tmp_1]:
        tmp_2 = tmp_2 + (256 - chars[tmp_1])
    elif tmp_2 == chars[tmp_1]:
        print('MDR')
    else:
        tmp_2 = tmp_2 - chars[tmp_1]
    tmp_1 -= 1

    # Swap
    chars = swap(chars, tmp_1, tmp_2)

    # Decode
    flag[tmp_1 - 1] = flag_enc[tmp_1 - 1] ^ chars[(chars[tmp_2] + chars[tmp_1]) % 256]
    print("".join([chr(e) for e in flag]))

# tmp2(n+1) = chars[tmp1 - 1] + tmp2(n) [256] => tmp2(n) = tmp2(n+1) - chars[tmp1 - 1] [256]

# import requests

# payload = """{{'a'.__class__.__base__.__subclasses__}}@example.com"""
# payload = """%7B%7B''.__class__.__base__.__subclasses__%2528%2529%5B0o144%5D%7D%7D@exemple.com"""
# print(payload)
# res = requests.post("http://127.0.0.1:8000/render", data={"email": payload})
# response = res.text

# if "alert-success" in response:
#     print(response.split("<strong>")[1].split("</strong>")[0])
# elif "alert-danger" in response:
#     print(response.split('<div class="alert alert-danger" role="alert">')[1].split("</div>")[0])
# else:
#     print("Internal Server Error")
