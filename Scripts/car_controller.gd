extends Node2D
const car = preload("res://Scenes/car.tscn")
var nalr
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	multiplayer.peer_connected.connect(check)
	nalr=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
			
	pass
func check(id:int):
	set_multiplayer_authority(id)
func cartt():
	if nalr :
			nalr=false
			var carr = car.instantiate()
			var randx = randf_range(300,737) 
			var randy = 1000
			carr.position = Vector2(randx,randy)
			carr.z_index = 50
			add_child(carr)
			carr.walk_start()
