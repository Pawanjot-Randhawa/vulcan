extends Node3D

var in_range: bool = false
var player_safe = true
var addedScrews: int = 0;

@onready var heat_tick: Timer = $heat_tick

func _process(_delta):
	if in_range and GameStates.item_counter > 0 and Input.is_action_just_pressed("interact"):
		GameStates.item_counter -= 1;
		addedScrews += 1;
		print('Deposited one Coin');
	if addedScrews >= 3:
		get_tree().change_scene_to_file("res://scenes/endGame.tscn");
		GameStates.isDone = true;


func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body.has_method("player")):
		in_range = true;


func _on_area_3d_body_exited(body: Node3D) -> void:
	if (body.has_method("player")):
		in_range = false;


func _on_safe_area_3d_body_entered(body: Node3D) -> void:
	#in theroy we should check if body is tghe player but does not matter in this game
	if(body.has_method("player")):
		print('is player');
	player_safe = false


func _on_safe_area_3d_body_exited(_body: Node3D) -> void:
	player_safe = true


func _on_heat_tick_timeout() -> void:
	if player_safe:
		if GameStates.heat < 100:
			GameStates.heat += 5
	else:
		if GameStates.heat <= 20:
			GameStates.heat = 0
		elif GameStates.heat > 0:
			GameStates.heat -= 20
