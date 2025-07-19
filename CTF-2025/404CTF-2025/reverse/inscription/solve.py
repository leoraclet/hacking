from data import data

lorem = b"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest, si aliquod aeternum et infinitum impendere malum nobis opinemur. Quod idem licet transferre in voluptatem, ut."
print(len(data))
print(len(lorem))

res = b""
for i, b in enumerate(data):
    res += bytes([b ^ lorem[i & (len(lorem) - 1)]])

with open("lol.wasm", "wb") as f:
    f.write(res)
