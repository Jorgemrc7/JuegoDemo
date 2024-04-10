extends CharacterBody2D


var SPEED = 270.0
var JUMP_VELOCITY = -550.0
var health = 100
var leaved_floor: bool = false
var had_jump: bool = false
var allow_animation: bool = false
var direction
var gotDisparo: bool = false
var max_jump: int = 1
var count_jumps: int = 0
var double_jump: bool = false
const DASH_SPEED= 1000
var dashing = false
var can_dash = true
var isDead = false
# Variable para controlar la distancia recorrida durante el dash.
@export var disparo:PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$animaciones.play("appear")


func _physics_process(delta):
	
	
	# Add the gravity.
	if is_on_floor():
		leaved_floor = false
		had_jump = false
		count_jumps = 0

	if not is_on_floor():
		if not leaved_floor:
			$coyote_timer.start()
			leaved_floor = true
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Saltar") and (is_on_floor() or right_to_jump()):
		$audio_jump.play()
		if count_jumps == 0:
			
			double_jump = true
			#$audio_doblejump.play()
		else:
			$audio_jump.play()
		count_jumps += 1
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$audio_dash.play()
		$dash_again.start()




	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	if Input.is_action_pressed("Izq"):
		direction -= 1
	if Input.is_action_pressed("Der"):
		direction += 1

	if direction != 0:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED

	move_and_slide()
	decide_animation()

func _input(event):
	if event.is_action_pressed("shoot"): #tecla C
		if gotDisparo: return
		gotDisparo= true
		allow_animation = false
		$animaciones.play("shoot_normal")
		$audio_disparo.play()
		var newDisparo = disparo.instantiate()
		#newDisparo.position = self.position
		newDisparo.position = self.position + Vector2(0, -15)
		newDisparo.isFlip = $animaciones.flip_h
		newDisparo.connect("disparo_destruyed", _on_disparo_destroyed)
		add_sibling(newDisparo)
		if velocity.x == 0:
			gotDisparo= false
		if velocity.x == 1:
			gotDisparo= false
	
func _on_disparo_destroyed():
	gotDisparo = false


func decide_animation():
	
	if not allow_animation: return
	if direction < 0:
		$animaciones.flip_h =true
	elif direction >0:
		$animaciones.flip_h= false
	
	if double_jump:
		double_jump = false
		$animaciones.play("jump_up")
	# eje X
	if velocity.x == 0:
		$animaciones.play("idle")  # quieto
	elif velocity.x < 0:
 # isquierda
		$animaciones.play("run")
	elif velocity.x > 0:
# derecha
		$animaciones.play("run")

	# eje Y
	if velocity.y > 0:
		$animaciones.play("jump_down")
	elif velocity.y < 0:
		$animaciones.play("jump_up")
		
		
func right_to_jump():
	if had_jump:
		if count_jumps < max_jump:
			return true
		else:
			return false
	if is_on_floor():
		had_jump = true
		return true
	elif not $coyote_timer.is_stopped():
		had_jump = true
		return true

func _on_coyote_timer_timeout():
	leaved_floor = false

	# Replace with function body.
func _on_animaciones_animation_finished():
	allow_animation = true

@warning_ignore("unused_parameter")
func _on_damage_detection_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	allow_animation = false
	$animaciones.play("daño")
	$audiodamage.play()
	velocity.y = -420
	health -= 10
	# Revisar si el área pertenece al grupo "disparos" y el enemigo no está muerto
	if health <= 0:
			morir()
	#$audiodamage
	#print(health)
	pass # Replace with function body.
	

func morir():
	isDead = true  # Marcar el enemigo como muerto
	
	velocity.x = 0 
# Detener movimiento
	$animaciones.play("die-invisible")
	$die_time.start()

func _on_dash_timer_timeout():
	#$animaciones.play("DashXD")
	dashing = false

func _on_dash_again_timeout():
	can_dash = true

func _on_die_time_timeout():
	get_tree().reload_current_scene()  # Reiniciar la escena cuando el temporizador termine
	pass # Replace with function body.
