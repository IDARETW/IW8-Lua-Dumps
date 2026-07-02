module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SPECIAL_OPS"))

	local var_1_0 = {}
	local var_1_1 = CP.GetEnabledClassicMissionsTable()

	for iter_1_0, iter_1_1 in pairs(var_1_1) do
		local var_1_2 = {
			ref = iter_1_0,
			name = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, iter_1_0, CSV.mpMapTable.cols.name),
			desc = StringTable.DIFCHIGDFB(CSV.specOpsMissionTable.file, CSV.specOpsMissionTable.cols.map, iter_1_0, CSV.specOpsMissionTable.cols.desc)
		}

		table.insert(var_1_0, var_1_2)
	end

	arg_1_0.MapButtons:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + arg_2_2 * arg_1_0.MapButtons:GetNumColumns()
		local var_2_1 = var_1_0[var_2_0 + 1]

		arg_2_0:SetMap(var_2_1.ref)

		if not arg_2_0._handlersAdded then
			arg_2_0._handlersAdded = true

			arg_2_0.Button:addEventHandler("button_over", function(arg_3_0, arg_3_1)
				if arg_1_0.ClassicMapDetails then
					arg_1_0.ClassicMapDetails:SetMap(var_2_1.ref)
				end
			end)
		end
	end)
	arg_1_0.MapButtons:SetNumChildren(#var_1_0)
	arg_1_0.MapButtons:RefreshContent()

	if CONDITIONS.AreSpecOpsRewardsEnabled() then
		arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			kbm_only = true,
			priority = 10,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLASSIC_SPEC_OPS_REWARD")
		})
	end

	local var_1_3 = arg_1_0.MapButtons:GetFirstFocusablePosition()

	if LUI.IsLastInputMouseNavigation(arg_1_1) and var_1_3 then
		arg_1_0.MapButtons:SetFocusedPosition(var_1_3, true)
	end
end

function CPRecordsMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIHorizontalNavigator.new()

	var_4_0.id = "CPRecordsMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		worldBlur = 1,
		controllerIndex = var_4_1
	}
	local var_4_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_4_4)

	var_4_5.id = "WorldBlur"

	var_4_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_4_0:addElement(var_4_5)

	var_4_0.WorldBlur = var_4_5

	local var_4_6
	local var_4_7 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CPMapButton", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_8 = LUI.UIGrid.new(var_4_7)

	var_4_8.id = "MapButtons"

	var_4_8:setUseStencil(true)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 806)
	var_4_0:addElement(var_4_8)

	var_4_0.MapButtons = var_4_8

	local var_4_9

	if CONDITIONS.AreSpecOpsStarsEnabled(var_4_0) then
		local var_4_10 = MenuBuilder.BuildRegisteredType("SOMapDetails", {
			controllerIndex = var_4_1
		})

		var_4_10.id = "ClassicMapDetails"

		var_4_10.GenericItemInfo.BodyText:setText("", 0)
		var_4_10.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
		var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1790, _1080p * 331, _1080p * 691)
		var_4_0:addElement(var_4_10)

		var_4_0.ClassicMapDetails = var_4_10
	end

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "MenuTitle"

	var_4_12.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/SPECIAL_OPS"), 0)
	var_4_12.Line:SetLeft(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_12)

	var_4_0.MenuTitle = var_4_12

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_4_13 = LUI.UIBindButton.new()

	var_4_13.id = "selfBindButton"

	var_4_0:addElement(var_4_13)

	var_4_0.bindButton = var_4_13

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CPRecordsMenu", CPRecordsMenu)
LockTable(_M)
