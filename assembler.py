# Assembler para projeto relogio, disciplina de design de computadores, 6 semestre INSPER
# feito por Guilherme Silvarolli

comandoDic = {
    "loadim" : "0010000000",
    "loadmem" : "0010010001",
    "loadbt" : "0010010000",
    "store" : "0000000010",
    "cmpne" : "0101000000",
    "cmpe" : "0101100000",
    "jmp" : "0000001000",
    "add" : "0010100000",
    "jc" : "0000000100",
    "display" : "0000000000",
    "reset" : "1000000000",
    "$UnSeg" : "00000001",
    "$DezSeg" : "00000010",
    "$UnMin" : "01100000",
    "$DezMin" : "10000000",
    "$UnHora" : "10100000",
    "$DezHora" : "11000000",
    "Useg" : "00100000",
    "Dseg" : "01000000",
    "Umin" : "01100000",
    "Dmin" : "10000000",
    "Uhora" : "10100000",
    "Dhora" : "11000000"
}

DATAWIDTH=18
DATADEPTH=256

def tradutor(comando, dicionario = comandoDic): #Funcao que traduz os comandos para o codigo de maquina MIF
    traduzido = dicionario[comando]

    return traduzido

def hextobin(hexa):
    my_hexdata = hexa[1:]
    scale = 16 ## equals to hexadecimal
    num_of_bits = 8
    converted = bin(int(my_hexdata, scale))[2:].zfill(num_of_bits)

    return converted

def inttobin(inteiro):
    num_of_bits = 8
    converted = bin(inteiro)[2:].zfill(num_of_bits)
    
    return converted


originalFile = open("teste.txt", "r") #Abrindo o arquivo com codigo assembly 

#Primeira passagem
labels = dict()
count = 0

for line in originalFile:
    count += 1
    l = line.split()
    if l[0] == "LABEL":
        tamanho = len(labels)
        labels[l[1]] = str(inttobin(count - tamanho - 1)) #Guarda somente os labels nessa primeira passagem e suas posições relativas 


originalFile = open("teste.txt", "r")


#Segunda passagem
linhasConvertidas = []
listacomandos = []
for line in originalFile:
    tmplist = []
    s = line.split()
    if s[0] == "LABEL":
        pass

    else:
        for comando in s: 
            if comando in labels:
                convertido = labels[comando]
                tmplist.append(convertido)
            elif comando[0] == "%":
                convertido = hextobin(comando)
                tmplist.append(convertido)
            else:
                convertido = tradutor(comando)
                tmplist.append(convertido)

        linhasConvertidas.append(tmplist)
        listacomandos.append(line)


#Escreve o arquivo MIF    
codmaquina = open("RomInit.mif", "w+")

codmaquina.write("WIDTH={0};\n".format(DATAWIDTH))
codmaquina.write("DEPTH={0};\n".format(DATADEPTH))
codmaquina.write("ADDRESS_RADIX=DEC;\n")
codmaquina.write("DATA_RADIX=BIN;\n")
codmaquina.write("CONTENT BEGIN\n")

count = 0
for linha in linhasConvertidas:
    junto = linha[0] + linha[1]
    codmaquina.write("{0}  :  {1};  --{2}".format(count, junto, listacomandos[count]))
    count += 1
codmaquina.write("\nEND;")

