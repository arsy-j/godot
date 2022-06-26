tool

extends Button

export(String, FILE) var next_scene_path: = ""

func _on_changescene_button_up() -> void:
	Buttonhit.play()
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)


func _get_configuration_warning() -> String:
	return "next scene path must be set to work" if next_scene_path == "" else""



