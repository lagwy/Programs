# Definicion de la clase Mapping que simula un diccionario
class Mapping(dict):
    # Asociar un valor a una entrada
    def __setitem__(self, key, item):
        self.__dict__[key] = item

    # Obtener el valor asociado a una entrada
    def __getitem__(self, key):
        return self.__dict__[key]

    # Muestra la representacion del diccionario, es como formato json
    def __repr__(self):
        return repr(self.__dict__)

    # Cantidad de entradas en el diccionario
    def __len__(self):
        return len(self.__dict__)

    # Eliminar una entrada del diccionario de acuerdo a su llave
    def __delitem__(self, key):
        del self.__dict__[key]

    # Limpia el diccionario, lo deja vacio
    def clear(self):
        return self.__dict__.clear()

    # Determina si hay una llave asociada a un valor
    def has_key(self, k):
        return self.__dict__.has_key(k)

    # Regresa y elimna un valor asociado a una llave, si no existe regresa None
    def pop(self, k, d=None):
        return self.__dict__.pop(k, d)

    # Agrega los valores al diccionario
    def update(self, *args, **kwargs):
        return self.__dict__.update(*args, **kwargs)

    # Regresa unicamente las llaves del diccionario
    def keys(self):
        return self.__dict__.keys()

    # Regresa solo los valores del diccionario,sin mostrar la llave
    def values(self):
        return self.__dict__.values()

    # Metodo parecido a __rep__ pero que regresa el diccionario en formato diferente
    def items(self):
        return self.__dict__.items()

    # Compara el diccionario con el cual se instancio el metodo con otro
    # que se envia como parametro
    def __cmp__(self, dict):
        return cmp(self.__dict__, dict)

    # Revisa si el texto existe en el diccionario,tanto en llaves o valores
    def __contains__(self, item):
        return item in self.__dict__

o = Mapping()
o.foo = "bar"
o['lumberjack'] = 'foo'
o.update({'a': 'b'}, c=44)
print o.__getitem__('lumberjack')
print o.__repr__()
print o.__len__()
print 'lumberjack' in o
print o.has_key('food')
print o.items()
print o.__contains__('food')
