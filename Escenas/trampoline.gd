extends Node2D


func _on_activation_area_body_entered(body):
	$audio_trampoline.play()
	$animaciones_trampoline.play("launch")
	body.velocity.y = -800
