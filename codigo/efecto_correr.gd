extends Node

@onready var jugador: CharacterBody2D = $".."
@onready var temporizador: Timer = $temporizador

@export var duracion_efecto: int = 5

const EFECTO_MUSICA : float = 1
@export var efecto_powerup : float = 3

func _ready() -> void:
	jugador.efecto_correr.connect(_on_jugador_efecto_correr)
	temporizador.timeout.connect(_on_timeout)
	jugador.respawn.connect(_on_jugador_respawn)
	restaura_musica()

func _on_jugador_efecto_correr() -> void:
	if temporizador.time_left <= 0:
		jugador.debe_correr = true
		Musica.pitch_scale = efecto_powerup
	
	temporizador.start(duracion_efecto + temporizador.time_left)

func _on_timeout() -> void:
	jugador.debe_correr = false
	restaura_musica()

func restaura_musica() -> void:
	Musica.pitch_scale = EFECTO_MUSICA

func _on_jugador_respawn() -> void:
	if temporizador.time_left > 0:
		temporizador.stop()
		temporizador.emit_signal("timeout")
