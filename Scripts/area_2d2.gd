extends Area2D
var t

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_frame()==15:
	
		get_parent().play("default",clamp((1-get_parent().get_frame()),-1,1))
		
	pass
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("ui_Mouse_left_Click")): 
		get_parent().animation="default"
		get_parent().play("default",clamp((22-get_parent().get_frame()),-1,1))
		#get_parent().
		get_tree().root.get_child(0).get_node("AnimatedSprite2D/AudioStreamPlayer2D").play() 
	
