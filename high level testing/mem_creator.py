from PIL import Image
import numpy as np

# Define the image file path and the output image .mem file path
image_path = "/home/jachm/Documents/Repos/CE4302-Project-II/high level testing/image.jpg"
image_mem_file_path = "image.mem"

# Define the palette .mem file path
palette_mem_file_path = "palette.mem"

# Define the palette
palette = [[0, 0, 0], [255, 255, 255], [251, 185, 49], [99, 134, 252], [218, 0, 0], [112, 105, 0], [151, 71, 2], [251, 177, 0]]

# Function to find the index of the closest color in the palette
def find_closest_color_index(pixel):
    pixel = np.array(pixel)
    distances = [np.linalg.norm(np.array(p) - pixel) for p in palette]
    return distances.index(min(distances))

# Open the image and convert it to RGB mode
image = Image.open(image_path).convert("RGB")

# Get the dimensions of the image
width, height = image.size

# Verify that the image dimensions match the expected 640x480 resolution
if width != 640 or height != 480:
    print("Image dimensions do not match 640x480. Please provide a 640x480 image.")
else:
    # Open the output image .mem file for writing
    with open(image_mem_file_path, "w") as image_mem_file, open(palette_mem_file_path, "w") as palette_mem_file:
        # Write the palette to the palette .mem file
        for color in palette:
            palette_mem_file.write(f"{color[0]:02X}{color[1]:02X}{color[2]:02X}\n")

        # Iterate through each pixel and write the index of the closest color (limited to 3 bits) to the image .mem file
        for y in range(height):
            for x in range(width):
                pixel = image.getpixel((x, y))
                closest_color_index = find_closest_color_index(pixel)
                # Ensure the index fits within 3 bits (0 to 7)
                closest_color_index = min(closest_color_index, 7)
                image_mem_file.write(f"{closest_color_index:03b}\n")

    print(f"Image .mem file '{image_mem_file_path}' and palette .mem file '{palette_mem_file_path}' generated successfully.")
