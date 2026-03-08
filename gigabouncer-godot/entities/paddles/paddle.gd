extends Node2D
class_name Paddle

@export var debug : bool = false
@export var move_speed : float = .5
@export var move_friction : float = .9

var velocity : Vector2

var colliding : bool = false
var clipping_counter : int = 0
var previous_position : Vector2

func _ready() -> void:
	for hitbox in $Hitboxes.get_children():
		hitbox.area_entered.connect(func(area:Area2D): colliding = true)
		hitbox.area_exited.connect(func(area:Area2D): colliding = false)
		#hitbox.area_entered.connect(manage_collisions.bind(hitbox)) ## DEPRECATED


func paddle_physics_process() -> void:
	if not colliding: # if the hitboxes predict a collision this frame, dont move
		previous_position = position #stores last frame's uncollided position
		position += velocity # apply last frames velocities
	
	if colliding:
		velocity *= .5
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("move_right"):
		velocity.x += move_speed
	if Input.is_action_pressed("boost"):
		velocity.y -= move_speed
	if Input.is_action_pressed("drop"):
		velocity.y += move_speed
	
	velocity *= move_friction

	$Hitboxes.position = velocity # project out the hitboxes to next frame's collision

## DEPRECATED
func manage_collisions(area,hitbox):
	## TODO keep this but put somewhere else
	## Fix wall collision 
	if area is Wall: 
		velocity.x *= .5 # the paddle cannot move if it projects a collision, but at high velocity this will leave a gap between the paddle and wall. This allows the paddle to move closer and hit the wall
