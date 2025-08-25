extends Node
@onready var player: Node3D = $CharacterBody3D;

func _process(_delta: float):
	if player.position.y < -10 or GameStates.heat > 99:
		GameStates.heat = 0;
		player.position = Vector3(1,1,1);
