extends Area2D

@onready var mensaje: Label = $Label

func _ready():
	mensaje.visible = false
	# Asegúrate de que esta línea coincida con el nombre de tu nodo jugador si no es "Jugador"

func _on_body_entered(body):
	if body.name == "Jugador":  # Esta es una forma más corta de hacerlo
		print("Mensaje mostrado")
		mensaje.visible = true
