extends Node

@onready var camera_pivot: Node3D = $CameraPivot
const ROOT = preload("res://scenes/root.tscn")

var time = 0.0
var amplitude = 1.0 #osicaltion inensity
var frequncy = 1.0 #osicalltion frequncy
var init_postion

func _ready() -> void:
	init_postion = camera_pivot.position.z


func _process(delta: float) -> void:
	time += delta * frequncy
	var offset = sin(time) *amplitude
	camera_pivot.position.z = init_postion + offset


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(ROOT)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
