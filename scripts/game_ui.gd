extends Control


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var h_box_container: HBoxContainer = $HBoxContainer

func _ready() -> void:
	progress_bar.value = GameStates.heat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	progress_bar.value = GameStates.heat
	if progress_bar.value < 1:
		progress_bar.visible = false
	else:
		progress_bar.visible = true
	for i in range(3):
		h_box_container.get_child(i).visible = false
	for i in range(GameStates.item_counter):
		h_box_container.get_child(i).visible = true
