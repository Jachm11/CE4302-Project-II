import matplotlib.pyplot as plt
import random
from matplotlib.animation import FuncAnimation

# Función para generar coordenadas aleatorias de inicio y fin de la línea
def generate_random_line():
    x0 = random.randint(0, 640)
    y0 = random.randint(0, 480)
    x1 = random.randint(0, 640)
    y1 = random.randint(0, 480)
    x0 = 0
    y0 = 16
    x1 = 24
    y1 = 0
    return x0, y0, x1, y1

# Función de animación para actualizar las líneas
def animate(i):
    for line in lines:
        x0, y0, x1, y1 = generate_random_line()
        #line_points = draw_line(x0, y0, x1, y1)
        line_points = draw_straight(0, 8, 1, 5)
        x, y = zip(*line_points)
        line.set_data(x, y)

def draw_line(x0, y0, x1, y1):

    #Resta vectorial + abs
    dx = abs(x1 - x0) 
    dy = abs(y1 - y0)

    steep = dy > dx
    if steep:
        x0, y0 = y0, x0
        x1, y1 = y1, x1
    if x0 > x1:
        x0, x1 = x1, x0
        y0, y1 = y1, y0
        

    #Resta vectorial + abs
    dx = abs(x1 - x0)
    dy = abs(y1 - y0)

    print("v0",x0,y0)
    print("v1",x1,y1)

    error = dx 
    ystep = 1 if y0 < y1 else -1
    y = y0
    points = []
    for x in range(x0, x1 + 1):
        if steep:
            points.append((y, x))
        else:
            points.append((x, y))
        error -= dy
        if error < 0:
            y += ystep
            error += dx
    print(points)
    return points

def draw_straight(org, end, hor, cons):
    o1 = org + 1
    o2 = org + 2
    o3 = org + 3
    o4 = org + 4

    points = []
    # STR 5 puntos
    if hor:
        points.extend([(org, cons), (o1, cons), (o2, cons), (o3, cons), (o4, cons)])
    else:
        points.extend([(cons, org), (cons, o1), (cons, o2), (cons, o3), (cons, o4)])

    xmm_v = [o1, o2, o3, o4]
    xmm_offset = [4, 4, 4, 4]

    for i in range(4, end - org, 4):
        xmm_v = [x + offset for x, offset in zip(xmm_v, xmm_offset)]
        if hor:
            points.extend([(x, cons) for x in xmm_v])
        else:
            points.extend([(cons, x) for x in xmm_v])
    
    print(points)

    return points

# Crear la figura y el objeto de la línea
fig, ax = plt.subplots()
plt.xlim(0, 10)
plt.ylim(0, 10)
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Líneas generadas con Bresenham')

# Adjust grid settings
ax.set_xticks(range(10), minor=False)  # Show grid lines for each integer value on X-axis
ax.set_yticks(range(10), minor=False)  # Show grid lines for each integer value on Y-axis
ax.invert_yaxis() 
plt.grid(True)

# Set the X-axis ticks to the top
ax.xaxis.set_ticks_position('top')

# Crear múltiples líneas
num_lines = 1  # Puedes ajustar la cantidad de líneas que deseas
lines = [ax.plot([], [], lw=2)[0] for _ in range(num_lines)]

# Crear la animación que cambia todas las líneas simultáneamente
ani = FuncAnimation(fig, animate, frames=1, interval=1000)  # Cambia las líneas cada 1 segundo

plt.show()
