extends Node2D

func _ready() -> void:
	connect("resized", self, "call_wrap_around")

func call_wrap_around():
	get_tree().call_group("wraparound", "recalculate_wrap_area")
	
