extends Node2D
var count=0
var texty
var texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture="AnimatedSprite2D2"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var texty="Counter:"+ str(count)
	get_node("Label").text=texty
	pass
