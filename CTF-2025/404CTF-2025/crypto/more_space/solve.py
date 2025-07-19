import os
import hashlib
from sboxes import S1, S2
from collections import Counter
from tqdm import tqdm
import random


# --- FeistelCipher repris depuis le challenge ---
class FeistelCipher:
    BS = 64
    KS = 4
    ROUNDS = 6

    def __init__(self, key):
        assert len(key) == 8
        self.derive_key(key)

    def derive_key(self, key):
        key1, key2 = key[:4], key[4:]
        self.keys = [
            hashlib.sha256(key1 + key2).digest()[:4],
            hashlib.sha256(key2 + key1).digest()[:4],
            hashlib.sha256(key2).digest()[:4],
            hashlib.sha256(key1).digest()[:4],
            key2,
            key1,
        ]

    def encrypt_block(self, block):
        block = int.from_bytes(block, byteorder="big")
        stateL = block >> 32
        stateR = block & 0xFFFFFFFF

        for i in range(6):
            round_key = int.from_bytes(self.keys[i], byteorder="big")
            stateL, stateR = stateL ^ self.f(round_key, stateR), stateR
            stateL, stateR = self.shift(stateL), stateR
            stateL, stateR = stateR, stateL

        return int.to_bytes(stateL, length=4, byteorder="big") + int.to_bytes(
            stateR, 4, byteorder="big"
        )

    def shift(self, halfState):
        return ((halfState << 4) & 0xFFFFFFFF) + (halfState >> 28)

    def f(self, round_key, block):
        block ^= round_key
        output = 0
        for i in range(0, 32, 8):
            if i % 16:
                part = (block >> (i - 1)) & 0x1FF
                part = S2[part]
                output += part << (i - 1)
            else:
                part = (block >> i) & 0x7F
                part = S1[part]
                output += part << i
        return output


# --- Notre propre fonction F indépendante du cipher ---
def f(k, R):
    R ^= k
    output = 0
    for i in range(0, 32, 8):
        if i % 16:
            part = (R >> (i - 1)) & 0x1FF
            part = S2[part]
            output += part << (i - 1)
        else:
            part = (R >> i) & 0x7F
            part = S1[part]
            output += part << i
    return output


# --- Inverse le shift gauche de 4 bits ---
def unshift(x):
    return ((x >> 4) | ((x & 0xF) << 28)) & 0xFFFFFFFF


# --- Génération de paires avec différence delta_R ---
def generate_pairs(cipher, delta_R=0x01, N=449):
    pairs = []
    for _ in range(N):
        L = random.getrandbits(32)
        R1 = random.getrandbits(32)
        R2 = R1 ^ delta_R

        P1 = (L << 32) | R1
        P2 = (L << 32) | R2

        C1 = int.from_bytes(cipher.encrypt_block(P1.to_bytes(8, "big")), "big")
        C2 = int.from_bytes(cipher.encrypt_block(P2.to_bytes(8, "big")), "big")

        L1, R1 = C1 >> 32, C1 & 0xFFFFFFFF
        L2, R2 = C2 >> 32, C2 & 0xFFFFFFFF

        pairs.append((R1, R2, L1 ^ L2))
    return pairs


# --- Attaque différentielle pour retrouver une clé ---
def differential_attack(pairs, keyspace_bits=20):
    candidates = Counter()
    for k_guess in tqdm(range(1 << keyspace_bits)):
        k_guess <<= 32 - keyspace_bits  # on garde MSBs

        count = 0
        for R1, R2, deltaL in pairs:
            if f(k_guess, R1) ^ f(k_guess, R2) == deltaL:
                count += 1
        if count > len(pairs) * 0.6:
            candidates[k_guess] = count
    return candidates.most_common(1)[0][0]


# --- Inversion d'un tour Feistel ---
def decrypt_one_round(L, R, k):
    L, R = R, L
    L = unshift(L)
    L = L ^ f(k, R)
    return L, R


# --- Fonction principale pour retrouver les 6 clés ---
def recover_all_keys(cipher):
    keys_found = []

    # Étape 1 : récupérer k0
    print("[*] Génération des paires avec delta_R = 0x01...")
    pairs = generate_pairs(cipher, delta_R=0x01, N=3000)

    print("[*] Attaque différentielle pour retrouver k0...")
    k0 = differential_attack(pairs)
    print(f"[+] k0 = {k0:08x}")
    keys_found.append(k0.to_bytes(4, "big"))

    # Utilise n'importe quel bloc pour enchaîner
    P = os.urandom(8)
    C = cipher.encrypt_block(P)
    state = [int.from_bytes(C[:4], "big"), int.from_bytes(C[4:], "big")]

    # Inverser les 5 tours restants
    for round_id in range(1, 6):
        print(f"[*] Inversion du round {round_id}...")
        k_prev = int.from_bytes(keys_found[-1], "big")
        L, R = decrypt_one_round(state[0], state[1], k_prev)
        state = [L, R]

        # Pour récupérer la clé suivante, on refait une attaque sur la nouvelle structure
        if round_id < 5:
            pairs = [
                (state[1], state[1] ^ 0x01, f(0, state[1]) ^ f(0, state[1] ^ 0x01))
                for _ in range(3000)
            ]
            k_next = differential_attack(pairs)
            print(f"[+] k{round_id} = {k_next:08x}")
            keys_found.append(k_next.to_bytes(4, "big"))
        else:
            # Dernier round, on récupère les deux derniers blocs littéralement
            keys_found.append(state[1].to_bytes(4, "big"))
            keys_found.append(state[0].to_bytes(4, "big"))

    return keys_found


# --- Exécution ---
if __name__ == "__main__":
    print("[*] Lancement du solveur complet.")
    true_key = os.urandom(8)
    cipher = FeistelCipher(true_key)

    recovered_keys = recover_all_keys(cipher)

    print("\n[*] Résultat final :")
    for i, k in enumerate(recovered_keys):
        print(f"    k{i} = {k.hex()}")

    print("\n[*] Vérification contre les vraies clés...")
    real_keys = cipher.keys
    success = all(real_keys[i] == recovered_keys[i] for i in range(6))

    if success:
        print("[✅] Succès ! Clés correctement récupérées.")
    else:
        print("[❌] Échec : certaines clés sont incorrectes.")
