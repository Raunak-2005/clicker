extends Node2D
@onready var men: Node2D = $Men
@onready var men_2: Node2D = $Men2
@onready var men_3: Node2D = $Men3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(men_2):men_2.get_node('AnimatedSprite2D').animation = 'walk'
	if is_instance_valid(men):men.get_node('AnimatedSprite2D').animation = 'bodyguard_walk'
	
	if is_instance_valid(men_3):men_3.get_node('AnimatedSprite2D').animation = 'bodyguard_walk'
	pass
