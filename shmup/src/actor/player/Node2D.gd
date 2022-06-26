extends Node2D

var laser_scene := load("res://src/object/laser_ray.tscn")

func shoot() :
	var laser = laser_scene.instance()
	laser.global_position = self.global_position
	get_node("/root/game scene").add_child(laser)
