import numpy as np
from scipy.io.wavfile import write

# Parameters
input_file = 'pogsag.iq'  # Your IQ complex128 binary file
output_file = 'output.wav'   # Output audio file
sample_rate = int(4.9152*1e6)

# Load IQ data
iq_data = np.fromfile(input_file, dtype=np.complex64)

# Save to WAV
write(output_file, sample_rate, np.real(iq_data))
