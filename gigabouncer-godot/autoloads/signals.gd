extends Node
## SIGNAL BUS

#signal paddle_hit_ball ## DEPRECATED

func _ready() -> void:
	#paddle_hit_ball.connect(report_signals.bind("paddle_hit_ball"))	
	pass

func report_signals(message):
	print("signal emitted: " + message)
