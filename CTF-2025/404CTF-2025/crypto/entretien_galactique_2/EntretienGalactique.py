import random
import time

from Crypto.Util.number import getPrime, isPrime


def getRand():
    return getPrime(64)


prenom = list(input("Comment vous appelez-vous ? "))
random.shuffle(prenom)
prenom = "".join(prenom)

for _ in range(100):
    x, y, z = sorted(getRand() for _ in range(3))
    print(f"x + y + z = {x + y + z}")
    print(f"x^3 + y^3 + z^3 = {x**3 + y**3 + z**3}")

    try:
        t1 = time.time()
        nx, ny, nz = list(map(int, input(random.choice(questions_rh) + " ? ").split(",")))
        t2 = time.time()

        assert (x, y, z) == (nx, ny, nz)
        assert t2 - t1 < 5
    except:
        print(f"Merci beaucoup {prenom}, c'etait très challengeant, on transmet votre CV ASAP.")
        exit()

print(f"Votre profil est strictement parfait !!\nNous vous proposons un magnifique poste de {open('flag.txt', 'r').read()} a 1,2 euro de l'heure !")
