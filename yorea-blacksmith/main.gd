extends Node3D

var interface

@onready var hammerNode = $"Hammer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interface = load("res://Player.tscn")
	add_child(interface.instantiate())
	
	hammerNode.playerNode = $"Player"
	hammerNode.hammer = $Hammer/RigidBody3D
	hammerNode.hammerSpot = $"Player/Neck/Camera3D/HammerSpot"
	hammerNode.hammerHandle = $Hammer.get_child(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_cancel"):
		if $Pause.visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$Pause.visible = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Pause.visible = true

func _on_desktop_pressed() -> void:
	$Pause/VR.visible = true
	$Pause/Desktop.visible = false
	remove_child(interface.instantiate())
	
	var Dekstop = load("res://Player.tscn")
	add_child(Dekstop.instantiate())
	
	interface = load("res://Player.tscn")
	add_child(interface.instantiate())
	
	hammerNode.playerNode = $"Player"
	hammerNode.hammerSpot = $"Player/Neck/Camera3D/HammerSpot"

func _on_vr_pressed() -> void:
	$Pause/VR.hide()
	$Pause/Desktop.show()
	remove_child(interface.instantiate())
	
	var VR = load("res://addons/godot-xr-tools/xr/start_xr.tscn")
	add_child(VR.instantiate())
	
	interface = load("res://vrplayer.tscn")
	add_child(interface.instantiate())
	
	hammerNode.playerNode = $"Vrplayer"
	hammerNode.hammerSpot = $"Player/Neck/Camera3D/HammerSpot"