extends Node
## SIGNAL BUS

#signal ball_bounced ## emitted when the ball bounces off any object

func _ready() -> void:
	#ball_bounced.connect(report_signals.bind("ball_bounced"))
	pass

func report_signals(message):
	print("signal : " + message)
