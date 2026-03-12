extends Node3D

@export var mineral_scene : PackedScene##The scene for the mineral to be spawned
@export_range(5,1200,5) var respawn_time = 20.0##How long it will take the ores to respawn
@export_range(0,600,1) var respawn_variance = 5.0##Used to randomize the amount of time for respawn. For example, a respawn variance of 5 means there is a chance for any number between 0 and 5 to either be added or subtracted to the set respawn time.

func _ready():
	if mineral_scene:
		for child in $Spawners.get_children():
			child.resource_scene = mineral_scene
			child.respawn_time = respawn_time - randf_range(-respawn_variance,respawn_variance)
