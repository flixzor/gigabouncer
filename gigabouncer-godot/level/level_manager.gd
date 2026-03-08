extends Node2D



func _physics_process(delta: float) -> void:
	%Paddle.paddle_physics_process()	
	%Ball.ball_physics_process() # ball must always go last
