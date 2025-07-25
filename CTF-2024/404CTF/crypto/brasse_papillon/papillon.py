from hashlib import shake_256
import os

# =============================================================== #
# AES CRYPTOSYSTEM WITH CUSTOM POLYNOMIAL
#
# Probably need to exploit polynomial vulnerability in Mix
# Columns operation
# =============================================================== #

# AES polynomial sucks, I prefer my own (x^8+x^4+x^3+x+1) :)

MULT1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255]
MULT2 = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 166, 168, 170, 172, 174, 176, 178, 180, 182, 184, 186, 188, 190, 192, 194, 196, 198, 200, 202, 204, 206, 208, 210, 212, 214, 216, 218, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 252, 254, 29, 31, 25, 27, 21, 23, 17, 19, 13, 15, 9, 11, 5, 7, 1, 3, 61, 63, 57, 59, 53, 55, 49, 51, 45, 47, 41, 43, 37, 39, 33, 35, 93, 95, 89, 91, 85, 87, 81, 83, 77, 79, 73, 75, 69, 71, 65, 67, 125, 127, 121, 123, 117, 119, 113, 115, 109, 111, 105, 107, 101, 103, 97, 99, 157, 159, 153, 155, 149, 151, 145, 147, 141, 143, 137, 139, 133, 135, 129, 131, 189, 191, 185, 187, 181, 183, 177, 179, 173, 175, 169, 171, 165, 167, 161, 163, 221, 223, 217, 219, 213, 215, 209, 211, 205, 207, 201, 203, 197, 199, 193, 195, 253, 255, 249, 251, 245, 247, 241, 243, 237, 239, 233, 235, 229, 231, 225, 227]
MULT142 = [0, 142, 1, 143, 2, 140, 3, 141, 4, 138, 5, 139, 6, 136, 7, 137, 8, 134, 9, 135, 10, 132, 11, 133, 12, 130, 13, 131, 14, 128, 15, 129, 16, 158, 17, 159, 18, 156, 19, 157, 20, 154, 21, 155, 22, 152, 23, 153, 24, 150, 25, 151, 26, 148, 27, 149, 28, 146, 29, 147, 30, 144, 31, 145, 32, 174, 33, 175, 34, 172, 35, 173, 36, 170, 37, 171, 38, 168, 39, 169, 40, 166, 41, 167, 42, 164, 43, 165, 44, 162, 45, 163, 46, 160, 47, 161, 48, 190, 49, 191, 50, 188, 51, 189, 52, 186, 53, 187, 54, 184, 55, 185, 56, 182, 57, 183, 58, 180, 59, 181, 60, 178, 61, 179, 62, 176, 63, 177, 64, 206, 65, 207, 66, 204, 67, 205, 68, 202, 69, 203, 70, 200, 71, 201, 72, 198, 73, 199, 74, 196, 75, 197, 76, 194, 77, 195, 78, 192, 79, 193, 80, 222, 81, 223, 82, 220, 83, 221, 84, 218, 85, 219, 86, 216, 87, 217, 88, 214, 89, 215, 90, 212, 91, 213, 92, 210, 93, 211, 94, 208, 95, 209, 96, 238, 97, 239, 98, 236, 99, 237, 100, 234, 101, 235, 102, 232, 103, 233, 104, 230, 105, 231, 106, 228, 107, 229, 108, 226, 109, 227, 110, 224, 111, 225, 112, 254, 113, 255, 114, 252, 115, 253, 116, 250, 117, 251, 118, 248, 119, 249, 120, 246, 121, 247, 122, 244, 123, 245, 124, 242, 125, 243, 126, 240, 127, 241]
MULT71 = [0, 71, 142, 201, 1, 70, 143, 200, 2, 69, 140, 203, 3, 68, 141, 202, 4, 67, 138, 205, 5, 66, 139, 204, 6, 65, 136, 207, 7, 64, 137, 206, 8, 79, 134, 193, 9, 78, 135, 192, 10, 77, 132, 195, 11, 76, 133, 194, 12, 75, 130, 197, 13, 74, 131, 196, 14, 73, 128, 199, 15, 72, 129, 198, 16, 87, 158, 217, 17, 86, 159, 216, 18, 85, 156, 219, 19, 84, 157, 218, 20, 83, 154, 221, 21, 82, 155, 220, 22, 81, 152, 223, 23, 80, 153, 222, 24, 95, 150, 209, 25, 94, 151, 208, 26, 93, 148, 211, 27, 92, 149, 210, 28, 91, 146, 213, 29, 90, 147, 212, 30, 89, 144, 215, 31, 88, 145, 214, 32, 103, 174, 233, 33, 102, 175, 232, 34, 101, 172, 235, 35, 100, 173, 234, 36, 99, 170, 237, 37, 98, 171, 236, 38, 97, 168, 239, 39, 96, 169, 238, 40, 111, 166, 225, 41, 110, 167, 224, 42, 109, 164, 227, 43, 108, 165, 226, 44, 107, 162, 229, 45, 106, 163, 228, 46, 105, 160, 231, 47, 104, 161, 230, 48, 119, 190, 249, 49, 118, 191, 248, 50, 117, 188, 251, 51, 116, 189, 250, 52, 115, 186, 253, 53, 114, 187, 252, 54, 113, 184, 255, 55, 112, 185, 254, 56, 127, 182, 241, 57, 126, 183, 240, 58, 125, 180, 243, 59, 124, 181, 242, 60, 123, 178, 245, 61, 122, 179, 244, 62, 121, 176, 247, 63, 120, 177, 246]
MULT16 = [0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 29, 13, 61, 45, 93, 77, 125, 109, 157, 141, 189, 173, 221, 205, 253, 237, 58, 42, 26, 10, 122, 106, 90, 74, 186, 170, 154, 138, 250, 234, 218, 202, 39, 55, 7, 23, 103, 119, 71, 87, 167, 183, 135, 151, 231, 247, 199, 215, 116, 100, 84, 68, 52, 36, 20, 4, 244, 228, 212, 196, 180, 164, 148, 132, 105, 121, 73, 89, 41, 57, 9, 25, 233, 249, 201, 217, 169, 185, 137, 153, 78, 94, 110, 126, 14, 30, 46, 62, 206, 222, 238, 254, 142, 158, 174, 190, 83, 67, 115, 99, 19, 3, 51, 35, 211, 195, 243, 227, 147, 131, 179, 163, 232, 248, 200, 216, 168, 184, 136, 152, 104, 120, 72, 88, 40, 56, 8, 24, 245, 229, 213, 197, 181, 165, 149, 133, 117, 101, 85, 69, 53, 37, 21, 5, 210, 194, 242, 226, 146, 130, 178, 162, 82, 66, 114, 98, 18, 2, 50, 34, 207, 223, 239, 255, 143, 159, 175, 191, 79, 95, 111, 127, 15, 31, 47, 63, 156, 140, 188, 172, 220, 204, 252, 236, 28, 12, 60, 44, 92, 76, 124, 108, 129, 145, 161, 177, 193, 209, 225, 241, 1, 17, 33, 49, 65, 81, 97, 113, 166, 182, 134, 150, 230, 246, 198, 214, 38, 54, 6, 22, 102, 118, 70, 86, 187, 171, 155, 139, 251, 235, 219, 203, 59, 43, 27, 11, 123, 107, 91, 75]
MULT70 = [0, 70, 140, 202, 5, 67, 137, 207, 10, 76, 134, 192, 15, 73, 131, 197, 20, 82, 152, 222, 17, 87, 157, 219, 30, 88, 146, 212, 27, 93, 151, 209, 40, 110, 164, 226, 45, 107, 161, 231, 34, 100, 174, 232, 39, 97, 171, 237, 60, 122, 176, 246, 57, 127, 181, 243, 54, 112, 186, 252, 51, 117, 191, 249, 80, 22, 220, 154, 85, 19, 217, 159, 90, 28, 214, 144, 95, 25, 211, 149, 68, 2, 200, 142, 65, 7, 205, 139, 78, 8, 194, 132, 75, 13, 199, 129, 120, 62, 244, 178, 125, 59, 241, 183, 114, 52, 254, 184, 119, 49, 251, 189, 108, 42, 224, 166, 105, 47, 229, 163, 102, 32, 234, 172, 99, 37, 239, 169, 160, 230, 44, 106, 165, 227, 41, 111, 170, 236, 38, 96, 175, 233, 35, 101, 180, 242, 56, 126, 177, 247, 61, 123, 190, 248, 50, 116, 187, 253, 55, 113, 136, 206, 4, 66, 141, 203, 1, 71, 130, 196, 14, 72, 135, 193, 11, 77, 156, 218, 16, 86, 153, 223, 21, 83, 150, 208, 26, 92, 147, 213, 31, 89, 240, 182, 124, 58, 245, 179, 121, 63, 250, 188, 118, 48, 255, 185, 115, 53, 228, 162, 104, 46, 225, 167, 109, 43, 238, 168, 98, 36, 235, 173, 103, 33, 216, 158, 84, 18, 221, 155, 81, 23, 210, 148, 94, 24, 215, 145, 91, 29, 204, 138, 64, 6, 201, 143, 69, 3, 198, 128, 74, 12, 195, 133, 79, 9]

