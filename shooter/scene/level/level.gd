extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Logo").rotation_degrees = 90

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Logo").rotation_degrees += 60 * delta
	if $Logo.position.x > 1100:
		$Logo.pos.x = 0

func test_function():
	print("테스트 함수")
