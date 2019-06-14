extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$mensajeTimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($mensajeTimer, "timeout")
	$ButtonPlay.show()
	$Mensaje.text = "Welcome"
	$Mensaje.show()
func ini():
	$ButtonPlay.show()
	$Mensaje.text = "Welcome"
	$Mensaje.show()
	
func update_score(Puntos):
	$scoreLabel.text = str(Puntos)


func _on_mensajeTimer_timeout():
	$Mensaje.hide()
	pass # Replace with function body.
	

func _on_ButtonPlay_pressed():
	$ButtonPlay.hide()
	emit_signal("iniciar_juego")
	
	
	
	
	
	
	
	
