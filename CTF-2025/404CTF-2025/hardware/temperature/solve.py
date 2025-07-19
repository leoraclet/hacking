# from turtle import color
# import pandas as pd
# import numpy as np
# from scipy.io import wavfile

# data = pd.read_csv('challenge.csv')

# c1 = list(data['logic1'])
# c2 = list(data['logic2'])

# # import matplotlib.pyplot as plt

# c2 = c2[14400:14900] + c2[42600:43800] + c2[79900:80300] + c2[108100:109200]
# c1 = c1[14400:14900] + c1[42600:43800] + c1[79900:80300] + c1[108100:109200]
# # fig, axs = plt.subplots(2, 1, sharex=True, sharey=True)

# # axs[0].plot(c1)
# # axs[0].set_title('Logic 1')

# # axs[1].plot(c2)
# # axs[1].set_title('Logic 2')

# # plt.show()

# data = np.stack((np.array(c1), np.array(c2)), axis=1)

# wavfile.write("data.wav", 44100, data)
# wavfile.write("scl.wav", 44100, np.array(c1))
# wavfile.write("sda.wav", 44100, np.array(c2))


t_degC = -45 + 175 * (0x5e * 256 + 0x53) / 65535
pRH =-6 + 125 * (0xa8 * 256 + 0x9c) / 65535

print(t_degC)
print(pRH)