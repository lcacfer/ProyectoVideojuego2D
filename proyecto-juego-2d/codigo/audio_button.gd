extends Button
class_name AudioButton

@export var sonido : AudioStream
@export var esperar_sonido : bool

signal boton_pulsado

func _init() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	if sonido:
		pressed.disconnect(_on_pressed)
		if esperar_sonido:
			await AudioPlayer.play(sonido)
		else:
			AudioPlayer.play(sonido)
	
	boton_pulsado.emit()
	
	if sonido:
		pressed.connect(_on_pressed)
