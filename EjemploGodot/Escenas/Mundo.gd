extends Node

export (PackedScene) var roca
var Score = 0

func _ready():
	
	randomize()
	
func nuevo_juego():
	
	Score = 0
	$inicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	$Player.show()


func game_over():
	$scoreTimer.stop()
	$rocaTimer.stop()
	$Interfaz.game_over()
func ini():
	$scoreTimer.stop()
	$rocaTimer.stop()
	$Interfaz.ini()

func _on_inicioTimer_timeout():
	
	$scoreTimer.start()
	$rocaTimer.start()
	pass # Replace with function body.


func _on_scoreTimer_timeout():
	
	Score = Score+1
	$Interfaz.update_score(Score)
	pass # Replace with function body.

var c = true
func _on_rocaTimer_timeout():
	if c:
		$Interfaz._on_ButtonPlay_pressed()
		c=false
	$camino/rocaPosicion.offset = randi()
	$camino/RocaPos.offset = randi()
	var R = roca.instance()
	var r = roca.instance()
	add_child(R)
	add_child(r)
	
	var s = $camino/rocaPosicion.rotation
	var d = $camino/RocaPos.rotation 
	
	r.position = $camino/rocaPosicion.position
	R.position = $camino/RocaPos.position
	d += rand_range(0,2*PI)
	s += rand_range(0,2*PI)
	R.rotation = d
	r.rotation = s
	R.set_linear_velocity(Vector2(rand_range(150,250),0).rotated(d))
	r.set_linear_velocity(Vector2(rand_range(150,250),0).rotated(s))
	
