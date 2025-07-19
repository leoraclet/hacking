from Crypto.Util.number import long_to_bytes,bytes_to_long
import os
#from flag import FLAG

perm = [65, 107, 53, 90, 67, 35, 17, 100, 37, 103, 41, 92, 23, 120, 70, 11, 34, 73, 16, 29, 7, 91, 127, 69, 81, 26, 0, 98, 71, 51, 9, 112, 64, 121, 101, 47, 114, 30, 104, 113, 3, 27, 6, 32, 42, 93, 48, 21, 118, 99, 89, 84, 36, 110, 25, 102, 61, 39, 86, 50, 14, 10, 56, 28, 38, 62, 22, 46, 66, 19, 108, 18, 13, 125, 49, 2, 74, 95, 8, 122, 58, 5, 75, 97, 15, 63, 117, 123, 96, 24, 94, 43, 4, 33, 115, 45, 76, 80, 126, 109, 52, 12, 79, 72, 54, 77, 31, 57, 1, 87, 88, 60, 20, 55, 40, 111, 116, 44, 82, 85, 68, 105, 106, 83, 78, 124, 59, 119]
perm_inv = [26, 108, 75, 40, 92, 81, 42, 20, 78, 30, 61, 15, 101, 72, 60, 84, 18, 6, 71, 69, 112, 47, 66, 12, 89, 54, 25, 41, 63, 19, 37, 106, 43, 93, 16, 5, 52, 8, 64, 57, 114, 10, 44, 91, 117, 95, 67, 35, 46, 74, 59, 29, 100, 2, 104, 113, 62, 107, 80, 126, 111, 56, 65, 85, 32, 0, 68, 4, 120, 23, 14, 28, 103, 17, 76, 82, 96, 105, 124, 102, 97, 24, 118, 123, 51, 119, 58, 109, 110, 50, 3, 21, 11, 45, 90, 77, 88, 83, 27, 49, 7, 34, 55, 9, 38, 121, 122, 1, 70, 99, 53, 115, 31, 39, 36, 94, 116, 86, 48, 127, 13, 33, 79, 87, 125, 73, 98, 22]

class Bob:
    def __init__(self, data):
        # Probably need a data of length % 256 similar
        data = long_to_bytes(len(data)%256) + data + long_to_bytes(len(data)%256)
        print(data.hex())
        self.data = self.bytes2binArray(data)
        print(self.data)
        self.state = [[0 for _ in range(32)],[0 for _ in range(96)]]

    def bytes2binArray(self,b):
        b = bin(bytes_to_long(b))[2:]
        b = '0'*(8-(len(b)%8))+b
        b = b+'0'*(32 - (len(b)%32))
        print('Bin len: ', len(b))
        return [int(i) for i in b]

    def binArray2bytes(self,b):
        bytes_in = [b[i:i+8] for i in range(0,len(b),8)]
        bytes_out = []
        for e in bytes_in:
            s = 0
            for i in range(8):
                s += e[i]*2**(7-i)
            bytes_out.append(s)
        return bytes(bytes_out)

    def xor(self,a,b):
        return [i^j for i,j in zip(a,b)]

    def digest(self):
        while len(self.data) != 0:
            input_data = self.data[:32]
            self.state[0] = self.xor(self.state[0],input_data)
            self.data = self.data[32:]
            
            #print(self.state)

            # _f()
            input_perm = self.state[0].copy()+self.state[1].copy()
            output_perm = [input_perm[i] for i in perm]
            self.state = [output_perm[:32],output_perm[32:]]
           
            
        output = []
        # At least 512 / 32 == 16 times
        while len(output) != 512:
        
            output += self.state[0].copy()
            # _f()
            input_perm = self.state[0].copy()+self.state[1].copy()
            output_perm = [input_perm[i] for i in perm]
            self.state = [output_perm[:32],output_perm[32:]]
        
        hash_out = self.binArray2bytes(output)
        return hash_out

if __name__ == '__main__':

    """
    Chemin de résonnement (un peu archaique mais on fait comme on peut)
    
    1er indice, le nom du challenge: "j'éponge donc j'essuie"
    Comme il s'agit de trouver une collision de HASH, et que en anglais éponge = SPONGE, on en déduit que c'est la fonction d'absorption, cad f() la faiblesse
    On regarde donc la fonction f(), on voit que ça utilise un XOR, qui dit XOR dit que: peu_importe XOR 0 = peu_importe
    Donc on à priori on va pouvoir changer la taille de l'input si on prend celui qui nous est fourni et que l'on fait un padding avec des 0 devant.
    Maintenant, quand on regarde la fonction d'initialisation de la classe, on remarque que la valeur, nombre de bytes de l'input modulo 256, est ajouté
    """

    hash_hex = bytes.fromhex(input("Hash: "))   # Le HASH que l'on souhaite reproduire
    input_hex = bytes.fromhex(input("Input: ")) # L'entrée qui a produit ce HASH
    
    # La nouvelle entrée
    new_input_hex = b"\x00" * 238 + b"\x10" + input_hex + b"\x10"
    
    # On vérifie dans le doute, on sait jamais
    bob = Bob(new_input_hex)
    assert bob.digest() == hash_hex
    
    # On affiche la solution en hexadecimal
    print(new_input_hex.hex())
    
    