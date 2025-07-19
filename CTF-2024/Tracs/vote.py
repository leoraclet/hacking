import hashlib

import bloodyai_alerte
import bloodyai_coffre_fort_clef
import bloodyai_effacement_urgence


# Input : bytearray / Output : string
def message_to_chainehexa(message):
    return message.hex()


# Input : string / Output bytearray
def chainehexa_to_message(chainehexa):
    return bytearray.fromhex(chainehexa)


# Input : bytearray
def print_message_en_hexa(message):
    print(message_to_chainehexa(message))


# Input : bytearray, bytearray / Output : bytearray
def xor_message_clef(message, clef):
    xor = bytearray(len(message))
    for i in range(len(message)):
        xor[i] = message[i] ^ clef[i]
    return xor


# Input : bytearray / Output : bytearray
def hache_chaine(chaine):
    return hashlib.sha512(chaine).digest()


# Input : string / Output : bytearray
def ajoute_hache_au_texte(texte):
    t = texte.encode()
    return t + hache_chaine(t)


# Input : bytearray / Output string ou False
def verifie_integrite_message_et_renvoie_texte(message):
    texte = message[:-64]
    hache = message[-64:]
    if hache == hache_chaine(texte):
        return texte.decode()
    return False


# Input : int, bytearray / Output string ou False
def dechiffre_message(utilisateur, message_chiffre):
    clef = bloodyai_coffre_fort_clef.get_clef_utilisateur_longueur_voulue_et_augmente_pointeur_clef_en_consequence(
        utilisateur, len(message_chiffre)
    )
    if clef == False:  # Il n'y a plus assez d'octets de clef
        return False
    return xor_message_clef(message_chiffre, clef)


# Input : liste de (liste de (int, bytearray))
def vote(liste_utilisateurs_messages):
    liste_choix = []
    for utilisateur_message in liste_utilisateurs_messages:
        utilisateur = utilisateur_message[0]
        message = utilisateur_message[1]
        message_clair = dechiffre_message(utilisateur, message)
        retour = verifie_integrite_message_et_renvoie_texte(message)
        if retour == False:
            bloodyai_alerte.DECLENCHE_ALERTE_MESSAGE_INVALIDE()
            exit()
        texte = retour
        liste_choix.append(texte)

    for choix in liste_choix:
        if choix != "DETRUIT" and choix != "CHIFFRE":
            bloodyai_alerte.DECLENCHE_ALERTE_MESSAGE_INVALIDE()
            print("Fin de la procédure.")
            exit()

    if liste_choix == ["DETRUIT"] * len(liste_choix):
        bloodyai_effacement_urgence.effacement_des_donnees()
        print("Fin de la procédure.")
        exit()

    if liste_choix == ["CHIFFRE"] * len(liste_choix):
        bloodyai_effacement_urgence.chiffrement_des_donnees()
        print("Fin de la procédure.")
        exit()

    print("Un vote a eu lieu mais il n'y a pas eu l'unanimité.")
    print("Aucune action n'a été engagée.")
    print("Fin de la procédure.")
    exit()
