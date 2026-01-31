extends Node2D
const car = preload("res://Scenes/car.tscn")
var nalr
var truck
var tank
var no = 1
@export var speed = 300
@export var pcenttruck = 1
@export var pcenttank = 5
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
			get_tree().get_multiplayer().rpc(get_tree().get_multiplayer().get_peers()[0],get_tree().root.get_node("Node2D/Game/Car Controller"),"carre",[randx,randy,rando,speed])	
			carr.position = Vector2(randx,randy)
			carr.z_index = 50
			truck = carr.pcenttruck
			tank = carr.pcenttank
			add_child(carr)
			if rando<= carr.pcenttruck:
				carr.get_node('AnimatedSprite2D').play("Truck")
				carr.scale.x = 1.2
				carr.scale.y = 1.2
				carr.end = 800
				carr.get_node('Area2D/CollisionShape2DTruck').disabled = false
			elif rando<=carr.pcenttank and rando > carr.pcenttruck:
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
			carr.speed = speed
			carr.walk_start()
@rpc("any_peer","call_remote")
func carre(randx,randy,rando,speed):
	var carr = car.instantiate()	
	carr.position = Vector2(randx,randy)
	carr.z_index = 50
	carr.speed = speed
	add_child(carr)
	if rando<= carr.pcenttruck:
		carr.get_node('AnimatedSprite2D').play("Truck")
		carr.scale.x = 1.2
		carr.scale.y = 1.2
		carr.end = 800
		carr.get_node('Area2D/CollisionShape2DTruck').disabled = false
	elif rando<=carr.pcenttank and rando > carr.pcenttruck:
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
	carr.walk_start()
