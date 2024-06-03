def pertenece (s, lista: list) -> bool:
    for i in range (len(lista)):
        if lista[i] == s:
            return True
    return False

def split_homemade(frase: str) -> str:
    string: str = []
    for caracter in frase:
        if caracter != " ":
            string.append(caracter)
    return pasar_lista_a_string(string)

def pasar_lista_a_string (lista: list[chr]) -> str:
    frase: str = ""
    for i in range (len(lista)):
        frase += lista[i]
    return frase

#print(split_homemade("Hola Como andas"))
            