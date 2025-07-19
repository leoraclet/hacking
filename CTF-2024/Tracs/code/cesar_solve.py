data = open("scysarle1.txt", "r").read()
print(data)

# cesar
# syl1

count = 0
chars = []
for char in data:
    if char.isalpha() and char not in chars:
        chars.append(char)
        print(char)
        count += 1
        print(count)


cesar_encoded = [
    "bdrzq",
    "acqyp",
    "zbpxo",
    "yaown",
    "xznvm",
    "wymul",
    "vxltk",
    "uwksj",
    "tvjri",
    "suiqh",
    "rthpg",
    "qsgof",
    "prfne",
    "oqemd",
    "npdlc",
    "mockb",
    "lnbja",
    "kmaiz",
    "jlzhy",
    "ikygx",
    "hjxfw",
    "giwev",
    "fhvdu",
    "eguct",
    "dftbs"
]

for word in cesar_encoded:
    if word in data:
        print(word)


def decrypt_scytale(scytale, data):
    decrypted = ""
    for i in range(scytale):
        for j in range(i, len(data), scytale):
            decrypted += data[j]
    return decrypted


for i in range(26):
    dec = decrypt_scytale(i, data)
    # print(dec)
    for word in cesar_encoded:
        if word in dec:
            print(dec)

# scrambles = open("combinaisons_brouillees.txt", "r").read().split("\n")

# first_number = [int(e[0]) for e in scrambles]
# second_number = [int(e[1]) for e in scrambles]
# third_number = [int(e[2]) for e in scrambles]
# fourth_number = [int(e[3]) for e in scrambles]

# first_number_counts = {}
# for num in first_number:
#     if num in first_number_counts:
#         first_number_counts[num] += 1
#     else:
#         first_number_counts[num] = 1

# second_number_counts = {}
# for num in second_number:
#     if num in second_number_counts:
#         second_number_counts[num] += 1
#     else:
#         second_number_counts[num] = 1

# third_number_counts = {}
# for num in third_number:
#     if num in third_number_counts:
#         third_number_counts[num] += 1
#     else:
#         third_number_counts[num] = 1

# fourth_number_counts = {}
# for num in fourth_number:
#     if num in fourth_number_counts:
#         fourth_number_counts[num] += 1
#     else:
#         fourth_number_counts[num] = 1

# first_number_counts_sorted = sorted(first_number_counts.items(), key=lambda x: x[1], reverse=True)
# second_number_counts_sorted = sorted(second_number_counts.items(), key=lambda x: x[1], reverse=True)
# third_number_counts_sorted = sorted(third_number_counts.items(), key=lambda x: x[1], reverse=True)
# fourth_number_counts_sorted = sorted(fourth_number_counts.items(), key=lambda x: x[1], reverse=True)

# print(first_number_counts_sorted)
# print(second_number_counts_sorted)
# print(third_number_counts_sorted)
# print(fourth_number_counts_sorted)
