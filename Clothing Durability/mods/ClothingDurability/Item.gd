extends "res://Scripts/Item.gd"

func UpdateDetails():
    super.UpdateDetails()
    
    if slotData.itemData.type == "Clothing":
        condition.text = str(int(round(slotData.condition))) + "%"
        condition.show()
        
        if condition.visible:
            if slotData.condition > 50: condition.modulate = Color.GREEN
            elif slotData.condition > 25: condition.modulate = Color.YELLOW
            else: condition.modulate = Color.RED