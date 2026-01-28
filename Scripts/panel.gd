extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	MultiplayerManager1.create_server()
	$Camera2D.enabled=false 
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	MultiplayerManager1.create_client()
	$Camera2D.enabled=false
	$"../CameraCar".enabled=true
	
	pass # Replace with function body.
