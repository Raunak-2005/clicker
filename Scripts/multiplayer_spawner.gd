extends MultiplayerSpawner
@export var PlayerConnect:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	multiplayer.peer_connected.connect(spawn_player)
	pass # Replace with function body.
func spawn_player(id:int):
	if !multiplayer.is_server(): return
	var player: Node= PlayerConnect.instantiate()
	player.name=str(id)
	
	get_node(spawn_path).call_deferred("add_child",player)
	get_node(spawn_path).play=NodePath(player.name)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
