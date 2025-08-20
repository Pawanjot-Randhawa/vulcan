extends CharacterBody3D
@export var speed = 30;

var player;
var player_in_chat_zone = false;

func on_dialogue_ended():
	if player:
		player.has_focus = true;
		

func _process(delta):
	if player_in_chat_zone:
		if Input.is_action_just_pressed("interact"):
			print("chatting w npc")
			var dialogue = DialogueManager.show_example_dialogue_balloon(load("res://dialogue/instructions.dialogue"), "start");
			dialogue.connect("dialogue_ended", on_dialogue_ended);
			if player:
				player.has_focus = false;


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("player"):
		player = body;
		player_in_chat_zone = true;


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.has_method("player"):
		player_in_chat_zone = false;
