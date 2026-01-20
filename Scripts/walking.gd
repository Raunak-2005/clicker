extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_walking = false
var target
var speed = 100
var check
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func walk_start():
	print('walk start')
	animated_sprite_2d.play('walk')
	is_walking = true
	check = true
	target = position.x + 1000
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_walking:
		if check:
			print('walking')
			check = false
		position.x += speed*delta
	if position.x >= target:
		print('done')
		is_walking = false
		animated_sprite_2d.stop()
		queue_free()
	pass
