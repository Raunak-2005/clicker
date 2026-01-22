extends Node2D
var count=0
var texty
var texture
var tl=5
var auto=false
var autot=5
var act=false
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	texture="AnimatedSprite2D2"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var texty="Counter:"+ str(count)
	get_node("Label").text=texty
	if auto==true && act==false:
		act=true
		autoclick()
		
		
	pass

func autoclick():
	await get_tree().create_timer(autot).timeout
	$AnimatedSprite2D/Area2D.working()
	var a=get_node("AutoClicked!").duplicate()
	a.position=Vector2(randf_range(200,610),randf_range(0,370))
	get_node(".").add_child(a)
	a.visible=true
	await get_tree().create_timer(2).timeout
	get_node(".").remove_child(a)
	
	act=false
	pass # Replace with function body.


func _on_button_pressed() -> void:
	$ShopCamera.enabled=true
	pass # Replace with function body.


func _on_close_pressed() -> void:
	$ShopCamera.enabled=!true
	pass # Replace with function body.
