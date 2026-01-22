extends Node2D
var costguy = 10
var costpolice = 10
var costdog = 5
var costcone = 15
var costvip = 20
@onready var button1: Button = $Item1/Button
@onready var button2: Button = $Item2/Button
@onready var button3: Button = $Item3/Button
@onready var button4: Button = $Item4/Button
@onready var button5: Button = $Item5/Button

func play_audio():
	$AudioStreamPlayer2D.play()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if get_parent().get_node('.').count >= costpolice:
		get_parent().get_node("AnimatedSprite2D/Area2D").no+=1
		get_parent().get_node('.').count -=costpolice
		costpolice=int(costpolice*1.3)
		button2.text = 'BUY\ncost:'+str(costpolice)
		get_parent().get_node("AnimatedSprite2D3").visible = true
		play_audio()
	pass # Replace with function body.


func _on_button_pressed2 () -> void:
	if get_parent().get_node('.').count >= costcone:
		get_parent().get_node(".").tl*=0.85
		get_parent().get_node('.').count -=costcone
		costcone*=2
		button5.text = 'BUY\ncost:'+str(costcone)
		play_audio()
	pass # Replace with function body.


func _on_button_pressed3() -> void:
	if get_parent().get_node('.').count >= costguy:
		get_parent().get_node(".").auto=true
		get_parent().get_node(".").autot*=0.9
		get_parent().get_node('TheGuyHand').visible = true
		get_parent().get_node('.').count -=costguy
		costguy=(costguy*1.8)
		button1.text = 'BUY\ncost:'+str(costguy)
		play_audio()
	pass # Replace with function body.


func _on_button_pressed4() -> void:
	if get_parent().get_node('.').count >= costdog:
		get_parent().get_node("AnimatedSprite2D/Area2D").sp*=1.05
		get_parent().get_node('.').count -=costdog
		costdog= int(costdog*1.3)
		button3.text = 'BUY\ncost:'+str(costdog)
		play_audio()
	pass # Replace with function body.


func _on_button_pressed5() -> void:
	if get_parent().get_node('.').count >= costvip:
		get_parent().get_node("AnimatedSprite2D/Area2D").pcent*=1.5
		get_parent().get_node('.').count -=costvip
		costvip =int(costvip*1.8)
		button4.text = 'BUY\ncost:'+str(costvip)
		play_audio()
	pass # Replace with function body.
