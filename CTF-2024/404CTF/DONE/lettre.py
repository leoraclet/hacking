import string

msg = "bonsoir, désolé pour le déranGement. je n'ai pas pu Y aller hier pour l'épreuve de barres asyMétriques. désolé si je N'ai pas été à lA hauteur de voS attenTes, je feraIs mieux aux épreuves publiQUes de dEmain.bises.franciS vigenere."
final = "Kl qsfwm, r'qc hm s'ynfefmmh wej rc peahxik xi eg lmgigg i uni voqevmmem fuv vkq srnk jcy psmryurnl yiyli hkppee ehv fuck ! Syuf ahkmi orw rmztuw kmsbijifq, w'aa xvvcr ha jq eelkwkpij. Rc hbiub : 404KJZ{RwBmxrzHtaBywVxybramqAlj}"

new_msg = ""

for char in msg:
    if char in string.ascii_uppercase:
        new_msg += char

print(new_msg)

final = final.upper()
mid = ""
for char in final:
    if char in string.ascii_uppercase:
        mid += char

print(mid)
new_final = ""

for i in range(len(mid)):
    char = mid[i]
    if char in string.ascii_uppercase:
        new_final += chr((((ord(char) - 65) - (ord(new_msg[i % len(new_msg)]) - 65)) % 26) + 65)
    else:
        new_final += char

print(new_final)

# 404KJZ{RwBmxrzHtaBywVxybramqAlj}
# 404CTF{NeVolezPasLesDrapeauxSvp}
# 404CTF{jeanclaude-killy_grenoble}