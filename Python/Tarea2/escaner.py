# -*- coding: utf-8 -*-
# Autores:
# Luis Angel Martinez   A00813485
# Evert Salinas
# Jorge Luis Márquez
# Fecha 07 de febrero de 2016

import sys

# tokens
NUM = 100 # Número entero
VAR = 101 # Variable
OPE = 102 # Operador
PCI = 103 # Paréntesis izquierdo
PAB = 104 # Paréntesis derecho
DOT = 105 # Punto
BSL = 106 # Diagonal inversa (Back Slash)
FIN = 107 # Fin de la entrada
ERR = 200 # Error léxico

# Matriz de transiciones
#      dig  var  ope   (     )   .   \     $   esp raro
MT = [[   1,  2, OPE, PCI, PAB, DOT, BSL, FIN,   0,   3], # edo 0 - estado inicial
      [   1,  3, NUM, NUM, NUM,   3, NUM, NUM, NUM,   3], # edo 1 - números enteros
      [   3,  2, VAR, VAR, VAR, VAR, VAR, VAR, VAR,   3], # edo 2 - variables
      [   3,  3, ERR, ERR, ERR,   3, ERR, ERR, ERR,   3]] # edo 3 - estado de error

# Filtro de caracteres
def filtro(c):
    """Filtro de caracteres"""
    if c == '0' or c == '1' or c == '2' or \
       c == '3' or c == '4' or c == '5' or \
       c == '6' or c == '7' or c == '8' or c == '9': # numeros
        return 0
    elif c == 'u' or c == 'v' or c == 'w' or \
         c == 'x' or c == 'y' or c == 'z': # variables
        return 1
    elif c == '+' or c == '-' or c == '*' or \
         c == '/': # operadores
        return 2
    elif c == '(': # delimitador (
        return 3
    elif c == ' ' or ord(c) == 0 or ord(c) == 10 or \
         ord(c) == 13: # blancos
        return 8
    elif c == ')': # delimitador )
        return 4
    elif c == '.': # delimitador .
        return 5
    elif c == "\\": # delimitador \
        return 6
    elif c == '$': # fin de entrada
        return 7
    else: # caracter raro
        return 9

_c = None # siguiente caracter
_leer = True # indica si se requiere leer un caracter de la entrada estándar

# Función principal: implementa el análisis léxico
def escaner():
    """Implementa un analizador léxico"""
    global _c, _leer
    edo = 0 # número de estado en el autómata
    lexema = "" # palabra que genera el token
    while(True):
        while edo < 100: #mientras el estado no sea de aceptación ni de error
            if _leer: _c = sys.stdin.read(1)
            else: _leer = True
            edo = MT[edo][filtro(_c)]
            if edo < 100 and edo != 0: lexema += _c
        if edo == NUM:
            _leer = False # ya se leyó el siguiente caracter
            print "Numero entero", lexema
            return NUM
        elif edo == VAR:
            _leer = False # ya se leyo el siguiente caracter
            print "Variable", lexema
            return VAR
        elif edo == OPE:
            lexema += _c # el último caracter forma el lexema
            print "Operador", lexema
            return OPE
        elif edo == PCI:
            lexema += _c # el último caracter forma el lexema
            print "Delimitador", lexema
            return PCI
        elif edo == PAB:
            lexema += _c # el último caracter forma el lexema
            print "Delimitador", lexema
            return PAB
        elif edo == DOT:
            lexema += _c # el último caracter forma el lexema
            print "Delimitador", lexema
            return DOT
        elif edo == BSL:
            lexema += _c # el último caracter forma el lexema
            print "Delimitador", lexema
            return BSL
        elif edo == FIN:
            print "Fin de expresion"
            return FIN
        else:
            _leer = False # el último caracter no es raro
            print "Error: palabra ilegal", lexema
            return ERR
    
       
      
