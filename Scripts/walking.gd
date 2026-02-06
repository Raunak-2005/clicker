extends Node2D
class_name men
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_walking = false
var target
var speed = 100
var check

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	walk_start()
	
	 
	pass # Replace with function body.

func walk_start():
	print('walk start')
	if get_parent() is not VIP: 
		animated_sprite_2d.play('walk')
	is_walking = true
	check = true
	target = position.x + 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_walking:
		if check:
			print('walking')
			check = false
		position.x += speed*delta
	if position.x >= target:
		print('done')
		get_tree().root.get_node("Node2D").count+=1
		is_walking = false
		animated_sprite_2d.stop()
		queue_free()
		
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is car:
		is_walking= 0
		scale*=0.33
		#get_node("Area2D/CollisionShape2D").disabled=true
		get_node("AnimatedSprite2D").animation="ex"
		
		
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	if get_node("AnimatedSprite2D").animation=="ex":
		get_tree().root.get_node("Node2D").countcr+=1*get_tree().root.get_node("Node2D/Game").multiplierparr
		queue_free()
	
	pass # Replace with function body.
