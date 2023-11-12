li a0 0 # R0xA <- 0x0
li a1 0 # R0xB <- 0x0
li a2 10 # R0xC <- 0xA
li a3 10 # R0xD <- 0xA
li a4 5 # R0xE <- 0x5

draw_line:

sub a5 a2 a0 # R0xF <- 0xA
sub a6 a3 a1 # R0x10 <- 0xA

bgez a5, skip_neg_a5_1  # BRANCH TAKEN
neg a5, a5 # ----

skip_neg_a5_1:
bgez a6, skip_neg_a6_1 # BRANCH TAKEN
neg a6, a6 # ----

skip_neg_a6_1:
slt t3 a5 a6 # R0x1C <- 0x0

blt a6 a5 _not_equal_case # BRANCH NOT TAKEN
li t3 1 # R0x1C <- 0x1

_not_equal_case:
ble a6 a5 _not_steep # BRANCH TAKEN

mv t0 a0 # ----
mv a0 a1 # ----
mv a1 t0 # ----

mv t0 a2 # ----
mv a2 a3 # ----
mv a3 t0 # ----

_not_steep:
ble a0 a2 _not_inverted # BRANCH TAKEN

mv t0 a0 # ----
mv a0 a2 # ----
mv a2 t0 # ----

mv t0 a1 # ----
mv a1 a3 # ----
mv a3 t0 # ----

_not_inverted:

sub a5 a2 a0 # R0xF <- 0xA
sub a6 a3 a1 # R0xF <- 0xA

bgez a5, skip_neg_a5_2  # BRANCH TAKEN
neg a5, a5 # ----
skip_neg_a5_2:

bgez a6, skip_neg_a6_2 # BRANCH TAKEN
neg a6, a6 # ----
skip_neg_a6_2:

mv a7 t3 # R0x11 <- 0x1

li t0 -1 # R0x5 <- 0xFFFFFFFF
bge a1 a3 _not_descend # BRANCH NOT TAKEN
li t0 1 # R0x5 <- 0x1

_not_descend:
mv t1 a0 # R0x6 <- 0x0
mv t2 a1 # R0x7 <- 0x0
li a1 640 # R0xB <- 0x280
li a3 1 # R0xD <- 0x1

# SHOLD RUN 11 TIMES AND CREATE 11 ITEMS IN MEMORY
_draw_loop:
bgt t1 a2 _draw_line_return # 1. NOT TAKEN 2. NOT TAKEN ... 11. TAKEN

mv t4 t1 # 1. R0x1D <- 0x0 | 2. R0x1D <- 0x1 | ...
mv t5 t2 # 1. R0x1E <- 0x0 | 2. R0x1E <- 0x1 | ...
beqz t3 _not_steep_loop # 1. NOT TAKEN 2. NOT TAKEN ...
mv t4 t2 # 1. R0x1D <- 0x0 | 2. R0x1D <- 0x1 | ...
mv t5 t1 # 1. R0x1E <- 0x0 | 2. R0x1E <- 0x1 | ...

_not_steep_loop:
mul a0 t5 a1 # 1. R0xA <- 0x0 | 2. R0xA <- 0x280 | ...
add a0 a0 t4 # 1. R0xA <- 0x0 | 2. R0xA <- 0x281 | ...

sb a4 0 a0 # 1. STR 5 at MEM[0x0]| 2. STR 5 at MEM[0x281] | ...
add t1 t1 a3 # 1. R0x6 <- 0x1 2. R0x6 <- 0x2 2. R0x6 <- 0x3 ... 11. R0x6 <- 0x11

sub a7 a7 a6 # 1. R0x11 <- 0xfffffff7 | 2. R0x11 <- 0xfffffff7 | ...
bgez a7 _draw_loop # 1. NOT TAKEN 2. NOT TAKEN  ...

add t2 t2 t0 # R0x7 <- 0x1 | ...
add a7 a7 a5 # 1. R0x11 <- 0x1 | 2. R0x11 <- 0x1 | ...
j _draw_loop # 1. TAKEN 2. TAKEN ... 11. TAKEN

_draw_line_return:
nop
nop
nop
nop
nop
nop
nop