extends Node2D
const car = preload("res://Scenes/car.tscn")
var nalr
var truck
var tank
var no = 1
@export var speed = 300
@export var pcenttruck = 1
@export var pcenttank = 5
@export var pcenttrack= 0.05
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
			var rando = randf_range(0,1)*100
			var rng = RandomNumberGenerator.new().randf_range(0,1)
			carr.position = Vector2(randx,randy)
			carr.z_index = 69
			truck = get_tree().root.get_node("Node2D/Game/Car Controller").pcenttruck
			tank =get_tree().root.get_node("Node2D/Game/Car Controller").pcenttank
			pcenttrack=get_tree().root.get_node("Node2D/Game/Car Controller").pcenttrack
			get_tree().get_multiplayer().rpc(get_tree().get_multiplayer().get_peers()[0],get_tree().root.get_node("Node2D/Game/Car Controller"),"carre",[randx,randy,rando,speed,truck,tank,pcenttrack,rng])	
			if rando<= pcenttank:
				carr.scalel=2
			
				
			add_child(carr)
			if rando<= pcenttruck:
				carr.get_node('AnimatedSprite2D').play("Truck")
				carr.scale.x = 1.2
				carr.scale.y = 1.2
				carr.end = 800
				carr.get_node('Area2D/CollisionShape2DTruck').disabled = false 
			elif rando<=pcenttank and rando > pcenttruck:
				carr.get_node('AnimatedSprite2D').play("Tank")
				carr.scale.x = 1.8
				carr.scale.y = 1.8
				carr.end = 650
				carr.get_node('Area2D/CollisionShape2DTank').disabled = false
				carr.scalel=2
			else:
				carr.get_node('AnimatedSprite2D').play("Car")
				carr.scale.x = 1.2
				carr.scale.y = 1.2
				carr.end = 650
				carr.get_node('Area2D/CollisionShape2DCar').disabled = false
			if rng<= pcenttrack:
				carr.oil=true
			carr.speed = speed
			carr.walk_start()
@rpc("any_peer","call_remote")
func carre(randx,randy,rando,speed,pcenttruck,pcenttank,pcenttrack,rng):
	var carr = car.instantiate()	
	carr.position = Vector2(randx,randy)
	carr.z_index = 69
	carr.speed = speed
	if rando<= pcenttank:
		carr.scalel=2
	add_child(carr)
	if rando<= pcenttruck:
		carr.get_node('AnimatedSprite2D').play("Truck")
		carr.scale.x = 1.2
		carr.scale.y = 1.2
		carr.end = 800
		carr.get_node('Area2D/CollisionShape2DTruck').disabled = false
	elif rando<=pcenttank and rando > pcenttruck:
		carr.get_node('AnimatedSprite2D').play("Tank")
		carr.scale.x = 1.8
		carr.scale.y = 1.8
		carr.end = 650
		carr.get_node('Area2D/CollisionShape2DTank').disabled = false
	else:
		carr.get_node('AnimatedSprite2D').play("Car")
		carr.scale.x = 1.2
		carr.scale.y = 1.2
		carr.end = 650
		carr.get_node('Area2D/CollisionShape2DCar').disabled = false
	if rng<= pcenttrack:
		carr.oil=true
	carr.walk_start()
