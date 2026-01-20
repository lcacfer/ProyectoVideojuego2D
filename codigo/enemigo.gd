extends Node2D

const velocidad = 60

var direccion = 1

@onready var ray_cast_2_ddere: RayCast2D = $RayCast2Ddere
@onready var ray_cast_2_dizq: RayCast2D = $RayCast2Dizq
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2_ddere.is_colliding():
		direccion = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_2_dizq.is_colliding():
		direccion = 1
		animated_sprite_2d.flip_h = false
	
	position.x += direccion * velocidad * delta