def A(x):
	return x[0] ^ x[1], x[2] ^ x[1], x[0] ^ x[2] ^ x[3], x[3] ^ x[1]

def B(x):
	return x[3] ^ x[0] ^ x[2], x[2] ^ x[1], x[3] ^ x[1], x[1] ^ x[0]

def C(x):
	return x[1] ^ x[2] ^ x[3], x[0] ^ x[1], x[0] ^ x[3], x[2] ^ x[0]

def P(x):
	return x[2], x[0], x[1], x[3]

def S(x):
	X = [(x >> i) & 1 for i in range(4)]
	Y = [(x >> i) & 1 for i in range(4, 8)]
	for i in range(3):
		X = A(X)
		Y = C(Y)
		Z = [x ^ y for x,y in zip(X, Y)]
		Z = B(Z)
		X = P([x ^ z for x, z in zip(X, Z)])
		Y = [y ^ z for y, z in zip(Y, Z)]
	O = list(X) + list(Y)
	return sum([O[i]*2**i for i in range(8)])

def S2(x):
	X = [(x >> i) & 1 for i in range(4)]
	Y = [(x >> i) & 1 for i in range(4, 8)]
	for i in range(7):
		X = A(X)
		Y = B(Y)
		Z = [x ^ y for x, y in zip(X, Y)]
		Z = C(Z)
		X = P([x ^ z for x, z in zip(X, Z)])
		Y = [y ^ z for y, z in zip(Y, Z)]
	O = list(X) + list(Y)

	return sum([O[i]*2**i for i in range(8)])

