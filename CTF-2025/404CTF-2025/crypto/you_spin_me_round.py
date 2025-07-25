import os

flag = os.getenv("flag") or b"404CTF{fake_flag_for_testing_purpose}"

s_box = (
    0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16,
)

inv_s_box = [0x00] * 256
for i in range(256):
    inv_s_box[s_box[i]] = i

def sub_bytes(s):
    # Let's do this more than once to be stronger
    for _ in range(security):
        for i in range(4):
            for j in range(4):
                s[i][j] = s_box[s[i][j]]


def inv_sub_bytes(s):
    # Let's do this more than once to be stronger
    for _ in range(security):
        for i in range(4):
            for j in range(4):
                s[i][j] = inv_s_box[s[i][j]]


def shift_rows(s):
    s[0][1], s[1][1], s[2][1], s[3][1] = s[1][1], s[2][1], s[3][1], s[0][1]
    s[0][2], s[1][2], s[2][2], s[3][2] = s[2][2], s[3][2], s[0][2], s[1][2]
    s[0][3], s[1][3], s[2][3], s[3][3] = s[3][3], s[0][3], s[1][3], s[2][3]


def inv_shift_rows(s):
    s[0][1], s[1][1], s[2][1], s[3][1] = s[3][1], s[0][1], s[1][1], s[2][1]
    s[0][2], s[1][2], s[2][2], s[3][2] = s[2][2], s[3][2], s[0][2], s[1][2]
    s[0][3], s[1][3], s[2][3], s[3][3] = s[1][3], s[2][3], s[3][3], s[0][3]


def add_round_key(s, k):
    for i in range(4):
        for j in range(4):
            s[i][j] ^= k[i][j]


xtime = lambda a: (((a << 1) ^ 0x1B) & 0xFF) if (a & 0x80) else (a << 1)


def mix_single_column(a):
    t = a[0] ^ a[1] ^ a[2] ^ a[3]
    u = a[0]
    a[0] ^= t ^ xtime(a[0] ^ a[1])
    a[1] ^= t ^ xtime(a[1] ^ a[2])
    a[2] ^= t ^ xtime(a[2] ^ a[3])
    a[3] ^= t ^ xtime(a[3] ^ u)


def mix_columns(s):
    for i in range(4):
        mix_single_column(s[i])


def inv_mix_columns(s):
    for i in range(4):
        u = xtime(xtime(s[i][0] ^ s[i][2]))
        v = xtime(xtime(s[i][1] ^ s[i][3]))
        s[i][0] ^= u
        s[i][1] ^= v
        s[i][2] ^= u
        s[i][3] ^= v

    mix_columns(s)


r_con = (
    0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40,
    0x80, 0x1B, 0x36, 0x6C, 0xD8, 0xAB, 0x4D, 0x9A,
    0x2F, 0x5E, 0xBC, 0x63, 0xC6, 0x97, 0x35, 0x6A,
    0xD4, 0xB3, 0x7D, 0xFA, 0xEF, 0xC5, 0x91, 0x39,
)


def bytes2matrix(text):
    return [list(text[i:i + 4]) for i in range(0, len(text), 4)]


def matrix2bytes(matrix):
    return bytes(sum(matrix, []))


def xor_bytes(a, b)-> list[bytes]:
    return bytes(i ^ j for i, j in zip(a, b))


def inc_bytes(a):
    out = list(a)
    for i in reversed(range(len(out))):
        if out[i] == 0xFF:
            out[i] = 0
        else:
            out[i] += 1
            break
    return bytes(out)


def pad(plaintext):
    padding_len = (16 - (len(plaintext) % 16)) % 16
    padding = bytes([padding_len] * padding_len)
    return plaintext + padding


def unpad(plaintext):
    padding_len = plaintext[-1]
    assert padding_len > 0
    message, padding = plaintext[:-padding_len], plaintext[-padding_len:]
    assert all(p == padding_len for p in padding)
    return message


def split_blocks(message, block_size=16, require_padding=True):
    assert len(message) % block_size == 0 or not require_padding
    return [message[i:i + 16] for i in range(0, len(message), block_size)]


