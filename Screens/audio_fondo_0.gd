extends AudioStreamPlayer

#func _on_finished():
#	self.play()
func _ready():
	# Establece la propiedad loop en true para que el audio se reproduzca en loop
	# Reproduce el audio
	self.play()
