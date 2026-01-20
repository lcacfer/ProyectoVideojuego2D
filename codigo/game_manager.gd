extends Node

var puntuacion = 0

@onready var etiqueta: Label = $Etiqueta

signal puntuacion_actualizada(puntuacion_actual:int)

func incrementa_punto():
	puntuacion += 1
	puntuacion_actualizada.emit(puntuacion)
	etiqueta.text = "¡Lo  conseguiste!
Has obtenido "+str(puntuacion)+"/18 monedas" 
