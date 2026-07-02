module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CallingCardChallengesDetailsPanel:UpdateDetailsForKeyboard(arg_1_1, arg_1_2.currentTier)
end

local function var_0_1(arg_2_0)
	local var_2_0 = arg_2_0.CallingCardGrid:GetFocusPositionIndex()

	if not var_2_0 then
		return
	end

	local var_2_1 = arg_2_0.CallingCardGrid:GetPositionForIndex(var_2_0)

	return arg_2_0.CallingCardGrid:GetElementAtPosition(var_2_1.x, var_2_1.y), var_2_0
end

local function var_0_2(arg_3_0)
	local var_3_0, var_3_1 = var_0_1(arg_3_0)
	local var_3_2 = 1

	if var_3_0 then
		var_3_2 = var_3_0.currentTier
	end

	local var_3_3 = arg_3_0._challengeTable[var_3_1 + 1]

	if var_3_3 then
		arg_3_0.CallingCardChallengesDetailsPanel:ShowChallenge(var_3_3, var_3_2)
	end
end

local function var_0_3(arg_4_0)
	arg_4_0.CallingCardGrid:processEvent({
		name = "lose_focus"
	})
	arg_4_0.CallingCardGrid:SetNumChildren(#arg_4_0._challengeTable)
	arg_4_0.CallingCardGrid:RefreshContent()
	arg_4_0.CallingCardGrid:processEvent({
		name = "gain_focus"
	})
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = 0
	local var_5_2 = 0

	for iter_5_0, iter_5_1 in pairs(arg_5_0._tabCategories) do
		var_5_1 = var_5_1 + 1

		table.insert(var_5_0, {
			name = Engine.CBBHFCGDIC(Challenge.StickerBookChallengeTypes[iter_5_0]),
			tabHeight = _1080p * 52,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				arg_5_0._challengeTable = Challenge.GetCallingCardMasterChallenges(arg_6_1, iter_5_0)

				var_0_3(arg_5_0)

				var_5_2 = Challenge.GetCompletedStickerBookChallengeOfTypeCount(arg_6_1, iter_5_0)

				arg_5_0.CategoryCompletionStatus:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_CATEGORY_COMPLETE", var_5_2, #arg_5_0._challengeTable))
			end
		})
	end

	arg_5_0.Tabs:SetTabs(var_5_0)
	arg_5_0.Tabs:SetAlignment(LUI.Alignment.Left)

	for iter_5_2 = 1, var_5_1 do
		local var_5_3 = arg_5_0.Tabs:GetTabAtIndex(iter_5_2)

		if var_5_3 then
			local var_5_4 = var_5_2 >= #arg_5_0._challengeTable

			var_5_3.CheckBox:SetAlpha(var_5_4 and 1 or 0)
			var_5_3.CheckBox:SetValue(var_5_4, true)
		end
	end
end

local function var_0_5(arg_7_0, arg_7_1)
	if arg_7_0.CallingCardChallengesDetailsPanel then
		arg_7_0.CallingCardChallengesDetailsPanel:EquipCallingCard(arg_7_1)
	end
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.PreviewChallenge = var_0_2
	arg_8_0.UpdateDetailsForKeyboard = var_0_0
	arg_8_0.EquipCurrentCallingCard = var_0_5
	arg_8_0.GetCurrentFocussedElement = var_0_1

	ACTIONS.ScaleFullscreen(arg_8_0.Darken)
	arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_TITLE"))

	local var_8_0 = Challenge.GetMasterChallengesCount()

	arg_8_0._tabCategories = Challenge.GetMasterChallengeCategories()

	if arg_8_0._tabCategories then
		var_0_4(arg_8_0, arg_8_1)
	else
		arg_8_0.Tabs:closeTree()

		arg_8_0.Tabs = nil
		arg_8_0._challengeTable = Challenge.GetCallingCardMasterChallenges(arg_8_1)
	end

	local var_8_1 = Challenge.GetCompletedStickerBookChallengeCount(arg_8_1)

	arg_8_0.ChallengeCompletionStatus:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_COMPLETION", var_8_1, var_8_0))
	arg_8_0.CallingCardGrid:SetRefreshChild(function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = arg_9_1 + arg_9_2 * arg_8_0.CallingCardGrid:GetNumColumns()
		local var_9_1 = arg_8_0._challengeTable[var_9_0 + 1]

		arg_9_0:SetChallengeData(arg_8_0, var_9_1)
		arg_9_0:SetProgressAlpha(1)
	end)
	var_0_3(arg_8_0)
	arg_8_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		ACTIONS.LeaveMenu(arg_8_0)
	end)
	arg_8_0:addEventHandler("menu_close", function(arg_11_0, arg_11_1)
		arg_8_0.CallingCardChallengesDetailsPanel:UpdatePlayerCardData(arg_8_1)
	end)
	LAYOUT.AddAspectRatioFadeFrame(arg_8_0, arg_8_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_8_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_8_0.Vignette)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_8_0, "WZSetup")
		LAYOUT.SetupScalingBackgroundVignette(arg_8_0)
	end
