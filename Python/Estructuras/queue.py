# Definicion de la clase pila
class Queue:
    # Metodo constructor de la pila que inicializa un arreglo vacio
    def __init__(self):
        self.items = []

    # Mismo metodo que en el stack que revisa si el arreglo contiene elementos
    def isEmpty(self):
        return self.items == []

    """
        Agrega un elemento al arreglo y como la manera de quitar
        un elemento es atraves de pop() que quita el ultimo elemento,
        se inserta al comienzo del arreglo, para que sea el ultimo en salir
     """
    def enqueue(self, item):
        self.items.insert(0,item)

    """
        Elimina y regresa el ultimo elemento en el arreglo, es decir,
        el primero que entro
    """
    def dequeue(self):
        return self.items.pop()

    # Cantidad de elementos en la fila
    def size(self):
        return len(self.items)

q=Queue()
q.enqueue(4)
q.enqueue('dog')
q.enqueue(True)
print(q.dequeue())
print(q.size())
