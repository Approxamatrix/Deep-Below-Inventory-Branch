@tool
extends Node3D
@export_tool_button("Update Rotation","CurveTilt") var updater = Callable(self, "update_rotation")
@export_range(-125,125) var turn_angle = 0.0
@export var turn_speed = 1.0
@export_group("light settings")
@export var shadows_enabled = false
@export var light_energy = 4.0
@export var light_range = 20.0
@export var light_width = 45.0
@export var attenuation = 1.0
@onready var hinge = $Hinge
@onready var source = $Hinge/Source

func _ready():
	hinge.rotation_degrees.x = turn_angle
	source.spot_range = light_range
	source.light_energy = light_energy
	source.spot_angle = light_width
	source.shadow_enabled = shadows_enabled

func update_rotation():
	source.spot_attenuation = attenuation
	source.shadow_enabled = shadows_enabled
	source.spot_range = light_range
	source.light_energy = light_energy
	source.spot_angle = light_width
	
	var difference = (hinge.rotation_degrees.x - turn_angle)/40 / turn_speed
	if difference < 0:
		difference *= -1
	var rotation_goal = Vector3(turn_angle,180,90)
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(hinge,"rotation_degrees", rotation_goal, difference)
