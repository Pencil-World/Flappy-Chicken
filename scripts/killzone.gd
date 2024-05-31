extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	if body is Chicken:
		var chicken = body as Chicken
		chicken.die()
		timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()
