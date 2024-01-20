extends Area2D



@export var speed = 300

@onready var offscreen_notifier = $OffScreenNotifier

func _ready():
	offscreen_notifier.connect("screen_exited",_on_screen_exited)

func _physics_process(delta):
	global_position.x += speed*delta


func _on_screen_exited():
	queue_free()
