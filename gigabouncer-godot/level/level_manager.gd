extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _physics_process(delta: float) -> void:

	%Paddle.paddle_physics_process()
	
	%Ball.ball_physics_process() # ball must always go last
