import pygame
import sys
from math import atan2, sqrt

# Inicializar pygame
pygame.init()

# Dimensiones lógicas
logical_width, logical_height = 640, 480

# Dimensiones reales de la ventana
window_width, window_height = 1280, 960

# Crear la ventana
screen = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption('Coordenadas del Pixel')

# Cargar la imagen y escalarla
image_path = '/home/jachm/Documents/Repos/CE4302-Project-II/high level testing/prisma.jpg'  # Cambia 'tu_imagen.jpg' por la ruta de tu imagen
original_image = pygame.image.load(image_path)
scaled_image = pygame.transform.scale(original_image, (logical_width+200, logical_height + 400))

# Crear una superficie para dibujar las líneas
line_surface = pygame.Surface((window_width, window_height), pygame.SRCALPHA)


def draw_filled_area(points, color, line_spacing):
    # Sort points in clockwise order to create a convex polygon
    sorted_points = sorted(points, key=lambda p: (atan2(p[1] - points[0][1], p[0] - points[0][0]), p))

    # Find the bounding box of the polygon
    min_x, max_x = min(p[0] for p in sorted_points), max(p[0] for p in sorted_points)
    min_y, max_y = min(p[1] for p in sorted_points), max(p[1] for p in sorted_points)

    # Counter for the number of lines drawn
    lines_drawn = 0

    # Iterate through the bounding box and check if each point is inside the polygon
    for y in range(min_y, max_y + 1, line_spacing):
        for x in range(min_x, max_x + 1, line_spacing):
            if is_point_inside_polygon(x, y, sorted_points):
                draw_line((x, y), (x + line_spacing, y + line_spacing), color, color)
                lines_drawn += 1

                # Check if the maximum number of lines has been reached
                if lines_drawn >= 40:
                    break
    print(lines_drawn)


def is_point_inside_polygon(x, y, polygon):
    n = len(polygon)
    inside = False
    p1x, p1y = polygon[0]
    for i in range(n + 1):
        p2x, p2y = polygon[i % n]
        if y > min(p1y, p2y):
            if y <= max(p1y, p2y):
                if x <= max(p1x, p2x):
                    if p1y != p2y:
                        xinters = (y - p1y) * (p2x - p1x) / (p2y - p1y) + p1x
                    if p1x == p2x or x <= xinters:
                        inside = not inside
        p1x, p1y = p2x, p2y
    return inside

def translate(value, leftMin, leftMax, rightMin, rightMax):
    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)

def draw_line(start, end, color, color_a):
    pygame.draw.line(line_surface, color, start, end, 2)
    x_i = int(translate(start[0], 0, window_width, 0, logical_width))
    y_i = int(translate(start[1], 0, window_height, 0, logical_height))
    x_f = int(translate(end[0], 0, window_width, 0, logical_width))
    y_f = int(translate(end[1], 0, window_height, 0, logical_height))
    string = f"li a0 {x_i}\nli a1 {y_i}\nli a2 {x_f}\nli a3 {y_f}\nli a4 {color_a}\njal ra, draw_line\n"
    write_to_file(string)
    #print(string)

def write_to_file(string):
    with open('assembly_output.txt', 'a') as file:
        file.write(string)

def main():
    color = (255, 0, 0)
    color_line = (255, 255, 255)
    drawing = False
    image_visible = True
    color_a = 3
    color_line_a = 4

    points = []  # Store the four points for flood-fill

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            elif event.type == pygame.MOUSEBUTTONDOWN:
                x, y = pygame.mouse.get_pos()

                if not drawing:
                    start_pos_d = (x, y)
                    drawing = True
                else:
                    end_pos_d = (x, y)
                    drawing = False
                    draw_line(start_pos_d, end_pos_d, color_line,color_a)

                if len(points) < 4:
                    points.append((x, y))

                    if len(points) == 4:
                        # Draw filled area and perform flood-fill
                        draw_filled_area(points, color, 30)
                        pygame.display.flip()  # Update the display
                        points = []


            elif event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
                # Toggle the visibility of the image on and off with the spacebar
                image_visible = not image_visible

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_1:
                color = (255, 0, 0)
                color_a = 3
            
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_2:
                color = (140, 10, 10)
                color_a = 2

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_3:
                color = (0, 0, 255)
                color_a = 4
            


        # Mostrar la imagen escalada y las líneas
        screen.fill((0, 0, 0))  # Rellenar la pantalla con blanco
        if image_visible:
            screen.blit(scaled_image, (window_width//2 - (logical_width+200)//2, window_height//2 - (logical_height+400)//2))
        screen.blit(line_surface, (0,0))
        pygame.display.flip()

if __name__ == "__main__":
    main()
