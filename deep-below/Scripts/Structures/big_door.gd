extends Node3D

@export var start_open = false
@onready var door_anims = $DoorAnims
var open = false
var moving = false

func _ready():
	if start_open and !moving:
		moving = true
		door_anims.play("open")

func trigger():
	if !moving:
		if open:
			open = false
			door_anims.play_backwards("open")
		elif !open:
			open = true
			door_anims.play("open")

func _on_door_anims_animation_finished(anim_name):
	if anim_name == "open":
		if open:
			open = false
		elif !open:
			open = true
