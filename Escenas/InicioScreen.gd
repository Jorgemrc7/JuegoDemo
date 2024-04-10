extends CanvasLayer

@onready var menuInicio : Node2D = $MenuInicio
@onready var selectl : Node2D = $SelectLevelsMenu

func _ready():
	menuInicio.visible = false
	selectl.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_comenzar_pressed()
	
func _on_comenzar_pressed():
	menuInicio.visible = true
	
func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://Screens/Screen_0.tscn")


func _on_elegir_nivel_pressed():
	selectl.visible= true


func _on_personalización_pressed():
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()

#.-----------------------------------------

func _on_regresar_pressed():
	selectl.visible= false

func _on_bnivel_1_pressed():
	get_tree().change_scene_to_file("res://Screens/nivel_1.tscn")
	get_tree().paused = false


func _on_bnivel_2_pressed():
	get_tree().change_scene_to_file("res://Screens/nivel_2.tscn")
	get_tree().paused = false


func _on_bnivel_3_pressed():
	get_tree().change_scene_to_file("res://Screens/Screen_0.tscn")
	get_tree().paused = false


func _on_bnivel_4_pressed():
	get_tree().change_scene_to_file("res://Screens/nivel_4.tscn")
	get_tree().paused = false

func _on_bnivel_5_pressed():
	get_tree().change_scene_to_file("res://Screens/nivel_5.tscn")
	get_tree().paused = false
