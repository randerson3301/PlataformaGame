extends Area2D

#essa variavel armazenará todos os arquivos do tipo cena 
export(String, FILE, "*.tscn") var scenes

func _on_Passagem_body_entered(body):
	#pega a raiz e muda a cena de acordo cm o valor setado
	get_tree().change_scene(scenes)


