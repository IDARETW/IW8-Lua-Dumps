module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if Dvar.IBEGCHEFE("LLRLMRNNNM") then
		return
	end

	assert(arg_1_0.characterRotationArea)
	arg_1_0.characterRotationArea:SetCharacterInfo(arg_1_1, arg_1_2)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetClientCharacterInfo = var_0_0
	arg_2_0.ResetRotation = ResetRotation

	if Dvar.IBEGCHEFE("LLRLMRNNNM") then
		return
	end

	local var_2_0 = LUI.UIModelRotationArea.new({
		type = LUI.UIModelRotationArea.Types.Character,
		controllerIndex = arg_2_1
	})

	var_2_0.id = "characterRotationArea"

	var_2_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ROTATION_NORMAL)
	arg_2_0:addElement(var_2_0)

	arg_2_0.characterRotationArea = var_2_0
end

function CharacterRotator(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "CharacterRotator"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CharacterRotator", CharacterRotator)
LockTable(_M)
