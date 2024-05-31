extends CharacterBody2D
class_name Chicken

@export var sounds : Array[AudioStream]
@onready var audio : AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var slow_speed := 100.0
@export var speed := 200.0
@export var fast_speed := 400.0

var dead
@export var flap_velocity := -600.0
@export var gravity := 600.0

@export var sprite_normal : CompressedTexture2D
@export var sprite_flap : CompressedTexture2D
@export var sprite_dead : CompressedTexture2D
@onready var sprite : Sprite2D = $Sprite2D

func _ready():
	dead = false

func _physics_process(delta):
	if Input.is_action_just_released("reset"):
		get_tree().reload_current_scene()
	
	velocity.y += gravity * delta		
	if !dead:
		var direction = Input.get_axis("left", "right")
		velocity.x = [slow_speed, speed, fast_speed][direction + 1]
		if Input.is_action_just_pressed("flap"):
			velocity.y = flap_velocity
			var soundIndex = randi() % sounds.size()
			audio.stream = sounds[soundIndex]
			audio.play()
			
		sprite.texture = sprite_flap if velocity.y < 0 else sprite_normal

	move_and_slide()
	rotation = atan2(velocity.y, velocity.x)

func die():
	dead = true
	velocity = Vector2.ZERO
	sprite.texture = sprite_dead
	$CollisionShape2D.queue_free()
