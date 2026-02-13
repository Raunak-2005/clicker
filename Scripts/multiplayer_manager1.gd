extends Node
const SERVER_PORT:int =8080  
# Called when the node enters the scene tree for the first time.
func create_server() :
	var enet_network_peer :ENetMultiplayerPeer=ENetMultiplayerPeer.new()
	enet_network_peer.create_server(SERVER_PORT)
	get_tree().get_multiplayer().multiplayer_peer= enet_network_peer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func create_client(host_ip: String ="localhost",host_port: int = SERVER_PORT) : 
	var enet_network_peer :ENetMultiplayerPeer=ENetMultiplayerPeer.new()
	enet_network_peer.create_client(host_ip,host_port)
	get_tree().get_multiplayer().multiplayer_peer= enet_network_peer
	pass
