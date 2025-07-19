import random

from groupe import Groupe


class GroupePermutations(Groupe):

    def __init__(self, size):
        self.size = size

    def get_element_neutre(self):
        return [i for i in range(self.size)]

    def get_symetrique(self, x):
        y = [0] * self.size
        for i in range(self.size):
            y[x[i]] = i
        return y

    def get_element_hasard(self):
        element = [i for i in range(self.size)]
        random.shuffle(element)
        return element

    def operation(self, x, y):
        z = [0] * self.size
        for i in range(self.size):
            z[i] = y[x[i]]
        return z

    def multiple_operation(self, element, multiple):
        bits_multiple = bin(multiple)[2:]
        resultat = [i for i in range(4096)]
        for bit in bits_multiple:
            resultat = self.operation(resultat, resultat)
            if bit == "1":
                resultat = self.operation(resultat, element)
        return resultat

    def element_to_clef(self, x):
        v = 0
        for i in range(1, self.size):
            v *= 2
            if x[i - 1] < x[i]:
                v += 1
        w = 0
        for i in range(self.size // 2, self.size):
            w *= 2
            if x[i - self.size // 2] < x[i]:
                w += 1

        return (v * w // (2**512)) % (2**2048)
