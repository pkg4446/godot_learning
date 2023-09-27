extends Sprite2D

var pos: Vector2    = Vector2.ZERO
const speed: int    = 100
var test_scale: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(100,200)
	position = pos
	
	test_scale = 2
	scale = Vector2(test_scale, test_scale)
	print(get_node("..").test_array)
	get_node("..").test_function()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):			
	pos.x += speed * delta;
	position = pos
