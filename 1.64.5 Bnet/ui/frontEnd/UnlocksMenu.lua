module(..., package.seeall)

local var_0_0 = 5

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0.UnlockRewardList.listSize > var_0_0

	if not arg_1_1 or not arg_1_2 then
		return
	end

	if var_1_0 then
		if arg_1_0.UnlockRewardList._targetPosition.x <= 0 then
			arg_1_1:SetAlpha(0)
			arg_1_2:SetAlpha(1)
		elseif arg_1_0.UnlockRewardList._targetPosition.x >= arg_1_0.UnlockRewardList.listSize - 1 then
			arg_1_1:SetAlpha(1)
			arg_1_2:SetAlpha(0)
		else
			arg_1_1:SetAlpha(1)
			arg_1_2:SetAlpha(1)
		end
	else
		arg_1_1:SetAlpha(0)
		arg_1_2:SetAlpha(0)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_3 then
		arg_2_0.RankProgressionBar:SetFocusedRankSlot(arg_2_1, arg_2_2)
		arg_2_0.RankProgressionBar:SetBorderHighlightPosition(arg_2_1, arg_2_2)

		arg_2_0.curFocusedPos = arg_2_2 + 1
	end

	local var_2_0 = arg_2_0.unlockIDs and #arg_2_0.unlockIDs or 0
	local var_2_1 = var_2_0 > var_0_0
	local var_2_2 = 0

	if var_2_1 and var_2_0 % var_0_0 then
		var_2_2 = var_0_0 - var_2_0 % var_0_0
	end

	arg_2_0.UnlockRewardList.listSize = var_2_0 + var_2_2

	arg_2_0.UnlockRewardListTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/LEVEL_X_UNLOCKS", arg_2_0.curFocusedPos))
	arg_2_0.UnlockRewardList:SetNumChildren(var_2_0 + var_2_2)
	arg_2_0.UnlockRewardList:RefreshContent()

	arg_2_0.Pips.pipsNumber = math.ceil((var_2_0 + var_2_2) / var_0_0)

	arg_2_0.UnlockRewardList:SetPosition({
		x = 0,
		y = 0
	}, true)
	arg_2_0.Pips:Setup(arg_2_1, arg_2_0.Pips.pipsNumber, var_2_1)

	arg_2_0.currentPipIndex = 1

	arg_2_0.Pips:SetActive(1)

	if LUI.IsLastInputGamepad(arg_2_1) then
		var_0_1(arg_2_0, arg_2_0.leftTriggerButton, arg_2_0.rightTriggerButton)
	else
		var_0_1(arg_2_0, arg_2_0.RewardListArrowLeft, arg_2_0.RewardListArrowRight)
	end

	if not var_2_1 then
		ACTIONS.AnimateSequence(arg_2_0, "HideRewardListScrolling")
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/RANK_PROGRESSION"))

	local var_3_0 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_3_1,
		_rankTypeOverride = PROGRESSION.RANK_TYPES.MILITARY
	})

	arg_3_0.RankTabLeft:InitializeRankDisplay(0, 0)
	arg_3_0.RankTabRight:InitializeRankDisplay(var_3_0._rankMax, 0)

	arg_3_0.unlocksFilterPreference = LOOT.WZGetUnlocksFilterPreference(arg_3_1)
	arg_3_0.curFocusedPos = var_3_0._rankDisplay
	arg_3_0.maxDisplayRank = var_3_0._rankMaxDisplay
	arg_3_0.UnlockList.default = true

	arg_3_0.UnlockList:SetNumChildren(var_3_0._rankMaxDisplay)
	arg_3_0.UnlockList:SetSnapOnWrapEnabled(true)
	arg_3_0.UnlockList:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0.UnlockList:GetContentIndex(arg_4_1, arg_4_2, {
			relativePosition = false
		})
		local var_4_1 = PROGRESSION.GetRankUnlocks(var_4_0)

		arg_4_0:InitUnlocks(arg_3_1, var_4_0, var_4_1, arg_3_0.unlocksFilterPreference)
	end)
	arg_3_0.UnlockList:processEvent({
		name = "gain_focus",
		controller = arg_3_1
	})

	arg_3_0:Wait(1).onComplete = function()
		arg_3_0.UnlockList:SetFocusedPosition({
			y = 0,
			x = var_3_0._rank
		}, true)
	end

	arg_3_0.UnlockList:RefreshContent()
	arg_3_0.RankProgressionBar:SetRankProgressionSlot(arg_3_1, var_3_0._rank)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0

	if arg_6_2 == "left" then
		var_6_0 = -1 * var_0_0
	elseif arg_6_2 == "right" then
		var_6_0 = var_0_0
	else
		return
	end

	local var_6_1 = LUI.FlowManager.GetCurrentMenu(arg_6_0)

	var_6_1.curFocusedPos = var_6_1.curFocusedPos + var_6_0

	if var_6_1.curFocusedPos > var_6_1.maxDisplayRank then
		var_6_1.curFocusedPos = 1
	elseif var_6_1.curFocusedPos < 1 then
		var_6_1.curFocusedPos = var_6_1.maxDisplayRank
	end

	var_6_1.UnlockList:SetFocusedPosition({
		y = 0,
		x = var_6_1.curFocusedPos - 1
	}, true)
	var_6_1.RankProgressionBar:SetFocusedRankSlot(arg_6_1, var_6_1.curFocusedPos - 1)
	var_6_1.RankProgressionBar:SetBorderHighlightPosition(arg_6_1, var_6_1.curFocusedPos - 1)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = LUI.FlowManager.GetCurrentMenu(arg_7_0)

	if not var_7_0.unlockIDs or not #var_7_0.unlockIDs then
		local var_7_1 = 0
	end

	local var_7_2 = 0

	if arg_7_2 == "left" then
		var_7_2 = 1
	elseif arg_7_2 == "right" then
		var_7_2 = -1
	end

	var_7_0.UnlockRewardList:ScrollAmount(arg_7_2, var_0_0)

	if LUI.IsLastInputGamepad(arg_7_1) then
		var_0_1(var_7_0, var_7_0.leftTriggerButton, var_7_0.rightTriggerButton)
	else
		var_0_1(var_7_0, var_7_0.RewardListArrowLeft, var_7_0.RewardListArrowRight)
	end

	local var_7_3 = math.ceil((var_7_0.UnlockRewardList._targetPosition.x + var_7_2) / var_0_0)

	var_7_0.Pips:SetActive(var_7_3)

	var_7_0.currentPipIndex = var_7_3
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_0 * arg_8_2
	local var_8_1 = arg_8_0.currentPipIndex
	local var_8_2 = math.abs(arg_8_2 - var_8_1)
	local var_8_3

	if arg_8_2 < var_8_1 then
		var_8_3 = "left"
	elseif var_8_1 < arg_8_2 then
		var_8_3 = "right"
	else
		return
	end

	arg_8_0.UnlockRewardList:ScrollAmount(var_8_3, var_8_2 * var_0_0)

	if LUI.IsLastInputGamepad(arg_8_1) then
		var_0_1(arg_8_0, arg_8_0.leftTriggerButton, arg_8_0.rightTriggerButton)
	else
		var_0_1(arg_8_0, arg_8_0.RewardListArrowLeft, arg_8_0.RewardListArrowRight)
	end

	arg_8_0.Pips:SetActive(arg_8_2)

	arg_8_0.currentPipIndex = arg_8_2
