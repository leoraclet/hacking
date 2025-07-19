import random

import groupe


class DiffieHellman:
    def __init__(self):
        self.G = None
        self.generateur = None
        self.clef_privee = None
        self.clef_publique_a_envoyer = None
        self.clef_publique_recue = None
        self.clef_partagee = None

    def set_groupe(self, G):
        self.G = G

    def choose_generateur(self, generateur=None):
        if generateur != None:
            self.generateur = generateur
        else:
            if self.G != None:
                self.generateur = self.G.get_element_hasard()

    def get_generateur(self):
        return self.generateur

    def choose_clef_privee(self, clef_privee=None):
        if clef_privee != None:
            self.clef_privee = clef_privee
        else:
            self.clef_privee = random.randint(2**4095, 2**4096)

    def compute_clef_publique_a_envoyer(self):
        if self.generateur != None and self.clef_privee != None:
            self.clef_publique_a_envoyer = self.G.x(
                self.generateur, self.clef_privee
            )

    def get_clef_publique_a_envoyer(self):
        return self.clef_publique_a_envoyer

    def set_clef_publique_recue(self, clef_publique_recue):
        self.clef_publique_recue = clef_publique_recue

    def compute_clef_partagee(self):
        if self.clef_privee != None:
            self.clef_partagee = self.G.multiple_operation(
                self.clef_publique_recue, self.clef_privee
            )

    def get_clef_partagee(self):
        return self.clef_partagee
