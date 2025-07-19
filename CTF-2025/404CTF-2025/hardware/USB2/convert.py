import numpy as np
import pandas as pd
from scipy.io import wavfile

D_neg = np.fromfile('USB2_D_neg.raw', dtype=np.float32)
D_plus = np.fromfile("USB2_D_plus.raw", dtype=np.float32)

# df = pd.DataFrame(np.array([D_neg, D_plus]).T, columns=['D_neg', 'D_plus'])
# df.to_csv('USB2.csv', index=False)

# === Step 1: Ensure same length ===
min_len = min(len(D_neg), len(D_plus))
left_channel = D_neg[:min_len]
right_channel = D_plus[:min_len]

left_channel = np.array([0] * 1000 + list(left_channel))
right_channel = np.array([0] * 1000 + list(right_channel))

# === Step 1: Apply threshold to channels ===
threshold = 0.95
left_channel[left_channel < threshold] = 0
right_channel[right_channel < threshold] = 0
left_channel[left_channel > threshold] = 1
right_channel[right_channel > threshold] = 1

# import matplotlib.pyplot as plt

# plt.figure()
# plt.plot(left_channel, label='D-')
# plt.plot(right_channel, label='D+')
# plt.xlabel('Sample')
# plt.ylabel('Amplitude')
# plt.title('Audio Data')
# plt.legend()
# plt.show()

# === Step 2: Stack into stereo (shape: [samples, 2]) ===
stereo_data = np.stack((left_channel, right_channel), axis=-1)

# === Step 3: Normalize and convert to int16 for WAV export ===
stereo_data_clipped = np.clip(stereo_data, -1.0, 1.0)
stereo_int16 = (stereo_data_clipped * 32767).astype(np.int16)

# === Step 4: Export to WAV ===
sample_rate = 1000000 * 20 * 12 # 1 MHz
wavfile.write("USB2.wav", sample_rate, stereo_int16)
