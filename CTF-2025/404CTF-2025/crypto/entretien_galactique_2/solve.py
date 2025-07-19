import json
import random
import time
from math import gcd

from sympy import *

from Crypto.Util.number import getPrime, isPrime


def solve_problem(n3, n1, z):
    x1, y1 = symbols("x, y", integer=True)
    sol = solve(
        [
            x1**3 + y1**3 + z**3 - n3,
            x1 + y1 + z - n1,
        ],
    )

    return sol


def getRand():
    return getPrime(64)


##########################################
# SAGEMATH PART
##########################################

# def getPrime(bits):
#     return random_prime(2 ^ 64 - 1, False, 2 ^ 63)


# def getRand():
#     return getPrime(64)


# x, y, z = sorted(getRand() for _ in range(3))
# n3 = x**3 + y**3 + z**3
# n1 = x + y + z

# n = (
#     n1**3 - n3
# ) / 3  # (x + y + z)^3 = (x^3 + y^3 + z^3) - 3 * (x + y)(y + z)(z + x) => (x + y)(y + z)(z + x) = ((x + y + z)^3 - (x^3 + y^3 + z^3)) / 3


# sols = []
# for d in list(divisors(n)):
#     t = -(d - n1)
#     if ZZ(t).is_prime() and 2**63 < t < 2**64 - 1:
#         sols.append(t)

# print(sols)
# print(n3, n1)

sols = [
    17943338313850301489,
    17897476142817305569,
    17892428147907556517,
    16967991096768032609,
    16569197092213639009,
    16444407611443457453,
    16260312216924073313,
    15832955307379606049,
    15810865577621022401,
    15774488639828656193,
    15509602857413184353,
    15247621346737246937,
    13960587737366325409,
    13950330661682978183,
    13387127116209253409,
    13363838663660796323,
    12561712927683597749,
    12209548736176767809,
    11802866082386278369,
    11602269264807496409,
    10614531144269310689,
    9558857987902776737,
    9540669488349722269,
    9338622332594983289,
]

n3, n1 = 4128520337331161666822544662076657755463039391050751488929, 32463366139913295329
for s in sols:
    sol = list(solve_problem(n3, n1, s))

    if sol != []:
        for e in sol:
            x, y = e.values()
            if x + y + s == n1 and x**3 + y**3 + s**3 == n3:
                print(sorted([x, y, s]))
                break


# prenom = list(input("Comment vous appelez-vous ? "))
# random.shuffle(prenom)
# prenom = "".join(prenom)

# questions_rh = [
#     "Si vous étiez une photocopieuse, comment réagiriez-vous à une surcharge papier émotionnelle",
#     "Un lama rentre dans la salle de réunion et réclame un Beamer. Que faites-vous",
#     "Décrivez vos competences en télépathie sur une echelle de 1 à 'je connais déjà votre reponse'",
#     "Combien de pingouins peut-on faire rentrer dans une théière sans enfreindre la charte éthique de l'entreprise",
#     "Votre manager se transforme soudainement en moine tibétain et ne parle plus que par enigmes. Comment menez-vous à bien votre projet",
#     "Vous êtes coincé dans un ascenseur avec votre alter ego du futur qui vous juge. Quel est votre plan de survie mentale",
#     "Si vous deviez convaincre un pot de yaourt de vous accorder une promotion, quel serait votre discours",
#     "Quel est votre plus grand échec professionnel impliquant une chèvre et un vidéoprojecteur",
#     "Un stagiaire affirme être la reincarnation de Napoléon. Le croyez-vous. Pourquoi",
#     "Si on vous donnait le pouvoir de rendre invisible un seul objet au bureau, que choisiriez-vous (et pourquoi la machine à café)",
#     "Comment voyez vous votre vie dans 48 ans",
#     "Votre collègue de bureau vous mord le doigt de pied, que faites vous"]

# for _ in range(100):
# x, y, z = sorted(getRand() for _ in range(3))
# print(f"x + y + z = {x + y + z}")
# print(f"x^3 + y^3 + z^3 = {x**3 + y**3 + z**3}")

#     try:
#         t1 = time.time()
#         nx, ny, nz = list(map(int, input(random.choice(questions_rh) + " ? ").split(",")))
#         t2 = time.time()

#         assert (x, y, z) == (nx, ny, nz)
#         assert t2 - t1 < 5
#     except:
#         print(f"Merci beaucoup {prenom}, c'etait très challengeant, on transmet votre CV ASAP.")
#         exit()

# print(f"Votre profil est strictement parfait !!\nNous vous proposons un magnifique poste de {open('flag.txt', 'r').read()} a 1,2 euro de l'heure !")
