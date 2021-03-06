extends Node2D

onready var infinity_light = $Infinilight
#onready var camera = $Player/ArcLightPosition/Camera2D
onready var player = $Player
onready var camera = player.get_node("ArcLightPosition").get_node("Camera2D")
#change pos of player

signal noise_made
signal level_started

func _init():
	Global.enemy_aggression = 0
	Global.godmode = false
	
func _ready():
#	Input.#set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_custom_mouse_cursor(Global.cursor)
	MenuMusic.on_level_started()
	print("STARTED LEVEL")

func _on_getting_noise():
	emit_signal("noise_made")

func _physics_process(delta):
	if Input.is_action_just_pressed("debug_reset"):
		get_tree().reload_current_scene()
#	if Input.is_action_just_pressed("debug_light"):
#		infinity_light.visible = !infinity_light.visible
#	if Input.is_action_just_pressed("debug_zoom_out"):
#		camera.set_zoom(camera.get_zoom() * 1.25)
#	if Input.is_action_just_pressed("debug_zoom_in"):
#		camera.set_zoom(camera.get_zoom() * 0.8)
#	if Input.is_action_just_pressed("debug_godmode"):
#		Global.godmode = !Global.godmode
##	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
#		if Input.is_action_pressed("debug_teleport"):
#			var mouse_pos = get_viewport().get_mouse_position()
#			player.position = mouse_pos
	
#func _input(event):
#	if event is InputEventMouseMotion:
#		var mouse_pos = event.relative
#		$Player.move_arc_light(mouse_pos)
