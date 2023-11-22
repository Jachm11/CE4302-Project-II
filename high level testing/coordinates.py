import pygame
import sys

# Inicializar pygame
pygame.init()

# Dimensiones lógicas
logical_width, logical_height = 640, 480

# Dimensiones reales de la ventana
window_width, window_height = 3840, 2160

# Crear la ventana
screen = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption('Coordenadas del Pixel')

# Cargar la imagen y escalarla
image_path = '/home/jachm/Documents/Repos/CE4302-Project-II/high level testing/prisma.jpg'  # Cambia 'tu_imagen.jpg' por la ruta de tu imagen
original_image = pygame.image.load(image_path)
scaled_image = pygame.transform.scale(original_image, (logical_width+1000, logical_height + 1200))

# Crear una superficie para dibujar las líneas
line_surface = pygame.Surface((window_width, window_height), pygame.SRCALPHA)


def translate(value, leftMin, leftMax, rightMin, rightMax):
    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)

def draw_line(start, end, color):
    pygame.draw.line(line_surface, color, start, end, 2)

def write_to_file(start, end):
    with open('assembly_output.txt', 'a') as file:
        file.write(f"li a0 {start[0]}\nli a1 {start[1]}\nli a2 {end[0]}\nli a3 {end[1]}\nli a4 5\njal ra, draw_line\n")

def main():
    color = (255, 0, 0)
    drawing = False
    start_pos = (0, 0)
    end_pos = (0, 0)
    image_visible = True
    color_a = 3

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
            elif event.type == pygame.MOUSEBUTTONDOWN:
                # Obtener las coordenadas del mouse al hacer clic
                x, y = pygame.mouse.get_pos()
                x_s = int(translate(x,0,window_width,0,logical_width))
                y_s = int(translate(y,0,window_height,0,logical_height))
                if not drawing:
                    start_pos = (x_s, y_s)
                    start_pos_d = (x, y)
                    drawing = True
                else:
                    end_pos = (x_s, y_s)
                    end_pos_d = (x, y)
                    drawing = False
                    draw_line(start_pos_d, end_pos_d, color)
                    write_to_file(start_pos, end_pos)
                    print(f"li a0 {start_pos[0]}\nli a1 {start_pos[1]}\nli a2 {end_pos[0]}\nli a3 {end_pos[1]}\nli a4 {color_a}\njal ra, draw_line")


            elif event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
                # Toggle the visibility of the image on and off with the spacebar
                image_visible = not image_visible

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_1:
                color = (219, 43, 57)
                color_a = 8
                print("red")
            
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_2:
                color = (250, 107, 119)
                color_a = 9
                print("light red")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_3:
                color = (117, 12, 20)
                color_a = 10
                print("dark red")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_4:
                color = (41,51,92)
                color_a = 11
                print("blue")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_5:
                color = (101, 115, 171)
                color_a = 12
                print("light blue")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_6:
                color = (29, 38, 71)
                color_a = 13
                print("dark blue")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_7:
                color = (243, 167, 18)
                color_a = 14
                print("yellow")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_8:
                color = (252, 205, 111)
                color_a = 15
                print("light yellow")
            
            elif event.type == pygame.KEYDOWN and event.key == pygame.K_9:
                color = (148, 99, 3)
                color_a = 16
                print("dark yellow")

            elif event.type == pygame.KEYDOWN and event.key == pygame.K_0:
                color = (255, 255, 255)
                color_a = 1
                print("white")
            

        # Mostrar la imagen escalada y las líneas
        screen.fill((0, 0, 0))  # Rellenar la pantalla con blanco
        if image_visible:
            screen.blit(scaled_image, (window_width//2 - (logical_width+1000)//2, window_height//2 - (logical_height+1200)//2))
        screen.blit(line_surface, (0,0))
        pygame.display.flip()

if __name__ == "__main__":
    main()
