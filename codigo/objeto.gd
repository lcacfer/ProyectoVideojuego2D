extends Sprite2D

@onready var sonido: AudioStreamPlayer2D = $Sonido
@onready var objeto: Sprite2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	sonido.play()
	objeto.visible = false
	collision_shape_2d.call_deferred("set", "disabled", true)
	body.iniciar_efecto_correr()

func _on_sonido_finished() -> void:
	queue_free()
