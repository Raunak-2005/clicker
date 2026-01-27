extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_W):
		position.y-=2
	if Input.is_key_pressed(KEY_S):
		position.y+=2
	position.y=clamp(position.y,-2,138)
	pass
