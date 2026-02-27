extends Node
class_name InventoryNode

@export var InventoryData : InventoryRes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if InventoryData != null:
		
		
		pass
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func add_item(newitem : SlotData):
	
	if InventoryData != null:
		
		for slots in InventoryData.SlotArray:
			if slots.Itemdata == newitem.Itemdata:
				
				slots.ItemCount += newitem.ItemCount
				
				pass
			else:
				
				InventoryData.SlotArray.append(newitem)
				
				pass
		
		
		pass
	
	pass

func remove_item(item : ItemData):
	
	if InventoryData != null:
		for slotindex in InventoryData.SlotArray.size(): 
			if item == InventoryData.SlotArray[slotindex]:
				
				InventoryData.SlotArray.remove_at(slotindex)
				
				pass
			else:
				
				
				pass
		
		

	pass
