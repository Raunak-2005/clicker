extends Area2D
var to
var texture
var texture1
var no
var sp=100
const guy = preload("res://Scenes/men.tscn")
const vip = preload("res://Scenes/vip.tscn")
var pcent = 0.01
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = preload("res://Assets/Cursor-Sheet.png")
	texture1 = preload("res://Assets/Cursor-Sheet1.png")
	to=false 
	no=1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("ui_Mouse_left_Click") && (get_parent().get_parent().get_node("Timer").t.time_left==0 || to)):
		get_parent().animation="default"
		get_parent().play()
		get_parent().get_node("AudioStreamPlayer2D").play() 
		get_parent().get_parent().get_node("Timer").startcountdown()
		for i in no: 
			if randf_range(0,1)>pcent:
				var dude = guy.instantiate()
				dude.speed=sp
				var randx = randf_range(-250,-150)
				var randy = randf_range(50,130)
				dude.position = Vector2(randx,randy)
				dude.z_index = 100
				print(randx)
				print(randy)
				add_child(dude)
				dude.walk_start()
				
			else:
				var vips = vip.instantiate()
				vips.get_node("Men").speed = sp
				vips.get_node('Men2').speed = sp
				vips.get_node('Men3').speed = sp
				var randx = randf_range(-250,-150)
				var randy = randf_range(50,130)
				vips.position = Vector2(randx,randy)
				vips.z_index = 100
				print(randx)
				print(randy)
				add_child(vips)
				vips.get_node("Men").walk_start()
				vips.get_node("Men2").walk_start()
				vips.get_node("Men3").walk_start() #just testing wont work like this
				print('pcent',pcent)
		
		Input.set_custom_mouse_cursor(texture,Input.CURSOR_ARROW)
	if (Input.is_action_just_released("ui_Mouse_left_Click")):
		Input.set_custom_mouse_cursor(texture1,Input.CURSOR_ARROW)
	pass # Replace with function body.
func working():
	for i in no: 
			if randf_range(0,1)>pcent:
				var dude = guy.instantiate()
				dude.speed=sp
				var randx = randf_range(-250,-150)
				var randy = randf_range(50,130)
				dude.position = Vector2(randx,randy)
				dude.z_index = 100
				print(randx)
				print(randy)
				add_child(dude)
				dude.walk_start()
				
			else:
				var vips = vip.instantiate()
				vips.get_node("Men").speed = sp
				vips.get_node('Men2').speed = sp
				vips.get_node('Men3').speed = sp
				var randx = randf_range(-250,-150)
				var randy = randf_range(50,130)
				vips.position = Vector2(randx,randy)
				vips.z_index = 100
				print(randx)
				print(randy)
				add_child(vips)
				vips.get_node("Men").walk_start()
				vips.get_node("Men2").walk_start()
				vips.get_node("Men3").walk_start()
				 #just testing wont work like this
