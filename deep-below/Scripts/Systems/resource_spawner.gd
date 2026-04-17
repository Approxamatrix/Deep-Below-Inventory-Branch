@icon("res://Assets/2D/Icons/mineral_item_icon.svg")
extends Node3D

@onready var respawn_timer = $RespawnTimer
@onready var spawn_point = $SpawnPoint
@onready var respawn_animation = $RespawnAnimation

@export var resource_scene : PackedScene##The scene for the item that will be spawned
@export var respawn_time = 20.0##Time until the item will respawn after being removed



var instance

func _ready():
	await get_tree().create_timer(.1).timeout
	if resource_scene:
		instance = resource_scene.instantiate()
		instance = resource_scene.instantiate()
		spawn_point.add_child(instance)
		spawn_point.get_child(1).visibility_changed.connect(item_removed)
	respawn_timer.wait_time = respawn_time
	respawn()

func item_removed():
	if !instance.visible:
		$DustParticles.emitting = true
		$RockParticles.emitting = true
		
		if get_parent().get_parent().ItemSlotdata != null:
			
			InventoryAutoload.AddItem.emit(get_parent().get_parent().ItemSlotdata)
			
			pass
		else:
			
			pass
		
		respawn_timer.start()
		respawn_animation.play("RESET")

func respawn():
	if resource_scene:
		instance.visible = true
		respawn_animation.play("grow")
