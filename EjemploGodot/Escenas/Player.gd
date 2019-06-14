extends Area2D

export (int) var velocidad
var movimiento = Vector2() 
signal golpe

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= 1
	if Input.is_action_pressed("ui_up"):
		movimiento.y -= 1
	if Input.is_action_pressed("ui_down"):
		movimiento.y += 1
	#Verificar si se esta moviendo muy rapido
	if movimiento.length() > 0 :
		movimiento = movimiento.normalized()* velocidad
	
	position += movimiento * delta
	position.x = clamp(position.x, 20, 620)
	position.y = clamp(position.y, 20, 680)
	
	if movimiento.x > 0:
		$AnimatedSprite.animation = "Derecha"
	elif movimiento.x < 0:
		$AnimatedSprite.animation = "Izquierda"
	elif movimiento.y > 0:
		$AnimatedSprite.animation = "Abajo"
	else:
		$AnimatedSprite.animation = "Frente"
	
	

func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

func inicio():
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
	
	
	
	
	
	
