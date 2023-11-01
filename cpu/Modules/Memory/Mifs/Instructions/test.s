.text
# Escribe a memoria desde la direccion 0x100 los valores del 1 al 20 (1 por word)
populate_memory:
    li a0, 0x0
    li a1, 1
    li a2, 1
    li a3, 20
    sb a1, 0(a0)

loop:
    addi a0, a0, 4
    addi a1, a1, 1
    sb a1, 0(a0)
    addi a2, a2, 1
    blt a2, a3, loop        # [0, 20]

nop