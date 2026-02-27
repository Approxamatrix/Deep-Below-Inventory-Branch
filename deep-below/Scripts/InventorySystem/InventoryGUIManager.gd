extends Control


#@export var GUINode : Node
@export var InvNode : InventoryNode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if InvNode.InventoryData != null:
		
		#populate_inventory_ui()
		
		pass
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populate_inventory_ui():
	
	#if GUINode != null:
		#
		#pass
	#
	
	pass
