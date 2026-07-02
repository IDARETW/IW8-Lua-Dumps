module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	return
end

function NewOperatorsPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "NewOperatorsPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	var_2_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})
	var_2_0.HelperBar.id = "HelperBar"

	var_2_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_2_0.HelperBar:setPriority(10)
	var_2_0:addElement(var_2_0.HelperBar)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Frame"

	var_2_4:SetRGBFromInt(3355443, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1920, _1080p * -463, _1080p * 421)
	var_2_0:addElement(var_2_4)

	var_2_0.Frame = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Background"

	var_2_6:SetRGBFromInt(1644825, 0)
	var_2_6:SetAlpha(0.8, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1920, _1080p * -540, _1080p * 540)
	var_2_0:addElement(var_2_6)

	var_2_0.Background = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("NewOperatorsFactionInfo", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "NewOperatorsWest"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 896, _1080p * 129, _1080p * 979)
	var_2_0:addElement(var_2_8)

	var_2_0.NewOperatorsWest = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("NewOperatorsFactionInfo", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "NewOperatorsEast"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1024, _1080p * 1824, _1080p * 129, _1080p * 979)
	var_2_0:addElement(var_2_10)

	var_2_0.NewOperatorsEast = var_2_10

	var_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_2_11 = LUI.UIBindButton.new()

	var_2_11.id = "selfBindButton"

	var_2_0:addElement(var_2_11)

	var_2_0.bindButton = var_2_11

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NewOperatorsPopup", NewOperatorsPopup)
LockTable(_M)
