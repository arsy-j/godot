extends Control

onready var label: Label = get_node("Label")


func _ready() -> void:
	label.text = label.text %[Playerdata.score, Playerdata.death]

