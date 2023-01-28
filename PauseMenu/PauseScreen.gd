extends Control


func _on_ContinueButton_mouse_entered():
	$Menu/CenterRow/Buttons/ContinueButton/ContinueLabel.get("custom_fonts/font").size = 40


func _on_ContinueButton_mouse_exited():
	$Menu/CenterRow/Buttons/ContinueButton/ContinueLabel.get("custom_fonts/font").size = 36


func _on_NewGameButton_mouse_entered():
	$Menu/CenterRow/Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 40
	print("mouse entered")


func _on_NewGameButton_mouse_exited():
	$Menu/CenterRow/Buttons/NewGameButton/NewGameLabel.get("custom_fonts/font").size = 36
	print("mouse entered")


func _on_ExitButton_mouse_entered():
	$Menu/CenterRow/Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 40
	print("mouse exited")


func _on_ExitButton_mouse_exited():
	$Menu/CenterRow/Buttons/ExitButton/ExitLabel.get("custom_fonts/font").size = 36
	print("mouse exited")


func _on_ContinueButton_pressed():
	pass # Replace with function body.


func _on_NewGameButton_pressed():
	pass # Replace with function body.


func _on_ExitButton_pressed():
	pass # Replace with function body.
