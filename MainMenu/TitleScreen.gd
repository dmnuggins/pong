extends Control

# Hover animations for menu buttons
func _on_NewGameButton_mouse_entered():
	$Menu/CenterRow/Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 38
	print("mouse entered")


func _on_NewGameButton_mouse_exited():
	$Menu/CenterRow/Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 32
	print("mouse entered")


func _on_ExitButton_mouse_entered():
	$Menu/CenterRow/Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 38
	print("mouse exited")


func _on_ExitButton_mouse_exited():
	$Menu/CenterRow/Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 32
	print("mouse exited")


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
