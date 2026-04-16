extends Node
class_name InventoryNode

@export var InventoryData : InventoryRes

func _ready() -> void:
	InventoryAutoload.AddItem.connect(add_item)
	InventoryAutoload.RemoveItem.connect(remove_item)
	
	if InventoryData != null:
		pass
	
func add_item(newitem : SlotData):
	if InventoryData != null and newitem != null:
		for slots in InventoryData.SlotArray:
			if slots.Itemdata == newitem.Itemdata:
				if slots.Itemcount != null:
					slots.Itemcount += newitem.Itemcount
				InventoryAutoload.UpdateInvGUI.emit()
				break
			elif slots.Itemdata == null or slots == null:
				slots.Itemdata = newitem.Itemdata
				slots.Itemcount = newitem.Itemcount
				InventoryAutoload.UpdateInvGUI.emit()
				break

func remove_item(item : ItemData):
	
	if InventoryData != null: 
		
		for hotbarindex in InventoryData.HotBar.size(): ##for the hotbar !
			
			if item == InventoryData.HotBar[hotbarindex]:
				InventoryData.HotBar[hotbarindex].Itemcount = 0
				InventoryData.HotBar[hotbarindex].Itemdata = null
				InventoryAutoload.UpdateInvGUI.emit()
				
			else: 
				pass
			
		for slotindex in InventoryData.SlotArray.size(): ##for the backpack !
			if item == InventoryData.SlotArray[slotindex]:
				InventoryData.SlotArray[slotindex].Itemcount = 0
				InventoryData.SlotArray[slotindex].Itemdata = null
				InventoryAutoload.UpdateInvGUI.emit()
			else: pass

func swap_slots(slot1 : InventoryButton, slot2 : InventoryButton):
	##get the reference of the itemslots 
	var slot1data : SlotData = get_specific_inventory_slotdata(slot1)
	var slot2data : SlotData = get_specific_inventory_slotdata(slot2)
	
	var oldslot1data = slot1data
	var oldslot2data = slot2data
	#var oldslot1 = InventoryData.SlotArray[slot1]
	#var oldslot2 =  InventoryData.SlotArray[slot2]
	#InventoryData.SlotArray[slot1] = oldslot2
	set_specific_inventory_slotdata(slot2,oldslot1data)
	set_specific_inventory_slotdata(slot1,oldslot2data)
	InventoryAutoload.UpdateInvGUI.emit()

func get_inventory_data():
	return InventoryData
func get_specific_inventory_slotdata(buttonref : InventoryButton):
	if buttonref.get_parent() is GridContainer:
		return InventoryData.SlotArray[buttonref.get_index()]
		
	if buttonref.get_parent() is HBoxContainer:
		return InventoryData.HotBar[buttonref.get_index()]
		
	else:
		pass

func set_specific_inventory_slotdata(buttonref : InventoryButton,buttonslotdata : SlotData):
	if buttonslotdata == null:
		buttonslotdata = SlotData.new()
	
	if buttonref.get_parent() is GridContainer:
		InventoryData.SlotArray[buttonref.get_index()] = buttonslotdata
		
	elif buttonref.get_parent() is HBoxContainer: ##hardcoded to specific types for now...
		InventoryData.HotBar[buttonref.get_index()] = buttonslotdata
		
	else:
		pass

func get_slot_data(index : int):
	##for now just have it move the non-hotbar slots
	if InventoryData.SlotArray[index] != null:
		return InventoryData.SlotArray[index]
	else:
		pass