class BC_Starhunter:
    rounds_by_key_size = {16: 10, 24: 12, 32: 14}

    def __init__(self, master_key):
        assert len(master_key) in self.rounds_by_key_size
        self.n_rounds = self.rounds_by_key_size[len(master_key)]
        self._key_matrices = self._expand_key(master_key)

    def _expand_key(self, master_key):
        key_columns = bytes2matrix(master_key)
        iteration_size = len(master_key) // 4

        i = 1
        while len(key_columns) < (self.n_rounds + 1) * 4:
            word = list(key_columns[-1])

            if len(key_columns) % iteration_size == 0:
                word.append(word.pop(0))
                word = [s_box[b] for b in word]
                word[0] ^= r_con[i]
                i += 1
            elif len(master_key) == 32 and len(key_columns) % iteration_size == 4:
                word = [s_box[b] for b in word]

            word = xor_bytes(word, key_columns[-iteration_size])
            key_columns.append(word)

        return [key_columns[4 * i: 4 * (i + 1)] for i in range(len(key_columns) // 4)]

    def encrypt_block(self, plaintext):
        assert len(plaintext) == 16

        plain_state = bytes2matrix(plaintext)

        add_round_key(plain_state, self._key_matrices[0])

        for i in range(1, self.n_rounds):
            sub_bytes(plain_state)
            shift_rows(plain_state)
            mix_columns(plain_state)
            add_round_key(plain_state, self._key_matrices[i])

        sub_bytes(plain_state)
        shift_rows(plain_state)
        add_round_key(plain_state, self._key_matrices[-1])

        return matrix2bytes(plain_state)

    def decrypt_block(self, ciphertext):
        assert len(ciphertext) == 16

        cipher_state = bytes2matrix(ciphertext)

        add_round_key(cipher_state, self._key_matrices[-1])
        inv_shift_rows(cipher_state)
        inv_sub_bytes(cipher_state)

        for i in range(self.n_rounds - 1, 0, -1):
            add_round_key(cipher_state, self._key_matrices[i])
            inv_mix_columns(cipher_state)
            inv_shift_rows(cipher_state)
            inv_sub_bytes(cipher_state)

        add_round_key(cipher_state, self._key_matrices[0])

        return matrix2bytes(cipher_state)

    def sendMissile(self, plaintext):
        plaintext = pad(plaintext)
        print(f"Envoie du missile de force {len(plaintext)}...")
        blocks = split_blocks(plaintext)
        ciphertext = b"".join(self.encrypt_block(block) for block in blocks)
        return ciphertext

    def decrypt(self, ciphertext):
        blocks = split_blocks(ciphertext, require_padding=False)
        plaintext = b"".join(self.decrypt_block(block) for block in blocks)
        return unpad(plaintext)


if __name__ == "__main__":

    N = 277_182 # Secuity
    security = N
    key = os.urandom(16)
    print(f"Key: {key.hex()}")
    Battlecruiser = BC_Starhunter(key)
    tries = 2
    lol1 = Battlecruiser.sendMissile(b"\x00" * 16)
    print((b"\x00" * 16).hex(), lol1.hex())
    lol2 = Battlecruiser.sendMissile(flag)
    print(lol2.hex())

    # print("""
    # ====================================================================================================
    #          .  . '    .
    #       '   .            . '            .                +
    #               `                          '    . '
    #         .                         ,'`.                         .
    #    .                  .."    _.-;'    `.              .
    #               _.-"`.##%"_.--" ,'        `.           "#"     ___,,od000
    #            ,'"-_ _.-.--"\   ,'            `-_       '%#%',,/////00000HH
    #          ,'     |_.'     )`/-     __..--""`-_`-._    J L/////00000HHHHM
    #  . +   ,'   _.-"        / /   _-""           `-._`-_/___\///0000HHHHMMM
    #      .'_.-""      '    :_/_.-'                 _,`-/__V__\\0000HHHHHMMMM
    #  . _-""                         .        '   _,////\  |  /000HHHHHMMMMM
    # _-"   .       '  +  .              .        ,//////0\ | /00HHHHHHHMMMMM
    #        `                                   ,//////000\|/00HHHHHHHMMMMMM
    # .             '       .  ' .   .       '  ,//////00000|00HHHHHHHHMMMMMM
    #      .             .    .    '           ,//////000000|00HHHHHHHMMMMMMM
    #                   .  '      .       .   ,///////000000|0HHHHHHHHMMMMMMM
    #   '             '        .    '         ///////000000000HHHHHHHHMMMMMMM
    #                     +  .  . '    .     ,///////000000000HHHHHHHMMMMMMMM
    #      '      .              '   .       ///////000000000HHHHHHHHMMMMMMMM
    #    '                  . '              ///////000000000HHHHHHHHMMMMMMMM
    #                            .   '      ,///////000000000HHHHHHHHMMMMMMMM
    #        +         .        '   .    .  ////////000000000HHHHHHHHMMMMMMhs
    # ====================================================================================================
    # Un ennemi est à vos trousses, il semble difficile de lui échapper... Vous décidez d'engager le combat, après avoir tourné autour de cette planète sans réel résultat...
    # """)
    # try:
    #     security = int(input("Entrez votre niveau de sécurité pour commencer le combat: "))
    #     if security <= 0:
    #         print("Uhm... sans sécurité, le combat est déjà perdu... x.x")
    #         exit(0)
    #     if security > 300_000:
    #         print("Uhm... La paranoïa ?? ...")
    #         exit(0)
    # except:
    #     print("Contact perdu.... Qui sait ce qu'il s'est passé...")
    #     exit(1)

    # while tries != 0:
    #     try:
    #         choice = int(input("""
    #         Qu'allez vous faire maintenant !?
    #         1. Essayer de communiquer.
    #         2. Utiliser votre arme secrète.
    #         """))
    #         tries -= 1

    #         if choice == 1:
    #             message = bytes.fromhex(input("Qu'allez-vous envoyer ?"))
    #             print(f"Aussi étrange que cela puisse paraître, voici ce qu'il a répondu : {Battlecruiser.sendMissile(message).hex()}")

    #         elif choice == 2:
    #             print("Bien, attendez d'être attaqué et ensuite envoyez exactement le même missile pour passer outre son bouclier magnétique")

    #             loadingMissile = os.urandom(16)
    #             missile = Battlecruiser.sendMissile(loadingMissile).hex()

    #             print(f"Là ! Le missile arrive ! >>> {missile}")
    #             response = bytes.fromhex(input("Fiouuu que devons-nous renvoyer chef ?"))

    #             print("""
    #                     ⠀⠀⠀⠀ ⢠⠀⡀⢀⠀⢠⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠀⢠⢤⣀⠀⠀⠀⠈⣆⢧⠈⡆⢸⠀⠀⠀⢰⢡⠇⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⢀⠀⠀⣯⢀⣨⠃⠀⠀⠀⠸⡜⣄⣣⢸⠀⠀⠀⡜⡌⠀⠀⠀⠀⢀⡜⡁⠀⠀⠀⠀⠀
    #             ⠀⠀⠙⢮⡳⢄⠈⠁⠀⢠⠴⠍⣛⣚⣣⢳⢽⡀⣏⣲⣀⢧⡥⠤⠶⢤⣠⢎⠜⠁⠀⠀⠀⠀⠀
    #             ⠀⠠⣀⠀⠙⢦⡑⢄⢀⣾⣧⡎⠁⠀⠙⡎⡇⡇⡇⠹⢪⣀⡓⣦⢀⣼⣵⠋⢀⠴⣊⠔⠁⠀⠀
    #             ⠀⠀⠈⠑⢦⣀⠙⣲⣝⢭⡚⠃⠀⠀⠀⠸⠸⣹⠁⠀⠀⠀⠉⣹⣪⣎⡸⢞⡵⠊⠁⣀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠈⣷⢯⣨⠷⣝⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠵⣪⢶⣙⡤⠖⢉⣀⠤⠖⠂
    #             ⠀⠀⠀⠀⠀⢀⡞⢠⠾⠓⢮⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⣺⡯⢕⢲⠉⣥⣀⡀⠀⠀
    #             ⠀⠀⢀⡤⣀⢈⡷⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠘⠀⢱⢾⠘⢇⢴⠁⠀⠀
    #             ⠀⠀⢻⣀⡼⢘⣧⢀⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⢙⣞⠆⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⠉⠀⢿⡀⠈⠧⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⣹⣦⠇⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠸⢤⡴⢺⡧⣴⡶⢗⡣⠀⡀⠀⠀⠀⡄⠀⢀⣄⠢⣔⡞⣤⠦⡇⠀⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⣀⡤⣖⣯⡗⣪⢽⡻⣅⠀⣜⡜⠀⠀⠀⠸⡜⡌⣮⡣⡙⢗⢏⡽⠁⠰⡏⠙⡆⠀⠀
    #             ⠀⠀⣒⡭⠖⣋⡥⣞⣿⡚⠉⠉⢉⢟⣞⣀⣀⣀⠐⢦⢵⠹⡍⢳⡝⢮⡷⢝⢦⡀⠉⠙⠁⠀⠀
    #             ⠐⠊⢡⠴⠚⠕⠋⠹⣍⡉⠹⢧⢫⢯⣀⣄⣀⠈⣹⢯⣀⣧⢹⡉⠙⢦⠙⣄⠑⢌⠲⣄⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠀⠀⠀⠘⠧⡴⣳⣃⣸⠦⠴⠖⢾⣥⠞⠛⠘⣆⢳⡀⠈⠳⡈⠳⡄⠁⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⡱⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⢣⠀⠀⠉⠀⠈⠂⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠀⠀⢀⠞⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
    #             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    #                     """)

    #             if loadingMissile == response:
    #                 print(f"Bien joué, vous êtes sortis vainqueur. Voici votre prime : {flag}")

    #             else:
    #                 print("C'était vous... x.x")
    #                 exit(0)
    #     except Exception as e:
    #         print(e)
    #         print("Contact perdu.... Qui sait ce qu'il s'est passé...")
    #         exit(1)

# Solve sage
"""
def bytes2mat(b):
    a = []
    for i in b:
        tmp = bin(i)[2:].zfill(8)
        for j in tmp:
            a.append(int(j))
    return Matrix(GF(2), a)

def mat2bytes(m):
    a = ""
    for i in range(128):
        a += str(m[0, i])
    a = [a[i:i+8] for i in range(0, 128, 8)]
    a = [int(i, 2) for i in a]
    return bytes(a)

I = identity_matrix(GF(2), 8)
X = Matrix(GF(2), 8, 8)
for i in range(7):
    X[i, i+1] = 1
X[3, 0] = 1
X[4, 0] = 1
X[6, 0] = 1
X[7, 0] = 1

C = block_matrix([
    [X, X+I, I, I],
    [I, X, X+I, I],
    [I, I, X, X+I],
    [X+I, I, I, X]
])

zeros = Matrix(GF(2), 8, 8)
zeros2 = Matrix(GF(2), 32, 32)
o0 = block_matrix([
    [I, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros]
])

o1 = block_matrix([
    [zeros, zeros, zeros, zeros],
    [zeros, I, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros]
])

o2 = block_matrix([
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, I, zeros],
    [zeros, zeros, zeros, zeros]
])

o3 = block_matrix([
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, zeros],
    [zeros, zeros, zeros, I]
])

S = block_matrix([
    [o0, o1, o2, o3],
    [o3, o0, o1, o2],
    [o2, o3, o0, o1],
    [o1, o2, o3, o0]
])

M = block_matrix([
    [C, zeros2, zeros2, zeros2],
    [zeros2, C, zeros2, zeros2],
    [zeros2, zeros2, C, zeros2],
    [zeros2, zeros2, zeros2, C]
])

R = M*S
A = S*(R**9) # sorry for the inconsistency in the variable name, this is supposed to be SA^9 that I talked about

ct = bytes.fromhex("96dd7d6857165907919ea012955a805d")
p2 = bytes.fromhex("00000000000000000000000000000000")
ct2 = bytes.fromhex("fa424199dc33214b4bd189e71b69b35e")

p2 = bytes2mat(p2).transpose()
ct2 = bytes2mat(ct2).transpose()

K = ct2 - A*p2

recovered_plaintext = mat2bytes((A.inverse() * (bytes2mat(ct).transpose() - K)).transpose())
print(recovered_plaintext.hex())
"""
