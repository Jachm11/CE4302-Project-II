li a1 10
li a2 20

add a3 a1 a2
sub a3 a1 a2
xor a3 a1 a2
or a2 a1 a2
and a3 a1 a2

li a2 2

sll a3 a1 a2
srl a3 a1 a2

li a1 -16

sra a3 a1 a2

slt a3 a1 a2 # -16 < 2
slt a3 a1 a1 # -16 < -16
slt a3 a2 a1 # 2 < -16
sltu a3 a1 a2 # 16 < 2
sltu a3 a2 a1 # 2 < 16


addi a1 a1 26
xori a3 a1 5
ori a3 a1 10
andi a3 a1 12
slli a3 a1 4
srli a3 a1 2

li a1 -16

srai a3 a1 4
slti a3 a1 16
slti a3 a1 -16
sltiu a3 a1 16
sltiu a3 a1 -1


li a1 0xF1
li a2 0xA1
li a3 0x150
#lui a3 0x10001

sb a1 0(a3)
sb a2 1(a3)
sh a1 0(a3)
sh a2 2(a3)
sw a1 0(a3)
sw a2 4(a3)

lb a4 0(a3)
lh a4 0(a3)
lw a4 0(a3)

lbu a4 4(a3)
lhu a4 4(a3)


# debe saltare los nops
li a1 10
li a2 10
beq a1 a2 beq_tag

nop
nop
nop

beq_tag:

# debe saltar
li a2 0
bne_tag:
addi a2 a2 1
bne a1 a2 bne_tag

# debe saltar
li a2 0
blt_tag:
addi a2 a2 1
blt a2 a1 blt_tag

# No debe saltarse los nops
li a2 20
bge a1 a2 bge_tag

nop
nop
nop

bge_tag:

#debe saltarse los nops
li a1 -10
bltu a2 a1 bltu_tag

nop
nop
nop

bltu_tag:

# no debe saltarse el nop
bgeu a2 a1 bgeu_tag
nop
bgeu_tag:

# ra = x1
# jal ra, funct_tag # goto
# jalr zero, ra, 0 # return

# jal x1 jal_tag
jal ra jal_tag

nop
nop
nop

jal_tag:
jalr a2 ra 16

lui a1 4
auipc a1 4

li a1 100
li a2 100
li a3 100