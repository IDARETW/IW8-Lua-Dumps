module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.EditButton:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.EditButton:SetButtonDisabled(not arg_1_1)
	arg_1_0.EditButton:SetMouseFocusBlocker(not arg_1_1)

	if arg_1_1 and not arg_1_0.LoadoutButton.navigation.right then
		arg_1_0.LoadoutButton.navigation.right = arg_1_0.EditButton
	elseif not arg_1_1 and arg_1_0.LoadoutButton.navigation.right then
		arg_1_0.LoadoutButton.navigation.right = nil
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.line and not arg_2_1 then
		arg_2_0.line:closeTree()

		arg_2_0.line = nil
	elseif not arg_2_0.line and arg_2_1 then
		local var_2_0 = LUI.UIImage.new()

		var_2_0.id = "Line"

		local var_2_1 = 550

		if arg_2_2 == true then
			var_2_1 = 370
		end

		var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -0, _1080p * var_2_1, _1080p * 63, _1080p * 64)
		var_2_0:SetAlpha(0.5)
		arg_2_0:addElement(var_2_0)

		arg_2_0.line = var_2_0
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.EditButton)

	arg_3_0.SetEditButtonEnabled = var_0_0
	arg_3_0.LoadoutButton.navigation = {}
	arg_3_0.EditButton.navigation = {}
	arg_3_0.EditButton.navigation.left = arg_3_0.LoadoutButton
	arg_3_0.AddDividingLine = var_0_1

	var_0_0(arg_3_0, false)
end

function InGameLoadoutButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 60 * _1080p)

	var_4_0.id = "InGameLoadoutButton"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("SelectLoadoutButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LoadoutButton"

	var_4_4.Text:setText(ToUpperCase(""), 0)
	var_4_4.Text:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 370, 0, _1080p * 60)
	var_4_0:addElement(var_4_4)

	var_4_0.LoadoutButton = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("EditLoadoutButton", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "EditButton"

	var_4_6:SetAlpha(0, 0)
	var_4_6.Text:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -165, 0, 0, _1080p * 60)
	var_4_0:addElement(var_4_6)

	var_4_0.EditButton = var_4_6

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("InGameLoadoutButton", InGameLoadoutButton)
LockTable(_M)
