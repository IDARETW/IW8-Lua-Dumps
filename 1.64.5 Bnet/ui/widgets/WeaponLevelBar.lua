module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = PROGRESSION.GetWeaponXPPercent(arg_1_1, arg_1_2)

	arg_1_0.Fill:SetRightAnchor(1 - var_1_0, 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function WeaponLevelBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -170 * _1080p, 170 * _1080p, -6 * _1080p, 6 * _1080p)

	var_3_0.id = "WeaponLevelBar"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Fill"

	var_3_6:SetAlpha(0.8, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Fill = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponLevelBar", WeaponLevelBar)
LockTable(_M)
