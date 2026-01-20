extends CanvasLayer

@export var nivel_carga : PackedScene

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_button_comenzar_pressed() -> void:
	if nivel_carga:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene_to_packed(nivel_carga)
	else:
		print("Sin nivel selecionado")


func _on_button_continuar_pressed() -> void:
	pass # Replace with function body.


func _on_button_salir_pressed() -> void:
	get_tree().quit()
