module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)
	arg_1_0.MenuTitle:SetTitle(arg_1_2.title)
	arg_1_0.PlatformGrid:SetNumChildren(#arg_1_2.buttons)
	arg_1_0.PlatformGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_2 + 1
		local var_2_1 = arg_1_2.buttons[var_2_0]

		arg_2_0:SetText(var_2_1.label)
		arg_2_0:SetEquipped(var_2_1.isEquipped)
		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			var_2_1.action(arg_3_0, arg_3_1.controller)
			LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
		end)
	end)

	for iter_1_0 = 1, #arg_1_2.buttons do
		if arg_1_2.buttons[iter_1_0].isEquipped then
			arg_1_0.PlatformGrid:SetFocusedPosition({
				x = 0,
				y = iter_1_0 - 1
			}, true, nil, false)

			break
		end
	end
end

function SelectSearchPlatformPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -412.5 * _1080p, 412.5 * _1080p, -540 * _1080p, 540 * _1080p)

	var_4_0.id = "SelectSearchPlatformPopup"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "MenuTitle"

	var_4_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_FRIENDS")), 0)
	var_4_4.Line:SetLeft(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_4)

	var_4_0.MenuTitle = var_4_4

	local var_4_5
	local var_4_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericOptionButton", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_7 = LUI.UIGrid.new(var_4_6)

	var_4_7.id = "PlatformGrid"

	var_4_7:setUseStencil(true)
	var_4_7:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 92, _1080p * -109, _1080p * 142, _1080p * 557)
	var_4_0:addElement(var_4_7)

	var_4_0.PlatformGrid = var_4_7

	function var_4_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_8 = LUI.UIBindButton.new()

	var_4_8.id = "selfBindButton"

	var_4_0:addElement(var_4_8)

	var_4_0.bindButton = var_4_8

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SelectSearchPlatformPopup", SelectSearchPlatformPopup)
LockTable(_M)
