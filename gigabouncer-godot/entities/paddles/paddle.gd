extends Node2D
class_name Paddle

@export var debug : bool = false
@export var move_speed : float = .5
@export var move_friction : float = .9

var velocity : Vector2

var colliding : bool = false

func _ready() -> void:
	for hitbox in $Hitboxes.get_children():
		hitbox.area_entered.connect(func(area:Area2D): colliding = true) 
		hitbox.area_exited.connect(func(area:Area2D): colliding = false)


func paddle_physics_process() -> void:
	if not colliding: # if the hitboxes predict a collision this frame, dont move
		position += velocity
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x += move_speed
	
	velocity *= move_friction	

	$Hitboxes.position = velocity # project out the hitboxes to next frame's collision

	
	
#func _prevent_paddle_clipping(area,hitbox):
#	colliding = true
#	pass
