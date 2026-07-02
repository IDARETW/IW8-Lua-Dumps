module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)

	assert(arg_1_0.WeaponLevel)
	assert(arg_1_0.WeaponLevelBar)
	arg_1_0.WeaponLevel:setText(Engine.CBBHFCGDIC("CAS/GUN_WEAPON_LEVEL", var_1_0))
	arg_1_0.WeaponLevelBar:Setup(arg_1_1, arg_1_2)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function WeaponLevel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -255 * _1080p, 255 * _1080p, -28 * _1080p, 28 * _1080p)

	var_3_0.id = "WeaponLevel"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "WeaponLevel"

	var_3_4:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 510, 0, _1080p * 30)
	var_3_0:addElement(var_3_4)

	var_3_0.WeaponLevel = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "WeaponLevelBar"

	var_3_6:SetScale(0.5, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 85, _1080p * 425, _1080p * -15, _1080p * -3)
	var_3_0:addElement(var_3_6)

	var_3_0.WeaponLevelBar = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponLevel", WeaponLevel)
LockTable(_M)
