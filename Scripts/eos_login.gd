extends Control

@onready var display = $MessageDisplay
@onready var back_button = $Button
@onready var peer: EOSGMultiplayerPeer = EOSGMultiplayerPeer.new()
var player1=false 
var player2=false  
@export var game_scene: PackedScene

var local_user_id = ""
var is_server = false
var peer_user_id = 0
var EosSetup = false
var PRODUCT_ID="d376b2fdf68440e4a8860127fb47e9ec" #Replace EosCredentials.PRODUCT_ID with your actual PRODUCT_ID from the EOS website
var SANDBOX_ID = "6ed8f2b7e8bf48fd88e9cafce623c9f4" #Replace EosCredentials.SANDBOX_ID with your actual SANDBOX_ID from the EOS website
var DEPLOYMENT_ID="67574f53a2354c9fababae24a9c4102c" #Replace EosCredentials.DEPLOYMENT_ID with your actual DEPLOYMENT_ID from the EOS website
var CLIENT_ID="xyza7891iAdXqSPwe4q053rbrTiTzKG2" #Replace EosCredentials.CLIENT_ID with your actual CLIENT_ID from the EOS website
var CLIENT_SECRET ="smT063MF4Zytxf8wwkkc72l/Ni6BeqiKmssic/fWEvI"#Replace EosCredentials.CLIENT_SECRET with your actual CLIENT_SECRET from the EOS website
var ENCRYPTION_KEY="1278127318273473647584756463264874895952345234234235236357356467"
var local_lobby: HLobby

func _ready() -> void:
	
	display.text = "Starting"
	
	#Initialize the SDK
	if not EosSetup:
		var init_opts = EOS.Platform.InitializeOptions.new()
		init_opts.product_name ="Press To Cross"#Replace EosCredentials.PRODUCT_NAME with your actual PRODUCT_NAME from the EOS website
		init_opts.product_version = PRODUCT_ID #Replace EosCredentials.PRODUCT_ID with your actual PRODUCT_ID from the EOS website
	
		var init_results = EOS.Platform.PlatformInterface.initialize(init_opts)
		if init_results != EOS.Result.Success:
			printerr("Failed to initialize EOS SDK: " + EOS.result_str(init_results))
			display.text = "Failed to initialize EOS SDK: " + EOS.result_str(init_results)
			back_button.visible = true
			return
		print("Initialized EOS Platform")
	
		# Create EOS platform
		var create_opts = EOS.Platform.CreateOptions.new()
		create_opts.product_id = PRODUCT_ID #Replace EosCredentials.PRODUCT_ID with your actual PRODUCT_ID from the EOS website
		create_opts.sandbox_id =SANDBOX_ID #Replace EosCredentials.SANDBOX_ID with your actual SANDBOX_ID from the EOS website
		create_opts.deployment_id = DEPLOYMENT_ID #Replace EosCredentials.DEPLOYMENT_ID with your actual DEPLOYMENT_ID from the EOS website
		create_opts.client_id = CLIENT_ID #Replace EosCredentials.CLIENT_ID with your actual CLIENT_ID from the EOS website
		create_opts.client_secret =CLIENT_SECRET #Replace EosCredentials.CLIENT_SECRET with your actual CLIENT_SECRET from the EOS website
		create_opts.encryption_key = ENCRYPTION_KEY #Replace EosCredentials.ENCRYPTION_KEY with your any string of 64 numbers
	
		var _create_results = 0
		_create_results = EOS.Platform.PlatformInterface.create(create_opts)
		print("EOS Platform created")
		display.text = "Waiting"
	
		# Setup Logs from EOS
		EOS.get_instance().logging_interface_callback.connect(_on_logging_interface_callback)
		var res := EOS.Logging.set_log_level(EOS.Logging.LogCategory.AllCategories, EOS.Logging.LogLevel.Info)
		if res != EOS.Result.Success:
			print("Failed to set log level: ", EOS.result_str(res))
			display.text = "Failed to set log level: " + EOS.result_str(res)
	
		EOS.get_instance().connect_interface_login_callback.connect(_on_connect_login_callback)
	
		peer.peer_connected.connect(_on_peer_connected)
		peer.peer_disconnected.connect(_on_peer_disconnected)
	
		await HAuth.login_anonymous_async("User")
		EosSetup = true
		back_button.visible = true
	else:
		peer.peer_connected.connect(_on_peer_connected)
		peer.peer_disconnected.connect(_on_peer_disconnected)
		back_button.visible = true
	
