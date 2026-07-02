module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.weaponRotationArea:ResetRotation(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._weaponIndex = arg_2_2.weaponIndex
	arg_2_0._weaponModel = arg_2_2.weaponModel
	arg_2_0._weaponModelName = arg_2_2.weaponModelName
	arg_2_0.ResetRotation = var_0_0

	local var_2_0 = LUI.UIModelRotationArea.new({
		type = LUI.UIModelRotationArea.Types.Weapon,
		controllerIndex = arg_2_1
	})

	var_2_0.id = "weaponRotationArea"

	var_2_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_2_0:addElement(var_2_0)

	arg_2_0.weaponRotationArea = var_2_0

	arg_2_0.weaponRotationArea:SetModelIndex(arg_2_0._weaponIndex)
	arg_2_0.weaponRotationArea:SetModel(arg_2_0._weaponModel)
	arg_2_0.weaponRotationArea:SetModelName(arg_2_0._weaponModelName)
	arg_2_0.weaponRotationArea:SetModelOffsetData()
	ACTIONS.ScaleFullscreen(arg_2_0.weaponRotationArea)
	arg_2_0._weaponModel:SetOffsetsAndRotations(arg_2_0._weaponModelName)
end

function WeaponRotator(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "WeaponRotator"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponRotator", WeaponRotator)
LockTable(_M)
