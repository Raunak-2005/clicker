extends Control


# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	
	pass # Replace with function body.

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	if !is_multiplayer_authority():return
	pass
