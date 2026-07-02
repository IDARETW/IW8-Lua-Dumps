module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.LoadoutGrid)

	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetBlurStrength(5)
	var_1_0:setupWorldBlur()

	var_1_0.id = "blur"

	arg_1_0:addElement(var_1_0)

	local var_1_1 = PlayerData.BFFBGAJGD(arg_1_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts

	arg_1_0.LoadoutGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		assert(arg_2_0.GenericButton)
		arg_2_0.GenericButton.Text:setText(var_1_1[arg_2_2].name:get())
		arg_2_0.GenericButton:addEventHandler("button_over", function(arg_3_0)
			arg_1_0.LoadoutSelectButtons:SetupGridItems(arg_1_1, arg_2_2, var_1_1[arg_2_2])
		end)
		arg_2_0.GenericButton:addEventHandler("button_action", function(arg_4_0)
			if Dvar.IBEGCHEFE("LKPQLSPSRK") == true then
				return
			end

			MatchSimulator.loadoutSelected(arg_1_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)

		return arg_2_0
	end)
	arg_1_0.LoadoutGrid:SetNumColumns(1)
	arg_1_0.LoadoutGrid:SetNumRows(#var_1_1)
	arg_1_0.LoadoutGrid:RefreshContent()

	if Engine.CGABICJHAI() then
		arg_1_0.LoadoutSelectButtons:SetMouseFocusBlocker(true)
	end
end

function MatchSimLoadoutSelect(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "MatchSimLoadoutSelect"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "MenuTitle"

	var_5_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/LOADOUT_SELECT"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_6)

	var_5_0.MenuTitle = var_5_6

	local var_5_7
	local var_5_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		wrapX = true,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ItemListButton", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 370,
		rowHeight = _1080p * 60,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_9 = LUI.UIGrid.new(var_5_8)

	var_5_9.id = "LoadoutGrid"

	var_5_9:setUseStencil(true)
	var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 216, _1080p * 496)
	var_5_0:addElement(var_5_9)

	var_5_0.LoadoutGrid = var_5_9

	local var_5_10
	local var_5_11 = MenuBuilder.BuildRegisteredType("LoadoutSelectButtons", {
		controllerIndex = var_5_1
	})

	var_5_11.id = "LoadoutSelectButtons"

	var_5_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 960, _1080p * 1393, _1080p * 216, _1080p * 1016)
	var_5_0:addElement(var_5_11)

	var_5_0.LoadoutSelectButtons = var_5_11

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_5_12 = LUI.UIBindButton.new()

	var_5_12.id = "selfBindButton"

	var_5_0:addElement(var_5_12)

	var_5_0.bindButton = var_5_12

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_5_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.controller or var_5_1

		ACTIONS.UploadStats(var_5_0, var_9_0)
	end)
	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MatchSimLoadoutSelect", MatchSimLoadoutSelect)
LockTable(_M)
