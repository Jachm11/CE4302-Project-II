from utils import *

def indexed_replace(str, start, end, replace_str):
    return str[:start] + replace_str + str[end+1:]


# inverted means that str[0] is at top right
def indexed_replace_inverted(str, start, end, replace_str):
    str = str[::-1]
    str = str[:start] + replace_str[::-1] + str[end+1:]
    return str[::-1]


def indexed_substring_inverted(str, start, end):
    str = str[::-1]
    str = str[start:end+1]
    return str[::-1]


def riscv_to_hex(instructions_list, isa_dictionary, register_dictionary, tags_dictionary):

    hex_list = []
    for instruction in instructions_list:

        # instruction[0] contains the tokens of an instruction
        # instruction[0][0] contains the instruction key word like 'add' or 'jal'

        print("INSTRUCTION:", instruction)
        
        instruction_tokens = instruction[0]
        print("instruction_tokens: ", instruction_tokens)

        instruction_key_word = instruction_tokens[0]
        print("instruction_key_word:", instruction_key_word)
        
        pc = instruction[1]
        print("PC:", pc)

        dictionary_instruction_data = isa_dictionary[instruction_key_word]
        print("dictionary_instruction_data: ", dictionary_instruction_data)

        instruction_type = dictionary_instruction_data[0]
        print("instruction_type:", instruction_type)

        opcode = dictionary_instruction_data[1]
        print("opcode:", opcode)
        instruction_bits = "00000000000000000000000000000000"

        instruction_bits = indexed_replace_inverted(instruction_bits, 0, 6, opcode)

        if(instruction_type == "R"):
            print("Instruction type of R")

            if(instruction_key_word == "neg"):
                rd = instruction_tokens[1]
                rs1 = "x0"
                rs2 = instruction_tokens[2]
            else:
                rd = instruction_tokens[1]
                rs1 = instruction_tokens[2]
                rs2 = instruction_tokens[3]

            rd_bits = register_dictionary[rd]
            print("\trd:", rd, " bits:", rd_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, rd_bits)
            print("\t", instruction_bits)

            funct3 = dictionary_instruction_data[2]
            print("\tfunct3:", funct3)
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)
            print("\t", instruction_bits)

            rs1_bits = register_dictionary[rs1]
            print("\trs1:", rs1, " bits:", rs1_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs1_bits)
            print("\t", instruction_bits)

            rs2_bits = register_dictionary[rs2]
            print("\trs2:", rs2, " bits:", rs2_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 24, rs2_bits)
            print("\t", instruction_bits)

            funct7 = dictionary_instruction_data[3]
            print("\tfunct7:", funct7)
            instruction_bits = indexed_replace_inverted(instruction_bits, 25, 31, funct7)
            print("\t", instruction_bits)
        
        elif(instruction_type == "I" or instruction_type == "L"):

            if(instruction_type == "I"):
  
                if(instruction_key_word != "nop"):

                    # remapeos de pseudoinstrucciones
                    if(instruction_key_word == "li"):
                        rd = instruction_tokens[1]
                        rs1 = "zero"
                        minus = instruction_tokens[2]
                        hex_prefix = instruction_tokens[3]
                        value = instruction_tokens[4]
                        print("\tinstruction_tokens remapped: ", ["addi", rd, rs1, minus, hex_prefix, value])

                    elif(instruction_key_word == "not"):
                        rd = instruction_tokens[1]
                        rs1 = instruction_tokens[2]
                        minus = "-"
                        hex_prefix = ""
                        value = "1"
                        print("\tinstruction_tokens remapped: ", ["xori", rd, rs1, minus, hex_prefix, value])

                    elif(instruction_key_word == "mv"):
                        rd = instruction_tokens[1]
                        rs1 = instruction_tokens[2]
                        value = "0"
                        print("\tinstruction_tokens remapped: ", ["addi", rd, rs1, minus, hex_prefix, value])
                    else:
                        rd = instruction_tokens[1]
                        rs1 = instruction_tokens[2]
                        minus = instruction_tokens[3]
                        hex_prefix = instruction_tokens[4]
                        value = instruction_tokens[5]

                    rd_bits = register_dictionary[rd]
                    print("\trd:", rd, " bits:", rd_bits)
                    instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, rd_bits)
                    print("\t", instruction_bits)

                    funct3 = dictionary_instruction_data[2]
                    print("\tfunct3:", funct3)
                    instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)
                    print("\t", instruction_bits)

                    rs1_bits = register_dictionary[rs1]
                    print("\trs1:", rs1, " bits:", rs1_bits)
                    instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs1_bits)
                    print("\t", instruction_bits)

                    if(hex_prefix == "0x"):
                        immediate = number_to_nbit_binary(minus+value, is_hexadecimal=True, n_bits=12)
                    else:
                        immediate = number_to_nbit_binary(minus+value, is_hexadecimal=False, n_bits=12)

                    if(instruction_key_word == "slli" or instruction_key_word == "srli"):
                        immediate = indexed_replace_inverted(immediate, 5, 11, "0000000")

                    if(instruction_key_word == "srai"):
                        immediate = indexed_replace_inverted(immediate, 5, 11, "0100000")

                    print("\timmediate:", immediate)
                    instruction_bits = indexed_replace_inverted(instruction_bits, 20, 31, immediate)
                    print("\t", instruction_bits)


            else:
                print("Instruction type of L")

                rd = instruction_tokens[1]
                minus = instruction_tokens[2]
                hex_prefix = instruction_tokens[3]
                value = instruction_tokens[4]
                rs1 = instruction_tokens[5]

                rd_bits = register_dictionary[rd]
                print("\trd:", rd, " bits:", rd_bits)
                instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, rd_bits)
                print("\t", instruction_bits)

                funct3 = dictionary_instruction_data[2]
                print("\tfunct3:", funct3)
                instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)
                print("\t", instruction_bits)

                rs1_bits = register_dictionary[rs1]
                print("\trs1:", rs1, " bits:", rs1_bits)
                instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs1_bits)
                print("\t", instruction_bits)

                if(hex_prefix == "0x"):
                    immediate = number_to_nbit_binary(minus+value, is_hexadecimal=True, n_bits=12)
                else:
                    immediate = number_to_nbit_binary(minus+value, is_hexadecimal=False, n_bits=12)
                print("\timmediate:", immediate)
                instruction_bits = indexed_replace_inverted(instruction_bits, 20, 31, immediate)
                print("\t", instruction_bits)

        elif(instruction_type == "S"):
                        
            rs2 = instruction_tokens[1]
            minus = instruction_tokens[2]
            hex_prefix = instruction_tokens[3]
            value = instruction_tokens[4]
            rs1 = instruction_tokens[5]

            if(hex_prefix == "0x"):
                immediate = number_to_nbit_binary(minus+value, is_hexadecimal=True, n_bits=12)
            else:
                immediate = number_to_nbit_binary(minus+value, is_hexadecimal=False, n_bits=12)
            print("\timmediate:", immediate)

            imm_4_0 = indexed_substring_inverted(immediate, 0, 4)
            imm_11_5 = indexed_substring_inverted(immediate, 5, 11)

            print("\timm_4_0:", imm_4_0)
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, imm_4_0)
            print("\t", instruction_bits)

            funct3 = dictionary_instruction_data[2]
            print("\tfunct3:", funct3)
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)
            print("\t", instruction_bits)

            rs1_bits = register_dictionary[rs1]
            print("\trs1:", rs1, " bits:", rs1_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs1_bits)
            print("\t", instruction_bits)

            rs2_bits = register_dictionary[rs2]
            print("\trs2:", rs2, " bits:", rs2_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 24, rs2_bits)
            print("\t", instruction_bits)

            print("\timm_11_5:", imm_11_5)
            instruction_bits = indexed_replace_inverted(instruction_bits, 25, 31, imm_11_5)
            print("\t", instruction_bits)

        elif(instruction_type == "B"):

            rs1 = instruction_tokens[1]

            # remapeos de pseudoinstrucciones
            if(instruction_key_word == "beqz"):
                rs2 = "x0"
                tag = instruction_tokens[2] 
            elif(instruction_key_word == "bgez"):
                rs2 = "x0"
                tag = instruction_tokens[2]
            elif(instruction_key_word == "bgt"):
                rs1 = instruction_tokens[2] 
                rs2 = instruction_tokens[1]
                tag = instruction_tokens[3]
            elif(instruction_key_word == "ble"):
                rs1 = instruction_tokens[2] 
                rs2 = instruction_tokens[1]
                tag = instruction_tokens[3]
            else:
                rs2 = instruction_tokens[2]
                tag = instruction_tokens[3]

            immediate_d = tags_dictionary[tag]-pc
            immediate = number_to_nbit_binary(str(immediate_d), is_hexadecimal=False, n_bits=13)
            print("\tcurrent pc:", pc)
            print("\ttag:", tag)
            print("\ttag_pc:", tags_dictionary[tag])
            print("\timmediate_d:", immediate_d, " bits:", immediate)

            imm_11 = indexed_substring_inverted(immediate, 11, 11)
            imm_4_1 = indexed_substring_inverted(immediate, 1, 4)
            imm_10_5 = indexed_substring_inverted(immediate, 5, 10)
            imm_12 = indexed_substring_inverted(immediate, 12, 12)
            
            print("\timm_11:", imm_11)
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 7, imm_11)
            print("\t", instruction_bits)

            print("\timm_4_1:", imm_4_1)
            instruction_bits = indexed_replace_inverted(instruction_bits, 8, 11, imm_4_1)
            print("\t", instruction_bits)

            funct3 = dictionary_instruction_data[2]
            print("\tfunct3:", funct3)
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)
            print("\t", instruction_bits)

            rs1_bits = register_dictionary[rs1]
            print("\trs1:", rs1, " bits:", rs1_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs1_bits)
            print("\t", instruction_bits)

            rs2_bits = register_dictionary[rs2]
            print("\trs2:", rs2, " bits:", rs2_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 24, rs2_bits)
            print("\t", instruction_bits)

            print("\timm_10_5:", imm_10_5)
            instruction_bits = indexed_replace_inverted(instruction_bits, 25, 30, imm_10_5)
            print("\t", instruction_bits)

            print("\timm_12:", imm_12)
            instruction_bits = indexed_replace_inverted(instruction_bits, 31, 31, imm_12)
            print("\t", instruction_bits)

        elif(instruction_type == "U"):

            rd = instruction_tokens[1]
            minus = instruction_tokens[2]
            hex_prefix = instruction_tokens[3]
            value = instruction_tokens[4]

            rd_bits = register_dictionary[rd]
            print("\trd:", rd, " bits:", rd_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, rd_bits)
            print("\t", instruction_bits)

            if(hex_prefix == "0x"):
                immediate = number_to_nbit_binary(minus+value, is_hexadecimal=True, n_bits=20)
            else:
                immediate = number_to_nbit_binary(minus+value, is_hexadecimal=False, n_bits=20)
            print("\timmediate:", immediate)
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 31, immediate)
            print("\t", instruction_bits)

        elif(instruction_type == "J"):
            print("if J!")

            if(instruction_key_word == "j"):
                rd = "zero"
                tag = instruction_tokens[1]

            else:
                rd = instruction_tokens[1]
                tag = instruction_tokens[2]
    
            immediate_d = tags_dictionary[tag]-pc
            immediate = number_to_nbit_binary(str(immediate_d), is_hexadecimal=False, n_bits=21)
            print("\tcurrent pc:", pc)
            print("\ttag:", tag)
            print("\ttag_pc:", tags_dictionary[tag])
            print("\timmediate_d:", immediate_d, " bits:", immediate)

            rd_bits = register_dictionary[rd]
            print("\trd:", rd, " bits:", rd_bits)
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, rd_bits)
            print("\t", instruction_bits)

            imm_12_19 = indexed_substring_inverted(immediate, 12, 19)
            imm_11 = indexed_substring_inverted(immediate, 11, 11)
            imm_10_1 = indexed_substring_inverted(immediate, 1, 10)
            imm_20 = indexed_substring_inverted(immediate, 20, 20)

            print("\timm_12_19:", imm_12_19)
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 19, imm_12_19)
            print("\t", instruction_bits)

            print("\timm_11:", imm_11)
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 20, imm_11)
            print("\t", instruction_bits)

            print("\timm_10_1:", imm_10_1)
            instruction_bits = indexed_replace_inverted(instruction_bits, 21, 30, imm_10_1)
            print("\t", instruction_bits)

            print("\timm_20:", imm_20)
            instruction_bits = indexed_replace_inverted(instruction_bits, 31, 31, imm_20)
            print("\t", instruction_bits)

        elif(instruction_type == "STV"):

            vd = instruction_tokens[1]
            vs = instruction_tokens[2]
            rs = instruction_tokens[3]
            value = instruction_tokens[4]

            
            vd_bits = register_dictionary[vd]
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, vd_bits)
            
            funct3 = dictionary_instruction_data[2]
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)

            rs_bits = register_dictionary[rs] 
            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, rs_bits)

            vs_bits = register_dictionary[vs]
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 24, vs_bits)
            
            immediate = number_to_nbit_binary(value, is_hexadecimal=False, n_bits=2)
            instruction_bits = indexed_replace_inverted(instruction_bits, 25, 26, immediate)

            instruction_bits = indexed_replace_inverted(instruction_bits, 27, 32, "00000")


        elif(instruction_type == "VTS"):

            print(instruction_tokens)

            sd = instruction_tokens[1]
            vs = instruction_tokens[2]
            value = instruction_tokens[5]
            
        
            sd_bits = register_dictionary[sd]
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, sd_bits)

            funct3 = dictionary_instruction_data[2]
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)

            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, "00000")

            vs_bits = register_dictionary[vs]
            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 24, sd_bits)

            immediate = number_to_nbit_binary(value, is_hexadecimal=False, n_bits=2)
            instruction_bits = indexed_replace_inverted(instruction_bits, 25, 26, immediate)

            instruction_bits = indexed_replace_inverted(instruction_bits, 27, 31, "00000")



        elif(instruction_type == "ABS"):

            vd = instruction_tokens[1]
            vs = instruction_tokens[2]

            vd_bits = register_dictionary[vd]
            instruction_bits = indexed_replace_inverted(instruction_bits, 7, 11, vd_bits)

            funct3 = dictionary_instruction_data[2]
            instruction_bits = indexed_replace_inverted(instruction_bits, 12, 14, funct3)


            vs_bits = register_dictionary[vs]
            instruction_bits = indexed_replace_inverted(instruction_bits, 15, 19, vd_bits)


            instruction_bits = indexed_replace_inverted(instruction_bits, 20, 31, "".zfill(12))

        
        print("bin", instruction_bits)
        hex_instruction = binary_to_8digit_hexadecimal(instruction_bits)
        print("hex:", hex_instruction)
        hex_list.append(hex_instruction)
        print()
    return hex_list
