
clear all

arbol = ArbolAsincronoAnalisis(0,0,0,0);

padre = Nodo(0,0,0,0,0);

fas = arbol.fases
pa = arbol.padreAnalisis

arbol.recursivaNodosAnalisis(pa,fas)