func _on_logging_interface_callback(msg) -> void:
	msg = EOS.Logging.LogMessage.from(msg) as EOS.Logging.LogMessage
	print("SDK %s | %s" % [msg.category, msg.message])
	
func exit_game():
	if peer:
		peer.close()
	
	if multiplayer.multiplayer_peer:
		multiplayer.multiplayer_peer = null
	if is_server and local_lobby:
		await local_lobby.destroy_async()
	elif local_lobby:
		await local_lobby.leave_async()
	
func _exit_tree() -> void:
	exit_game()
		
func findMatch():
	player1=true
	$Button2.disabled=true
	$Button2.visible=false 
	$Button3.disabled=true 
	$Button3.visible=false  
	display.text = "Successful login"
	await get_tree().create_timer(1.0).timeout
	if not await search_lobbies():
		display.text = "Trying again"
		await get_tree().create_timer(randf_range(0.1, 3)).timeout
		if not await search_lobbies():
			display.text = "Making game"
			await get_tree().create_timer(0.5).timeout
			create_lobby()

func _on_connect_login_callback(data: Dictionary) -> void:
	if not data.success:
		print("Login failed")
		EOS.print_result(data)
		display.text = "Login failed"
		return
	print_rich("[b]Login successfull[/b]: local_user_id=", data.local_user_id)
	local_user_id = data.local_user_id
	HAuth.product_user_id = local_user_id
	
	
#LOBBY CREATION CODE
#-----------------------------------#
func create_lobby():
	var create_opts := EOS.Lobby.CreateLobbyOptions.new()
	create_opts.bucket_id = "Press_Cross"
	create_opts.max_lobby_members = 2

	var new_lobby = await HLobbies.create_lobby_async(create_opts)
	if new_lobby == null:
		display.text = "Lobby creation failed"
		return
	
	# Start listening for P2P
	var result := peer.create_server("cdfightpoker")
	if result != OK:
		printerr("Failed to create client: " + EOS.result_str(result))
		return
	multiplayer.multiplayer_peer = peer
	display.text = "Waiting for another player"
	$Timer.start()
	is_server = true
	#$CanvasLayer/Temp.visible = false;
	
	local_lobby = new_lobby

#LOBBY JOIN CODE
#---------------------------------------#
func search_lobbies() -> bool:
	player2=true
	$Button3.disabled=true 
	$Button3.visible=false 
	
	# Search for public lobbies
	var lobbies = await HLobbies.search_by_bucket_id_async("Press_Cross")
	if not lobbies:
		printerr("No lobbies found")
		display.text = "No lobbies found"
		return false

	# Join a lobby
	var lobby: HLobby = lobbies[0]
	await HLobbies.join_by_id_async(lobby.lobby_id)
	
	var result := peer.create_client("cdfightpoker", lobby.owner_product_user_id)
	if result != OK:
		printerr("Failed to create client: " + EOS.result_str(result))
		return false
	multiplayer.multiplayer_peer = peer
#	$CanvasLayer/Temp.visible = false
	display.text = "Found lobby"
	return true
	
func lock_lobby():
	if is_server and local_lobby:
		local_lobby.permission_level = EOS.Lobby.LobbyPermissionLevel.InviteOnly
		var success = await local_lobby.update_async()
		if success:
			print("Lobby locked (hidden from search)")
		else:
			print("Failed to lock lobby")
	
#GAME CODE
#-----------------------------------#
func _on_peer_connected(peer_id: int) -> void:
	display.text = "Player %d connected" % peer_id
	print("Player %d connected" % peer_id)
	lock_lobby()
	peer_user_id = peer_id
	$Timer.stop()
	await get_tree().create_timer(1.5).timeout
	start_game()

func _on_peer_disconnected(peer_id: int) -> void:
	display.text = "Player %d disconnected" % peer_id
	print("Player %d disconnected" % peer_id)
	exit_game()

@rpc("any_peer", "call_local", "reliable")
func start_game() -> void:
	$Button2.disabled=true
	$Button2.visible=false 
	print("Game Started\n-------------")
	var game_instance = game_scene.instantiate()
	game_instance.name="Node2D"
	get_tree().root.add_child(game_instance)
	
	#$CanvasLayer.visible = false

func _on_timer_timeout() -> void:
	#$CanvasLayer/Temp.visible = true
	print("ok")

func _on_bot_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/direct_to_bot.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

 # Replace with function body.
