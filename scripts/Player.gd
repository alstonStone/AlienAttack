extends CharacterBody2D


signal took_damage

var speed = 400
var rocket_scene = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer




func _process(delta):
	#actions
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	#movement
	velocity = Vector2(0,0)
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	move_and_slide()
	var screen_size = get_viewport_rect().size	
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_instance.global_position = global_position
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position.x += 60

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
