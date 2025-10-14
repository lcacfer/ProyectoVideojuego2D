extends CanvasLayer

@onready var contador: Label = $contador

func _ready() -> void:
	var game_manager = get_node("%GameManager")
	game_manager.puntuacion_actualizada.connect(_on_puntuacion_actualizada)

func _on_puntuacion_actualizada(puntuacion_actual:int) -> void:
	contador.text = str(puntuacion_actual)
