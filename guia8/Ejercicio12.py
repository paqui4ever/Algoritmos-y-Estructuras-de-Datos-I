from queue import LifoQueue as Pila

def evaluar_expresion (s: str) -> float:
    pila_operandos: Pila = Pila()
    tokens: str = s.split() # Saco los espacios en blanco con la funcion split()
    operadores: list = ["+", "-", "/", "*"]
    for token in tokens:
        if token in operadores:
            operando2 = float(pila_operandos.get()) #IMPORTANTE: Sacar primero el segundo operando ya que sino la operacion termina "dada vuelta"
            operando1 = float(pila_operandos.get())
            if token == "+":
                res = operando1 + operando2
            elif token == "-":
                res = operando1 - operando2
            elif token == "*":
                res = operando1 * operando2
            elif token == "/":
                res = operando1 / operando2
            
            pila_operandos.put(float(res))        
        else:
            pila_operandos.put(float(token))
    return pila_operandos.get()

            
print(evaluar_expresion("3 4 + 5 * 2 -"))