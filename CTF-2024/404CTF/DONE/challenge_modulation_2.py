import numpy as np
import json


def QAM16(symbol):
	return -3+2*(symbol>>2)+1j*(3-2*(symbol&0b11))

def OFDM(T,N,X,t):
	return sum([X[k]*np.exp(2j*np.pi*k*t/T) for k in range(N)])

def map_bytes(bytes_list):
	mapped_symbols = []
	for b in bytes_list:
		mapped_symbols += [QAM16(b>>4),QAM16(b&0b1111)]
	return mapped_symbols

NB_SOUS_PORTEUSES = 8
F_C = 7e3
F_E = int(50*F_C)
T_E = 1/F_E
R = 1000
T = 1/R

"""
data = np.fromfile('flag.png', dtype = "uint8")
modulated = []

for i in range(0,len(data),4):
	mapped = np.array(map_bytes(data[i:i+4]))
	modulated += [OFDM(T,NB_SOUS_PORTEUSES,mapped,t*T_E) for t in range(int(F_E*T))]

np.array(modulated,dtype='complex64').tofile("flag.iq")
"""

lol = [24, 154, 187, 231]
mapped = map_bytes(lol)
print(mapped)

def OFDM_inv(x, t, T, N=8):
    return sum([x[k]*np.exp(-2j*np.pi*k*t/T) for k in range(N)]) / N

print((854000 / int(F_E*T)) * 4)
flag = np.fromfile('flag.iq', dtype="complex64")
print(flag)
print(flag.size)

modulated = [OFDM(T,NB_SOUS_PORTEUSES,mapped,t*T_E) for t in range(int(F_E*T))]
demodulated = [OFDM_inv(modulated, t*T_E, T, 350) for t in range(8)]

print(demodulated)

invert_table_2 = {}
invert_table_3 = {}

for i in range(256):
    invert_table_2[QAM16(i >> 4)] = i
    invert_table_3[(QAM16(i >> 4), QAM16(i & 0b1111))] = i

"""
print()
print(invert_table_1)
print(len(invert_table_1))
print()
print(invert_table_2)
print(len(invert_table_2))
"""
#print(invert_table_3)
#print(len(invert_table_3))

all_symbols = list(invert_table_2.keys())

print(all_symbols)

all_symbols = np.array(all_symbols)
dists = abs(np.array(demodulated).reshape((-1,1)) - all_symbols.reshape((1,-1)))
const_index = dists.argmin(axis=1)
hardDecision = all_symbols[const_index]


final = []

for i in range(0, len(hardDecision), 2):
    final.append(invert_table_3[(hardDecision[i], hardDecision[i+1])])

print(final)

solution = []

for j in range(0, flag.size, 350):
    modulated = flag[j:j+350]
    demodulated = [OFDM_inv(modulated, t*T_E, T, 350) for t in range(8)]
    
    dists = abs(np.array(demodulated).reshape((-1,1)) - all_symbols.reshape((1,-1)))
    const_index = dists.argmin(axis=1)
    hardDecision = all_symbols[const_index]
    
    final = []

    for i in range(0, len(hardDecision), 2):
        final.append(invert_table_3[(hardDecision[i], hardDecision[i+1])])
    
    solution += final


np.array(solution,dtype='uint8').tofile("flag.png")
    