extends Sprite2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

@export var tinte_desactivado: Color = Color.WHITE

func _on_area_2d_body_entered(body: Node2D) -> void:
	audio_stream_player.play()
	collision_shape_2d.set_deferred("disabled", true)
	self_modulate = tinte_desactivado
	body.iniciar_punto_guardado()
