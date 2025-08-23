extends Control

@onready var credits_view: Control = $CreditsView
@onready var buttons_margin: MarginContainer = $ButtonsMargin

func _ready() -> void:
	credits_view.visible = false
	buttons_margin.visible = true
	


func _on_credits_button_pressed() -> void:
	buttons_margin.visible = false
	credits_view.visible = true


func _on_back_button_pressed() -> void:
	credits_view.visible = false
	buttons_margin.visible = true
