extends Node


func message(sender : Object, message : String):
	if sender.debug:
		print_rich("[color=green]DEBUG: " + sender.get_parent().name +" / "+ sender.name +" : [/color]"+ message)
