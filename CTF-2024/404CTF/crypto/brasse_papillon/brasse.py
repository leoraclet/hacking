from Crypto.Util.number import getPrime, bytes_to_long, long_to_bytes, getRandomRange, inverse

# =============================================================== #
# RSA CRYPTOSYSTEM
# =============================================================== #

class Brasse:
    def legendre(self, a, r):
        return pow(a, (r - 1) // 2, r)

    def __init__(self):
        self.p = getPrime(1024)
        self.q = getPrime(1024)
        self.n = self.p * self.q

        self.pool = [getRandomRange(0, 2**512) for _ in range(64)]
        
    def getWater(self):
        
        a = getRandomRange(0, self.n)
        
        while pow(a, (self.p - 1) // 2, self.p) != self.p - 1 or pow(a, (self.q - 1) // 2, self.q) != self.q - 1:
            a = getRandomRange(0, self.n)
            
        return a
    
    def dive(self, a):
        return sum([pow(a, i, self.n) * k for i, k in enumerate(self.pool)]) % self.n

    def encrypt(self, a):
    
        m = bytes_to_long(a)
        c = []
        y = getRandomRange(0, self.n)
        
        for i in range(len(a) * 8):
            z = self.getWater() if m & 1 else 1
            s = self.dive(y + i)
            c.append(s**2 * z % self.n)

            m >>= 1

        return c 
    
    def decrypt(self, c):
        m = 0
        for b in c[::-1]:
            m <<= 1
            if pow(b, (self.p - 1) // 2, self.p) != 1 or pow(b, (self.q - 1) // 2, self.q) != 1:
                m += 1
        return long_to_bytes(m)