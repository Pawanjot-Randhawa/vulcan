extends Node3D

var in_range: bool = false

func _process(_delta):
	if in_range and GameStates.counter > 0 and Input.is_action_just_pressed("interact"):
		GameStates.counter -= 1;
		print('Deposited one Coin');
		

func _on_area_3d_body_entered(body: Node3D) -> void:
	in_range = true;


func _on_area_3d_body_exited(body: Node3D) -> void:
	in_range = false;
