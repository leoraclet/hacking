import os
import json
import hashlib

from sboxes import S1, S2
# 7 and 9 bits SBoxes


class FeistelCipher:
	BS = 64
	KS = 4
	ROUNDS = 6

	def __init__(self, key):
		assert len(key) == 8
		self.derive_key(key)

	def derive_key(self, key):
		"""
		Key derivation of the cipher
		"""
		key1, key2 = key[:4], key[4:]

		self.keys = [
			hashlib.sha256(key1 + key2).digest()[:4],
			hashlib.sha256(key2 + key1).digest()[:4],
			hashlib.sha256(key2).digest()[:4],
			hashlib.sha256(key1).digest()[:4],
			key2,
			key1
		]

	def encrypt_block(self, block):
		"""
		Encrypt a block of plaintext
		"""

		block = int.from_bytes(block, byteorder="big")

		stateL = block >> 32
		stateR = block & 0xffffffff

		for i in range(0, 6):

			round_key = int.from_bytes(self.keys[i], byteorder="big")

			# Apply F and shift the left part
			stateL, stateR = stateL ^ self.f(round_key, stateR), stateR
			stateL, stateR = self.shift(stateL), stateR

			# Invert stateL and stateR
			stateL, stateR = stateR, stateL

		return int.to_bytes(stateL, length=4, byteorder="big") + int.to_bytes(stateR, 4, byteorder="big")


	def shift(self, halfState):
		"""
		Perform a cyclic shift of half of a state
		"""
		return ((halfState << 4) & 0xffffffff) + (halfState >> 28)


	def f(self, round_key, block):
		# Add round key
		block ^= round_key

		output = 0
		# Apply 9 bits or 7 bits SBoxes
		for i in range(0, 32, 8):
			if i % 16:
				part = (block >> (i - 1)) & 0x1ff
				part = S2[part]
				output += part << (i - 1)
			else:
				part = (block >> i) & 0x7f
				part = S1[part]
				output += part << i

		return output


if __name__ == "__main__":
	N = 450
	FLAG = os.environ.get("FLAG", "404CTF{this_is_a_fake_flag}")

	cipher = FeistelCipher(os.urandom(8))

	while N > 0:
		recv = json.loads(input(">>> "))

		if recv["command"] ==  "encrypt" and "plaintext" in recv.keys():

			plaintext = bytes.fromhex(recv["plaintext"])
			if len(plaintext) != 8:
				print(f"Plaintext should be exactly {8} bytes.\nBye !")
				exit(1)

			encrypted = cipher.encrypt_block(plaintext)
			print(json.dumps({"encrypted": encrypted.hex()}))

		elif recv["command"] == "check" and "keys" in recv.keys():
			checked = True

			# Check the 6 keys
			for i, key in enumerate(cipher.keys):
				if key.hex() != recv["keys"][i]:
					checked = False
					break

			if checked:
				print(f"Congratz !\n{FLAG}")
				break

		N -= 1