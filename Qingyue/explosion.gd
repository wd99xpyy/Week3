extends Sprite
signal PlayerAttack


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tilemap
var cell
var tile_id

# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_parent().get_node("LabLarge")

func animationPlay(theanim):
	$AnimationPlayer.play(theanim)


func _on_bomb_body_entered(body):
	if body.name == "Player":
		emit_signal("PlayerAttack")
		body._on_enemy_PlayerAttack()
	if body.name == "LabLarge":
		cell = tilemap.world_to_map(position)
		tile_id = tilemap.get_cellv(cell)
		print("Labenter")
		print(cell)
		print(position)
		print(tile_id)
		tilemap.set_cellv(cell,-1)
