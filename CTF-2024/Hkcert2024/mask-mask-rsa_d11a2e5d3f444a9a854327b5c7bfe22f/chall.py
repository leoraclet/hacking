from Crypto.Util.number import getPrime, bytes_to_long
import string
import random

CHARS = string.ascii_letters

FLAG = b'flag{this_is_a_test_flag}'

def mask_expr(expr):
    global e, n
    assert '**' not in expr, "My computer is weak, I can't handle this insane calculation"
    assert len(expr) <= 4, "Too long!"
    assert all([c in r'pq+-*/%' for c in expr]), "Don't try to break me"
    res = eval(expr)
    return str(pow(res, e, n))[::2]

if __name__ == '__main__':

    for i in range(20):
        lol = ''.join(random.choices(CHARS, k=i))
        print(len(lol), len(lol[::2]))
    print()
    print()
    e = 65537
    p, q = 1, 1
    while p == q:
        while (p-1) % e == 0:
            p = getPrime(513)
        while (q-1) % e == 0:
            q = getPrime(513)

    m = bytes_to_long(FLAG)
    n = p * q
    c = pow(m, e, n)
    print(f'{c = }')
    for _ in range(6):
        expr = input('Input your expression in terms of p, q and r: ')
        print(mask_expr(expr))

c = 334659660824341845974877742225504248484935166927294182355618376039406678133648088502185724817387789131642591078343386900443496124868320387671656270231735124835796143714887470427040997261483425111957584208089025253274990270434766026779559524088028862863285430326272113913748742420069900983177607369966242097475
p_mask = 63727882869383688245320001048307954569424455073244514702065174541422707031585130302946409292152872617822926106470475302180810094789831865590867969394340727
q_mask = 1024934618367514200729610304744270080734407427921426744997558633912459840096456360779434257551949690597453245590165337610941589611096308301603402859493990
p_is_greater_than_q = False # q > p
q_mod_p_mask = 1827798117324538150535160844574080233587642544248919462163521074991404162868478147781846386206710069255585075498127241451824282034423488556528604583002372
q_minus_p_mask = q_mod_p_mask if not p_is_greater_than_q else 0

print(p.bit_length(), q.bit_length())