extends Area2D

func _ready():
	$AnimatedSprite2D.play("caida-fuego")

func _on_body_entered(body):
	if body.get_name() == "Jugador":
		print("cambio de nivel")
		get_tree().reload_current_scene()
