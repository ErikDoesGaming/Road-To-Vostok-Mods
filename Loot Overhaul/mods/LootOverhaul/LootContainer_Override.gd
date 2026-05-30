extends "res://Scripts/LootContainer.gd"

func FillBuckets():
    super.FillBuckets()
    var medicals = commonBucket.filter(func(item): return item.resource_path.contains("Items/Medical/"))
    for item in medicals:
        commonBucket.append(item)

func GenerateLoot():
    rarityRoll = randi_range(1, 100)
    if joker: rarityRoll = 100

    if rarityRoll == 1:
        if randi_range(1, 10) != 1: return
        if legendaryBucket.size() != 0:
            for pick in 1:
                CreateLoot(legendaryBucket.pick_random())

    elif rarityRoll <= 5:
        if rareBucket.size() != 0:
            for pick in randi_range(1, 2):
                CreateLoot(rareBucket.pick_random())

    elif rarityRoll <= 30:
        if rareBucket.size() != 0:
            for pick in randi_range(0, 1):
                CreateLoot(rareBucket.pick_random())
        if commonBucket.size() != 0:
            for pick in randi_range(1, 3):
                CreateLoot(commonBucket.pick_random())

    elif rarityRoll <= 70:
        if commonBucket.size() != 0:
            for pick in randi_range(1, 4):
                CreateLoot(commonBucket.pick_random())

    elif rarityRoll == 100:
        if rareBucket.size() != 0:
            for pick in randi_range(1, 2):
                CreateLoot(rareBucket.pick_random())
        if commonBucket.size() != 0:
            for pick in randi_range(4, 10):
                CreateLoot(commonBucket.pick_random())