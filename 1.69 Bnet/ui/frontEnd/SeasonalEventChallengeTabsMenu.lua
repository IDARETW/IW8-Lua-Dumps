module(..., package.seeall)

local var_0_0 = 900
local var_0_1 = {
	PARTICIPATION_CHALLENGES = 2,
	COMMUNITY_CHALLENGES = 1
}

local function var_0_2(arg_1_0)
	if arg_1_0.Grid then
		arg_1_0.verticalScrollbar:closeTree()

		arg_1_0.verticalScrollbar = nil

		arg_1_0.Grid:closeTree()

		arg_1_0.Grid = nil
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		var_0_2(arg_2_0)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	var_0_2(arg_4_0)

	local var_4_0
	local var_4_1 = arg_4_1 == var_0_1.PARTICIPATION_CHALLENGES
	local var_4_2 = {
		buildArrowsLabel = false,
		adjustSizeToContent = false,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		mouseWheelScrollingOffsetPx = 32,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleRows = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxVisibleColumns = var_4_1 and 2 or 1,
		controllerIndex = arg_4_2,
		refreshChild = function(arg_5_0, arg_5_1, arg_5_2)
			return
		end,
		spacingX = _1080p * 30,
		spacingY = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_3 = LUI.UIGrid.new(var_4_2)

	var_4_3.id = "Grid"

	var_4_3:setUseStencil(true)
	var_4_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1790, _1080p * 200, _1080p * 979)
	arg_4_0:addElement(var_4_3)

	arg_4_0.Grid = var_4_3

	arg_4_0.Grid:SetActiveParentBehavior()

	local var_4_4, var_4_5, var_4_6, var_4_7 = arg_4_0.Grid:getLocalRect()
	local var_4_8
	local var_4_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_4_2
	})

	var_4_9.id = "verticalScrollbar"

	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, var_4_6, var_4_6 + 30 * _1080p, var_4_5, var_4_7)
	arg_4_0:addElement(var_4_9)

	arg_4_0.verticalScrollbar = var_4_9

	local var_4_10 = arg_4_0.verticalScrollbar
	local var_4_11 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_4_10,
		startCap = var_4_10.startCap,
		endCap = var_4_10.endCap,
		sliderArea = var_4_10.sliderArea,
		slider = var_4_10.sliderArea and var_4_10.sliderArea.slider,
		fixedSizeSlider = var_4_10.sliderArea and var_4_10.sliderArea.fixedSizeSlider,
		mouseWheelTarget = arg_4_0.Grid
	})

	arg_4_0.Grid:AddScrollbar(var_4_11)
	var_4_11:UpdateSliderAreaVertical(false)
	var_4_11:SetKBMStyle(true)
end

local function var_0_5(arg_6_0)
	local var_6_0 = 50
	local var_6_1 = arg_6_0.Grid:GetBuiltChildren()[1]:GetCurrentAnchorsAndPositions()

	arg_6_0.Grid:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_6_0, var_6_1.right + _1080p * var_6_0, _1080p * 200, _1080p * 980)

	local var_6_2, var_6_3, var_6_4, var_6_5 = arg_6_0.Grid:getLocalRect()

	arg_6_0.verticalScrollbar:SetAnchorsAndPosition(0, 1, 0, 1, var_6_4, var_6_4 + 40 * _1080p, var_6_3, var_6_5)
end

