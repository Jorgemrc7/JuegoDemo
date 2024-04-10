extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED = 200
const RAY_FLOOR_POSITION_X = 20
const RAY_WALL_TARGET_POSITION_X = 20

func _ready():

	velocity.x = SPEED
	$raycas_floor_detection.position.x = RAY_FLOOR_POSITION_X
	$raycas_wall_detection.target_position.x = RAY_WALL_TARGET_POSITION_X
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if not $raycas_floor_detection.is_colliding() || $raycas_wall_detection.is_colliding():
		velocity.x *= -1
		$raycas_floor_detection.position.x *= -1
		$raycas_wall_detection.target_position.x *= -1

	move_and_slide()


func _on_damage_zone_area_entered(area):
	if area.is_in_group("disparos"):
		velocity.x = 0
		$audio_expl.play()
		$AnimatedSprite2D.play("die")

func _on_animated_sprite_2d_animation_finished():
	self.queue_free()
