import sys
from utils import *
from tokenizer import *
from encode import *
from generate_isa_dictionary import *
from create_mif_file import *

def get_instructions_with_pc_and_generate_tags_dictionary(raw_lines):
    i = 0
    instructions_list = []
    tags_dictionary = {}
    pattern_tags = r'(^[^#\n ]+\:$)'
    pattern_spaces_between = r'[^\r\t\f\v ] ( +)'
    for raw_line in raw_lines:
        print("Raw line: ", raw_line)
        match = re.findall(pattern_tags, raw_line)

        if(match == []):
            line = raw_line.strip()
            line = re.sub(pattern_spaces_between, '', line)
            instructions_list.append([line, i*4])
            i+=1
        
        else:
            groups = match[0]
            tag = groups[0:-1] # le quita los ':'
            tags_dictionary[tag] = (i)*4

    return (instructions_list, tags_dictionary)


def compile(file_name):
    print("-- Read file --")
    lines = open_txt(file_name)
    for line in lines:
        print(line)

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Delete comments --")
    lines = delete_comments(lines)
    for line in lines:
        print(line)

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Delete empty lines --")
    lines = delete_empty_lines(lines)
    for line in lines:
        print(line)
    
    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Delete sections --")
    lines = delete_sections(lines)
    for line in lines:
        print(line)
    
    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Add PCs and generate tags dictionary --")    
    (instructions_list, tags_dictionary) = get_instructions_with_pc_and_generate_tags_dictionary(lines)

    # print("Instructions list:")
    # for instruction in instructions_list:
    #     print(instruction)

    # print("Tags dictionary:")
    # print(tags_dictionary)

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Tokenize --")
    instructions_list = tokenize(instructions_list)
    for instruction in instructions_list:
        print(instruction)

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Generate isa dictionary --")
    risc_v_dictionary = generate_isa_dictionary()
    register_dictionary = generate_register_dictionary()

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Get hex instructions --")
    hex_instructions = riscv_to_hex(instructions_list, risc_v_dictionary, register_dictionary, tags_dictionary)
    for instruction in hex_instructions:
        print(instruction)

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Write mif --")
    create_mif_file(file_name[:-2] + ".mif", hex_instructions, 256, ADDRESS_RADIX="UNS")

    print("\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n")

    print("-- Done --")


if __name__ == "__main__":
    filepath = sys.argv[1]
    compile(filepath)

