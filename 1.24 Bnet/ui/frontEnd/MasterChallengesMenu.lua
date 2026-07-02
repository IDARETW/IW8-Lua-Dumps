module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CallingCardChallengesDetailsPanel:UpdateDetailsForKeyboard(arg_1_1, arg_1_2.currentTier)
	arg_1_2:UpdatePipsData()
end

local function var_0_1(arg_2_0)
	local var_2_0 = arg_2_0.CallingCardGrid:GetFocusPositionIndex()

	if not var_2_0 then
		return
	end

	local var_2_1 = arg_2_0.CallingCardGrid:GetPositionForIndex(var_2_0)
	local var_2_2 = arg_2_0.CallingCardGrid:GetElementAtPosition(var_2_1.x, var_2_1.y)
	local var_2_3 = 1

	if var_2_2 then
		var_2_3 = var_2_2.currentTier
	end

	local var_2_4 = arg_2_0._challengeTable[var_2_0 + 1]

	if var_2_4 then
		arg_2_0.CallingCardChallengesDetailsPanel:ShowChallenge(var_2_4, var_2_3)
	end
end

local function var_0_2(arg_3_0)
	arg_3_0.CallingCardGrid:processEvent({
		name = "lose_focus"
	})
	arg_3_0.CallingCardGrid:SetNumChildren(#arg_3_0._challengeTable)
	arg_3_0.CallingCardGrid:RefreshContent()
	arg_3_0.CallingCardGrid:processEvent({
		name = "gain_focus"
	})
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = 0
	local var_4_2 = 0

	for iter_4_0, iter_4_1 in pairs(arg_4_0._tabCategories) do
		var_4_1 = var_4_1 + 1

		table.insert(var_4_0, {
			name = Engine.CBBHFCGDIC(Challenge.StickerBookChallengeTypes[iter_4_0]),
			tabHeight = _1080p * 52,
			focusFunction = function(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
				arg_4_0._challengeTable = Challenge.GetCallingCardMasterChallenges(arg_5_1, iter_4_0)

				var_0_2(arg_4_0)

				var_4_2 = Challenge.GetCompletedStickerBookChallengeOfTypeCount(arg_5_1, iter_4_0)

				arg_4_0.CategoryCompletionStatus:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_CATEGORY_COMPLETE", var_4_2, #arg_4_0._challengeTable))
			end
		})
	end

	arg_4_0.Tabs:SetTabs(var_4_0)
	arg_4_0.Tabs:SetAlignment(LUI.Alignment.Left)

	for iter_4_2 = 1, var_4_1 do
		local var_4_3 = arg_4_0.Tabs:GetTabAtIndex(iter_4_2)

		if var_4_3 then
			local var_4_4 = var_4_2 >= #arg_4_0._challengeTable

			var_4_3.CheckBox:SetAlpha(var_4_4 and 1 or 0)
			var_4_3.CheckBox:SetValue(var_4_4, true)
		end
	end
end

local function var_0_4(arg_6_0, arg_6_1)
	if arg_6_0.CallingCardChallengesDetailsPanel then
		arg_6_0.CallingCardChallengesDetailsPanel:EquipCallingCard(arg_6_1)
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.PreviewChallenge = var_0_1
	arg_7_0.UpdateDetailsForKeyboard = var_0_0
	arg_7_0.EquipCurrentCallingCard = var_0_4

	ACTIONS.ScaleFullscreen(arg_7_0.Darken)
	ACTIONS.ScaleFullscreen(arg_7_0.TabBacker)
	arg_7_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_TITLE"))

	local var_7_0 = Challenge.GetMasterChallengesCount()

	arg_7_0._tabCategories = Challenge.GetMasterChallengeCategories()

	if arg_7_0._tabCategories then
		var_0_3(arg_7_0, arg_7_1)
	else
		arg_7_0.Tabs:closeTree()

		arg_7_0.Tabs = nil
		arg_7_0._challengeTable = Challenge.GetCallingCardMasterChallenges(arg_7_1)
	end

	local var_7_1 = Challenge.GetCompletedStickerBookChallengeCount(arg_7_1)

	arg_7_0.ChallengeCompletionStatus:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_COMPLETION", var_7_1, var_7_0))
	arg_7_0.CallingCardGrid:SetRefreshChild(function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = arg_8_1 + arg_8_2 * arg_7_0.CallingCardGrid:GetNumColumns()
		local var_8_1 = arg_7_0._challengeTable[var_8_0 + 1]

		arg_8_0:SetChallengeData(arg_7_0, var_8_1)
	end)
	var_0_2(arg_7_0)
	arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		ACTIONS.LeaveMenu(arg_7_0)
	end)
	arg_7_0:addEventHandler("menu_close", function(arg_10_0, arg_10_1)
		arg_7_0.CallingCardChallengesDetailsPanel:UpdatePlayerCardData(arg_7_1)
	end)
end

function MasterChallengesMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "MasterChallengesMenu"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = {
		worldBlur = 1,
		controllerIndex = var_11_1
	}
	local var_11_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_11_4)

	var_11_5.id = "WorldBlur"

	var_11_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_11_0:addElement(var_11_5)

	var_11_0.WorldBlur = var_11_5

	local var_11_6
	local var_11_7 = LUI.UIImage.new()

	var_11_7.id = "Darken"

	var_11_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_7:SetAlpha(0.5, 0)
	var_11_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 1, _1080p * 1, 0, 0)
	var_11_0:addElement(var_11_7)

	var_11_0.Darken = var_11_7

	local var_11_8
	local var_11_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_11_1
	})

	var_11_9.id = "TabBacker"

	var_11_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_11_0:addElement(var_11_9)

	var_11_0.TabBacker = var_11_9

	local var_11_10
	local var_11_11 = {
		spacing = 0,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTabWithTimer", {
				controllerIndex = var_11_1
			})
		end,
		controllerIndex = var_11_1
	}
	local var_11_12 = LUI.TabManager.new(var_11_11)

	var_11_12.id = "Tabs"

	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 996, _1080p * 108, _1080p * 154)
	var_11_0:addElement(var_11_12)

	var_11_0.Tabs = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "MenuTitle"

	var_11_14.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGES_TITLE"), 0)
	var_11_14.Line:SetLeft(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_14)

	var_11_0.MenuTitle = var_11_14

	local var_11_15
	local var_11_16 = {
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
		controllerIndex = var_11_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CallingCardMasterChallengeWidget", {
				controllerIndex = var_11_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 130,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_11_17 = LUI.UIGrid.new(var_11_16)

	var_11_17.id = "CallingCardGrid"

	var_11_17:setUseStencil(true)
	var_11_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1216, _1080p * 244, _1080p * 824)
	var_11_0:addElement(var_11_17)

	var_11_0.CallingCardGrid = var_11_17

	local var_11_18
	local var_11_19 = MenuBuilder.BuildRegisteredType("CallingCardChallengesDetailsPanel", {
		controllerIndex = var_11_1
	})

	var_11_19.id = "CallingCardChallengesDetailsPanel"

	var_11_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -637, _1080p * -77, _1080p * 170, _1080p * 840)
	var_11_0:addElement(var_11_19)

	var_11_0.CallingCardChallengesDetailsPanel = var_11_19

	local var_11_20
	local var_11_21 = LUI.UIText.new()

	var_11_21.id = "ChallengeCompletionStatus"

	var_11_21:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_11_21:setText(Engine.CBBHFCGDIC("CHALLENGE/MASTER_CHALLENGE_COMPLETION"), 0)
	var_11_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_21:SetAlignment(LUI.Alignment.Right)
	var_11_21:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 119, _1080p * 143)
	var_11_0:addElement(var_11_21)

	var_11_0.ChallengeCompletionStatus = var_11_21

	local var_11_22
	local var_11_23 = LUI.UIText.new()

	var_11_23.id = "CategoryCompletionStatus"

	var_11_23:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_11_23:setText("", 0)
	var_11_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_23:SetAlignment(LUI.Alignment.Left)
	var_11_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 102, _1080p * 366, _1080p * 201, _1080p * 225)
	var_11_0:addElement(var_11_23)

	var_11_0.CategoryCompletionStatus = var_11_23

	local var_11_24
	local var_11_25 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_11_1
	})

	var_11_25.id = "PlayercardScrollbar"

	var_11_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1225, _1080p * 1241, _1080p * 244, _1080p * 824)
	var_11_0:addElement(var_11_25)

	var_11_0.PlayercardScrollbar = var_11_25

	local var_11_26
	local var_11_27 = LUI.UIImage.new()

	var_11_27.id = "GridDivider"

	var_11_27:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_27:SetAlpha(0.6, 0)
	var_11_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1216, _1080p * 230, _1080p * 231)
	var_11_0:addElement(var_11_27)

	var_11_0.GridDivider = var_11_27

	local var_11_28 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_11_25,
		startCap = var_11_25.startCap,
		endCap = var_11_25.endCap,
		sliderArea = var_11_25.sliderArea,
		slider = var_11_25.sliderArea and var_11_25.sliderArea.slider,
		fixedSizeSlider = var_11_25.sliderArea and var_11_25.sliderArea.fixedSizeSlider
	})

	var_11_17:AddScrollbar(var_11_28)
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_11_29 = LUI.UIBindButton.new()

	var_11_29.id = "selfBindButton"

	var_11_0:addElement(var_11_29)

	var_11_0.bindButton = var_11_29

	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("MasterChallengesMenu", MasterChallengesMenu)
LockTable(_M)
