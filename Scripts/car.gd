extends Node2D
var is_walking = false
var target
var speed = 300
var check
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func walk_start():
	is_walking = true
	check= true
	target = position.y - 700
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_walking:
		if check:
			check = false
		position.y -= speed*delta
	if position.y <= target:
		is_walking = false
		get_parent().nalr=true
		queue_free()
	pass
