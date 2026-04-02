extends Node3D

@export var locked = false
var open = false
var animation_playing = false

func _on_detection_body_entered(_body):
	print("detected")
	if !open and !animation_playing and !locked:
		$Anims.play("open")
		animation_playing = true

func _on_detection_body_exited(_body):
	if open and !animation_playing:
		$Anims.play_backwards("open")
		animation_playing = true

func _on_anims_animation_finished(_anim_name):
	animation_playing = false
	if open:
		open = false
	elif !open:
		open = true
