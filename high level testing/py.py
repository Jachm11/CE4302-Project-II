import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import LinearSegmentedColormap

# Create data for the bars
data = np.random.rand(10)  # Replace with your data

# Create a color gradient from green to red
cmap = LinearSegmentedColormap.from_list('GreenToRed', ['#00FF00', '#FF0000'], N=101)

# Create a figure and axis
fig, ax = plt.subplots()

# Plot the bars with the specified color gradient
bars = ax.bar(np.arange(len(data)), data, color=cmap(data))

# Customize the plot
ax.set_xlabel('X-Axis Label')
ax.set_ylabel('Y-Axis Label')
ax.set_title('Bar Chart with Green to Red Color Gradient')
ax.set_xticks(np.arange(len(data)))
ax.set_xticklabels([f'Bar {i+1}' for i in range(len(data))])

# Add a color bar for reference
sm = plt.cm.ScalarMappable(cmap=cmap, norm=plt.Normalize(vmin=0, vmax=1))
sm.set_array([])  # An empty array is required
cbar = plt.colorbar(sm, ax=ax)

# Show the plot
plt.show()
