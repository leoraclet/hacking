from more_itertools import first


groups = [
    "waqfs",
    "jived",
    "klutz",
    "phynx",
    "cromb",
    "waqfs",
    "gizmo",
    "veldt",
    "phynx",
    "bruck",
    "waqfs",
    "glitz",
    "phynx",
    "moved",
    "bruck",
    "waqfs",
    "klutz",
    "phynx",
    "gived",
    "cromb",
    "waqfs",
    "miltz",
    "phynx",
    "goved",
    "bruck",
    "waqfs",
    "vozhd",
    "bemix",
    "grypt",
    "clunk",
    "waqfs",
    "vozhd",
    "cimex",
    "blunk",
    "grypt",
    "waqfs",
    "vozhd",
    "cylix",
    "kempt",
    "brung",
    "waqfs",
    "vozhd",
    "xylic",
    "kempt",
    "brung",
    "fjord",
    "vibex",
    "waltz",
    "gucks",
    "nymph",
    "fjord",
    "vibex",
    "waltz",
    "gymps",
    "chunk",
    "jacks",
    "fritz",
    "blonx",
    "gyved",
    "whump",
    "jumps",
    "blonx",
    "fritz",
    "gyved",
    "whack",
    "jumps",
    "blonx",
    "fritz",
    "gyved",
    "chawk",
    "quack",
    "fjord",
    "glitz",
    "wembs",
    "phynx",
    "waqfs",
    "judge",
    "miltz",
    "phynx",
    "brock",
    "waqfs",
    "jumbo",
    "glitz",
    "phynx",
    "dreck",
    "waqfs",
    "joked",
    "phynx",
    "glitz",
    "crumb",
    "waqfs",
    "juked",
    "phynx",
    "glitz",
    "cromb",
    "waqfs",
    "jumpy",
    "vozhd",
    "brick",
    "glent",
    "waqfs",
    "jumpy",
    "vozhd",
    "bling",
    "treck",
    "waqfs",
    "jimpy",
    "vozhd",
    "bruck",
    "glent",
    "waqfs",
    "jumby",
    "vozhd",
    "prick",
    "glent",
    "waqfs",
    "jumby",
    "vozhd",
    "kreng",
    "clipt",
    "waqfs",
    "jumby",
    "vozhd",
    "treck",
    "pling",
]

# solutions = [
#     41,
#     2276,
#     1708,
#     1057,
#     665,
#     1846,
#     2226,
#     1602,
#     1519,
#     1334,
#     1079,
#     389,
#     151,
#     636,
#     709,
#     491,
#     682,
#     377,
#     201,
#     810,
#     9,
#     726,
#     1589,
#     153,
#     292,
#     817,
#     1230,
#     212,
#     1214,
#     1391,
#     821,
#     909,
# ]

# with open("wordlist.txt") as f:
#     possible_solutions, wordlist = f.read().split("-")
#     possible_solutions = possible_solutions.split("\n")[:-1]
#     wordlist = wordlist.split("\n")[1:]


# Check if the solution is in the wordlist
# for solution in possible_solutions:
#     if solution in wordlist:
#         print(solution)

from pwn import process

groups = [groups[i : i + 5] for i in range(0, len(groups), 5)]
for group in groups:
    assert len(list(set("".join(group)))) == 25


i = 1
while True:

    for group in groups:
        sh = process("./challenge")
        sh.sendline(f"{hex(i)[2:]}".encode())

        for word in group:
            sh.recvuntil("/37: ")
            sh.sendline(word.encode())

        lol = sh.recvall().decode()
        if "solved" in lol:
            print(f"Seed: {hex(i)[2:]}, Solution: {group}")
            exit()

    i += 1

# with open("solutions.txt", "r") as f:
#     solutions = f.read().split("\n")

# for e in sorted(solutions):
#     print(e)

# first_letters = {}
# fifth_letters = {}
# second_letters = {}
# third_letters = {}
# fourth_letters = {}
# for solution in solutions:
#     if solution[4] not in fifth_letters:
#         fifth_letters[solution[4]] = 0
#     fifth_letters[solution[4]] += 1
#     if solution[1] not in second_letters:
#         second_letters[solution[1]] = 0
#     second_letters[solution[1]] += 1
#     if solution[2] not in third_letters:
#         third_letters[solution[2]] = 0
#     third_letters[solution[2]] += 1
#     if solution[3] not in fourth_letters:
#         fourth_letters[solution[3]] = 0
#     fourth_letters[solution[3]] += 1
#     if solution[0] not in first_letters:
#         first_letters[solution[0]] = 0
#     first_letters[solution[0]] += 1

# fifth_letters = sorted(fifth_letters.items(), key=lambda x: x[1], reverse=True)
# second_letters = sorted(second_letters.items(), key=lambda x: x[1], reverse=True)
# third_letters = sorted(third_letters.items(), key=lambda x: x[1], reverse=True)
# fourth_letters = sorted(fourth_letters.items(), key=lambda x: x[1], reverse=True)
# first_letters = sorted(first_letters.items(), key=lambda x: x[1], reverse=True)

# print(first_letters, len(first_letters))
# print(second_letters, len(second_letters))
# print(third_letters, len(third_letters))
# print(fourth_letters, len(fourth_letters))
# print(fifth_letters, len(fifth_letters))
# # print(all_letters, len(all_letters))
# print()
# # for group in groups:
# #     print(group)


# def Levenshtein_dist(a, b):

#     if b == "":
#         return len(a)
#     if a == "":
#         return len(b)
#     if a[0] == b[0]:
#         return Levenshtein_dist(a[1:], b[1:])
#     return 1 + min(Levenshtein_dist(a[1:], b), Levenshtein_dist(a, b[1:]), Levenshtein_dist(a[1:], b[1:]))

# ranked_words = {}
# for i, g in enumerate(groups):
#     ranked_words[i] = 0
#     for w in g:
#         for s in solutions:
#             ranked_words[i] += Levenshtein_dist(w, s)

# with open("ranked_hroup_words.txt", "w") as f:
#     for k, v in sorted(ranked_words.items(), key=lambda x: x[1]):
#         f.write(f"{k} {v}\n")

# with open("ranked_hroup_words.txt", "r") as f:
#     ranked_words = {int(k): int(v) for k, v in [line.split() for line in f.readlines()]}

# for i, v in sorted(ranked_words.items(), key=lambda x: x[1]):
#     print(groups[i], v)

# ['waqfs', 'gizmo', 'veldt', 'phynx', 'bruck']
