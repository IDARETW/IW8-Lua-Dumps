module(..., package.seeall)

function MaxPointsPopup(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -215.5 * _1080p, 215.5 * _1080p, -126.5 * _1080p, 126.5 * _1080p)

	var_1_0.id = "MaxPointsPopup"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericPopup", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "GenericPopup"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.GenericPopup = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "PointsFull"

	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/POINTS_MAXED_OUT"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 22.48, _1080p * 389.48, _1080p * 26.52, _1080p * 46.52)
	var_1_0:addElement(var_1_6)

	var_1_0.PointsFull = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "YesButton"

	var_1_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/YES"), 0)
	var_1_8.Text:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 431, _1080p * 167, _1080p * 210)
	var_1_0:addElement(var_1_8)

	var_1_0.YesButton = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "NoButton"

	var_1_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/NO"), 0)
	var_1_10.Text:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 431, _1080p * 210, _1080p * 253)
	var_1_0:addElement(var_1_10)

	var_1_0.NoButton = var_1_10

	var_1_8:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller or var_1_1

		ACTIONS.RestoreMenu("LoadoutSelect", true, var_2_0)
	end)
	var_1_10:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_1_1
		end

		ACTIONS.LeaveMenu(var_1_0)
	end)

	function var_1_0.addButtonHelperFunction(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_1_0:addEventHandler("menu_create", var_1_0.addButtonHelperFunction)

	local var_1_11 = LUI.UIBindButton.new()

	var_1_11.id = "selfBindButton"

	var_1_0:addElement(var_1_11)

	var_1_0.bindButton = var_1_11

	var_1_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.LeaveMenu(var_1_0)
	end)

	return var_1_0
end

MenuBuilder.registerType("MaxPointsPopup", MaxPointsPopup)
LockTable(_M)
