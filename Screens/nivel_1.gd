extends Node2D

var can_open_menu = false
var quest_respondida = false
var can_open_menu2 = false
var quest_respondida2 = false
@onready var quest1: Node2D = $Pregunta1
@onready var bloqueo: StaticBody2D = $Bloqueo1
@onready var quest2: Node2D = $Pregunta2
@onready var bloqueo2: StaticBody2D = $Bloqueo2
@onready var S: Label= $TeclaS
@onready var S2: Label= $TeclaS2

@onready var button2 : Button = $Pregunta1/Button2
@onready var button3 : Button = $Pregunta1/Button3
@onready var button4 : Button = $Pregunta1/Button4
@onready var buttonc1 : Button = $Pregunta2/ButtonC1
@onready var buttonc3 : Button = $Pregunta2/ButtonC3
@onready var buttonc4 : Button = $Pregunta2/ButtonC4

func _ready():
	quest1.visible = false
	quest2.visible = false
	S.visible = false
	S2.visible = false
	
func _on_console_pc_body_entered(body):
	if body.name == "Jugador" and not quest_respondida:  # Solo permite la interacción si la pregunta no ha sido respondida
		can_open_menu = true
		S.visible = true
func _on_console_pc_body_exited(body):
	if body.name == "Jugador":
		can_open_menu = false

func _input(event):
	if event.is_action_pressed("touch") and can_open_menu and not quest_respondida:  # Agrega comprobación de quest_respondida
		quest1.visible = true
		print("Abriendo menú...")
	if event.is_action_pressed("touch") and can_open_menu2 and not quest_respondida2:  # Agrega comprobación de quest_respondida
		quest2.visible = true
		print("Abriendo menú...")
		# Aquí iría el resto de tu lógica para mostrar el menú.

func _on_button_pressed():
	$Bloqueo1/AnimatedSprite2D.play("abierto")
	quest1.visible = false
	bloqueo.queue_free()
	$Pregunta1/Button/AudioCorrect.play()
	quest_respondida = true

#segunda consola
func _on_console_pc_2_body_entered(body):
	if body.name == "Jugador" and not quest_respondida2:  # Solo permite la interacción si la pregunta no ha sido respondida
		can_open_menu2 = true
		S2.visible = true

func _on_console_pc_2_body_exited(body):
	if body.name == "Jugador":
		can_open_menu = false


func _on_button_c_2_pressed():
	$Bloqueo2/AnimatedSprite2D.play("abierto")
	quest2.visible = false
	bloqueo2.queue_free()
	$Pregunta1/Button/AudioCorrect.play()
	quest_respondida2 = true


func _on_button_2_pressed():
	button2.disabled = true
	$AudioIncorrecto.play()
func _on_button_3_pressed():
	button3.disabled = true
	$AudioIncorrecto.play()
func _on_button_4_pressed():
	button4.disabled = true
	$AudioIncorrecto.play()
func _on_button_c_1_pressed():
	buttonc1.disabled = true
	$AudioIncorrecto.play()
func _on_button_c_3_pressed():
	buttonc3.disabled = true
	$AudioIncorrecto.play()
func _on_button_c_4_pressed():
	buttonc4.disabled = true
	$AudioIncorrecto.play()
