extends Node2D
const car = preload("res://Scenes/car.tscn")
var nalr
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nalr=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (get_parent().get_node(".").tl>=2 and get_parent().get_node(".").autot>=2):
		if (get_parent().get_node("Timer").t.time_left==0 || get_parent().get_node("Timer").t.time_left==0) && nalr:
				nalr=false
				var carr = car.instantiate()
				var randx = randf_range(300,737) 
				var randy = randf_range(900,1000)
				carr.position = Vector2(randx,randy)
				carr.z_index = 50
				add_child(carr)
				carr.walk_start()
			
	pass
