extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_parent().get_node("AnimatedSprite2D/Area2D").no+=1
	pass # Replace with function body.


func _on_button_pressed2 () -> void:
	get_parent().get_node(".").tl*=0.95
	pass # Replace with function body.


func _on_button_pressed3() -> void:
	get_parent().get_node(".").auto=true
	get_parent().get_node(".").autot*=0.95
	
	pass # Replace with function body.


func _on_button_pressed4() -> void:
	get_parent().get_node("AnimatedSprite2D/Area2D").sp*=1.05
	pass # Replace with function body.
