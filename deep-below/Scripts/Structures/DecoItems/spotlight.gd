@tool
extends Node3D
@export_tool_button("Update Rotation","CurveTilt") var updater = Callable(self, "update_rotation")
@export_range(-125,125) var turn_angle = 0.0
@export var turn_speed = 1.0
@onready var hinge = $Hinge

func _ready():
	hinge.rotation_degrees.x = turn_angle

func update_rotation():
	var difference = (hinge.rotation_degrees.x - turn_angle)/40 / turn_speed
	if difference < 0:
		difference *= -1
	var rotation_goal = Vector3(turn_angle,180,90)
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(hinge,"rotation_degrees", rotation_goal, difference)
