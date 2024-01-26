extends Timer

var coin = preload("res://Scenes/Coin.tscn")

onready var body2D = get_parent()


func _on_Timer_timeout():
	var the_coin = coin.instance()
	the_coin.position = Vector2(body2D.position.x,body2D.position.y - 20)
	add_child(the_coin)
