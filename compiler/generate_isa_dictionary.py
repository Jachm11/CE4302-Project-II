def generate_isa_dictionary():
    dictionary = {}
    # [key_word] =          [instruction type, opcode, funct3, funct7]

    R_opcode = "0110011"
    dictionary["add"] = ['R', R_opcode, "000", "0000000"]    
    dictionary["sub"] = ['R', R_opcode, "000", "0100000"]    
    dictionary["xor"] = ['R', R_opcode, "100", "0000000"]    
    dictionary["or"] = ['R', R_opcode, "110", "0000000"]    
    dictionary["and"] = ['R', R_opcode, "111", "0000000"]    
    dictionary["sll"] = ['R', R_opcode, "001", "0000000"]    
    dictionary["srl"] = ['R', R_opcode, "101", "0000000"]    
    dictionary["sra"] = ['R', R_opcode, "101", "0100000"]    
    dictionary["slt"] = ['R', R_opcode, "010", "0000000"]    
    dictionary["sltu"] = ['R', R_opcode, "011", "0000000"]
    dictionary["neg"] = ['R', R_opcode, "000", "0100000"]
    dictionary["mul"] = ['R', R_opcode, "000", "0000111"]
 
    # Arithmetic Logic Inmmediate (ALI)
    ALI_opcode = "0010011"
    dictionary["addi"] = ['I', ALI_opcode, "000"]
    dictionary["mv"] = dictionary['addi']
    dictionary["li"] = dictionary["addi"]
    dictionary["xori"] = ['I', ALI_opcode, "100"]

    dictionary["not"] = dictionary["xori"]    
    dictionary["ori"] = ['I', ALI_opcode, "110"]    
    dictionary["andi"] = ['I', ALI_opcode, "111"]    
    dictionary["slli"] = ['I', ALI_opcode, "001", "0000000"]    
    dictionary["srli"] = ['I', ALI_opcode, "101", "0000000"]    
    dictionary["srai"] = ['I', ALI_opcode, "101", "0100000"]    
    dictionary["slti"] = ['I', ALI_opcode, "010"]    
    dictionary["sltiu"] = ['I', ALI_opcode, "011"]
    dictionary["nop"] = dictionary["addi"]

    loads_opcode = "0000011"
    dictionary["lb"] = ['L', loads_opcode, "000"]    
    dictionary["lh"] = ['L', loads_opcode, "001"]    
    dictionary["lw"] = ['L', loads_opcode, "010"]
    dictionary["lbu"] = ['L', loads_opcode, "100"]
    dictionary["lhu"] = ['L', loads_opcode, "101"]

    stores_opcode = "0100011"
    dictionary["sb"] = ['S', stores_opcode, "000"]    
    dictionary["sh"] = ['S', stores_opcode, "001"]    
    dictionary["sw"] = ['S', stores_opcode, "010"]

    branches_opcode = "1100011"
    dictionary["beq"] = ['B', branches_opcode, "000"]    
    dictionary["beqz"] = dictionary["beq"]    
    dictionary["bne"] = ['B', branches_opcode, "001"]    
    dictionary["blt"] = ['B', branches_opcode, "100"]
    dictionary["bge"] = ['B', branches_opcode, "101"]    
    dictionary["bltu"] = ['B', branches_opcode, "110"]
    dictionary["bgeu"] = ['B', branches_opcode, "111"]

    dictionary['bgez'] = dictionary["bne"]
    dictionary["bgt"] = dictionary["blt"]
    dictionary["ble"] = dictionary["bge"]  

    dictionary["jal"] = ['J', "1101111"]
    dictionary["j"] = dictionary["jal"]
    dictionary["jalr"] = ['I', "1100111", "000"]

    dictionary["lui"] = ['U', "0110111"]
    dictionary["auipc"] = ['U', "0010111", "000"]


    # vectorial instructions
    dictionary["vadd"] = ['R', "1111000", "000", "0000000"]
    dictionary["vsub"] = ['R', "1111000", "000", "0100000"]

    dictionary['vs'] = ["S", "1111011", "000"]
    dictionary['vl'] = ["L", "1111100", "000"]
    
    
    dictionary["stv"] = ['STV', "1111001", "000"]
    dictionary["vts"] = ["VTS", "1111010", "000"]

    dictionary['vabs'] = ["ABS", "1111101", "000"]
 
    return dictionary


def generate_register_dictionary():

    dictionary = {}


    # registers
    dictionary["zero"] = "00000"
    dictionary["x0"] = dictionary["zero"]

    dictionary["ra"] = "00001"
    dictionary["x1"] = dictionary["ra"]

    dictionary["sp"] = "00010"
    dictionary["x2"] = dictionary["sp"]

    dictionary["gp"] = "00011"
    dictionary["x3"] = dictionary["gp"]

    dictionary["tp"] = "00100"
    dictionary["x4"] = dictionary["tp"]

    dictionary["t0"] = "00101"
    dictionary["x5"] = dictionary["t0"]
    dictionary["t1"] = "00110"
    dictionary["x6"] = dictionary["t1"]
    dictionary["t2"] = "00111"
    dictionary["x7"] = dictionary["t2"]

    dictionary["s0"] = "01000"
    dictionary["fp"] = dictionary["s0"]
    dictionary["x8"] = dictionary["s0"]

    dictionary["s1"] = "01001"
    dictionary["x9"] = dictionary["s1"]

    dictionary["a0"] = "01010"
    dictionary["x10"] = dictionary["a0"]
    dictionary["a1"] = "01011"
    dictionary["x11"] = dictionary["a1"]
    dictionary["a2"] = "01100"
    dictionary["x12"] = dictionary["a2"]
    dictionary["a3"] = "01101"
    dictionary["x13"] = dictionary["a3"]
    dictionary["a4"] = "01110"
    dictionary["x14"] = dictionary["a4"]
    dictionary["a5"] = "01111"
    dictionary["x15"] = dictionary["a5"]
    dictionary["a6"] = "10000"
    dictionary["x16"] = dictionary["a6"]
    dictionary["a7"] = "10001"
    dictionary["x17"] = dictionary["a7"]

    dictionary["s2"] = "10010"
    dictionary["x18"] = dictionary["s2"]
    dictionary["s3"] = "10011"
    dictionary["x19"] = dictionary["s3"]
    dictionary["s4"] = "10100"
    dictionary["x20"] = dictionary["s4"]
    dictionary["s5"] = "10101"
    dictionary["x21"] = dictionary["s5"]
    dictionary["s6"] = "10110"
    dictionary["x22"] = dictionary["s6"]
    dictionary["s7"] = "10111"
    dictionary["x23"] = dictionary["s7"]
    dictionary["s8"] = "11000"
    dictionary["x24"] = dictionary["s8"]
    dictionary["s9"] = "11001"
    dictionary["x25"] = dictionary["s9"]
    dictionary["s10"] = "11010"
    dictionary["x26"] = dictionary["s10"]
    dictionary["s11"] = "11011"
    dictionary["x27"] = dictionary["s11"]

    dictionary["t3"] = "11100"
    dictionary["x28"] = dictionary["t3"]
    dictionary["t4"] = "11101"
    dictionary["x29"] = dictionary["t4"]
    dictionary["t5"] = "11110"
    dictionary["x30"] = dictionary["t5"]
    dictionary["t6"] = "11111"
    dictionary["x31"] = dictionary["t6"]




    for i in range(0, 31):
        register = "v" + str(i)
        dictionary[register] = bin(i)[2:].zfill(5)

    return dictionary
