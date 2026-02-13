extends Panel
signal startedserver
signal startedclient
@onready var line_edit: LineEdit = $"../LineEdit"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	#MultiplayerManager1.create_server()
	startedserver.emit()
	$Camera2D.enabled=false 
	get_tree().root.get_node("Node2D/MainCamera").enabled=true
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	#MultiplayerManager1.create_client($"../LineEdit".text)
	startedclient.emit()
	$Camera2D.enabled=false 
	get_tree().root.get_node("Node2D/CameraCar").enabled=true
	pass # Replace with function body.
