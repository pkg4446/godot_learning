extends Area2D

signal player_enterd
signal player_exited

func _on_body_entered(body):
	player_enterd.emit()

func _on_body_exited(body):
	player_exited.emit()
