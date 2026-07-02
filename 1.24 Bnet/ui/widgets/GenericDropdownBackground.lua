module(..., package.seeall)

function SetupButton(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = 80

	SetupTextureLayer(arg_1_0, arg_1_3)
	LAYOUT.SetTextBoxSize(arg_1_1, arg_1_0.DropdownBackground, arg_1_2, var_1_0, nil, arg_1_3, 0, LUI.EASING.outQuadratic)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupButton = SetupButton
	arg_2_0._textureLayerSet = false

	if IsLanguageRightToLeft(GetCurrentLanguage()) then
		arg_2_0:SetZRotation(180)
	end
end

function GenericDropdownBackground(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 357 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "GenericDropdownBackground"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "DropdownBackground"

	var_3_4:SetRGBFromInt(1250324, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DropdownBackground = var_3_4

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GenericDropdownBackground", GenericDropdownBackground)
LockTable(_M)
