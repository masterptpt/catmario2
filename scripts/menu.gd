extends Control

var waiting_for_input := false

func _ready() -> void:
	$ColorRect/AnimationPlayer.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "flash":
		print("Animação terminou:", anim_name)
		start()
		waiting_for_input = true
		
func _unhandled_input(event: InputEvent) -> void:
	if waiting_for_input:
		if (event is InputEventKey and event.pressed) or\
		   (event is InputEventMouseButton and event.pressed and event.button_index in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]):
			var scene : PackedScene = load("res://scenes/world_1.tscn")
			get_tree().change_scene_to_packed(scene)
			waiting_for_input = false

func start():
	print("Iniciando start()")
	$ColorRect/START/AnimationPlayer.play("blip")
