'''
extends Area2D

@onready var Mensaje : Label = $Label

func _ready():
	Mensaje.visible = false

func _on_body_entered(body):
	if body.get_name() == "Jugador":
		print("Mensaje mostrado")
		Mensaje.visible = true
	pass # Replace with function body.
'''
extends Area2D

@onready var mensaje: Label = $Label

func _ready():
	mensaje.visible = false
	# Asegúrate de que esta línea coincida con el nombre de tu nodo jugador si no es "Jugador"


func _on_body_entered(body):
	if body.name == "Jugador":  # Esta es una forma más corta de hacerlo
		print("Mensaje mostrado")
		mensaje.visible = true
