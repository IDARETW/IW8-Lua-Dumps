module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = WEAPON.GetName(arg_1_2)
	local var_1_1 = PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)

	arg_1_0.WeaponAndLevel:setText(Engine.CBBHFCGDIC("CAS/GUN_WEAPON_LEVEL", var_1_1))
	arg_1_0.WeaponLevelBar:Setup(arg_1_1, arg_1_2)

	local var_1_2 = PROGRESSION.GetWeaponXP(arg_1_1, arg_1_2)
	local var_1_3 = PROGRESSION.GetWeaponCurrentLevelXP(arg_1_1, arg_1_2)
	local var_1_4 = PROGRESSION.GetWeaponNextLevelXP(arg_1_1, arg_1_2)

	if PROGRESSION.IsWeaponMaxLevel(arg_1_1, arg_1_2) then
		arg_1_0.XPText:setText("")

		if CONDITIONS.IsWZWipFlowEnabled() then
			arg_1_0.WeaponAndLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPON_MAX_LEVEL_NUMBER", PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)))
		end
	else
		arg_1_0.XPText:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_XP", var_1_2 - var_1_3, var_1_4 - var_1_3))
	end

	if PROGRESSION.IsWeaponMaxLevel(arg_1_1, arg_1_2) then
		ACTIONS.AnimateSequence(arg_1_0, "MaxLevel")
	else
		ACTIONS.AnimateSequence(arg_1_0, "ShowProgress")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.WeaponAndLevel)
	assert(arg_2_0.WeaponLevelBar)

	arg_2_0.Setup = var_0_0

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function GunsmithWeaponLevel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 216 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "GunsmithWeaponLevel"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "WeaponAndLevel"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.subtitle, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetWordWrap(false)
	var_3_4:SetAlignment(LUI.Alignment.Right)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -10, 0, _1080p * 28)
	var_3_0:addElement(var_3_4)

	var_3_0.WeaponAndLevel = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "WeaponLevelBar"

	var_3_6:SetAnchorsAndPosition(1, 0, 0, 1, 0, _1080p * 350, _1080p * 10, _1080p * 18)
	var_3_0:addElement(var_3_6)

	var_3_0.WeaponLevelBar = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "XPText"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:setText(ToUpperCase(""), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetOutlineRGBFromInt(0, 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * 165, _1080p * 350, _1080p * -10, _1080p * 8)
	var_3_0:addElement(var_3_8)

	var_3_0.XPText = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		}
	}

	var_3_4:RegisterAnimationSequence("MaxLevel", var_3_11)

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("MaxLevel", var_3_12)

	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("MaxLevel", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("MaxLevel")
		var_3_6:AnimateSequence("MaxLevel")
		var_3_8:AnimateSequence("MaxLevel")
	end

	var_3_0._sequences.MaxLevel = var_3_14

	local var_3_15
	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_3_4:RegisterAnimationSequence("ShowProgress", var_3_16)

	local var_3_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowProgress", var_3_17)

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ShowProgress", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("ShowProgress")
		var_3_6:AnimateSequence("ShowProgress")
		var_3_8:AnimateSequence("ShowProgress")
	end

	var_3_0._sequences.ShowProgress = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_3_4:RegisterAnimationSequence("WZWipSetup", var_3_21)

	local function var_3_22()
		var_3_4:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_22

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GunsmithWeaponLevel", GunsmithWeaponLevel)
LockTable(_M)
