extends Node

var gameData = preload("res://Resources/GameData.tres")
var interface

func _ready():
	print("Loading No Armor Durability...")

func _process(_delta):
	if !gameData.interface:
		interface = null
		return

	if interface == null:
		interface = get_tree().current_scene.get_node_or_null("/root/Map/Core/UI/Interface")
		return

	var equipmentUI = interface.get_node_or_null("Equipment")
	if equipmentUI == null:
		return

	if equipmentUI.get_child_count() < 9:
		return

	var rigSlot = equipmentUI.get_child(7)
	if rigSlot.get_child_count() != 0:
		rigSlot.get_child(0).slotData.condition = 100

	var helmetSlot = equipmentUI.get_child(8)
	if helmetSlot.get_child_count() != 0:
		helmetSlot.get_child(0).slotData.condition = 100