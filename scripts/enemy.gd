extends Area2D

signal killed

@export var speed = 200

@onready var offscreen_notifier = $OffScreenNotifier




func _ready():
	#offscreen_notifier.connect("screen_exited",_on_screen_exited)
	pass

func _physics_process(delta):
	global_position.x -= speed*delta

func _on_screen_exited():
	queue_free()

func die():
	emit_signal("killed")
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()
