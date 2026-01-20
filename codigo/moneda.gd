extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sonido: AudioStreamPlayer2D = $sonido
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var autodestruir: bool = true

func _on_body_entered(_body: Node2D) -> void:
	game_manager.incrementa_punto()
	sonido.play()
	collision_shape_2d.call_deferred("set", "disabled", true)
	if autodestruir:
		animated_sprite_2d.visible = false
		sonido.finished.connect(_on_finished)

func _on_finished() -> void:
	queue_free()
