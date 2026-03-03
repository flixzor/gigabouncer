extends Node2D
@export var gravity : float = .1
@export_range(0.0,1.0) var bounciness : float = 1 ## At 0 the ball will lose all velocity on collision, at 1 it will bounce forever

var velocity : Vector2 = Vector2(10,10)
var just_collided : bool = false ## This boolean makes sure the ball escapes its current collision before recolliding.

func _physics_process(delta: float) -> void:
	## 1. Check if current forces will result in a collision
	$ShapeCast2D.target_position = velocity # check collisions along ball trajectory
	$ShapeCast2D.force_shapecast_update() # reset shapecaster
	
	if $ShapeCast2D.is_colliding() and not just_collided: # if there is a collision, resolve and exit function	
		var collision_fraction = $ShapeCast2D.get_closest_collision_safe_fraction()		

		if collision_fraction != 1.0: # in the freak occurence that the CF is 1.0, don't move the ball. This prevents some wierd glitches
			position += velocity * collision_fraction # move to position of collision			

		## Resolve collision
		var collision_normal = $ShapeCast2D.get_collision_normal(0)
		velocity = velocity - 2 * (velocity.dot(collision_normal)) * collision_normal
		velocity *= bounciness # lose some velocity	
		$ShapeCast2D.target_position = velocity # reset shapecaster
		just_collided = true
		return # exit from function
	
	## 2. If there will be no collision, set new position normally.
	position += velocity
	just_collided = false
	
	## 3. Apply constant forces for next frame
	velocity.y += gravity
	
