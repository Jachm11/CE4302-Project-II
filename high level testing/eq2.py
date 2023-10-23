import time
import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile
from scipy.signal import welch
from matplotlib.animation import FuncAnimation
import pygame
import threading

file = '/home/jachm/Documents/Repos/CE4302-Project-II/high level testing/lucky.wav'

# Load the audio file
Fs, y = wavfile.read(file)

# Get time of the signal
samples = len(y)
x = samples / Fs
y = y[:, 0]

# Define the desired frames per second (FPS)
desired_fps = 10  # Change this to your preferred FPS

# Calculate the segment duration based on the desired FPS
segment_duration = 1 / desired_fps  # 1 second divided by FPS
samples_per_segment = int(Fs * segment_duration)

# Define the specific frequencies and frequency ranges
specific_frequencies = [32, 64, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]
frequency_ranges = [(f / 2, 1.5 * f) for f in specific_frequencies]

# Initialize the figure and axes for the animated bar plot
fig, ax = plt.subplots()
bar = ax.bar(specific_frequencies, [0] * len(specific_frequencies), width=20)  # Initialize with zero heights
ax.set_ylim(0, 100)  # Set the y-axis limits from 0 to 100
ax.set_xlabel('Frequency (Hz)')
ax.set_ylabel('Normalized Power Density')
ax.set_title('Spectral Analysis')

# Set the background color of the figure and axes to black
fig.set_facecolor('black')
ax.set_facecolor('black')
# Set tick label colors to white
ax.tick_params(axis='x', colors='white')
#ax.tick_params(axis='y', colors='white')
ax.set_ylim(0, 100)  # Set the y-axis limits from 0 to 100

# Define string labels for the specific frequencies
specific_frequency_labels = ['32 Hz', '64 Hz', '125 Hz', '250 Hz', '500 Hz', '1 kHz', '2 kHz', '4 kHz', '8 kHz', '16 kHz']

data = []
all_colors = [] 

# Function to update the animated bar plot
def spectral_analisis(i):
    start_sample = i * samples_per_segment
    end_sample = (i + 1) * samples_per_segment

    # Extract the segment of the audio
    audio_segment = y[start_sample:end_sample]

    # Perform spectral analysis using welch for the current segment
    frequencies, power_density = welch(audio_segment, fs=Fs)

    # Initialize an array to store the highest power density values for specific frequencies
    highest_power_densities = []

    # Calculate the highest power density within each frequency range
    for freq_range in frequency_ranges:
        # Determine the indices corresponding to the frequencies within the range
        indices_in_range = (frequencies >= freq_range[0]) & (frequencies <= freq_range[1])
        
        # Extract power densities within the range
        power_densities_in_range = power_density[indices_in_range]
        
        # Check if there are any power density values within the range
        if len(power_densities_in_range) > 0:
            # Find the maximum power density within the range
            max_power_density = max(power_densities_in_range)
            highest_power_densities.append(max_power_density)
        else:
            highest_power_densities.append(-1)

    # Normalize the highest power density values to the range [0, 100]
    min_power_density = np.min(highest_power_densities)
    max_power_density = np.max(highest_power_densities)
    normalized_power_densities = 100 * (highest_power_densities - min_power_density) / (max_power_density - min_power_density)

    for n in range(0, len(normalized_power_densities)):
        normalized_power_densities[n] = int(normalized_power_densities[n])

    data.append(normalized_power_densities)

def gradient_color(value):
    # Normalize the value to the range [0, 1]
    normalized_value = value / 100.0

    # Interpolate between green and red
    r = min(1.0, max(0.0, 2.0 * (1.0 - normalized_value)))
    g = min(1.0, max(0.0, 2.0 * normalized_value))
    b = 0.0
    return (r, g, b)

def animate(i):

    # Update the bar plot
    ax.clear()
    ax.bar(specific_frequency_labels, data[i], color=all_colors[i])  # Adjust the bar width as needed
    #ax.set_title(f'Second {i * segment_duration:.3f} - {i * segment_duration + segment_duration:.3f} s')

# Calculate the number of frames based on the segment duration and the total audio duration
num_frames = int(x / segment_duration)

for i in range(0,num_frames):
    spectral_analisis(i)
    # Calculate colors based on data values
    colors = [gradient_color(value) for value in data[i]]
    all_colors.append(colors)

# Create the animation with the desired FPS and calculated number of frames
ani = FuncAnimation(fig, animate, frames=num_frames, repeat=False, interval= 800/desired_fps)

# Function to play the audio
def play_audio():

    time.sleep(0)

    # Initialize Pygame
    pygame.init()
    
    # Load the .wav file
    sound = pygame.mixer.Sound(file)
    
    # Play the sound
    sound.play()
    
    # Wait for the sound to finish
    pygame.time.delay(int(sound.get_length() * 1000))
    
    # Quit Pygame
    pygame.quit()

# Create a thread to play audio and set it as a daemon thread
audio_thread = threading.Thread(target=play_audio)
audio_thread.daemon = True

# Start the audio thread
audio_thread.start()

# Show the animated plot
plt.show()