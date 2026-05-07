extends Node3D

@export var target_object : Node
@export var secondary_target_object : Node
@export var start_active = false
@onready var anims = $Anims
var active = false

func _ready():
	toggle()

func toggle():
	if !active:
		active = true
		anims.play("toggle")
	elif active:
		active = false
		anims.play_("toggle")

func trigger_target():
	if target_object and target_object.has_method("trigger"):
		target_object.trigger()
	if secondary_target_object and secondary_target_object.has_method("trigger"):
		secondary_target_object.trigger()

func _on_input_detector_input_detected(interact_state):
	if interact_state:
		trigger_target()
