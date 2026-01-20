extends Area2D

@onready var timer: Timer = $Timer
@onready var sonido_muerte: AudioStreamPlayer2D = $sonidoMuerte

var jugador : Node2D

func _on_body_entered(body: Node2D) -> void:
	jugador = body
	sonido_muerte.play()
	print("Has perdido")
	Engine.time_scale = 0.5
	jugador.get_node("CollisionShape2D").set_deferred("disabled", true)
	InputManager.input_enabled = false
	timer.start()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	jugador.iniciar_respawn()
	await get_tree().physics_frame
	await get_tree().physics_frame
	jugador.get_node("CollisionShape2D").set_deferred("disabled", false)
	InputManager.input_enabled = true
