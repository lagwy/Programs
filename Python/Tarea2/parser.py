# -*- coding: utf-8 -*-
# Implementación de un parser que reconoce
# expresiones mediante la siguiente gramática
# ____
# Autores:
# Luis Ángel Martínez   A00813485
# Evert Salinas         A00
# Jorge Luis Márquez    A01
# Fecha: 07 de febrero de 2016

import sys
import escaner as scanner

# Empata y obtiene el siguiente token
def match(tokenEsperado):
    global token
    if token == tokenEsperado:
        token = scanner.escaner()
    else:
        error("Token incorrecto")

# Función principal: implementa el análisis sintáctico
def parser():
    global token
    token = scanner.escaner()
    p() # Primer expresión
    if token == scanner.FIN:
        print "Expresion bien construida"
        sys.exit(0)
    else:
        error("Expresion mal construida")

def p():
    e()

def e():
    if token == scanner.VAR:
        match(token)    # reconoce la variable
        e1()
    elif token == scanner.NUM:
        match(token)    # reconoce el número
        e1()
    elif token == scanner.OPE:
        match(token)    # reconoce el operador
        e()
        e1()
    elif token == scanner.BSL:
        match(token)    # reconoce el \
        match(scanner.VAR)  # reconoce la variable
        match(scanner.DOT)  # reconoce el punto
        e()
        e1()
    elif token == scanner.PCI:
        match(token)    # reconoce el parentesis izquierdo
        e()
        match(scanner.PAB)
        e1()
    else:
        error("Expresion mal diseñada")

def e1():
    if token == scanner.FIN or token == scanner.PAB:
        return
    else:
        e()
        
        
# Termina con un mensaje de error
def error(mensaje):
    print "ERROR:", mensaje
    sys.exit(1)
        
        
    
