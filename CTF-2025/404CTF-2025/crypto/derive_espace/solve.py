import json

# packets = json.loads(open("packets_2.json").read())

# with open("data.txt", "w") as file:
#     for p in packets:
#         if p["_source"]["layers"]["data"]["data.len"] == "3328":
#             pass
#         file.write("".join(p['_source']['layers']['data']['data.data'].split(":")) + "\n")

data = [bytes.fromhex(b) for b in open("data.txt").read().split("\n")[:-1]]
data = b"".join(data)

print(len(data) / 200, len(data) / 200 / 16)

png_len = len(data) // 200
encrypted = []
ivs = []

for i in range(200):
    encrypted.append(data[i * png_len : (i + 1) * png_len - 16])
    ivs.append(data[(i + 1) * png_len - 16 : (i + 1) * png_len])

print(len(encrypted), len(ivs))
print(len(encrypted[0]), len(ivs[0]))

encrypted_blocks = []
for block in encrypted:
    encrypted_blocks.append([block[i : i + 16] for i in range(0, len(block), 16)])

print(len(encrypted_blocks), len(encrypted_blocks[0]), len(encrypted_blocks[0][0]))

for enc in encrypted:
    if encrypted.count(enc) > 1:
        print("Found duplicate block", enc)

for iv in ivs:
    if ivs.count(iv) > 1:
        print("Found duplicate IV", iv)
