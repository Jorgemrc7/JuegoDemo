extends Area2D

func _ready():
	$AnimatedSprite2D.play("portal")

func _on_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene_to_file("res://Screens/final_screen.tscn")
	pass # Replace with function body.
