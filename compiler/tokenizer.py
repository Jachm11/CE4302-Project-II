import re

def tokenize(instructions_list):
    tokenized_list = []

    #sub patterns
    sub_pattern_keyword = r'\w+'
    sub_pattern_name = r'[A-Za-z]+\d*'
    sub_pattern_value = r'(-)?((0x)([\dA-Fa-f]+))|(-)?(\d+)'
    sub_pattern_tag = r'[A-z]{1}[A-z:\d]*'

    # patterns
    pattern_name_value =        r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_value + r')$'
    pattern_name_name_value =   r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_value + r')$'#
    pattern_name_name_name =    r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')$'
    pattern_name_name_tag =     r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_tag + r')$'
    pattern_name_value_name =   r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_value + r')\(\s*(' + sub_pattern_name + r')\s*\)$'
    pattern_name_name_name_value = r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_value + r')$'
    
    pattern_name_tag =          r'^(' + sub_pattern_keyword + r')\s+(' + sub_pattern_name + r')\s*(\,| +)\s*(' + sub_pattern_tag + r')$'
    pattern_tag = r'(' + sub_pattern_keyword + r')\s+(' + sub_pattern_tag + r')$'
    pattern_nop = r'(nop)$'

    print("pattern_name_value: ", pattern_name_value)
    print("pattern_name_name_value: ", pattern_name_name_value)
    print("pattern_name_name_name: ", pattern_name_name_name)
    print("pattern_name_name_tag: ", pattern_name_name_tag)
    print("pattern_name_value_name: ", pattern_name_value_name)
    print("pattern_name_name_name_value: ", pattern_name_name_name_value)
    print("pattern_name_tag: ", pattern_name_tag)
    print("pattern_nop: ", pattern_nop)

    for instruction in instructions_list:
        print("Instruction: ", instruction)

        match = re.findall(pattern_name_value, instruction[0])
        if(match != []):
            #print("pattern_name_value")
            groups = match[0]

            # groups[0] = keyword
            # groups[1] = reg
            # groups[2] = ,
            # groups[3] = aux

            # groups[4] = hex -
            # groups[5] = aux
            # groups[6] = 0x
            # groups[7] = hex value

            # groups[8] = dec -
            # groups[9] = dec value
            if(groups[6]==""):
                #                       keyword     reg         -           0x  value
                tokenized_list.append([[groups[0],  groups[1],  groups[8],  "", groups[9]], instruction[1]])
            else:
                #                       keyword     reg         -           0x          value
                tokenized_list.append([[groups[0],  groups[1],  groups[4],  groups[6],  groups[7]], instruction[1]])
            
            continue

        
        match = re.findall(pattern_name_name_value, instruction[0])
        if(match != []):
         
            groups = match[0]
            # groups[0] = keyword <-
            # groups[1] = reg <-
            # groups[2] = ,
            # groups[3] = reg <-
            # groups[4] = ,
            # groups[5] = aux
            # groups[6] = hex -
            # groups[7] = aux
            # groups[8] = 0x
            # groups[9] = hex value
            # groups[10] = dec -
            # groups[11] = dec value

            print("Groups" + str(groups))
            if(groups[8]==""):
                #                       keyword     reg         reg         -           0x  value
                tokenized_list.append([[groups[0],  groups[1],  groups[3],  groups[10],  "", groups[11]], instruction[1]])
            else:
                #                       keyword     reg         reg         -           0x          value
                tokenized_list.append([[groups[0],  groups[1],  groups[3],  groups[6],  groups[8],  groups[9]], instruction[1]])
            
            continue

        match = re.findall(pattern_name_name_name, instruction[0])
        if(match != []):
            #print("pattern_name_name_name")
            groups = match[0]
            # groups[0] = keyword
            # groups[1] = reg
            # groups[2] = ','
            # groups[3] = reg
            # groups[4] = ','
            # groups[5] = reg
            tokenized_list.append([[groups[0], groups[1], groups[3], groups[5]], instruction[1]])
            continue
        
        match = re.findall(pattern_name_name_tag, instruction[0])
        if(match != []):
            #print("pattern_name_name_tag")
            groups = match[0]
            # groups[0] = keyword
            # groups[1] = reg
            # groups[2] = ','
            # groups[3] = reg
            # groups[4] = ','
            # groups[5] = tag
            tokenized_list.append([[groups[0], groups[1], groups[3], groups[5]], instruction[1]])
            continue         
                    
        match = re.findall(pattern_name_value_name, instruction[0])
        if(match != []):
            #print("pattern_name_value_name")
            groups = match[0]
            # group[0] = keyword
            # group[1] = reg
            # group[2] = ,
            # group[3] = 
            # group[4] = hex -
            # group[5] = aux
            # group[6] = 0x
            # group[7] = hex va
            # group[8] = dec -
            # group[9] = dec value
            # group[10] = reg
            if(groups[6]==""):
                #                       keyword     reg         dec -       0x  dec value   reg
                tokenized_list.append([[groups[0],  groups[1],  groups[8],  "", groups[9],  groups[10]], instruction[1]])
            else: # hex value
                #                       keyword     reg         hex -        0x          hex value   reg
                tokenized_list.append([[groups[0],   groups[1], groups[4],   groups[6],  groups[7],  groups[10]], instruction[1]])
                        
            continue

        match = re.findall(pattern_nop, instruction[0])
        if(match != []):    
            #print("pattern_nop")                                                 
            group = match[0]
            tokenized_list.append([[group], instruction[1]])
            continue
                            

        match = re.findall(pattern_name_tag, instruction[0])
        if(match != []):
            #print("pattern_name_tag")                                                 
            group = match[0]
            # group[0] = keyword
            # group[1] = reg
            # group[2] = ','
            # group[3] = tag
            tokenized_list.append([[group[0], group[1], group[3]], instruction[1]])
            continue

        match = re.findall(pattern_tag, instruction[0])
        if(match != []):
            #print("pattern_tag")                                                 
            group = match[0]
            # group[0] = keyword
            # group[1] = tag
            tokenized_list.append([[group[0], group[1]], instruction[1]])


        match = re.findall(pattern_name_name_name_value, instruction[0])
        if(match != []):

            group = match[0]
            #group[0] = keyword
            #group[1] = reg
            #group[2] = ','
            #group[3] = reg            
            #group[4] = ','
            #group[5] = reg
            #group[6] = ','
            #group[7] = imm

            print(group)
            tokenized_list.append([[group[0], group[1], group[3], group[5], group[7]], instruction[1]])
            print(tokenized_list[-1])

    return tokenized_list