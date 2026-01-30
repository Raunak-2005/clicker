extends Area2D
var t
signal shoot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot.connect(get_parent().get_parent().get_parent().get_node("Car Controller").cartt)
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
		#get_parent().get
		shoot.emit()
		get_parent().get_parent().get_parent().get_node("AnimatedSprite2D/AudioStreamPlayer2D").play() 
		print(get_tree().get_multiplayer().get_remote_sender_id())
	
#get_tree().get_multiplayer().rpc(get_tree().get_multiplayer().get_peers()[0],get_tree().root.get_node("Node2D/Game/AnimatedSprite2D/Area2D"),"working2v",[randx,randy])	
func check():
	get_parent().animation="default"
	get_parent().play("default",clamp((22-get_parent().get_frame()),-1,1))
		#get_parent().get
	shoot.emit()
	get_tree().root.get_node("Node2D").get_node("Game/AnimatedSprite2D/AudioStreamPlayer2D").play() 
	print(get_tree().get_multiplayer().get_remote_sender_id())		
	
