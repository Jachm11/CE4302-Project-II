import re

def open_txt(file_name_with_ext):
    # Abre un archivo de texto en modo de lectura
    raw_lines = []
    try:
        with open(file_name_with_ext, "r") as file:
            # Lee y muestra cada línea del archivo
            for line in file:
                line_mod = line.strip()
                line_mod = line_mod.lower()
                raw_lines.append(line_mod)
            return raw_lines
    except FileNotFoundError:
        print(f"File: {file_name_with_ext} not found.")
    except Exception as e:
        print(f"Exception opening file: {str(e)}")


def delete_empty_lines(raw_lines):
    lines = []
    for raw_line in raw_lines:
        raw_line = raw_line.replace('\n','')
        if(raw_line != ''):
            lines.append(raw_line)
    return lines


def delete_comments(raw_lines):
    lines_without_comments = []
    pattern_comment = r'\#.+$'
    
    for raw_line in raw_lines:
        lines_without_comments.append(re.sub(pattern_comment, '', raw_line))
        
    return lines_without_comments


def delete_sections(raw_lines):
    lines = []
    pattern = r'(\.[^\#\n]+)'
    
    for raw_line in raw_lines:
        match = re.findall(pattern, raw_line)
        if(match == []):
            lines.append(raw_line)
    return lines


def binary_to_hexadecimal(binary):
    try:
        # Convert the binary number to a decimal integer
        decimal = int(binary, 2)
        
        # Convert the decimal integer to a hexadecimal string
        hexadecimal = hex(decimal)
        
        # The hexadecimal representation will have the '0x' prefix, so we remove it
        hexadecimal_without_prefix = hexadecimal[2:]
        
        return hexadecimal_without_prefix
    except ValueError:
        return "Error: Invalid input"


def number_to_nbit_binary(number, is_hexadecimal=False, n_bits=12):

    is_negative = False
    if(number[0] == "-"):
        is_negative = True

    try:

        if is_hexadecimal:
            decimal = int(number, 16)
        else:
            decimal = int(number)

        if is_negative:
            # Calcular el complemento a 2
            if decimal < 0:
                decimal = 2 ** n_bits + decimal
            binary = bin(decimal)
        else:
            binary = bin(decimal)

        binary_str = binary[2:]  # Remove the '0b' prefix
        # Ensure that the binary string has the specified number of bits
        binary_str = binary_str.zfill(n_bits)
        return binary_str
    except ValueError:
        return "Error: Invalid input"


def binary_to_8digit_hexadecimal(binary):
    try:
        # Convierte el número binario a un entero decimal
        decimal = int(binary, 2)
        
        # Convierte el entero decimal a una cadena hexadecimal con un ancho fijo de 8 dígitos
        hexadecimal = format(decimal, '08X')
        
        return hexadecimal
    except ValueError:
        return "Error: Entrada no válida"

