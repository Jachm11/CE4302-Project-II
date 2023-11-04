# Bresenham
# x0 -> a0
# y0 -> a1
# x1 -> a2
# y1 -> a3
# color -> a4
# draw_line(int x0, int y0, int x1, int y1, int color)
draw_line:

    # Calculate dx and dy (as abs)
    sub a5 a2 a0
    sub a6 a3 a1

    # Abs(a5)
    bgez a5, skip_neg_a5_1  
    neg a5, a5
    skip_neg_a5_1:
    # Abs(a6)
    bgez a6, skip_neg_a6_1 
    neg a6, a6 
    skip_neg_a6_1:

    # t3 = steep = dy > dx
    slt t3 a5 a6  # Set t3 to 1 if a5 < a6, else set t3 to 0
    
    blt a6 a5 _not_equal_case
    li t3 1

    _not_equal_case:
    ble a6 a5 _not_steep  # branch if dy <= dx 

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

    # Calculate dx and dy (as abs)
    sub a5 a2 a0
    sub a6 a3 a1
    
    # Abs(a5)
    bgez a5, skip_neg_a5_2  
    neg a5, a5
    skip_neg_a5_2:
    # Abs(a6)
    bgez a6, skip_neg_a6_2
    neg a6, a6 
    skip_neg_a6_2:

    # Initialize error and ystep
    mv a7 t3  # a7 = error = dx

    # t0 = ystep = 1 or -1
    li t0 -1
    bge a1 a3 _not_descend
    li t0 1

    _not_descend:
    mv t1 a0 # t1 = x = x0
    mv t2 a1 # t2 = y = y0
    li a1 640  # Display width
    li a3 1 
    # li t6 0x200 #RIPES

    _draw_loop:
    bgt t1 a2 _draw_line_return  # if x > x1 return

        mv t4 t1 # xm = t4 = x
        mv t5 t2 # ym = t5 = y
        beqz t3 _not_steep_loop # if t3 > t1 then target
        mv t4 t2 # xm = t4 = y
        mv t5 t1 # ym = t5 = x

        # Store pixel
        _not_steep_loop:
        # Calculate the address for pixel (x, y)
        mul a0 t5 a1  # a0 = address = y * display width
        add a0 a0 t4  # address += x
        # add a0 a0 t6 # +0x200 RIPES

        sb a4 0 a0  # store pixel color
        add t1 t1 a3 # x++

        # Update error
        sub a7 a7 a6 # error = error - dy
        bgez a7 _draw_loop

        add t2 t2 t0 # y = y + ystep
        add a7 a7 a5 # error = error + dv[0]
        j _draw_loop

    _draw_line_return:
    nop