end

local function var_0_7(arg_9_0, arg_9_1)
	arg_9_0.bindButton = LUI.UIBindButton.new()
	arg_9_0.bindButton.id = "bindButton"

	arg_9_0:addElement(arg_9_0.bindButton)
	arg_9_0.bindButton:addEventHandler("button_shoulderr", function(arg_10_0, arg_10_1)
		var_0_4(arg_10_0, arg_9_1, "right")
	end)
	arg_9_0.bindButton:addEventHandler("button_shoulderl", function(arg_11_0, arg_11_1)
		var_0_4(arg_11_0, arg_9_1, "left")
	end)
end

local function var_0_8(arg_12_0, arg_12_1)
	arg_12_0.bindButton = LUI.UIBindButton.new()
	arg_12_0.bindButton.id = "bindButton"

	arg_12_0:addElement(arg_12_0.bindButton)
	arg_12_0.bindButton:addEventHandler("button_right_trigger", function(arg_13_0, arg_13_1)
		var_0_5(arg_13_0, arg_12_1, "right")
	end)
	arg_12_0.bindButton:addEventHandler("button_left_trigger", function(arg_14_0, arg_14_1)
		var_0_5(arg_14_0, arg_12_1, "left")
	end)

	function arg_12_0.UnlockRewardList.HandleMouseScroll(arg_15_0, arg_15_1)
		if arg_15_1 == "left" or arg_15_1 == "right" then
			var_0_5(arg_15_0, arg_12_1, arg_15_1)
		end
	end
