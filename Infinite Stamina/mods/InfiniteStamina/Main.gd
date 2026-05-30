extends Node

var gameData = preload("res://Resources/GameData.tres")

func _ready():
	print("Infinite Stamina loaded!")

func _process(_delta):
	gameData.bodyStamina = 100.0
	gameData.armStamina = 100.0