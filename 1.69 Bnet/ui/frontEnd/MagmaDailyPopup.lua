module(..., package.seeall)

local var_0_0 = 3

local function var_0_1(arg_1_0)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0._BRChallenges = Challenge.GetBRDailyChallenges(arg_2_1)
	arg_2_0._coreChallenges = Challenge.GetDailyChallenges(arg_2_1)
	arg_2_0._CPChallenges = Challenge.GetCPDailyChallenges(arg_2_1)

	if arg_2_0._BRChallenges and #arg_2_0._BRChallenges > 0 and not Engine.CHDGBEFDHB() and not Engine.CHBHFFFIGH() and not Engine.EAABDHIDFJ() then
		Challenge.SortByLength(arg_2_0._BRChallenges)

		local var_2_0 = math.min(#arg_2_0._BRChallenges, var_0_0)

		arg_2_0.Challenges1:SetNumRows(var_2_0)
		arg_2_0.Challenges1:SetNumColumns(1)
		arg_2_0.Challenges1:RefreshContent()
	else
		arg_2_0.Challenges1:SetNumRows(0)
		arg_2_0.Challenges1:SetNumColumns(0)
		arg_2_0.Challenges1:RefreshContent()
	end

	if arg_2_0._coreChallenges and #arg_2_0._coreChallenges > 0 then
		Challenge.SortByLength(arg_2_0._coreChallenges)

		local var_2_1 = math.min(#arg_2_0._coreChallenges, var_0_0)

		arg_2_0.Challenges2:SetNumRows(var_2_1)
		arg_2_0.Challenges2:SetNumColumns(1)
		arg_2_0.Challenges2:RefreshContent()
	else
		arg_2_0.Challenges2:SetNumRows(0)
		arg_2_0.Challenges2:SetNumColumns(0)
		arg_2_0.Challenges2:RefreshContent()
	end

	if arg_2_0._CPChallenges and #arg_2_0._CPChallenges > 0 then
		Challenge.SortByLength(arg_2_0._CPChallenges)

		local var_2_2 = math.min(#arg_2_0._CPChallenges, var_0_0)

		arg_2_0.Challenges3:SetNumRows(var_2_2)
		arg_2_0.Challenges3:SetNumColumns(1)
		arg_2_0.Challenges3:RefreshContent()
	else
		arg_2_0.Challenges3:SetNumRows(0)
		arg_2_0.Challenges3:SetNumColumns(0)
		arg_2_0.Challenges3:RefreshContent()
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Challenges1:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0._BRChallenges[arg_4_2 + 1]

		arg_4_0:SetData(var_4_0)
	end)
	arg_3_0.Challenges2:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_3_0._coreChallenges[arg_5_2 + 1]

		arg_5_0:SetData(var_5_0)
	end)
	arg_3_0.Challenges3:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = arg_3_0._CPChallenges[arg_6_2 + 1]

		arg_6_0:SetData(var_6_0)
	end)
	var_0_2(arg_3_0, arg_3_1)
	Challenge.SetupDailyResetTimer(arg_3_0.ChallengeResetTimer, arg_3_0.ChallengeResetTimer.Text, true)
	arg_3_0.ChallengeResetTimer:SetupLeftAlignment()

	local function var_3_0()
		Challenge.SetSeenDailyPopup(arg_3_1)
		LUI.FlowManager.RequestLeaveMenu(arg_3_0, true, false)
	end

	arg_3_0.ContinueButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		var_3_0()
	end)

	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.BindButton)
	arg_3_0.BindButton:addEventHandler("button_primary", function(arg_9_0, arg_9_1)
		var_3_0()
	end)
	ACTIONS.ScaleFullscreen(arg_3_0.Background)
	var_0_1(arg_3_0)
	arg_3_0:addEventHandler("new_daily_challenges", function(arg_10_0, arg_10_1)
		var_0_2(arg_10_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("new_br_daily_challenges", function(arg_11_0, arg_11_1)
		var_0_2(arg_11_0, arg_3_1)
	end)
	arg_3_0:addEventHandler("new_cp_daily_challenges", function(arg_12_0, arg_12_1)
		var_0_2(arg_12_0, arg_3_1)
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

function MagmaDailyPopup(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "MagmaDailyPopup"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Background"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.9, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Background = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "GenericPopupWindow"

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_13_6.BotBorderWZ:SetTop(_1080p * -2, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_13_6.TopBorderWZ:SetBottom(_1080p * 2, 0)
	end

	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -399, _1080p * 397)
	var_13_0:addElement(var_13_6)

	var_13_0.GenericPopupWindow = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIText.new()

	var_13_8.id = "Title"

	var_13_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_13_8:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES")), 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_13_8:SetAlignment(LUI.Alignment.Center)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -377, _1080p * -317)
	var_13_0:addElement(var_13_8)

	var_13_0.Title = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_13_0) then
		var_13_10.Label:setText("ButtonPrompts", 0)
	end

	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * 430, _1080p * 461)
	var_13_0:addElement(var_13_10)

	var_13_0.Prompts = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "ChallengeResetTimer"

	var_13_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 146, _1080p * 224, _1080p * -360, _1080p * -330)
	var_13_0:addElement(var_13_12)

	var_13_0.ChallengeResetTimer = var_13_12

	local var_13_13
	local var_13_14 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_13_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
				controllerIndex = var_13_1
			})
		end,
		refreshChild = function(arg_15_0, arg_15_1, arg_15_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 514,
		rowHeight = _1080p * 165,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_13_15 = LUI.UIGrid.new(var_13_14)

	var_13_15.id = "Challenges1"

	var_13_15:setUseStencil(false)
	var_13_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -818, _1080p * -304, _1080p * -242, _1080p * 380)
	var_13_0:addElement(var_13_15)

	var_13_0.Challenges1 = var_13_15

	local var_13_16 = _1080p * -245
	local var_13_17 = _1080p * 379
	local var_13_18 = _1080p * 259
	local var_13_19

	if CONDITIONS.IsLazeOrOutrun() then
		var_13_19 = _1080p * -955
	else
		var_13_19 = _1080p * -255
	end

	local var_13_20
	local var_13_21 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_13_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
				controllerIndex = var_13_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 514,
		rowHeight = _1080p * 165,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_13_22 = LUI.UIGrid.new(var_13_21)

	var_13_22.id = "Challenges2"

	var_13_22:setUseStencil(false)
	var_13_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_13_19, var_13_18, var_13_16, var_13_17)
	var_13_0:addElement(var_13_22)

	var_13_0.Challenges2 = var_13_22

	local var_13_23 = _1080p * -245
	local var_13_24 = _1080p * 379
	local var_13_25 = _1080p * 821
	local var_13_26

	if CONDITIONS.IsLazeOrOutrun() then
		var_13_26 = _1080p * -87
	else
		var_13_26 = _1080p * 307
	end

	local var_13_27
	local var_13_28 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_13_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ChallengePopupDetails", {
				controllerIndex = var_13_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 514,
		rowHeight = _1080p * 165,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_13_29 = LUI.UIGrid.new(var_13_28)

	var_13_29.id = "Challenges3"

	var_13_29:setUseStencil(false)
	var_13_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_13_26, var_13_25, _1080p * -245, _1080p * 379)
	var_13_0:addElement(var_13_29)

	var_13_0.Challenges3 = var_13_29

	local var_13_30
	local var_13_31

	if CONDITIONS.IsLazeOrOutrun() then
		var_13_30 = _1080p * -605
		var_13_31 = _1080p * -90
	else
		var_13_30 = _1080p * -255
		var_13_31 = _1080p * 259
	end

	local var_13_32
	local var_13_33 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_13_1
	})

	var_13_33.id = "MPHeader"

	var_13_33.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_13_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_13_30, var_13_31, _1080p * -300, _1080p * -260)
	var_13_0:addElement(var_13_33)

	var_13_0.MPHeader = var_13_33

	local var_13_34
	local var_13_35 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_35.id = "ContinueButton"

	var_13_35.Text:SetLeft(_1080p * 20, 0)
	var_13_35.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
	var_13_35.Text:SetAlignment(LUI.Alignment.Center)
	var_13_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 325, _1080p * 361)
	var_13_0:addElement(var_13_35)

	var_13_0.ContinueButton = var_13_35

	if not CONDITIONS.IsLazeOrOutrun() then
		local var_13_36
		local var_13_37 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
			controllerIndex = var_13_1
		})

		var_13_37.id = "WZHeader"

		var_13_37.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE_CAPS"), 0)
		var_13_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -818, _1080p * -294, _1080p * -300, _1080p * -260)
		var_13_0:addElement(var_13_37)

		var_13_0.WZHeader = var_13_37
	end

	local var_13_38
	local var_13_39

	if CONDITIONS.IsLazeOrOutrun() then
		var_13_38 = _1080p * 107
		var_13_39 = _1080p * 625
	else
		var_13_38 = _1080p * 507
		var_13_39 = _1080p * 832
	end

	local var_13_40
	local var_13_41 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_13_1
	})

	var_13_41.id = "CPHeader"

	var_13_41.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/COOP_OPERATIONS_CAPS"), 0)
	var_13_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_13_38, var_13_39, _1080p * -300, _1080p * -260)
	var_13_0:addElement(var_13_41)

	var_13_0.CPHeader = var_13_41

	local function var_13_42()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_42

	local function var_13_43()
		return
	end

	var_13_0._sequences.Display1 = var_13_43

	local function var_13_44()
		return
	end

	var_13_0._sequences.Display2 = var_13_44

	local function var_13_45()
		return
	end

	var_13_0._sequences.Display3 = var_13_45

	local var_13_46
	local var_13_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -378
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -318
		}
	}

	var_13_8:RegisterAnimationSequence("AR", var_13_47)

	local var_13_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 223
		}
	}

	var_13_12:RegisterAnimationSequence("AR", var_13_48)

	local function var_13_49()
		var_13_8:AnimateSequence("AR")
		var_13_12:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_49

	local var_13_50
	local var_13_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_13_8:RegisterAnimationSequence("WZWipSetup", var_13_51)

	local function var_13_52()
		var_13_8:AnimateSequence("WZWipSetup")
	end

	var_13_0._sequences.WZWipSetup = var_13_52

	var_0_3(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("MagmaDailyPopup", MagmaDailyPopup)
LockTable(_M)
