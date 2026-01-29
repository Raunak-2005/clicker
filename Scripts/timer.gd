extends Node2D
var t
var tl
var n
var n1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	t=Timer.new()
	
	add_child(t)
	pass # Replace with function body.
func startcountdown():
	get_parent().get_node("ColorRect").visible=true
	t.start(get_tree().root.get_node("Node2D").tl)
	await(t.timeout)
	get_parent().get_node("ColorRect").visible=false
	t.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	n=str("%0.0f" % t.time_left)
	
	if n!=n1:
		if n!="0":
			get_parent().get_node("ColorRect").get_node("Label2").text=n
		print(n)
	n1=n
	pass
