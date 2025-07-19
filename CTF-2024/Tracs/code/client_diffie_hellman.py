import systeme_reseau
import thread_connexion

from groupe_permutations import GroupePermutations
from diffie_hellman import DiffieHellman
from my_good_generators import generator_4096

def client_diffie_hellman():
    dh = DiffieHellman()
    G = GroupePermutations(4096)
    dh.set_groupe(G)

    dh.choose_generateur(generator_4096)
    dh.choose_clef_privee()
    dh.compute_clef_publique_a_envoyer()
    message_a_envoyer = "G=" + str(dh.get_generateur()) + "/A=" + str(dh.get_clef_publique_a_envoyer())
    systeme_reseau.envoi_message(message_a_envoyer)
    message_clef_publique_recue = systeme_reseau.attente_message()
    if message_clef_publique_recue[:2]!="B=":
        print("Message Clef Publique Incorrect")
        return False
    dh.set_clef_publique_recue(eval(message_clef_publique_recue[2:]))
    dh.compute_clef_partagee()
    clef_partagee = dh.get_clef_partagee()
    thread_connexion.create(G.element_to_clef(clef_partagee))
    return True
