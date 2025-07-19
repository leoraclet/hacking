def xor_bytes(data: bytes, key: bytes) -> bytes:
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

# Example usage
data1 = bytes.fromhex("e3df2713dfaefd4badf9b892ba54245f")
data2 = bytes.fromhex("11dfc83092be6f72c7e9e000e1de2960")

print(xor_bytes(data1, data2).hex())
