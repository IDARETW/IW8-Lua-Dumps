module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CPMaps", {
	"host"
})

local var_0_0 = "frontEnd.maps"

local function var_0_1()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MenuTitle)
	assert(arg_2_0.MapDetails)
	Engine.DHFCHIIJCA("squad_lobby")
	FrontEndScene.HideAllCharacters()

	local var_2_0 = Lobby.GetCurrentGameType()

	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC(var_2_0 == "cp_specops" and "LUA_MENU/CHOOSE_MISSION" or "LUA_MENU_CP/CHOOSE_MAP"))

	local var_2_1 = CP.GetMapsDataSources(var_0_0, arg_2_1)

	arg_2_0:SetDataSource(var_2_1, arg_2_1)
	arg_2_0.MapButtons:SetGridDataSource(var_2_1, arg_2_1)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0.MapButtons, "name", function()
		local var_3_0 = arg_2_0.MapButtons:GetDataSource()
		local var_3_1 = var_3_0.ref
		local var_3_2 = var_3_0.name:GetValue(arg_2_1)

		if var_3_2 ~= nil then
			arg_2_0.MapDetails.MapText:setText(var_3_2)
		else
			arg_2_0.MapDetails.MapText:setText("")
		end

		local var_3_3 = Lobby.GetCurrentGameTypeName()

		if var_3_3 ~= nil then
			arg_2_0.MapDetails.GameModeText:setText(ToUpperCase(var_3_3))
		else
			arg_2_0.MapDetails.GameModeText:setText("")
		end

		local var_3_4 = arg_2_0.MapButtons:GetDataSource().image:GetValue(arg_2_1)

		if var_3_4 ~= nil then
			arg_2_0.MapDetails.MapImage:setImage(RegisterMaterial(var_3_4))
		end

		if arg_2_0.ClassicMapDetails then
			arg_2_0.ClassicMapDetails:SetMap(var_3_1)
		end

		if arg_2_0.SOStarRequirements then
			arg_2_0.SOStarRequirements:SetMap(var_3_1)
		end
	end)

	if var_2_0 == "cp_specops" and CONDITIONS.AreSpecOpsRewardsEnabled() then
		arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			kbm_only = true,
			priority = 10,
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/CLASSIC_SPEC_OPS_REWARD")
		})
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.GradientRight)

	local var_2_2 = arg_2_0.MapButtons:GetFirstFocusablePosition()

	if LUI.IsLastInputMouseNavigation(arg_2_1) and var_2_2 then
		arg_2_0.MapButtons:SetFocusedPosition(var_2_2, true)
	end
end

function CPMaps(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIHorizontalNavigator.new()

	var_4_0.id = "CPMaps"

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
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "WorldMask"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_4)

	var_4_0.WorldMask = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("MapDetails", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "MapDetails"

	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.MapDetails = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "GradientRight"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_8:SetAlpha(0.4, 0)
	var_4_8:SetYRotation(180, 0)
	var_4_8:setImage(RegisterMaterial("gradient_curve"), 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 703, _1080p * 2, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.GradientRight = var_4_8

	local var_4_9
	local var_4_10 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CPMapButton", {
				controllerIndex = var_4_1
			})
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_11 = LUI.UIDataSourceGrid.new(var_4_10)

	var_4_11.id = "MapButtons"

	var_4_11:setUseStencil(false)
	var_4_11:SetGridDataSourceThroughElement(var_4_0, nil)
	var_4_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 806)
	var_4_0:addElement(var_4_11)

	var_4_0.MapButtons = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "MenuTitle"

	var_4_13.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_CP/CHOOSE_MAP")), 0)
	var_4_13.Line:SetLeft(0, 0)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_13)

	var_4_0.MenuTitle = var_4_13

	local var_4_14

	if CONDITIONS.AreSpecOpsStarsEnabledAndIsSpecOpsGameType(var_4_0) then
		local var_4_15 = MenuBuilder.BuildRegisteredType("SOMapDetails", {
			controllerIndex = var_4_1
		})

		var_4_15.id = "ClassicMapDetails"

		var_4_15.GenericItemInfo.BodyText:setText("", 0)
		var_4_15.GenericItemInfo.HeaderText:setText(ToUpperCase(""), 0)
		var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1790, _1080p * 216, _1080p * 576)
		var_4_0:addElement(var_4_15)

		var_4_0.ClassicMapDetails = var_4_15
	end

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

	local var_4_16 = LUI.UIBindButton.new()

	var_4_16.id = "selfBindButton"

	var_4_0:addElement(var_4_16)

	var_4_0.bindButton = var_4_16

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CPMaps", CPMaps)
LUI.FlowManager.RegisterStackPopBehaviour("CPMaps", var_0_1)
LockTable(_M)
