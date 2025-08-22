extends Node3D

var in_range: bool = false
var player_safe = true

@onready var heat_tick: Timer = $heat_tick

func _process(_delta):
	if in_range and GameStates.item_counter > 0 and Input.is_action_just_pressed("interact"):
		GameStates.item_counter -= 1;
		print('Deposited one Coin');

func _on_area_3d_body_entered(body: Node3D) -> void:
	in_range = true;


func _on_area_3d_body_exited(body: Node3D) -> void:
	in_range = false;


func _on_safe_area_3d_body_entered(body: Node3D) -> void:
	#in theroy we should check if body is tghe player but does not matter in this game
	player_safe = false


func _on_safe_area_3d_body_exited(body: Node3D) -> void:
	player_safe = true


func _on_heat_tick_timeout() -> void:
	if player_safe:
		if GameStates.heat < 100:
			GameStates.heat += 5
	else:
		if GameStates.heat > 0:
			GameStates.heat -= 5
