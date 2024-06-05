inventario: dict[str, dict[str, float, int]] = {
    "Remera negra": {
        "nombre": "remera negra",
        "precio": 12.0,
        "cantidad": 10
    },
    "Pantalon de Jean": {
        "nombre": "pantalon de jean",
        "precio": 25.0,
        "cantidad": 12
    }
}

def agregar_producto (inventario: dict[str, dict[str,float,int]], nombre: str, precio: float, cantidad: int):
    inventario[f"{nombre}"] =  {"nombre": nombre, "precio": precio, "cantidad": cantidad}
    
#agregar_producto(inventario, "Campera", 50, 3)
#print(inventario)

def actualizar_stock (inventario: dict[str, dict[str,float,int]], nombre: str, cantidad: int):
    if nombre in inventario:
        inventario[nombre]["cantidad"] = cantidad               
    
#actualizar_stock(inventario, "Remera negra", 13)
#print(inventario)

def actualizar_precios (inventario: dict[str, dict[str,float,int]], nombre: str, precio: float):
    if nombre in inventario:
        inventario[nombre]["precio"] = precio
        
#actualizar_precios(inventario, "Remera negra", 14.5)
#print(inventario)

def calcular_valor_inventario (inventario: dict[str, dict[str,float,int]]) -> int:
    total = 0
    for nombre in inventario:
        precio = inventario[nombre]["precio"]
        cantidad = inventario[nombre]["cantidad"]
        total += precio * cantidad
    return total

#print(calcular_valor_inventario(inventario))
        