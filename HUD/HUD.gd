extends CanvasLayer

func _on_NewGameButton_mouse_entered():
	$Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 38


func _on_NewGameButton_mouse_exited():
	$Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 32


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Main.tscn")
	get_tree().reload_current_scene()


func _on_ExitButton_mouse_entered():
	$Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 38
	print("mouse exited")


func _on_ExitButton_mouse_exited():
	$Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 32
	print("mouse exited")


func _on_ExitButton_pressed():
	get_tree().quit()
