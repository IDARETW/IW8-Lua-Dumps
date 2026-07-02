module(..., package.seeall)

local var_0_0 = 99 * _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		arg_1_0[iter_1_0].button.Image:setImage(RegisterMaterial(iter_1_1.icon))
		arg_1_0[iter_1_0].button:addEventHandler("button_action", arg_1_2)

		arg_1_0[iter_1_0].button.ref = iter_1_1.ref

		arg_1_0[iter_1_0].costLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", iter_1_1.kills))
		arg_1_0[iter_1_0].nameLabel:setText(Engine.CBBHFCGDIC(iter_1_1.name))

		arg_1_0[iter_1_0].name = iter_1_1.name
		arg_1_0[iter_1_0].kills = iter_1_1.kills
		arg_1_0[iter_1_0].scoreCost = iter_1_1.scoreCost
		arg_1_0[iter_1_0].desc = iter_1_1.desc

		arg_1_0[iter_1_0].button:Setup(iter_1_1)
	end
end

local function var_0_2(arg_2_0)
	local var_2_0 = ""

	if arg_2_0.showKills then
		var_2_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_SCORESTREAK_VALUES")
	else
		var_2_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_KILLSTREAK_VALUES")
	end

	arg_2_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 2,
		button_ref = "button_right_trigger",
		helper_text = var_2_0,
		container = arg_2_0.Prompts
	}, {
		replaceTop = true
	})

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.streakElements) do
		local var_2_1 = ""
		local var_2_2 = ""

		if arg_2_0.showKills then
			var_2_1 = Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tonumber(iter_2_1.kills))
			var_2_2 = Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tonumber(arg_2_0._options.selection.kills))
		else
			var_2_1 = iter_2_1.scoreCost
			var_2_2 = arg_2_0._options.selection.scoreCost
		end

		iter_2_1.costLabel:setText(var_2_1)
		arg_2_0.ChosenPreview.Kills:setText(var_2_2)
	end

	local var_2_3 = arg_2_0.streakElements[arg_2_0._currentIndex + 1].costLabel:getText()

	arg_2_0.SwapPreview.Kills:setText(var_2_3)
end

local function var_0_3(arg_3_0)
	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.BindButton)
	arg_3_0.BindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		ACTIONS.LeaveMenu(arg_3_0)
	end)
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 0,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_3_0.Prompts
	})
	arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT"),
		container = arg_3_0.Prompts
	})

	if CONDITIONS.ShowScorestreakValues() then
		arg_3_0.BindButton:addEventHandler("button_right_trigger", function(arg_5_0, arg_5_1)
			arg_3_0.showKills = not arg_3_0.showKills

			var_0_2(arg_3_0)
		end)

		local var_3_0 = ""

		if arg_3_0.showKills then
			var_3_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_SCORESTREAK_VALUES")
		else
			var_3_0 = Engine.CBBHFCGDIC("LUA_MENU/VIEW_KILLSTREAK_VALUES")
		end

		arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			priority = 2,
			button_ref = "button_right_trigger",
			helper_text = var_3_0,
			container = arg_3_0.Prompts
		}, {
			replaceTop = true
		})
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.SwapStreakButtons)
	assert(arg_6_2.streaks and #arg_6_2.streaks == 3)
	assert(arg_6_2.selection)
	assert(arg_6_2.onReplace)

	arg_6_0._options = arg_6_2
	arg_6_0.showKills = arg_6_2.showKills or not CONDITIONS.ShowScorestreakValues()

	arg_6_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/STREAK_REPLACE_MESSAGE", arg_6_2.selection.name))

	local var_6_0 = LAYOUT.GetElementWidth(arg_6_0.ChosenStreak)

	arg_6_0.ChosenStreak.Image:setImage(RegisterMaterial(arg_6_2.selection.icon))
	arg_6_0.ChosenStreak.Name:setText(Engine.CBBHFCGDIC(arg_6_2.selection.name))
	arg_6_0.ChosenPreview.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/STREAK_SWAP_EQUIP"))
	arg_6_0.ChosenPreview.Name:setText(Engine.CBBHFCGDIC(arg_6_2.selection.name))

	local var_6_1

	if arg_6_0.showKills then
		var_6_1 = Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tonumber(arg_6_2.selection.kills))
	else
		var_6_1 = arg_6_2.selection.scoreCost
	end

	arg_6_0.ChosenPreview.Kills:setText(var_6_1)
	arg_6_0.ChosenPreview.Desc:setText(Engine.CBBHFCGDIC(arg_6_2.selection.desc))
	ACTIONS.AnimateSequence(arg_6_0.ChosenStreak, "Swap")

	local function var_6_2(arg_7_0, arg_7_1)
		arg_6_2.onReplace(arg_7_0.ref)
		ACTIONS.LeaveMenu(arg_6_0)
	end

	arg_6_0.streakElements = {
		{},
		{},
		{}
	}

	arg_6_0.SwapStreakButtons:SetNumChildren(0)
	arg_6_0.SwapStreakButtons:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_6_0.SwapStreakButtons:GetContentIndex(arg_8_1, arg_8_2)

		arg_6_0.streakElements[arg_8_1 + 1].button = arg_8_0
		arg_6_0.streakElements[arg_8_1 + 1].costLabel = arg_8_0.Cost
		arg_6_0.streakElements[arg_8_1 + 1].nameLabel = arg_8_0.Name
	end)
	arg_6_0.SwapStreakButtons:SetNumChildren(3)
	arg_6_0.SwapStreakButtons:RefreshContent()
	var_0_1(arg_6_0.streakElements, arg_6_2.streaks, var_6_2)
	arg_6_0.SwapPreview.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/STREAK_SWAP_REPLACE"))
	arg_6_0.SwapPreview.Name:setText(Engine.CBBHFCGDIC(arg_6_0.streakElements[1].name))
	arg_6_0.SwapPreview.Kills:setText(arg_6_0.streakElements[1].kills)
	arg_6_0.SwapPreview.Desc:setText(Engine.CBBHFCGDIC(arg_6_0.streakElements[1].desc))

	arg_6_0._currentIndex = 0

	arg_6_0:registerEventHandler("preview_streak", function(arg_9_0, arg_9_1)
		arg_6_0._currentIndex = arg_6_0.SwapStreakButtons:GetFocusPositionIndex()

		local var_9_0 = 710 * _1080p + arg_6_0._currentIndex * (var_0_0 + var_6_0)
		local var_9_1 = var_9_0 + var_6_0

		if CONDITIONS.IsSplitscreen(arg_6_0) and CONDITIONS.InGame(arg_6_0) then
			arg_6_0.ChosenStreak:SetAnchorsAndPosition(0, 1, 0, 1, var_9_0, var_9_1, _1080p * 300, _1080p * 400)
		else
			arg_6_0.ChosenStreak:SetAnchorsAndPosition(0, 1, 0, 1, var_9_0, var_9_1, _1080p * 516, _1080p * 616)
		end

		arg_6_0.SwapPreview.Name:setText(Engine.CBBHFCGDIC(arg_9_1.streakData.name))

		local var_9_2

		if arg_6_0.showKills then
			var_9_2 = Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tonumber(arg_9_1.streakData.kills))
		else
			var_9_2 = arg_9_1.streakData.scoreCost
		end

		arg_6_0.SwapPreview.Kills:setText(var_9_2)
		arg_6_0.SwapPreview.Desc:setText(Engine.CBBHFCGDIC(arg_9_1.streakData.desc))
	end)
	var_0_3(arg_6_0)
	var_0_2(arg_6_0)

	arg_6_0.isQuickAccessShortcutsDisabled = true

	ACTIONS.ScaleFullscreen(arg_6_0.Darkener)
