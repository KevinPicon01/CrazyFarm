extends RigidBody2D
 
export (float) var velocidad_min
export (float) var velocidad_max
var tipo_roca = ["grande", "chiquito"]

func _ready():
	$AnimatedSprite.animation = tipo_roca[randi() %tipo_roca.size()]

func _on_Visibilidad_screen_exited():
	queue_free()
	pass # Replace with function body.
	
	
	
	
	
	
	
	
