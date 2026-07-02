module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.WeaponCustomizeButtons)

	if Engine.BHICADFIHA() then
		if not arg_1_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_1_2.loadoutIndex = 0
		end

		if not arg_1_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_1_2.weaponSlot = 0
		end
	end

	assert(arg_1_2.loadoutPlayerData)
	assert(arg_1_2.weaponPlayerData)
	assert(arg_1_2.loadoutIndex)
	assert(arg_1_2.weaponSlot)
	arg_1_0.WeaponCustomizeButtons:SetupButtons(arg_1_1, arg_1_2.weaponSlot, arg_1_2.loadoutIndex)

	local var_1_0 = arg_1_2.loadoutPlayerData
	local var_1_1 = arg_1_2.weaponPlayerData.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_1_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_1_0.GunsmithWeaponLevel:Setup(arg_1_1, var_1_1)
	end
end

function GunsmithCustomize(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "GunsmithCustomize"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3

	if CONDITIONS.InGame(var_2_0) then
		local var_2_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_2_1
		})

		var_2_4.id = "InGameMenuBackground"

		var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_2_0:addElement(var_2_4)

		var_2_0.InGameMenuBackground = var_2_4
	end

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("WeaponCustomizeButtons", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "WeaponCustomizeButtons"

	var_2_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 1790, _1080p * -235, _1080p * -101)
	var_2_0:addElement(var_2_6)

	var_2_0.WeaponCustomizeButtons = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "GunsmithWeaponLevel"

	var_2_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_2_0:addElement(var_2_8)

	var_2_0.GunsmithWeaponLevel = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GunsmithCustomize", GunsmithCustomize)
LockTable(_M)
