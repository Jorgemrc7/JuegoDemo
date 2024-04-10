extends Node2D

var velocidad = Vector2(450, 0)
signal disparo_destruyed

var isFlip = false

func _ready():
	$Timer.start()
	if isFlip:
		velocidad.x *= -1

	
func _process(delta):
	position += velocidad * delta


func _on_hitbox_body_entered(body):
	if body.is_in_group("Nodojugador"):

		return # Esto previene cualquier acción adicional cuando el disparo colisione con el jugador.
	
	velocidad = Vector2.ZERO
	
	$balasprite.play("die-shoot")
	#destroyed_myself()
	
	#print("colicionando")
func _on_balasprite_animation_finished():
	self.queue_free()
	
func _on_timer_timeout():
	emit_signal("disparo_destruyed")

func destroyed_myself():
	self.queue_free()
