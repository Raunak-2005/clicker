extends Area2D

var texture
var texture1
const guy = preload("res://Scenes/men.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = preload("res://Assets/Cursor-Sheet.png")
	texture1 = preload("res://Assets/Cursor-Sheet1.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("ui_Mouse_left_Click")):
		get_parent().animation="default"
		get_parent().play()
		get_parent().get_node("AudioStreamPlayer2D").play() 
		var dude = guy.instantiate()
		var randx = randf_range(-250,-150)
		var randy = randf_range(50,130)
		dude.position = Vector2(randx,randy)
		dude.z_index = 100
		print(randx)
		print(randy)
		add_child(dude)
		dude.walk_start()
		get_tree().root.get_child(0).count+=1 #just testing wont work like this
		
		Input.set_custom_mouse_cursor(texture,Input.CURSOR_ARROW)
	if (Input.is_action_just_released("ui_Mouse_left_Click")):
		Input.set_custom_mouse_cursor(texture1,Input.CURSOR_ARROW)
	pass # Replace with function body.