end

function MasterChallengesMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0.id = "MasterChallengesMenu"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = {
		worldBlur = 1,
		controllerIndex = var_12_1
	}
	local var_12_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_12_4)

	var_12_5.id = "WorldBlur"

	var_12_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_12_0:addElement(var_12_5)

	var_12_0.WorldBlur = var_12_5

	local var_12_6
	local var_12_7 = LUI.UIImage.new()

	var_12_7.id = "Darken"

	var_12_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_7:SetAlpha(0.5, 0)
	var_12_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * 1, 0, 0)
	var_12_0:addElement(var_12_7)

	var_12_0.Darken = var_12_7

	local var_12_8
	local var_12_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_12_1
	})

	var_12_9.id = "Vignette"

	var_12_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_12_0:addElement(var_12_9)

	var_12_0.Vignette = var_12_9

	local var_12_10
	local var_12_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_12_1
	})

	var_12_11.id = "TabBacker"

	var_12_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_12_0:addElement(var_12_11)

	var_12_0.TabBacker = var_12_11

	local var_12_12
	local var_12_13 = {
		spacing = 5,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTabWithTimer", {
				controllerIndex = var_12_1
			})
		end,
		controllerIndex = var_12_1
	}
	local var_12_14 = LUI.TabManager.new(var_12_13)

	var_12_14.id = "Tabs"

	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 154)
	var_12_0:addElement(var_12_14)

	var_12_0.Tabs = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "MenuTitle"

	var_12_16.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_TITLE"), 0)
	var_12_16.Line:SetLeft(0, 0)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_12_0:addElement(var_12_16)

	var_12_0.MenuTitle = var_12_16

	local var_12_17
	local var_12_18 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CallingCardMasterChallengeWidget", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_15_0, arg_15_1, arg_15_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 130,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_19 = LUI.UIGrid.new(var_12_18)

	var_12_19.id = "CallingCardGrid"

	var_12_19:setUseStencil(true)
	var_12_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1216, _1080p * 244, _1080p * 824)
	var_12_0:addElement(var_12_19)

	var_12_0.CallingCardGrid = var_12_19

	local var_12_20
	local var_12_21 = MenuBuilder.BuildRegisteredType("CallingCardChallengesDetailsPanel", {
		controllerIndex = var_12_1
	})

	var_12_21.id = "CallingCardChallengesDetailsPanel"

	var_12_21:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -653, _1080p * -93, _1080p * 229, _1080p * 899)
	var_12_0:addElement(var_12_21)

	var_12_0.CallingCardChallengesDetailsPanel = var_12_21

	local var_12_22
	local var_12_23 = LUI.UIText.new()

	var_12_23.id = "ChallengeCompletionStatus"

	var_12_23:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_23:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_COMPLETION"), 0)
	var_12_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_23:SetAlignment(LUI.Alignment.Right)
	var_12_23:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 119, _1080p * 143)
	var_12_0:addElement(var_12_23)

	var_12_0.ChallengeCompletionStatus = var_12_23

	local var_12_24
	local var_12_25 = LUI.UIText.new()

	var_12_25.id = "CategoryCompletionStatus"

	var_12_25:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_12_25:setText("", 0)
	var_12_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_25:SetAlignment(LUI.Alignment.Left)
	var_12_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 366, _1080p * 201, _1080p * 225)
	var_12_0:addElement(var_12_25)

	var_12_0.CategoryCompletionStatus = var_12_25

	local var_12_26
	local var_12_27 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_12_1
	})

	var_12_27.id = "PlayercardScrollbar"

	var_12_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1225, _1080p * 1241, _1080p * 244, _1080p * 824)
	var_12_0:addElement(var_12_27)

	var_12_0.PlayercardScrollbar = var_12_27

	local var_12_28
	local var_12_29 = LUI.UIImage.new()

	var_12_29.id = "GridDivider"

	var_12_29:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_12_29:SetAlpha(0.6, 0)
	var_12_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1216, _1080p * 230, _1080p * 231)
	var_12_0:addElement(var_12_29)

	var_12_0.GridDivider = var_12_29

	local function var_12_30()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_30

	local var_12_31
	local var_12_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_12_23:RegisterAnimationSequence("WZSetup", var_12_32)

	local function var_12_33()
		var_12_23:AnimateSequence("WZSetup")
	end

	var_12_0._sequences.WZSetup = var_12_33

	local var_12_34 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_12_27,
		startCap = var_12_27.startCap,
		endCap = var_12_27.endCap,
		sliderArea = var_12_27.sliderArea,
		slider = var_12_27.sliderArea and var_12_27.sliderArea.slider,
		fixedSizeSlider = var_12_27.sliderArea and var_12_27.sliderArea.fixedSizeSlider
	})

	var_12_19:AddScrollbar(var_12_34)
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_12_35 = LUI.UIBindButton.new()

	var_12_35.id = "selfBindButton"

	var_12_0:addElement(var_12_35)

	var_12_0.bindButton = var_12_35

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("MasterChallengesMenu", MasterChallengesMenu)
LockTable(_M)
