# ##################CUSTOM INSTRUCTIONS###############

# Vector registers
#   128 bits long (32x4)
#   v0 = [0,0,0,0] 
#   v1 -> v31

# Vector instructions
#
#     |       Name       |      Syntax      |        Description 
#     |__________________|__________________|__________________________
#     | Vector sum       | vadd vd v1 v2    | vd = v1 + v2
#     | Vector sum       | vsub vd v1 v2    | vd = v1 - v2
#     | Scalar to vector | stv vd vs rs imm | vd[imm] = rs (when vs=vd)
#     | Vector to scalar | vts sd vs imm    | sd = vs[imm]
#     | Vector store     | vs v imm(sr)     | M[sr+imm][0:128] = v
#     | Vector load      | vl v imm(sr)     | v = M[sr+imm][0:128]
#     | Vector abs       | vabs vd vs       | vd = abs(vs)

######################################################

li a0 164
li a1 137
li a2 256
li a3 167
li a4 3
jal ra, draw_line
li a0 256
li a1 167
li a2 475
li a3 149
li a4 3
jal ra, draw_line
li a0 475
li a1 149
li a2 352
li a3 126
li a4 3
jal ra, draw_line
li a0 352
li a1 127
li a2 165
li a3 138
li a4 3
jal ra, draw_line
li a0 165
li a1 138
li a2 175
li a3 287
li a4 3
jal ra, draw_line
li a0 175
li a1 287
li a2 260
li a3 354
li a4 3
jal ra, draw_line
li a0 261
li a1 355
li a2 257
li a3 169
li a4 3
jal ra, draw_line
li a0 476
li a1 150
li a2 464
li a3 314
li a4 3
jal ra, draw_line
li a0 464
li a1 314
li a2 263
li a3 354
li a4 3
jal ra, draw_line
li a0 175
li a1 288
li a2 349
li a3 263
li a4 3
jal ra, draw_line
li a0 349
li a1 263
li a2 464
li a3 313
li a4 3
jal ra, draw_line
li a0 351
li a1 126
li a2 350
li a3 265
li a4 3
jal ra, draw_line
li a0 263
li a1 355
li a2 289
li a3 286
li a4 5
jal ra, draw_line
li a0 177
li a1 287
li a2 241
li a3 258
li a4 5
jal ra, draw_line
li a0 167
li a1 140
li a2 239
li a3 182
li a4 5
jal ra, draw_line
li a0 352
li a1 127
li a2 334
li a3 171
li a4 5
jal ra, draw_line
li a0 475
li a1 151
li a2 392
li a3 188
li a4 5
jal ra, draw_line
li a0 388
li a1 268
li a2 462
li a3 314
li a4 5
jal ra, draw_line
li a0 258
li a1 169
li a2 289
li a3 198
li a4 5
jal ra, draw_line
li a0 349
li a1 262
li a2 334
li a3 245
li a4 5
jal ra, draw_line
li a0 240
li a1 183
li a2 288
li a3 200
li a4 2
jal ra, draw_line
li a0 290
li a1 201
li a2 290
li a3 284
li a4 2
jal ra, draw_line
li a0 290
li a1 284
li a2 242
li a3 258
li a4 2
jal ra, draw_line
li a0 242
li a1 258
li a2 239
li a3 185
li a4 2
jal ra, draw_line
li a0 239
li a1 185
li a2 334
li a3 173
li a4 2
jal ra, draw_line
li a0 334
li a1 173
li a2 333
li a3 245
li a4 2
jal ra, draw_line
li a0 333
li a1 245
li a2 244
li a3 258
li a4 2
jal ra, draw_line
li a0 334
li a1 245
li a2 387
li a3 268
li a4 2
jal ra, draw_line
li a0 387
li a1 268
li a2 291
li a3 285
li a4 2
jal ra, draw_line
li a0 387
li a1 268
li a2 391
li a3 189
li a4 2
jal ra, draw_line
li a0 391
li a1 189
li a2 291
li a3 200
li a4 2
jal ra, draw_line
li a0 391
li a1 190
li a2 336
li a3 173
li a4 2
jal ra, draw_line

j end  # jump to end


# Bresenham
# draw_line(int x0, int y0, int x1, int y1, int color)
# x0 -> a0
# y0 -> a1
# x1 -> a2
# y1 -> a3
# color -> a4
draw_line: 

    # v1 = [x0,y0,0,0]
    stv v1 v0 a0 0
    stv v1 v1 a1 1

    # v2 = [x1,y1,0,0]
    stv v2 v0 a2 0
    stv v2 v2 a3 1

    # v3 = v2-v1
    vsub v3 v2 v1

    # abs(v3)
    vabs v3 v3 

    # a5 = dv[0]
    # a6 = dv[1]
    vts a5 v3 0
    vts a6 v3 1

    # t3 = steep = dv[1] > dv[0]
    slt t3 a5 a6  # Set t3 to 1 if a5 < a6, else set t3 to 0

    bne a6 a5 _not_equal_case
    li t3 0

    _not_equal_case:
    ble a6 a5 _not_steep  # branch if dv[1] <= dv[0] 

    # Swap x0 and y0 if necessary
    mv t0 a0 # temp = x0
    mv a0 a1 # x0 = y0
    mv a1 t0 # y0 = temp

    mv t0 a2 # temp = x1
    mv a2 a3 # x1 = y1
    mv a3 t0 # y1 = temp

    _not_steep:
    ble a0 a2 _not_inverted # branch if x0 <= x1

    mv t0 a0 # temp = x0
    mv a0 a2 # x0 = x1
    mv a2 t0 # x1 = temp

    mv t0 a1 # temp = y0
    mv a1 a3 # y0 = y1
    mv a3 t0 # y1 = temp

    _not_inverted:

    # v1 = [x0,y0,0,0]
    stv v1 v0 a0 0
    stv v1 v1 a1 1

    # v2 = [x1,y1,0,0]
    stv v2 v0 a2 0
    stv v2 v2 a3 1

    # v3 = v2-v1
    vsub v3 v2 v1

    # abs(v3)
    vabs v3 v3

    # a5 = dv[0]
    # a6 = dv[1]
    vts a5 v3 0
    vts a6 v3 1

    # Initialize error and ystep
    mv a7 a5 # a7 = err = dv[0]

    # t0 = ystep = 1 or -1
    li t0 -1
    bge a1 a3 _not_descend
    li t0 1

    _not_descend:
    mv t1 a0 # x = x0
    mv t2 a1 # y = y0
    li a1 640 # Display width
    li a3 1

    _draw_loop:
    bgt t1 a2 _draw_line_return # if x > x1 return

        mv t4 t1 # xm = t4 = x
        mv t5 t2 # ym = t5 = y
        beqz t3 _not_steep_loop # if t3 > t1 then target
        mv t4 t2 # xm = t4 = y
        mv t5 t1 # ym = t5 = x
        
        # Store pixel
        _not_steep_loop:
        # Calculate the address for pixel (x, y)
        mul a0 t5 a1 # a0 = address = y * display width
        add a0 a0 t4 # address += x

        sb a4 0(a0) # store pixel color 
        add t1 t1 a3 # x++

        # Update error
        sub a7 a7 a6 # error = error - dv[1]
        bgez a7 _draw_loop

        add t2 t2 t0 # y = y + ystep
        add a7 a7 a5 # error = error + dv[0]
        j _draw_loop

    _draw_line_return:
    jalr zero, ra, 0

end:
nop
nop
nop
nop