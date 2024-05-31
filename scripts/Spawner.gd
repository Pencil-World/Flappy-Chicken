extends Node

@export var spike : PackedScene
@export var player : Node2D

@export var high_position := -350
@export var low_position := 250

@export var spawn_distance := 2000
@export var place_spike := 0
@export var min_distance := 250
@export var max_distance := 500

var isLow = true

func _physics_process(delta):
	if player.position.x > place_spike:
		var obj = spike.instantiate()
		add_child(obj)
		
		var spike_distance = randi_range(min_distance, max_distance)
		place_spike += spike_distance
		obj.position.x = player.position.x + spawn_distance + spike_distance
		if isLow:
			obj.position.y = low_position
			obj.scale = Vector2(1, 1)
		else:
			obj.position.y =  high_position
			obj.scale = Vector2(1, -1)

		isLow = not isLow
