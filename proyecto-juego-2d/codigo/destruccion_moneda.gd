extends Node

@onready var moneda: Area2D = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

var distancia_recorrer: float = 20
var duracion_animacion: float = 0.5

func _ready() -> void:
	moneda.body_entered.connect(_on_body_entered)
	moneda.autodestruir = false

func _on_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween().bind_node(moneda).set_parallel(true)
	tween.tween_property(moneda, "position", moneda.position + Vector2.UP * distancia_recorrer, duracion_animacion).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(animated_sprite_2d, "self_modulate", Color(Color.WHITE, 0), duracion_animacion)
	await tween.finished
	moneda.queue_free()