end

local function var_0_9(arg_16_0, arg_16_1, arg_16_2)
	PROGRESSION.PrestreamRankUnlocksIcons(arg_16_0, arg_16_1)
end

local function var_0_10(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_0.MenuTitle)
	assert(arg_17_0.UnlockList)

	arg_17_0.UnlockRewardList.listSize = 0
	arg_17_0.currentPipIndex = 0
	arg_17_0.Pips.pipsNumber = 0

	arg_17_0.UnlocksRankPanel:SetDisplayMilitaryData(arg_17_1)
	var_0_3(arg_17_0, arg_17_1)
	var_0_7(arg_17_0, arg_17_1)
	var_0_8(arg_17_0, arg_17_1)

	local var_17_0 = LOOT.WZGetUnlocksFilterPreference(arg_17_1)

	if CONDITIONS.IsMagmaGameMode() then
		var_17_0:set(LOOT.filterOptions.VANGUARD_ONLY)
	else
		var_17_0:set(LOOT.filterOptions.MODERN_WARFARE_ONLY)
	end

	arg_17_0.unlocksFilterPreference = LOOT.WZGetUnlocksFilterPreference(arg_17_1)

	arg_17_0.UnlockList:RefreshContent()

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_17_0.WZTitleFilter:SetInitialFilter({
			defaultFilter = LOOT.filterOptions.VANGUARD_ONLY,
			filterPreference = var_17_0
		})
	end

	arg_17_0:registerEventHandler("navigate_with_pip", function(arg_18_0, arg_18_1)
		var_0_6(arg_17_0, arg_17_1, arg_18_1.index)
	end)
	arg_17_0:registerEventHandler("filter_changed", function(arg_19_0, arg_19_1)
		arg_17_0.unlocksFilterPreference = LOOT.WZGetUnlocksFilterPreference(arg_17_1)

		arg_17_0.UnlockList:RefreshContent()
	end)
	arg_17_0.UnlockRewardList:SetRefreshChild(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_17_0.unlockIDs then
			local var_20_0 = arg_20_1 + 1

			if var_20_0 <= #arg_17_0.unlockIDs then
				arg_20_0:UpdateUnlockData(arg_17_1, tonumber(arg_17_0.unlockIDs[var_20_0]))
				arg_20_0:SetAlpha(1)
			else
				arg_20_0:UpdateUnlockData(arg_17_1, tonumber(arg_17_0.unlockIDs[1]))
				arg_20_0:SetAlpha(0)
			end
		end
	end)

	local var_17_1 = ButtonMap.button_shoulderl.string
	local var_17_2 = ButtonMap.button_shoulderr.string
	local var_17_3 = ButtonMap.button_left_trigger.string
	local var_17_4 = ButtonMap.button_right_trigger.string
	local var_17_5
	local var_17_6 = {
		iconString = var_17_1
	}
	local var_17_7 = MenuBuilder.BuildRegisteredType("IconImage", var_17_6)

	var_17_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 500, _1080p * 532, _1080p * 246, _1080p * 278)
	var_17_7:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_17_7.id = "leftShoulderButton"

	arg_17_0:addElement(var_17_7)

	arg_17_0.leftShoulderButton = var_17_7

	local var_17_8
	local var_17_9 = {
		iconString = var_17_2
	}
	local var_17_10 = MenuBuilder.BuildRegisteredType("IconImage", var_17_9)

	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1750, _1080p * 1782, _1080p * 246, _1080p * 278)
	var_17_10:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_17_10.id = "rightShoulderButton"

	arg_17_0:addElement(var_17_10)

	arg_17_0.rightShoulderButton = var_17_10

	local var_17_11
	local var_17_12 = {
		iconString = var_17_3
	}
	local var_17_13 = MenuBuilder.BuildRegisteredType("IconImage", var_17_12)

	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 496, _1080p * 528, _1080p * 784, _1080p * 816)
	var_17_13:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_17_13.id = "leftTriggerButton"

	arg_17_0:addElement(var_17_13)

	arg_17_0.leftTriggerButton = var_17_13

	local var_17_14
	local var_17_15 = {
		iconString = var_17_4
	}
	local var_17_16 = MenuBuilder.BuildRegisteredType("IconImage", var_17_15)

	var_17_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1760, _1080p * 1792, _1080p * 784, _1080p * 816)
	var_17_16:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_17_16.id = "rightTriggerButton"

	arg_17_0:addElement(var_17_16)

	arg_17_0.rightTriggerButton = var_17_16

	arg_17_0:registerEventHandler("display_unlocks_changed", function(arg_21_0, arg_21_1)
		arg_21_0.unlockIndex = 1

		if arg_21_1._shouldUpdateSelection == true then
			arg_21_0.unlockIDs = arg_21_1._unlockIDs
			arg_21_0.currentFocusedRank = arg_21_1._rank
		elseif arg_21_0.currentFocusedRank == arg_21_1._rank then
			arg_21_0.unlockIDs = arg_21_1._unlockIDs
		end

		var_0_2(arg_21_0, arg_17_1, arg_21_0.currentFocusedRank, arg_21_1._shouldUpdateSelection)
	end)
	arg_17_0.UnlockList:addEventHandler("gamepad_button", function(arg_22_0, arg_22_1)
		if arg_22_1.qualifier == "mousewheel" and arg_22_1.down then
			local var_22_0 = 0
			local var_22_1 = arg_22_1.button == "up" and -1 or 1
			local var_22_2 = arg_22_0:GetTargetColumn()

			arg_22_0:SetTargetColumn(var_22_2 + var_22_1, true, true)
			Engine.HJJJIGAC(arg_22_1.controller)

			return true
		end
	end)

	arg_17_0.UnlockList._disableMouseWheel = true

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_17_0.ArrowLeft:addEventHandler("leftmouseup", function(arg_23_0, arg_23_1)
		if arg_23_1.inside then
			var_0_4(arg_23_0, arg_17_1, "left")
		end
	end)
	arg_17_0.ArrowRight:addEventHandler("leftmouseup", function(arg_24_0, arg_24_1)
		if arg_24_1.inside then
			var_0_4(arg_24_0, arg_17_1, "right")
		end
	end)
	arg_17_0.RewardListArrowLeft:addEventHandler("leftmouseup", function(arg_25_0, arg_25_1)
		if arg_25_1.inside then
			var_0_5(arg_25_0, arg_17_1, "left")
		end
	end)
	arg_17_0.RewardListArrowRight:addEventHandler("leftmouseup", function(arg_26_0, arg_26_1)
		if arg_26_1.inside then
			var_0_5(arg_26_0, arg_17_1, "right")
		end
	end)

	local function var_17_17(arg_27_0, arg_27_1)
		if LUI.IsLastInputGamepad(arg_27_1.controllerIndex) then
			arg_27_0.ArrowLeft:SetAlpha(0)
			arg_27_0.ArrowRight:SetAlpha(0)
			arg_27_0.leftShoulderButton:SetAlpha(1)
			arg_27_0.rightShoulderButton:SetAlpha(1)
			arg_27_0.RewardListArrowLeft:SetAlpha(0)
			arg_27_0.RewardListArrowRight:SetAlpha(0)
			var_0_1(arg_27_0, arg_27_0.leftTriggerButton, arg_27_0.rightTriggerButton)
		else
			arg_27_0.ArrowLeft:SetAlpha(1)
			arg_27_0.ArrowRight:SetAlpha(1)
			arg_27_0.leftShoulderButton:SetAlpha(0)
			arg_27_0.rightShoulderButton:SetAlpha(0)
			arg_27_0.leftTriggerButton:SetAlpha(0)
			arg_27_0.rightTriggerButton:SetAlpha(0)
			var_0_1(arg_27_0, arg_27_0.RewardListArrowLeft, arg_27_0.RewardListArrowRight)
		end

		if not arg_27_0.curFocusedPos then
			return
		end

		var_0_2(arg_27_0, arg_17_1, arg_27_0.curFocusedPos - 1, true)
	end

	arg_17_0:addAndCallEventHandler("update_input_type", var_17_17, {
		controllerIndex = arg_17_1
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_17_0, arg_17_1)
	ACTIONS.ScaleFullscreen(arg_17_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_17_0.TabBacker)
	arg_17_0:addEventHandler("update_display", function(arg_28_0, arg_28_1)
		local var_28_0 = math.floor(arg_28_1.index / var_0_0) * var_0_0

		arg_17_0.UnlockList:SetFocusedPosition({
			y = 0,
			x = var_28_0
		}, true)
	end)
end

function UnlocksMenu(arg_29_0, arg_29_1)
	local var_29_0 = LUI.UIElement.new()

	var_29_0.id = "UnlocksMenu"
	var_29_0._animationSets = var_29_0._animationSets or {}
	var_29_0._sequences = var_29_0._sequences or {}

	local var_29_1 = arg_29_1 and arg_29_1.controllerIndex

	if not var_29_1 and not Engine.DDJFBBJAIG() then
		var_29_1 = var_29_0:getRootController()
	end

	assert(var_29_1)
	var_0_9(var_29_0, var_29_1, arg_29_1)

	var_29_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_29_1
	})
	var_29_0.HelperBar.id = "HelperBar"

	var_29_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_29_0.HelperBar:setPriority(10)
	var_29_0:addElement(var_29_0.HelperBar)

	local var_29_2 = var_29_0
	local var_29_3
	local var_29_4 = {
		worldBlur = 1,
		controllerIndex = var_29_1
	}
	local var_29_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_29_4)

	var_29_5.id = "WorldBlur"

	var_29_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_29_0:addElement(var_29_5)

	var_29_0.WorldBlur = var_29_5

	local var_29_6
	local var_29_7 = LUI.UIImage.new()

	var_29_7.id = "Darken"

	var_29_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_29_7:SetAlpha(0.8, 0)
	var_29_0:addElement(var_29_7)

	var_29_0.Darken = var_29_7

	local var_29_8
	local var_29_9 = MenuBuilder.BuildRegisteredType("UnlocksRankPanel", {
		controllerIndex = var_29_1
	})

	var_29_9.id = "UnlocksRankPanel"

	var_29_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 225, _1080p * 1060)
	var_29_0:addElement(var_29_9)

	var_29_0.UnlocksRankPanel = var_29_9

	local var_29_10
	local var_29_11 = {
		scrollingThresholdX = 2,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 55,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_29_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ProgressionUnlockItem", {
				controllerIndex = var_29_1
			})
		end,
		refreshChild = function(arg_31_0, arg_31_1, arg_31_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 226,
		rowHeight = _1080p * 226,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_29_12 = LUI.UIGrid.new(var_29_11)

	var_29_12.id = "UnlockList"

	var_29_12:setUseStencil(true)
	var_29_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 538, _1080p * 1749, _1080p * 288, _1080p * 568)
	var_29_0:addElement(var_29_12)

	var_29_0.UnlockList = var_29_12

	local var_29_13
	local var_29_14 = MenuBuilder.BuildRegisteredType("RankProgressionSlot", {
		controllerIndex = var_29_1
	})

	var_29_14.id = "RankProgressionBar"

	var_29_14:SetScale(0.05, 0)
	var_29_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 630, _1080p * 1654, _1080p * 254, _1080p * 270)
	var_29_0:addElement(var_29_14)

	var_29_0.RankProgressionBar = var_29_14

	local var_29_15
	local var_29_16 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_29_1
	})

	var_29_16.id = "TabBacker"

	var_29_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_29_0:addElement(var_29_16)

	var_29_0.TabBacker = var_29_16

	local var_29_17
	local var_29_18 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_29_1
	})

	var_29_18.id = "MenuTitle"

	var_29_18.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/RANK_PROGRESSION"), 0)
	var_29_18.Line:SetLeft(0, 0)
	var_29_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_29_0:addElement(var_29_18)

	var_29_0.MenuTitle = var_29_18

	local var_29_19
	local var_29_20 = MenuBuilder.BuildRegisteredType("RankTab", {
		controllerIndex = var_29_1
	})

	var_29_20.id = "RankTabLeft"

	var_29_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 595, _1080p * 245, _1080p * 281)
	var_29_0:addElement(var_29_20)

	var_29_0.RankTabLeft = var_29_20

	local var_29_21
	local var_29_22 = MenuBuilder.BuildRegisteredType("RankTab", {
		controllerIndex = var_29_1
	})

	var_29_22.id = "RankTabRight"

	var_29_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1690, _1080p * 1760, _1080p * 245, _1080p * 281)
	var_29_0:addElement(var_29_22)

	var_29_0.RankTabRight = var_29_22

	local var_29_23
	local var_29_24 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_29_1
	})

	var_29_24.id = "ArrowLeft"

	var_29_24:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_29_24.Arrow:SetZRotation(90, 0)
	var_29_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 501, _1080p * 533, _1080p * 246, _1080p * 278)
	var_29_0:addElement(var_29_24)

	var_29_0.ArrowLeft = var_29_24

	local var_29_25
	local var_29_26 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_29_1
	})

	var_29_26.id = "ArrowRight"

	var_29_26:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_29_26.Arrow:SetZRotation(-90, 0)
	var_29_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1750, _1080p * 1782, _1080p * 246, _1080p * 278)
	var_29_0:addElement(var_29_26)

	var_29_0.ArrowRight = var_29_26

	local var_29_27
	local var_29_28 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_29_1
	})

	var_29_28.id = "LobbyMembersFooter"

	var_29_28:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_29_0:addElement(var_29_28)

	var_29_0.LobbyMembersFooter = var_29_28

	local var_29_29
	local var_29_30 = {
		scrollingThresholdX = 5,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_29_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZUnlocksLootItem", {
				controllerIndex = var_29_1
			})
		end,
		refreshChild = function(arg_33_0, arg_33_1, arg_33_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 230,
		rowHeight = _1080p * 309,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_29_31 = LUI.UIGrid.new(var_29_30)

	var_29_31.id = "UnlockRewardList"

	var_29_31:setUseStencil(false)
	var_29_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 538, _1080p * 1752, _1080p * 642, _1080p * 959)
	var_29_0:addElement(var_29_31)

	var_29_0.UnlockRewardList = var_29_31

	local var_29_32
	local var_29_33 = LUI.UIStyledText.new()

	var_29_33.id = "UnlockRewardListTitle"

	var_29_33:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_29_33:setText("", 0)
	var_29_33:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_29_33:SetWordWrap(false)
	var_29_33:SetAlignment(LUI.Alignment.Left)
	var_29_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 539, _1080p * 1039, _1080p * 606, _1080p * 630)
	var_29_0:addElement(var_29_33)

	var_29_0.UnlockRewardListTitle = var_29_33

	local var_29_34
	local var_29_35 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_29_1
	})

	var_29_35.id = "RewardListArrowRight"

	var_29_35.Arrow:SetZRotation(-90, 0)
	var_29_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1750, _1080p * 1782, _1080p * 784, _1080p * 816)
	var_29_0:addElement(var_29_35)

	var_29_0.RewardListArrowRight = var_29_35

	local var_29_36
	local var_29_37 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_29_1
	})

	var_29_37.id = "RewardListArrowLeft"

	var_29_37.Arrow:SetZRotation(90, 0)
	var_29_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 501, _1080p * 533, _1080p * 780, _1080p * 812)
	var_29_0:addElement(var_29_37)

	var_29_0.RewardListArrowLeft = var_29_37

	local var_29_38
	local var_29_39 = MenuBuilder.BuildRegisteredType("UnlocksMenuPips", {
		controllerIndex = var_29_1
	})

	var_29_39.id = "Pips"

	var_29_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1133, _1080p * 1154, _1080p * 982, _1080p * 989)
	var_29_0:addElement(var_29_39)

	var_29_0.Pips = var_29_39

	local var_29_40

	if CONDITIONS.InFrontendPublicMP() then
		local var_29_41 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_29_1
		})

		var_29_41.id = "MPPlayerDetails"

		var_29_41:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_29_0:addElement(var_29_41)

		var_29_0.MPPlayerDetails = var_29_41
	end

	local var_29_42

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_29_43 = MenuBuilder.BuildRegisteredType("WZTitleFilter", {
			controllerIndex = var_29_1
		})

		var_29_43.id = "WZTitleFilter"

		var_29_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 437, _1080p * 780, _1080p * 922)
		var_29_0:addElement(var_29_43)

		var_29_0.WZTitleFilter = var_29_43
	end

	local function var_29_44()
		return
	end

	var_29_0._sequences.DefaultSequence = var_29_44

	local var_29_45
	local var_29_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_35:RegisterAnimationSequence("HideRewardListScrolling", var_29_46)

	local var_29_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_29_37:RegisterAnimationSequence("HideRewardListScrolling", var_29_47)

	local function var_29_48()
		var_29_35:AnimateSequence("HideRewardListScrolling")
		var_29_37:AnimateSequence("HideRewardListScrolling")
	end

	var_29_0._sequences.HideRewardListScrolling = var_29_48

	var_29_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_29_49 = LUI.UIBindButton.new()

	var_29_49.id = "selfBindButton"

	var_29_0:addElement(var_29_49)

	var_29_0.bindButton = var_29_49

	var_29_0.bindButton:addEventHandler("button_secondary", function(arg_36_0, arg_36_1)
		if not arg_36_1.controller then
			local var_36_0 = var_29_1
		end

		ACTIONS.LeaveMenu(var_29_0)
	end)
	var_0_10(var_29_0, var_29_1, arg_29_1)

	return var_29_0
end

MenuBuilder.registerType("UnlocksMenu", UnlocksMenu)
LockTable(_M)
