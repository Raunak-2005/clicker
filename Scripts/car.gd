class_name car
extends Node2D
var is_walking = false
var target
var speed = 300
var check
var pcenttruck = 1
var pcenttank = 5
var end
var rng = RandomNumberGenerator.new()
var rando = rng.randf_range(0,1)*100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func walk_start():
	is_walking = true
	check= true
	target = position.y - end
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
