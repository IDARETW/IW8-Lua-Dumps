module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if Dvar.IBEGCHEFE("LLRLMRNNNM") then
		return
	end

	assert(arg_1_0.characterRotationArea)
	arg_1_0.characterRotationArea:SetCharacterInfo(arg_1_1, arg_1_2, arg_1_3)
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.characterRotationArea)
	arg_2_0.characterRotationArea:SetCharacterSkinRef(arg_2_1)
end

local function var_0_2(arg_3_0)
	assert(arg_3_0.characterRotationArea)

	return arg_3_0.characterRotationArea:GetClientCharacterTurnIdleAnim(arg_3_0)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetClientCharacterInfo = var_0_0
	arg_4_0.SetClientCharacterSkinRef = var_0_1
	arg_4_0.GetClientCharacterTurnIdleAnim = var_0_2
	arg_4_0.ResetRotation = ResetRotation

	if Dvar.IBEGCHEFE("LLRLMRNNNM") then
		return
	end

	local var_4_0 = LUI.UIModelRotationArea.new({
		type = LUI.UIModelRotationArea.Types.Character,
		controllerIndex = arg_4_1
	})

	var_4_0.id = "characterRotationArea"

	var_4_0:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ROTATION_NORMAL)
	arg_4_0:addElement(var_4_0)

	arg_4_0.characterRotationArea = var_4_0
end

function CharacterRotator(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "CharacterRotator"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CharacterRotator", CharacterRotator)
LockTable(_M)
