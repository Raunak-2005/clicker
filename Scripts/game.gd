extends Node2D


# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	multiplayer.peer_connected.connect(check)

func _ready() -> void:
	
	pass # Replace with function body.
func check(id:int):
	print()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_button_pressed() -> void:
	print("pressed")
	get_parent().get_node("ShopCamera").enabled=true
	get_parent().get_node("MainCamera").enabled=false
	pass
func _on_close_pressed() -> void:
	get_parent().get_node("ShopCamera").enabled= false
	get_parent().get_node("MainCamera").enabled = true
	pass # Replace with function body.


func _on_car_shop_button_pressed() -> void:
	get_parent().get_node("CarShopCamera").enabled=true
	get_parent().get_node("CameraCar").enabled=false
	pass # Replace with function body.


func _on_car_close_pressed() -> void:
	get_parent().get_node("CarShopCamera").enabled=false
	get_parent().get_node("CameraCar").enabled=true
	pass # Replace with function body.
