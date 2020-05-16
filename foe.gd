extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
const SPEED = 0.3

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walk")
	#'.' = node principal(foe)
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	
func _process(delta):
	if (posicao_inicial <= posicao_final and flip) :
		$".".position.x += SPEED
		$AnimatedSprite.flip_h = false
		if($".".position.x >= posicao_final):
			flip = false
	
	if($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= SPEED
		$AnimatedSprite.flip_h = true
		if($".".position.x <= posicao_inicial):
			flip = true

func dano():
	#pega o node anim e executa a animação die
	get_node("anim").play("die")


func die():
	#faz o corpo sumir
	$".".queue_free()

