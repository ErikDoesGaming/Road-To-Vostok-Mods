extends "res://Scripts/Interface.gd"

var canCombineRepair = false

func DestroyClothingSlot(slot) -> void:
	var slotItem = slot.get_child(0)
	slotItem.State("Free")
	slotItem.equipSlot = null
	slotItem.equipped = false
	slot.hint.show()
	slotItem.queue_free()
	rigManager.UpdateRig(false)

func CombineCheck(targetItem, combineItem):
	for element in targetItem.slotData.itemData.compatible:
		if element.file == combineItem.slotData.itemData.file:
			if element.name == "Duct Tape" || element.name == "Rags":
				if targetItem.slotData.itemData.type == "Clothing":
					if targetItem.slotData.condition < 100.0:
						return 6
	return super.CombineCheck(targetItem, combineItem)

func Hover():
	super.Hover()
	var compatibility = -1
	if itemDragged && hoverItem:
		compatibility = CombineCheck(hoverItem, itemDragged)
	elif itemDragged && hoverSlot && hoverSlot.get_child_count() != 0:
		compatibility = CombineCheck(hoverSlot.get_child(0), itemDragged)
	if compatibility == 6:
		canCombineCharge = false
		canCombineRepair = true
	else:
		canCombineRepair = false

func Release():
	if canCombineRepair:
		var combineItem = itemDragged
		var combineTarget = hoverItem if hoverItem else hoverSlot.get_child(0)
		Charge(combineTarget, combineItem)
		PlayClick()
		Reset()
	else:
		super.Release()

func Highlight():
	super.Highlight()
	if canCombineRepair:
		highlight.get_child(2).hide()
		highlight.color = valid
		highlight.size = hoverSlot.size if hoverSlot else hoverItem.size
		highlight.global_position = hoverSlot.global_position if hoverSlot else hoverItem.global_position
		highlight.show()

func ClothingHeadCheck() -> void:
	var headSlot = equipmentUI.get_child(9)
	if headSlot.get_child_count() != 0:
		var slotData = headSlot.get_child(0).slotData
		if slotData.condition > 0:
			slotData.condition -= randi_range(5, 10)
			if slotData.condition <= 0:
				slotData.condition = 0
				DestroyClothingSlot(headSlot)
				return
			headSlot.get_child(0).UpdateDetails()

func ClothingTorsoCheck() -> void:
	var torsoSlot = equipmentUI.get_child(10)
	if torsoSlot.get_child_count() != 0:
		var slotData = torsoSlot.get_child(0).slotData
		if slotData.condition > 0:
			slotData.condition -= randi_range(5, 10)
			if slotData.condition <= 0:
				slotData.condition = 0
				DestroyClothingSlot(torsoSlot)
				return
			torsoSlot.get_child(0).UpdateDetails()

func ClothingLegsCheck() -> void:
	var legsSlot = equipmentUI.get_child(11)
	if legsSlot.get_child_count() != 0:
		var slotData = legsSlot.get_child(0).slotData
		if slotData.condition > 0:
			slotData.condition -= randi_range(5, 10)
			if slotData.condition <= 0:
				slotData.condition = 0
				DestroyClothingSlot(legsSlot)
				return
			legsSlot.get_child(0).UpdateDetails()

func ClothingFeetCheck() -> void:
	var feetSlot = equipmentUI.get_child(13)
	if feetSlot.get_child_count() != 0:
		var slotData = feetSlot.get_child(0).slotData
		if slotData.condition > 0:
			slotData.condition -= randi_range(5, 10)
			if slotData.condition <= 0:
				slotData.condition = 0
				DestroyClothingSlot(feetSlot)
				return
			feetSlot.get_child(0).UpdateDetails()

func ClothingHandsCheck() -> void:
	var handsSlot = equipmentUI.get_child(14)
	if handsSlot.get_child_count() != 0:
		var slotData = handsSlot.get_child(0).slotData
		if slotData.condition > 0:
			slotData.condition -= randi_range(5, 10)
			if slotData.condition <= 0:
				slotData.condition = 0
				DestroyClothingSlot(handsSlot)
				return
			handsSlot.get_child(0).UpdateDetails()