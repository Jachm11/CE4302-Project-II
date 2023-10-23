import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile
from scipy.signal import welch
from matplotlib.animation import FuncAnimation

# Load the audio file
Fs, y = wavfile.read('/home/jachm/Documents/Repos/CE4302-Project-II/high level testing/barrido.wav')

# Get time of the signal and plot the signal
samples = len(y)
print(f"Samples is {samples}")

x = samples / Fs
t = np.linspace(0, x, samples)

# plt.subplot(2, 1, 1)
# plt.plot(t, y)
# plt.ylabel('Amplitude')
# plt.xlabel('Time (secs)')

# Converting signal to a frequency estimate

# Initialize the figure and axes for the animated bar plot
fig, ax = plt.subplots()
bar = ax.bar([], [], align='center')
ax.set_ylim(0, 4000)  # Adjust the y-axis limits as needed

y = y[:, 0]

# Calculate the number of samples in each 1-second segment
samples_per_second = Fs

# Function to update the animated bar plot
def animate(i):
    start_sample = i * samples_per_second
    end_sample = (i + 1) * samples_per_second

    # Extract the segment of the audio
    audio_segment = y[start_sample:end_sample]

    # Perform spectral analysis using welch for the current segment
    frequencies, power_density = welch(audio_segment, fs=Fs)

    # Get the indices of the top 10 highest power density values
    top_indices = np.argsort(power_density)[-10:][::-1]

    # Extract the top 10 frequencies and power density values
    top_frequencies = frequencies[top_indices]
    top_power_density = power_density[top_indices]

    # Normalize the power density values to the range [0, 100]
    min_power_density = np.min(top_power_density)
    max_power_density = np.max(top_power_density)
    normalized_power_density = 100 * (top_power_density - min_power_density) / (max_power_density - min_power_density)

    print(f"Top 10 Spectral Peak Frequencies for second {i+1}: {top_frequencies} Hz")

    # Update the bar plot
    ax.clear()
    ax.bar(top_frequencies, normalized_power_density, width=100)  # Adjust the bar width as needed
    ax.set_xlim(0, 22000)  # Set the x-axis limits from 0 Hz to 22 kHz
    ax.set_ylim(0, 100)  # Set the y-axis limits from 0 to 100
    ax.set_xlabel('Frequency (Hz)')
    ax.set_ylabel('Normalized Power Density')
    ax.set_title(f'Second {i+1}')

# Create the animation
ani = FuncAnimation(fig, animate, frames=int(x), repeat=False, interval=1000)

plt.show()

# # Plot the frequency spectrum
# plt.subplot(2, 1, 2)
# plt.semilogy(frequencies, power_density)
# plt.title('Power Spectral Density')
# plt.xlabel('Frequency (Hz)')
# plt.ylabel('Power/Frequency (dB/Hz)')
# plt.grid()
# plt.show()