end

function StreakReplacePopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "StreakReplacePopup"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Darkener"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.8, 0)
	var_10_4:SetScale(1, 0)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_10_0:addElement(var_10_4)

	var_10_0.Darkener = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericPopupWindow"

	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 147, _1080p * 933)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericPopupWindow = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIText.new()

	var_10_8.id = "Title"

	var_10_8:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_10_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STREAK_REPLACE_TITLE")), 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_8:SetAlignment(LUI.Alignment.Center)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -539, _1080p * 539, _1080p * 163, _1080p * 223)
	var_10_0:addElement(var_10_8)

	var_10_0.Title = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "Message"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_10:setText(Engine.CBBHFCGDIC("LUA_MENU/STREAK_REPLACE_MESSAGE"), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -640, _1080p * 640, _1080p * 237, _1080p * 257)
	var_10_0:addElement(var_10_10)

	var_10_0.Message = var_10_10

	local var_10_11
	local var_10_12 = {
		scrollingThresholdX = 0,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SwapStreakButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 99,
		spacingY = _1080p * 99,
		columnWidth = _1080p * 100,
		rowHeight = _1080p * 100,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_13 = LUI.UIGrid.new(var_10_12)

	var_10_13.id = "SwapStreakButtons"

	var_10_13:setUseStencil(false)
	var_10_13:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 710, _1080p * -710, _1080p * 301, _1080p * 401)
	var_10_0:addElement(var_10_13)

	var_10_0.SwapStreakButtons = var_10_13

	local var_10_14
	local var_10_15 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_10_1
	})

	var_10_15.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_10_0) then
		var_10_15.Label:setText("ButtonPrompts", 0)
	end

	var_10_15:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -855, _1080p * -755, _1080p * 964, _1080p * 995)
	var_10_0:addElement(var_10_15)

	var_10_0.Prompts = var_10_15

	local var_10_16
	local var_10_17 = MenuBuilder.BuildRegisteredType("SwapStreakButton", {
		controllerIndex = var_10_1
	})

	var_10_17.id = "ChosenStreak"

	var_10_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 810, _1080p * 516, _1080p * 616)
	var_10_0:addElement(var_10_17)

	var_10_0.ChosenStreak = var_10_17

	local var_10_18
	local var_10_19 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_10_1
	})

	var_10_19.id = "ChosenPreview"

	var_10_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -460, _1080p * -60, _1080p * 661, _1080p * 901)
	var_10_0:addElement(var_10_19)

	var_10_0.ChosenPreview = var_10_19

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "SwapPreview"

	var_10_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 60, _1080p * 460, _1080p * 661, _1080p * 901)
	var_10_0:addElement(var_10_21)

	var_10_0.SwapPreview = var_10_21

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("StreakReplacePopup", StreakReplacePopup)
LockTable(_M)