class Papillon:
	def __init__(self,key):
		self.BLOCK_SIZE = 128
		self.ROUNDS = 10
		self.keys = self._key_expansion(key)

	def _key_expansion(self, key):
		keys = [list(key)]

		for r in range(1, 11):
			k = keys[-1][-r:] + keys[-1][:-r]
			for j in range(len(k) // 2):
				k[j] = S(k[j])
			k = k[::-1]
			for j in range(len(k) // 2):
				k[j] = S2(k[j])
			keys.append(k)
		keys = [int.from_bytes(bytes(k), byteorder="big") for k in keys]
		return keys

	def _shuffle(self,block):
		p = [13, 0, 10, 5, 9, 2, 4, 8, 1, 7, 12, 15, 14, 11, 6, 3]
		out = sum([((block >> (i*8)) & 0xff) << (p[i]*8) for i in range(self.BLOCK_SIZE // 8)])
		return out
		
	def _mix(self,block):
		block = list(int.to_bytes(block, length=self.BLOCK_SIZE // 8))
		c1 = block[:self.BLOCK_SIZE // 16]
		c2 = block[self.BLOCK_SIZE // 16:]
		L = [MULT1, MULT1, MULT2, MULT142, MULT71, MULT16, MULT1, MULT70]
		M = [ L[-i:] + L[:-i] for i in range(8)]

		o1 = [0 for i in range(self.BLOCK_SIZE // 16)]
		o2 = [0 for i in range(self.BLOCK_SIZE // 16)]
		for i in range(8):
			for j in range(8):
				o1[i] ^= M[i][j][c1[j]]
				o2[i] ^= M[i][j][c2[j]]
			o1[i] = o1[i] % 256
			o2[i] = o2[i] % 256
		return int.from_bytes(bytes(o1+o2), byteorder="big")

	def _round(self,block,key):
		block = sum([(S((block >> i) & 0xff) << i) for i in range(0, self.BLOCK_SIZE, 8)])
		block = self._shuffle(block)
		block = self._mix(block)
		block ^= key
		return block

	def encrypt(self, blocks):
		assert len(blocks) % (self.BLOCK_SIZE // 8) == 0

		encrypted = b''
		for i in range(0, len(blocks), self.BLOCK_SIZE // 8):
			block = blocks[i : i + self.BLOCK_SIZE // 8]
			block = int.from_bytes(block, byteorder='big')
			block ^= self.keys[0]

			for round_nb in range(1, self.ROUNDS + 1):
				block = self._round(block, self.keys[round_nb])

			encrypted += int.to_bytes(block, length=self.BLOCK_SIZE // 8, byteorder='big')
		
		return encrypted