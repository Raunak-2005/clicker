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
var oil=false 
var k=0
const guy = preload("res://Scenes/trail.tscn")# preload("res://Scenes/men.tscn")
var c
var scalel =1
var rev=1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	c=guy.instantiate()
	c.scale.x*=scalel
	if rev==-1:
		c.rotate(PI)
	get_tree().root.get_node("Node2D/Game/Car Controller").add_child(c)
	pass # Replace with function body.

func walk_start():
	is_walking = true
	check= true
	target = position.y - end*rev
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if is_walking:
		if check:
			check = false
		position.y -= speed*delta*rev
	if rev==1:
		if position.y <= target:
			is_walking = false
			get_parent().nalr=true
			queue_free()
	elif rev==-1:
		if position.y >= target:
			is_walking = false
			get_parent().nalr=true
			queue_free()
	if oil and  $TrailPoint!=null and rev==-1:# and k%32==0:
		c.global_position=$TrailPoint.global_position
	
	elif oil and  $TrailPoint!=null:# and k%32==0:
		c.global_position=$TrailPoint.global_position
	k=k+1
	pass
