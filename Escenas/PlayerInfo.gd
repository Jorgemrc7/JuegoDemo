extends CanvasLayer

@onready var menu_Options : Node2D = $MenuOptions
@onready var selectl : Node2D = $SelectLevels

func _ready():
	menu_Options.visible = false
	selectl.visible = false
	if get_parent().has_node("jugador"):
		$vida_ProgressBar.value = get_parent().get_node("Jugador").health

func _process(_delta):
	$vida_ProgressBar.value = get_parent().get_node("Jugador").health
	if Input.is_action_just_pressed("ui_accept"):
		_on_boton_pausa_pressed()


func _on_boton_pausa_pressed():
	get_tree().paused = !get_tree().paused  # Esto invierte el estado de pausa
	menu_Options.visible = get_tree().paused



func _on_continuar_pressed():
	
	get_tree().paused = false
	menu_Options.visible = get_tree().paused
	pass # Replace with function body.


func _on_reiniciar_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	pass # Replace with function body.


func _on_cambiar_nivel_pressed():
	selectl.visible = true
	


func _on_salir_del_juego_pressed():
	get_tree().quit()

#menu de cambios de nivel

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
