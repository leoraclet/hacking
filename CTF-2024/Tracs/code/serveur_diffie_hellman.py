import systeme_reseau
import thread_connexion

from diffie_hellman import DiffieHellman
from groupe_permutations import GroupePermutations


def serveur_diffie_hellman():
    dh = DiffieHellman()
    G = GroupePermutations(4096)
    dh.set_groupe(G)
    while True:
        message_connexion = systeme_reseau.attente_message()
        [message_generateur, message_clef_publique_recue] = message_connexion.split("/")
        if message_generateur[:2] != "G=" or message_clef_publique_recue[:2] != "A=":
            print("Message Connexion Incorrect")
            continue
        else:
            dh.choose_generateur(generateur=eval(message_generateur[2:]))
            dh.choose_clef_privee()
            dh.compute_clef_publique_a_envoyer()
            message_a_envoyer = "B=" + str(dh.get_clef_publique_a_envoyer())
            systeme_reseau.envoi_message(message_a_envoyer)
            dh.set_clef_publique_recue(eval(message_clef_publique_recue[2:]))
            dh.compute_clef_partagee()
            clef_partagee = dh.get_clef_partagee()
            thread_connexion.create(G.element_to_clef(clef_partagee))
