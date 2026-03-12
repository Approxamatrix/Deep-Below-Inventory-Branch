extends Node3D

@onready var anims = $Anims

var open = false
var playing_animation = false

func _on_input_detector_input_detected(_interact_state):
	if !open and !playing_animation:
		anims.play("cycle")
		open = true
		playing_animation = true
	elif open and !playing_animation:
		anims.play_backwards("cycle")
		open = false
		playing_animation = true

func _on_anims_animation_finished(_anim_name):
	playing_animation = false