local function var_0_6(arg_7_0)
	local var_7_0 = 0
	local var_7_1 = arg_7_0.Grid:GetNumColumns()

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.Grid:GetBuiltChildren()) do
		if iter_7_1.shouldShowComplete then
			local var_7_2 = math.max(var_0_0 * var_7_0, 1)

			arg_7_0:Wait(var_7_2).onComplete = function()
				iter_7_1:ShowCompleteAnim()

				arg_7_0:Wait(1).onComplete = function()
					local var_9_0 = var_7_1 > 1 and math.floor((iter_7_0 - 1) / var_7_1) or iter_7_0 - 1
					local var_9_1 = var_7_1 > 1 and (iter_7_0 - 1) % var_7_1 or 0

					arg_7_0.Grid:SetFocusedPosition({
						x = var_9_1,
						y = var_9_0
					}, true)
				end
			end
			var_7_0 = var_7_0 + 1
		end
	end

	return var_7_0 > 0
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	var_0_4(arg_10_0, arg_10_2, arg_10_1)

	local var_10_0 = SEASONAL_EVENT.GetChallengesData(arg_10_1)

	if arg_10_2 == var_0_1.COMMUNITY_CHALLENGES then
		local var_10_1 = var_10_0.commChallengesData

		arg_10_0.challengesCount = #var_10_1

		ACTIONS.AnimateSequence(arg_10_0, "CommunityChallenge")

		for iter_10_0 = 1, #var_10_1 do
			local var_10_2 = var_10_1[iter_10_0]
			local var_10_3 = MenuBuilder.BuildRegisteredType("SeasonalEventCommunityChallengePanel", {
				controllerIndex = arg_10_1
			})

			var_10_3.id = "CommunityChallengePanel" .. iter_10_0

			var_10_3:SetData(var_10_2)
			var_10_3:SetupPreviewsGrid(var_10_1)

			local var_10_4 = var_10_3:GetCurrentAnchorsAndPositions()
			local var_10_5
			local var_10_6 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
				controllerIndex = arg_10_1
			})

			var_10_6.id = "EmptyFocusable"

			var_10_6:SetAnchorsAndPosition(var_10_4.leftAnchor, var_10_4.rightAnchor, var_10_4.topAnchor, var_10_4.bottomAnchor, var_10_4.left, var_10_4.right, var_10_4.top, var_10_4.bottom)
			var_10_3:addElement(var_10_6)

			var_10_3.EmptyFocusable = var_10_6

			ACTIONS.AnimateSequence(var_10_3, "AllChallengeLayout")
			arg_10_0.Grid:AddElement(var_10_3)
		end

		var_0_5(arg_10_0)
	elseif arg_10_2 == var_0_1.PARTICIPATION_CHALLENGES then
		local var_10_7 = SEASONAL_EVENT.FilterParticipationChallengesData(arg_10_1, var_10_0.miscChallengesData)

		arg_10_0.challengesCount = #var_10_7

		ACTIONS.AnimateSequence(arg_10_0, "ParticipationChallenge")

		for iter_10_1 = 1, #var_10_7 do
			local var_10_8 = var_10_7[iter_10_1]
			local var_10_9 = MenuBuilder.BuildRegisteredType("SeasonalEventParticipationChallenge", {
				controllerIndex = arg_10_1
			})

			var_10_9.id = "ParticipationChallenge" .. iter_10_1

			var_10_9:SetupEventHandlers(true)
			var_10_9:SetChallengeData(var_10_8)
			var_10_9:SetPromptsEnabled(false, var_10_9._controllerIndex)
			arg_10_0.Grid:AddElement(var_10_9)
		end
	end

	assert(#arg_10_0.Grid:GetBuiltChildren() > 0, "SeasonalEventChallengeTabsMenu: Challenge Grid is empty!")

	if not var_0_6(arg_10_0) then
		arg_10_0:Wait(1).onComplete = function()
			arg_10_0.Grid:SetFocusedPosition({
				x = 0,
				y = 0
			}, true)
		end
	end
end

local function var_0_8(arg_12_0, arg_12_1)
	local var_12_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_12_1 = {}

	if var_12_0.hasCommunityChallenges then
		var_12_1[#var_12_1 + 1] = {
			hasDefaultFocus = true,
			disabled = false,
			name = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CHALLENGES_SHORT")),
			focusFunction = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
				var_0_7(arg_12_0, arg_13_1, var_0_1.COMMUNITY_CHALLENGES)
			end
		}
	end

	if var_12_0.gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.PARTICIPATION_CHALLENGES then
		var_12_1[#var_12_1 + 1] = {
			hasDefaultFocus = false,
			disabled = false,
			name = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/PAR_CHALLENGES")),
			focusFunction = function(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
				var_0_7(arg_12_0, arg_14_1, var_0_1.PARTICIPATION_CHALLENGES)
			end
		}
	end

	local var_12_2 = {}

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		table.insert(var_12_2, iter_12_1)
	end

	arg_12_0.Tabs:SetTabs(var_12_2)
end

local function var_0_9(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.controllerIndex = arg_15_1

	var_0_8(arg_15_0, arg_15_1)
	arg_15_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/ALL_CH"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_15_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_15_0.Darkener)
	LAYOUT.AddAspectRatioFadeFrame(arg_15_0, arg_15_1)

	local function var_15_0(arg_16_0, arg_16_1)
		if arg_16_1.down and arg_16_1.qualifier == "mousewheel" and arg_15_0.Grid then
			arg_15_0.Grid._alwaysTrapMouseWheel = true

			return arg_15_0.Grid:processEvent(arg_16_1)
		end
	end

	var_0_3(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.MouseScrollCatcher:SetHandleMouse(true)
	arg_15_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
	arg_15_0.MouseScrollCatcher:addEventHandler("gamepad_button", var_15_0)
end

function SeasonalEventChallengeTabsMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIHorizontalNavigator.new()

	var_17_0.id = "SeasonalEventChallengeTabsMenu"

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = LUI.UIImage.new()

	var_17_4.id = "Darkener"

	var_17_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Darkener = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIImage.new()

	var_17_6.id = "Background"

	var_17_6:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_17_0:addElement(var_17_6)

	var_17_0.Background = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIImage.new()

	var_17_8.id = "MouseScrollCatcher"

	var_17_8:SetRGBFromInt(0, 0)
	var_17_8:SetAlpha(0, 0)
	var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_17_0:addElement(var_17_8)

	var_17_0.MouseScrollCatcher = var_17_8

	local var_17_9
	local var_17_10 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_17_1
	})

	var_17_10.id = "TabBacker"

	var_17_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_10)

	var_17_0.TabBacker = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "MenuTitle"

	var_17_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")), 0)
	var_17_12.Line:SetLeft(0, 0)
	var_17_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_12)

	var_17_0.MenuTitle = var_17_12

	local var_17_13
	local var_17_14 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_15 = LUI.TabManager.new(var_17_14)

	var_17_15.id = "Tabs"

	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1350, _1080p * 108, _1080p * 160)
	var_17_0:addElement(var_17_15)

	var_17_0.Tabs = var_17_15

	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_17_16 = LUI.UIBindButton.new()

	var_17_16.id = "selfBindButton"

	var_17_0:addElement(var_17_16)

	var_17_0.bindButton = var_17_16

	var_0_9(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("SeasonalEventChallengeTabsMenu", SeasonalEventChallengeTabsMenu)
LockTable(_M)
