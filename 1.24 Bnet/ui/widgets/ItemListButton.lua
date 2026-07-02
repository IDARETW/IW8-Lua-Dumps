module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_0.NewItemNotification)
	arg_2_0.NewItemNotification:UpdateAlpha(arg_2_1 and 1 or 0, 0)

	arg_2_0.isNew = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_0.Selected then
		local var_3_0 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
			controllerIndex = arg_3_1
		})

		var_3_0.id = "Selected"

		var_3_0:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -48, _1080p * -8, _1080p * -20, _1080p * 20)
		arg_3_0:addElement(var_3_0)

		arg_3_0.Selected = var_3_0
	end

	assert(arg_3_0.Selected)
	arg_3_0:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_2 and "On" or "Off")

	arg_3_0.isSelected = arg_3_2
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetNew = var_0_1
	arg_4_0.GetNew = var_0_0
	arg_4_0.SetSelected = var_0_2
	arg_4_0.SetupSelectable = SetupSelectable
end

function ItemListButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 60 * _1080p)

	var_5_0.id = "ItemListButton"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericButton"

	var_5_4.Text:SetLeft(_1080p * 20, 0)
	var_5_4.Text:setText(ToUpperCase(""), 0)
	var_5_4.Text:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericButton = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "NewItemNotification"

	var_5_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
	var_5_0:addElement(var_5_6)

	var_5_0.NewItemNotification = var_5_6

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ItemListButton", ItemListButton)
LockTable(_M)
