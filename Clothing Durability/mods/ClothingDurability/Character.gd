extends "res://Scripts/Character.gd"

func WeaponDamage(damage: int, penetration: int):
	var hitbox = randi_range(1, 3)

	if hitbox == 1:
		print("Hit: HEAD")
		if interface.HelmetCheck(penetration):
			gameData.impact = true
			PlayArmorAudio()
			return
		interface.ClothingHeadCheck()

	elif hitbox == 2:
		print("Hit: TORSO")
		if interface.PlateCheck(penetration):
			gameData.impact = true
			PlayArmorAudio()
			return
		interface.ClothingTorsoCheck()

	elif hitbox == 3:
		print("Hit: LIMBS")
		interface.ClothingLegsCheck()
		interface.ClothingFeetCheck()
		interface.ClothingHandsCheck()

	var medicalRoll = randi_range(0, 100)

	if hitbox == 1 && medicalRoll < 5 && !gameData.headshot:
		Headshot(true)
	elif hitbox == 2 && medicalRoll < 5 && !gameData.rupture:
		Rupture(true)
	else:
		if medicalRoll > 0 && medicalRoll <= 5 && !gameData.bleeding:
			Bleeding(true)
		elif medicalRoll > 5 && medicalRoll <= 10 && !gameData.fracture:
			Fracture(true)
		else:
			PlayImpactAudio()

	if !gameData.isDead:
		gameData.damage = true
		gameData.health -= randf_range(damage / 4.0, damage / 2.0)