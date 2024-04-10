extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED = 150
const RAY_FLOOR_POSITION_X = 20
const RAY_WALL_TARGET_POSITION_X = 20
var direction
var vidaEnemigo = 100
var isDead = false 
func _ready():
	
	velocity.x = SPEED
	$raycas_floor_detection.position.x = RAY_FLOOR_POSITION_X
	$raycas_wall_detection.target_position.x = RAY_WALL_TARGET_POSITION_X
	
func _physics_process(delta):
	# Add the gravity.
	if isDead:  # Si el enemigo está muerto, no hagas más procesamiento
		return
	if not is_on_floor():
		velocity.y += gravity * delta

	if not $raycas_floor_detection.is_colliding() || $raycas_wall_detection.is_colliding():
		velocity.x *= -1
		$raycas_floor_detection.position.x *= -1
		$raycas_wall_detection.target_position.x *= -1
		# Gira el sprite en el eje X.
		$AnimatedSprite2D.scale.x *= -1

	move_and_slide()

func _on_damage_zone_area_entered(area):
	if area.is_in_group("disparos") and not isDead:  # Revisar si el área pertenece al grupo "disparos" y el enemigo no está muerto
		vidaEnemigo -= 10
		print(vidaEnemigo)
		if vidaEnemigo <= 0:
			morir()
			#area.set_deferred("disabled", true)

func morir():
	isDead = true  # Marcar el enemigo como muerto
	velocity.x = 0  # Detener movimiento
	$audio_die.play()
	$AnimatedSprite2D.play("die-slime")
	
func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
