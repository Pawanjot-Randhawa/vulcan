extends CharacterBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if(body.has_method("player")):
		GameStates.counter += 1;
		queue_free();
