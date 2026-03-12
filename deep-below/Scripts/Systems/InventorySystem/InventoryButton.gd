extends Button
class_name InventoryButton

@export var Itemicon : TextureRect
@export var Itemamt : Label

signal pressedwithref(button)
func _on_pressed() -> void:
	pressedwithref.emit(self)
