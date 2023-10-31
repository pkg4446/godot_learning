extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func  _ready():
	$SelfDesturctTimer.start()

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
	#if body.has_method("hit"):
		body.hit()
	queue_free()


func _on_self_desturct_timer_timeout():
	queue_free()
