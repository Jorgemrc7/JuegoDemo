extends Node2D

var can_open_menu = false
var quest_respondida = false
@onready var quest1: Node2D = $Pregunta1
@onready var bloqueo: StaticBody2D = $Bloqueo1
@onready var S: Label= $TeclaS
@onready var button2 : Button = $Pregunta1/Button2
@onready var button3 : Button = $Pregunta1/Button3
@onready var button4 : Button = $Pregunta1/Button4
func _ready():
	quest1.visible = false
	S.visible = false

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
		#print("Abriendo menú...")

func _on_button_pressed():
	$Bloqueo1/AnimatedSprite2D.play("abierto")
	
	quest1.visible = false
	bloqueo.queue_free()
	$Pregunta1/Button/AudioCorrect.play()
	quest_respondida = true

func _on_animated_sprite_2d_animation_finished():
	_on_button_pressed()
func _on_button_2_pressed():
	$Pregunta1/AudioIncorrecto.play()
	button2.disabled = true
func _on_button_3_pressed():
	$Pregunta1/AudioIncorrecto.play()
	button3.disabled = true
func _on_button_4_pressed():
	$Pregunta1/AudioIncorrecto.play()
	button4.disabled = true
