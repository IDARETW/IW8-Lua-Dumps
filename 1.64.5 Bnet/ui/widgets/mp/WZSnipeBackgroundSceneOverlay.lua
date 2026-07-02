module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 == nil then
		return
	end

	local var_1_0
	local var_1_1 = arg_1_1.gameSourceID

	if arg_1_1.weaponRef then
		assert(var_1_1 == nil, "UpdateSnipeIcon - gameSourceID should not be specified in this scenario, since the gameSourceID will be determined via other provided options")

		local var_1_2 = LOOT.GetBaseWeaponItemID(arg_1_1.weaponRef)

		if var_1_2 then
			var_1_1 = LOOT.GetGameSourceIDFromItemID(var_1_2)
		end
	end

	if arg_1_1.useGunsmithSetup then
		local var_1_3 = Engine.DDJFBBJAIG() and "Frontend" or "InGame"

		ACTIONS.AnimateSequence(arg_1_0, var_1_3 .. "GunsmithSetup")
	elseif arg_1_1.useStoreButtonSetup then
		ACTIONS.AnimateSequence(arg_1_0, "StoreButtonSetup")
	elseif arg_1_1.useStoreBarSetup then
		ACTIONS.AnimateSequence(arg_1_0, "StoreBarSetup")
	end

	if var_1_1 == LUI.GAME_SOURCE_ID.COLD_WAR then
		ACTIONS.AnimateSequence(arg_1_0, "BlackOpsColdWarColor")
	elseif var_1_1 == LUI.GAME_SOURCE_ID.MODERN_WARFARE then
		ACTIONS.AnimateSequence(arg_1_0, "ModernWarfareColor")
	elseif var_1_1 == LUI.GAME_SOURCE_ID.VANGUARD then
		ACTIONS.AnimateSequence(arg_1_0, "VanguardColor")
	end

	arg_1_0._gameSourceID = var_1_1

	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0)
end

local function var_0_1(arg_2_0)
	arg_2_0.UpdateSnipeOverlay = var_0_0
	arg_2_0.UpdateSnipeOverlayUsingGameSourceID = UpdateSnipeOverlayUsingGameSourceID
end

function WZSnipeBackgroundSceneOverlay(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "WZSnipeBackgroundSceneOverlay"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Overlay"

	var_3_4:SetAlpha(0.05, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Overlay = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6
	local var_3_7 = {
		{
			value = 0.08,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("FrontendGunsmithSetup", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("FrontendGunsmithSetup")
	end

	var_3_0._sequences.FrontendGunsmithSetup = var_3_8

	local var_3_9
	local var_3_10 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("InGameGunsmithSetup", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("InGameGunsmithSetup")
	end

	var_3_0._sequences.InGameGunsmithSetup = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("BlackOpsColdWarColor", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("BlackOpsColdWarColor")
	end

	var_3_0._sequences.BlackOpsColdWarColor = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ModernWarfareColor", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("ModernWarfareColor")
	end

	var_3_0._sequences.ModernWarfareColor = var_3_17

	local var_3_18
	local var_3_19 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("StoreButtonSetup", var_3_19)

	local function var_3_20()
		var_3_4:AnimateSequence("StoreButtonSetup")
	end

	var_3_0._sequences.StoreButtonSetup = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("StoreBarSetup", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("StoreBarSetup")
	end

	var_3_0._sequences.StoreBarSetup = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("VanguardColor", var_3_25)

	local function var_3_26()
		var_3_4:AnimateSequence("VanguardColor")
	end

	var_3_0._sequences.VanguardColor = var_3_26

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZSnipeBackgroundSceneOverlay", WZSnipeBackgroundSceneOverlay)
LockTable(_M)
