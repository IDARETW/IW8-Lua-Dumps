module(..., package.seeall)

local var_0_0 = 5
local var_0_1 = 2

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.RankProgressionBar:SetFocusedRankSlot(arg_1_1, arg_1_2)

	arg_1_0.curFocusedPos = arg_1_2 + 1

	arg_1_0.UnlocksLootPanel:UpdateUnlockData(arg_1_1, arg_1_0.unlockIDs, 0)
end

local function var_0_3(arg_2_0, arg_2_1)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/RANK_PROGRESSION"))

	local var_2_0 = StringTable.BFHCAIIDA(CSV.progressionItems.file)
	local var_2_1 = PROGRESSION.GetPlayerRank(arg_2_1)
	local var_2_2 = var_2_1 + 1 == var_2_0 and true or false
	local var_2_3 = PROGRESSION.GetRankBigIcon(var_2_1, 0)
	local var_2_4 = PROGRESSION.GetRankDisplay(var_2_1)
	local var_2_5 = PROGRESSION.GetRankName(var_2_1)
	local var_2_6 = var_2_2 and 1 or var_2_1 + 1
	local var_2_7

	var_2_7 = var_2_2 and 1 or PROGRESSION.GetRankDisplay(var_2_6)

	local var_2_8 = PROGRESSION.GetRankBigIcon(var_2_6, var_2_2 and 1 or 0)

	if not var_2_2 or not Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_VALUE", 1) then
		local var_2_9 = PROGRESSION.GetRankName(var_2_6)
	end

	arg_2_0.RankTabLeft:InitializeRankDisplay(0, 0)
	arg_2_0.RankTabRight:InitializeRankDisplay(var_2_0 - 1, 0)

	arg_2_0.curFocusedPos = var_2_1 + 1
	arg_2_0.maxRank = var_2_0
	arg_2_0.UnlockList.default = true

	arg_2_0.UnlockList:SetNumChildren(var_2_0)
	arg_2_0.UnlockList:SetSnapOnWrapEnabled(true)
	arg_2_0.UnlockList:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_2_0.UnlockList:GetContentIndex(arg_3_1, arg_3_2, {
			relativePosition = false
		})
		local var_3_1 = PROGRESSION.GetRankUnlocks(var_3_0)

		arg_3_0:InitUnlocks(arg_2_1, var_3_0, var_3_1)
	end)
	arg_2_0.UnlockList:processEvent({
		name = "gain_focus",
		controller = arg_2_1
	})

	arg_2_0:Wait(1).onComplete = function()
		arg_2_0.UnlockList:SetFocusedPosition({
			y = 0,
			x = var_2_1
		}, true)
	end

	arg_2_0.UnlockList:RefreshContent()
	arg_2_0.RankProgressionBar:SetRankProgressionSlot(arg_2_1, var_2_1)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0

	if arg_5_2 == "left" then
		var_5_0 = -1 * var_0_0
	elseif arg_5_2 == "right" then
		var_5_0 = var_0_0
	else
		return
	end

	local var_5_1 = arg_5_0:getParent()

	var_5_1.curFocusedPos = var_5_1.curFocusedPos + var_5_0

	if var_5_1.curFocusedPos > var_5_1.maxRank then
		var_5_1.curFocusedPos = 1
	elseif var_5_1.curFocusedPos < 1 then
		var_5_1.curFocusedPos = var_5_1.maxRank
	end

	var_5_1.UnlockList:SetFocusedPosition({
		y = 0,
		x = var_5_1.curFocusedPos - 1
	}, true)
	var_5_1.RankProgressionBar:SetFocusedRankSlot(arg_5_1, var_5_1.curFocusedPos - 1)
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0.bindButton = LUI.UIBindButton.new()
	arg_6_0.bindButton.id = "bindButton"

	arg_6_0:addElement(arg_6_0.bindButton)
	arg_6_0.bindButton:addEventHandler("button_shoulderr", function(arg_7_0, arg_7_1)
		var_0_4(arg_7_0, arg_6_1, "right")
	end)
	arg_6_0.bindButton:addEventHandler("button_shoulderl", function(arg_8_0, arg_8_1)
		var_0_4(arg_8_0, arg_6_1, "left")
	end)
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	PROGRESSION.PrestreamRankUnlocksIcons(arg_9_0, arg_9_1)
end

