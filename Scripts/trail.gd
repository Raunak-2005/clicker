extends Node2D
var ok=false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await(get_tree().create_timer(3).timeout) 
	
	ok=true
	await(get_tree().create_timer(3.2).timeout) 
	queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ok :
		modulate.a*=0.985
	pass


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.get_parent() is men:
		area.get_parent().speed*=0.6
	pass # Replace with function body.


func _on_area_2d_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area != null and area.get_parent() is men:  
		area.get_parent().speed/=0.6
	pass # Replace with function body.
