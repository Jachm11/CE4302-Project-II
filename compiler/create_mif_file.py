def create_mif_file(filename, instruction_list, DEPTH, ADDRESS_RADIX="HEX"):
    # Abre el archivo .mif para escritura
    with open(filename, "w") as mif_file:
        # Escribe el encabezado del archivo .mif
        mif_file.write(f"DEPTH = {DEPTH};\n")
        mif_file.write(f"WIDTH = 32;\n")
        if ADDRESS_RADIX in ["HEX", "UNS"]:
            mif_file.write(f"ADDRESS_RADIX = {ADDRESS_RADIX};\n")
        else:
            raise ValueError("ADDRESS_RADIX must be 'HEX' or 'UNS'")
        mif_file.write(f"DATA_RADIX = HEX;\n")
        mif_file.write("CONTENT\n")
        mif_file.write("BEGIN\n")

        # Escribe las instrucciones en la lista
        for i, instruction in enumerate(instruction_list):
            # Formatea la dirección en función del ADDRESS_RADIX
            if ADDRESS_RADIX == "HEX":
                address = f"{i:04X}"
            elif ADDRESS_RADIX == "UNS":
                address = str(i)
            
            mif_file.write(f"{address} : {instruction};\n")

        # Rellena con 0 usando la sintaxis de grupos de direcciones [address..address]
        if len(instruction_list) < DEPTH:
            start_fill = len(instruction_list)
            end_fill = DEPTH - 1
            if ADDRESS_RADIX == "HEX":
                mif_file.write(f"[{start_fill:04X}..{end_fill:04X}] : 00000000;\n")
            elif ADDRESS_RADIX == "UNS":
                mif_file.write(f"[{start_fill}..{end_fill}] : 00000000;\n")

        mif_file.write("END;\n")