local function var_0_7(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)
	assert(arg_10_0.UnlockList)
	var_0_3(arg_10_0, arg_10_1)
	var_0_5(arg_10_0, arg_10_1)

	local var_10_0 = ButtonMap.button_shoulderl.string
	local var_10_1 = ButtonMap.button_shoulderr.string

	if arg_10_2.useTriggers then
		var_10_0 = ButtonMap.button_left_trigger.string
		var_10_1 = ButtonMap.button_right_trigger.string
	end

	local var_10_2
	local var_10_3 = {
		iconString = var_10_0
	}
	local var_10_4 = MenuBuilder.BuildRegisteredType("IconImage", var_10_3)

	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 550, _1080p * 586, _1080p * 184, _1080p * 220)
	var_10_4:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_10_4.id = "leftShoulderButton"

	arg_10_0:addElement(var_10_4)

	arg_10_0.leftShoulderButton = var_10_4

	local var_10_5
	local var_10_6 = {
		iconString = var_10_1
	}
	local var_10_7 = MenuBuilder.BuildRegisteredType("IconImage", var_10_6)

	var_10_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1784, _1080p * 1820, _1080p * 184, _1080p * 220)
	var_10_7:SetRGBFromTable(SWATCHES.tabManager.tabText)

	var_10_7.id = "rightShoulderButton"

	arg_10_0:addElement(var_10_7)

	arg_10_0.rightShoulderButton = var_10_7

	arg_10_0:registerEventHandler("display_unlocks_changed", function(arg_11_0, arg_11_1)
		arg_11_0.unlockIndex = 1
		arg_11_0.unlockIDs = arg_11_1.unlockIDs

		local var_11_0 = arg_11_1.rank

		var_0_2(arg_11_0, arg_10_1, var_11_0)
	end)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	arg_10_0.ArrowLeft:addEventHandler("leftmouseup", function(arg_12_0, arg_12_1)
		if arg_12_1.inside then
			var_0_4(arg_12_0, arg_10_1, "left")
		end
	end)
	arg_10_0.ArrowRight:addEventHandler("leftmouseup", function(arg_13_0, arg_13_1)
		if arg_13_1.inside then
			var_0_4(arg_13_0, arg_10_1, "right")
		end
	end)

	local function var_10_8(arg_14_0, arg_14_1)
		if LUI.IsLastInputGamepad(arg_14_1.controllerIndex) then
			arg_14_0.ArrowLeft:SetAlpha(0)
			arg_14_0.ArrowRight:SetAlpha(0)
			arg_14_0.leftShoulderButton:SetAlpha(1)
			arg_14_0.rightShoulderButton:SetAlpha(1)
		else
			arg_14_0.ArrowLeft:SetAlpha(1)
			arg_14_0.ArrowRight:SetAlpha(1)
			arg_14_0.leftShoulderButton:SetAlpha(0)
			arg_14_0.rightShoulderButton:SetAlpha(0)
		end
	end

	arg_10_0:addAndCallEventHandler("update_input_type", var_10_8, {
		controllerIndex = arg_10_1
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
	ACTIONS.ScaleFullscreen(arg_10_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)
end

function UnlocksMenu(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0.id = "UnlocksMenu"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)
	var_0_6(var_15_0, var_15_1, arg_15_1)

	var_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})
	var_15_0.HelperBar.id = "HelperBar"

	var_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_15_0.HelperBar:setPriority(10)
	var_15_0:addElement(var_15_0.HelperBar)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = {
		worldBlur = 1,
		controllerIndex = var_15_1
	}
	local var_15_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_15_4)

	var_15_5.id = "WorldBlur"

	var_15_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_15_0:addElement(var_15_5)

	var_15_0.WorldBlur = var_15_5

	local var_15_6
	local var_15_7 = LUI.UIImage.new()

	var_15_7.id = "Darken"

	var_15_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_7:SetAlpha(0.5, 0)
	var_15_0:addElement(var_15_7)

	var_15_0.Darken = var_15_7

	local var_15_8
	local var_15_9 = MenuBuilder.BuildRegisteredType("UnlocksRankPanel", {
		controllerIndex = var_15_1
	})

	var_15_9.id = "UnlocksRankPanel"

	var_15_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 191, _1080p * 979)
	var_15_0:addElement(var_15_9)

	var_15_0.UnlocksRankPanel = var_15_9

	local var_15_10
	local var_15_11 = MenuBuilder.BuildRegisteredType("UnlocksLootPanel", {
		controllerIndex = var_15_1
	})

	var_15_11.id = "UnlocksLootPanel"

	var_15_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 550, _1080p * 1820, _1080p * 503, _1080p * 979)
	var_15_0:addElement(var_15_11)

	var_15_0.UnlocksLootPanel = var_15_11

	local var_15_12
	local var_15_13 = {
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
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ProgressionUnlockItem", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 260,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_14 = LUI.UIGrid.new(var_15_13)

	var_15_14.id = "UnlockList"

	var_15_14:setUseStencil(true)
	var_15_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 550, _1080p * 1820, _1080p * 228, _1080p * 503)
	var_15_0:addElement(var_15_14)

	var_15_0.UnlockList = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("RankProgressionSlot", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "RankProgressionBar"

	var_15_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 673, _1080p * 1697, _1080p * 194, _1080p * 211)
	var_15_0:addElement(var_15_16)

	var_15_0.RankProgressionBar = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "TabBacker"

	var_15_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_15_0:addElement(var_15_18)

	var_15_0.TabBacker = var_15_18

	local var_15_19
	local var_15_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_15_1
	})

	var_15_20.id = "MenuTitle"

	var_15_20.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/RANK_PROGRESSION"), 0)
	var_15_20.Line:SetLeft(0, 0)
	var_15_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_15_0:addElement(var_15_20)

	var_15_0.MenuTitle = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("RankTab", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "RankTabLeft"

	var_15_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 609, _1080p * 679, _1080p * 185, _1080p * 221)
	var_15_0:addElement(var_15_22)

	var_15_0.RankTabLeft = var_15_22

	local var_15_23
	local var_15_24 = MenuBuilder.BuildRegisteredType("RankTab", {
		controllerIndex = var_15_1
	})

	var_15_24.id = "RankTabRight"

	var_15_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1702, _1080p * 1772, _1080p * 185, _1080p * 221)
	var_15_0:addElement(var_15_24)

	var_15_0.RankTabRight = var_15_24

	local var_15_25
	local var_15_26 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_15_1
	})

	var_15_26.id = "ArrowLeft"

	var_15_26:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_15_26.Arrow:SetZRotation(90, 0)
	var_15_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 565, _1080p * 597, _1080p * 189, _1080p * 221)
	var_15_0:addElement(var_15_26)

	var_15_0.ArrowLeft = var_15_26

	local var_15_27
	local var_15_28 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_15_1
	})

	var_15_28.id = "ArrowRight"

	var_15_28:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_15_28.Arrow:SetZRotation(-90, 0)
	var_15_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1777, _1080p * 1809, _1080p * 189, _1080p * 221)
	var_15_0:addElement(var_15_28)

	var_15_0.ArrowRight = var_15_28

	local var_15_29
	local var_15_30 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_15_1
	})

	var_15_30.id = "LobbyMembersFooter"

	var_15_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_15_0:addElement(var_15_30)

	var_15_0.LobbyMembersFooter = var_15_30

	local function var_15_31()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_31

	local function var_15_32()
		return
	end

	var_15_0._sequences.Icon1x1 = var_15_32

	local function var_15_33()
		return
	end

	var_15_0._sequences.Icon2x1 = var_15_33

	local var_15_34
	local var_15_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("Intro", var_15_35)

	local function var_15_36()
		var_15_14:AnimateSequence("Intro")
	end

	var_15_0._sequences.Intro = var_15_36

	var_15_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_15_37 = LUI.UIBindButton.new()

	var_15_37.id = "selfBindButton"

	var_15_0:addElement(var_15_37)

	var_15_0.bindButton = var_15_37

	var_15_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_15_1
		end

		ACTIONS.LeaveMenu(var_15_0)
	end)
	var_0_7(var_15_0, var_15_1, arg_15_1)
	ACTIONS.AnimateSequence(var_15_0, "Intro")

	return var_15_0
end

MenuBuilder.registerType("UnlocksMenu", UnlocksMenu)
LockTable(_M)
