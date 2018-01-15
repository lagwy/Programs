# Definicion de la clase stackclass Stack:     # Metodo constructor de la clase, inicializa un arreglo vacio     def __init__(self):         self.items = []     # Metodo que devuelve verdadero si la pila no contiene elementos     def isEmpty(self):         return self.items == []     # Agrega el valor del parametro item al final del arreglo     def push(self, item):         self.items.append(item)     # Elimina y regresa el ultimo valor en el arreglo      def pop(self):         return self.items.pop()     # Regresa el ultimo valor insertado en la pila     def peek(self):         return self.items[len(self.items)-1]     # Regresa la cantidad de elementos en la pila     def size(self):         return len(self.items)

s=Stack()

print(s.isEmpty())
s.push(4)
s.push('dog')
print(s.peek())
s.push(True)
print(s.size())
print(s.isEmpty())
s.push(8.4)
print(s.pop())
print(s.pop())
print(s.size())
