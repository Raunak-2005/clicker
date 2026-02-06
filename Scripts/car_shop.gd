extends Node2D

@export var costgirl = 10
var costparrot = 10
var coststick = 5
var costtruck = 15
var costoil = 20
@onready var button1: Button = $Item1/Button
@onready var button2: Button = $Item2/Button
@onready var button3: Button = $Item3/Button
@onready var button4: Button = $Item4/Button
@onready var button5: Button = $Item5/Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play_audio():
	$AudioStreamPlayer2D.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed_girl() -> void:
	
	pass # Replace with function body.


func _on_button_pressed_parrot() -> void:
	if get_parent().get_parent().get_node('.').countcr >= costparrot:
		get_parent().get_node("Car Controller").no+=1
		get_parent().get_parent().get_node('.').countcr -=costparrot
		costparrot=int(costparrot*1.3)
		button2.text = 'BUY\ncost '+str(costparrot)
		get_parent().multiplierparr+=1
		get_parent().pet=1
		get_tree().get_multiplayer().rpc(get_tree().get_multiplayer().get_peers()[0],get_tree().root.get_node("Node2D/Game/CarShop"),"setpet")	
		play_audio()
	pass # Replace with function body.


func _on_button_pressed_stick() -> void:
	if get_parent().get_parent().get_node('.').countcr >= coststick:
		get_parent().get_node("Car Controller").speed*=1.05
		get_parent().get_parent().get_node('.').countcr -=coststick
		coststick= int(coststick*1.3)
		button3.text = 'BUY\ncost '+str(coststick)
		play_audio()
	pass # Replace with function body.


func _on_button_pressed_truck() -> void:
	if get_parent().get_parent().get_node('.').countcr >= costtruck:
		get_parent().get_node("Car Controller").pcenttruck*=1.5
		get_parent().get_node("Car Controller").pcenttank*=1.5
		get_parent().get_parent().get_node('.').countcr -=costtruck
		costtruck =int(costtruck*1.8)
		button4.text = 'BUY\ncost '+str(costtruck)
		play_audio()
	pass # Replace with function body.


func _on_button_pressed_oil() -> void:
	if get_parent().get_parent().get_node('.').countcr >= costoil:
		get_parent().get_node("Car Controller").pcenttrack*=1.5
		get_parent().get_parent().get_node('.').countcr -=costoil
		costoil =int(costoil*1.8)
		button5.text = 'BUY\ncost '+str(costoil)
		play_audio()
	pass # Replace with function body.
@rpc("any_peer","call_local") 
func setpet():
	get_parent().pet=1
