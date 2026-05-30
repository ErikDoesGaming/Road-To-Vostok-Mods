extends Node

var ductTape = preload("res://Items/Misc/Duct_Tape/Duct_Tape.tres")
var rags = preload("res://Items/Misc/Rags/Rags.tres")

var clothingItems = [
	preload("res://Items/Clothing/Hat_Sauna/Hat_Sauna.tres"),
	preload("res://Items/Clothing/Hat_Mosquito/Hat_Mosquito.tres"),
	preload("res://Items/Clothing/Beanie_Flame/Beanie_Flame.tres"),
	preload("res://Items/Clothing/Cap_M62/Cap_M62.tres"),
	preload("res://Items/Clothing/Jacket_M62/Jacket_M62.tres"),
	preload("res://Items/Clothing/Hoodie_Gray/Hoodie_Gray.tres"),
	preload("res://Items/Clothing/Fleece_Tactical_Brown/Fleece_Tactical_Brown.tres"),
	preload("res://Items/Clothing/Fleece_Tactical_Green/Fleece_Tactical_Green.tres"),
	preload("res://Items/Clothing/Windbreaker_Black/Windbreaker_Black.tres"),
	preload("res://Items/Clothing/Windbreaker_Green/Windbreaker_Green.tres"),
	preload("res://Items/Clothing/Jacket_Winter_Blue/Jacket_Winter_Blue.tres"),
	preload("res://Items/Clothing/Jacket_Winter_Red/Jacket_Winter_Red.tres"),
	preload("res://Items/Clothing/Jacket_Santa/Jacket_Santa.tres"),
	preload("res://Items/Clothing/Jeans_Black/Jeans_Black.tres"),
	preload("res://Items/Clothing/Pants_Hiking/Pants_Hiking.tres"),
	preload("res://Items/Clothing/Boots_Combat/Boots_Combat.tres"),
	preload("res://Items/Clothing/Gloves_Leather/Gloves_Leather.tres"),
	preload("res://Items/Clothing/Gloves_Work/Gloves_Work.tres"),
	preload("res://Items/Clothing/Hoodie_Border_Zone/Hoodie_Border_Zone.tres"),
]

func _ready():
	print("Loading Clothing Durability...")
	for item in clothingItems:
		item.showCondition = true
		item.repairs = true
		if !item.compatible.has(ductTape):
			item.compatible.append(ductTape)
		if !item.compatible.has(rags):
			item.compatible.append(rags)
	overrideScript("res://mods/ClothingDurability/Character.gd")
	overrideScript("res://mods/ClothingDurability/Interface.gd")
	overrideScript("res://mods/ClothingDurability/Item.gd")
	queue_free()

func overrideScript(overrideScriptPath: String):
	var script: Script = load(overrideScriptPath)
	script.reload()
	var parentScript = script.get_base_script()
	script.take_over_path(parentScript.resource_path)