extends Node2D
var count=10000000
var countcr=0
var tt=true
var texture
var tl=5
var auto=false
var autot=5
var act=false
var checkstart=true
var str=""
var play="Game"
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	texture="AnimatedSprite2D2"
	
	#if get_node("2ndPlayer/CameraCar") != null:
	#	if get_node("2ndPlayer/CameraCar").enabled == true:	
	#		tt=false 
	#if tt==false:
	#	get_node("AnimatedSprite2D/Area2D/Point").visible=false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if get_node_or_null(play)!=null:
		
	
	#if get_node("2ndPlayer/CameraCar") !=null :
	#	if get_node("2ndPlayer/CameraCar").enabled == true:	
	#		tt=false 
	#if tt==false:
	#	get_node("AnimatedSprite2D/Area2D/Point").visible=false 
	
		var texty="Counter "+ str(count)
		get_node(play).get_node("Main_Counter").text=texty
		get_node(play).get_node("ShopCounter").text= texty
		texty="Counter "+ str(countcr)
		get_node(play).get_node("Count").text=texty
		if auto==true && act==false:
			act=true
			autoclick()
	
	pass

func autoclick():
	await get_tree().create_timer(autot).timeout
	get_node(play).get_node("AnimatedSprite2D/Area2D").working()
	var a=get_node(play).get_node("AutoClicked!").duplicate()
	a.position=Vector2(randf_range(200,610),randf_range(0,370))
	get_node(".").add_child(a)
	a.visible=true
	await get_tree().create_timer(2).timeout
	get_node(".").remove_child(a)
	
	act=false
	pass # Replace with function body.
