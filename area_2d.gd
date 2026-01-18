extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("ui_Mouse_left_Click")):
		get_parent().animation="default"
		get_parent().play()
		get_parent().get_node("AudioStreamPlayer2D").play() 
	pass # Replace with function body.
