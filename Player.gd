extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGTH = -570
var motion = Vector2()
var life_qtde = 3

func _physics_process(delta):
	
	motion.y += GRAVITY
	#se a tecla pressionada for a seta direita
	if Input.is_action_pressed("ui_right"):
		#cm a tecla pressionada o obj vai ir pra 100 no eixo x
		motion.x = SPEED
		$Sprite.play("run")
		#não inverte a sprite
		$Sprite.flip_h = false
	#se a tecla pressionada for a seta esquerda
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("run")
		#sentido da imagem será invertido
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGTH
	else:
		$Sprite.play("jump")

	#faz a movimentação acontecer de fato inconstante
	motion =  move_and_slide(motion, UP)	

#ira executar quando o contato for nos pés
func _on_feet_body_entered(body):
	body.dano()
	motion.y = JUMP_HEIGTH

#ira executar quando o contato for no corpo de dano
func _on_dano_body_entered(body):
	life_qtde -= 1
	print(life_qtde)
	if life_qtde == 0:
		get_tree().change_scene("res://menu.tscn")
