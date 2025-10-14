extends CharacterBody2D

const SPEED = 130.0
const RUN = 195.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sonido_salto: AudioStreamPlayer2D = $sonidoSalto

var debe_correr : bool = false

signal efecto_correr
signal respawn
signal hacer_punto_guardado

func iniciar_efecto_correr() -> void:
	efecto_correr.emit()


func iniciar_respawn() -> void:
	respawn.emit()


func iniciar_punto_guardado() -> void:
	hacer_punto_guardado.emit()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if InputManager.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sonido_salto.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := InputManager.get_axis("izquierda", "derecha")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("reposo")
		else:
			animated_sprite_2d.play("correr")
	else:
		animated_sprite_2d.play("saltar")
	
	if direction:
		velocity.x = direction * (RUN if debe_correr or InputManager.is_action_pressed("correr") else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
