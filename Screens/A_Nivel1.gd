extends Area2D

func _ready():
	$AnimatedSprite2D.play("PortalOn")

func _on_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene_to_file("res://Screens/nivel_1.tscn")
