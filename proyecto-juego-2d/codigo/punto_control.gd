extends Node

@onready var sonido_spawn: AudioStreamPlayer2D = $SonidoSpawn

var posicion_respawn : Vector2

func _ready() -> void:
	var jugador = get_parent()
	_guardar_punto_control()
	jugador.respawn.connect(_hacer_respawn)
	jugador.hacer_punto_guardado.connect(_guardar_punto_control)


func _hacer_respawn() -> void:
	sonido_spawn.play()
	var jugador = get_parent()
	jugador.position = posicion_respawn
	jugador.velocity = Vector2.ZERO


func _guardar_punto_control() -> void:
	posicion_respawn = get_parent().position
