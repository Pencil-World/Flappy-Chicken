extends Area2D

@onready var prefab = load("res://scenes/background.tscn")

func _on_body_entered(body):
	var obj = prefab.instantiate()
	add_child(obj)
	obj.position.x += 2000
