module(..., package.seeall)

local function var_0_0(arg_1_0)
	for iter_1_0 = 1, #arg_1_0._indexedButtons do
		local var_1_0 = arg_1_0._indexedButtons[iter_1_0]

		var_1_0.child.Selected:SetEquipped(var_1_0.isSelected)
	end

	local var_1_1 = #arg_1_0._selectedIndices
	local var_1_2 = Engine.JCBDICCAH(tostring(var_1_1))
	local var_1_3 = Engine.JCBDICCAH(tostring(CLANS.MAX_CLAN_SEARCH_LABELS))

	arg_1_0.SearchListDesc:setText(Engine.CBBHFCGDIC("CLANS/SELECT_LABELS", var_1_2, var_1_3))
	arg_1_0.EmptySearchLabels:SetAlpha(var_1_1 <= 0 and 1 or 0)
	arg_1_0.CurrentLabelsGrid:SetNumChildren(var_1_1)
	arg_1_0.CurrentLabelsGrid:RefreshContent()
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = {}

	for iter_2_0 = 1, #arg_2_0._indexedButtons do
		local var_2_1 = arg_2_0._indexedButtons[iter_2_0]

		if var_2_1.isSelected then
			table.insert(var_2_0, var_2_1)
		end
	end

	table.sort(var_2_0, function(arg_3_0, arg_3_1)
		return arg_3_0.lastUpdatedTime > arg_3_1.lastUpdatedTime
	end)

	arg_2_0._selectedIndices = {}

	for iter_2_1 = 1, #var_2_0 do
		local var_2_2 = var_2_0[iter_2_1]

		if iter_2_1 > CLANS.MAX_CLAN_SEARCH_LABELS then
			var_2_2.isSelected = false
		else
			arg_2_0._selectedIndices[iter_2_1] = var_2_2.index
		end
	end

	local var_2_3 = {}

	for iter_2_2 = 1, #arg_2_0._selectedIndices do
		table.insert(var_2_3, CLANS.CLAN_LABEL_KEYS[arg_2_0._selectedIndices[iter_2_2]])
	end

	Clans2.JAICIFIHC(arg_2_0._controllerIndex, arg_2_0._clanId, var_2_3)
end

local function var_0_2(arg_4_0, arg_4_1)
	if arg_4_1 == 1 then
		for iter_4_0 = 1, #arg_4_0._indexedButtons do
			local var_4_0 = arg_4_0._indexedButtons[iter_4_0]

			var_4_0.isSelected = false
			var_4_0.lastUpdatedTime = Engine.BFBIDEGDFB()
			arg_4_0._indexedButtons[iter_4_0] = var_4_0
		end
	else
		local var_4_1 = arg_4_0._indexedButtons[arg_4_1]

		var_4_1.isSelected = not var_4_1.isSelected
		var_4_1.lastUpdatedTime = Engine.BFBIDEGDFB()
		arg_4_0._indexedButtons[arg_4_1] = var_4_1
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_3 + arg_5_2 + 1
	local var_5_1 = CLANS.CLAN_LABEL_STRINGS[CLANS.CLAN_LABEL_KEYS[var_5_0]]
	local var_5_2 = arg_5_0._indexedButtons[var_5_0]

	var_5_2.child = arg_5_1
	arg_5_0._indexedButtons[var_5_0] = var_5_2

	arg_5_1.Text:setText(Engine.CBBHFCGDIC(var_5_1))
	arg_5_1:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_0_2(arg_5_0, var_5_0)
		var_0_1(arg_5_0, var_5_0)
		var_0_0(arg_5_0)
	end)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	ACTIONS.AnimateSequence(arg_7_1, "CenterText")

	local var_7_0 = arg_7_3 + arg_7_2 + 1
	local var_7_1 = arg_7_0._selectedIndices[var_7_0]
	local var_7_2 = CLANS.CLAN_LABEL_STRINGS[CLANS.CLAN_LABEL_KEYS[var_7_1]]

	arg_7_1.Label:setText(Engine.CBBHFCGDIC(var_7_2))
end

local function var_0_5(arg_8_0)
	local var_8_0 = tostring(CLANS.MAX_CLAN_SEARCH_LABELS)
	local var_8_1 = tostring(arg_8_0._selectedLabelCount)

	arg_8_0.SearchListDesc:setText(Engine.CBBHFCGDIC("CLANS/SELECT_LABELS", var_8_1, var_8_0))
	arg_8_0.SearchLabelTitle:setText(Engine.CBBHFCGDIC("CLANS/EDIT_CLAN_SEARCH_LABEL", var_8_0))
	arg_8_0.SearchLabelDesc:setText(Engine.CBBHFCGDIC("CLANS/EDIT_CLAN_SEARCH_LABEL_DESC", var_8_0))
end

local function var_0_6(arg_9_0)
	if LUI.IsLastInputGamepad(arg_9_0._controllerIndex) then
		arg_9_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_9_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_7(arg_10_0)
	local var_10_0 = LUI.UIBindButton.new()

	var_10_0.id = "selfBindButton"

	arg_10_0:addElement(var_10_0)

	arg_10_0._bindButton = var_10_0

	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_10_0._bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		ACTIONS.LeaveMenu(arg_10_0)
	end)
	arg_10_0:addAndCallEventHandler("update_input_type", arg_10_0.UpdateInputType, {
		controllerIndex = arg_10_0._controllerIndex
	})
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_2.searchLabelIndices and arg_12_2.clanId)

	arg_12_0.UpdateInputType = var_0_6
	arg_12_0._controllerIndex = arg_12_1
	arg_12_0._clanId = arg_12_2.clanId
	arg_12_0._selectedLabelCount = 0
	arg_12_0._selectedIndices = {}

	local var_12_0 = #arg_12_2.searchLabelIndices

	if arg_12_2.searchLabelIndices[0] ~= nil then
		var_12_0 = var_12_0 + 1
	end

	for iter_12_0 = 0, var_12_0 - 1 do
		local var_12_1 = CLANS.GetIndexForSearchLabel(arg_12_2.searchLabelIndices[iter_12_0])

		if var_12_1 ~= -1 then
			table.insert(arg_12_0._selectedIndices, var_12_1)
		end
	end

	arg_12_0._indexedButtons = {}

	for iter_12_1 = 1, #CLANS.CLAN_LABEL_KEYS do
		table.insert(arg_12_0._indexedButtons, {
			lastUpdatedTime = 0,
			isSelected = false,
			index = iter_12_1
		})
	end

	arg_12_0.SearchLabelsGrid:SetSnapOnWrapEnabled(true)
	arg_12_0.SearchLabelsGrid:SetRefreshChild(function(arg_13_0, arg_13_1, arg_13_2)
		var_0_3(arg_12_0, arg_13_0, arg_13_1, arg_13_2)
	end)
	arg_12_0.SearchLabelsGrid:SetNumChildren(#CLANS.CLAN_LABEL_KEYS)
	arg_12_0.SearchLabelsGrid:RefreshContent()
	arg_12_0.CurrentLabelsGrid:SetSnapOnWrapEnabled(true)
	arg_12_0.CurrentLabelsGrid:SetRefreshChild(function(arg_14_0, arg_14_1, arg_14_2)
		var_0_4(arg_12_0, arg_14_0, arg_14_1, arg_14_2)
	end)
	arg_12_0.CurrentLabelsGrid:SetNumChildren(0)
	arg_12_0.CurrentLabelsGrid:RefreshContent()

	for iter_12_2 = 1, #arg_12_0._selectedIndices do
		local var_12_2 = arg_12_0._selectedIndices[iter_12_2]
		local var_12_3 = arg_12_0._indexedButtons[var_12_2]

		var_12_3.isSelected = true
		arg_12_0._indexedButtons[var_12_2] = var_12_3
	end

	var_0_0(arg_12_0)
	var_0_7(arg_12_0)
	var_0_5(arg_12_0)
	arg_12_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/EDIT_SEARCH_LABELS"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_12_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_12_0, arg_12_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanEditSearchLabels(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIVerticalNavigator.new()

	var_15_0.id = "ClanEditSearchLabels"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	var_15_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_15_1
	})
	var_15_0.HelperBar.id = "HelperBar"

	var_15_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_15_0.HelperBar:setPriority(10)
	var_15_0:addElement(var_15_0.HelperBar)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIText.new()

	var_15_4.id = "SearchListDesc"

	var_15_4:setText(Engine.CBBHFCGDIC("CLANS/SELECT_LABELS"), 0)
	var_15_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_4:SetAlignment(LUI.Alignment.Left)
	var_15_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -754, _1080p * -130, _1080p * 228, _1080p * 264)
	var_15_0:addElement(var_15_4)

	var_15_0.SearchListDesc = var_15_4

	local var_15_5
	local var_15_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_17_0, arg_17_1, arg_17_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 546,
		rowHeight = _1080p * 62,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_7 = LUI.UIGrid.new(var_15_6)

	var_15_7.id = "SearchLabelsGrid"

	var_15_7:setUseStencil(true)
	var_15_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 814, _1080p * 284, _1080p * 1026)
	var_15_0:addElement(var_15_7)

	var_15_0.SearchLabelsGrid = var_15_7

	local var_15_8
	local var_15_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_15_1
	})

	var_15_9.id = "VerticalScrollbar"

	var_15_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 814, _1080p * 825, _1080p * 284, _1080p * 1026)
	var_15_0:addElement(var_15_9)

	var_15_0.VerticalScrollbar = var_15_9

	local var_15_10
	local var_15_11 = LUI.UIText.new()

	var_15_11.id = "SearchLabelTitle"

	var_15_11:setText(Engine.CBBHFCGDIC("CLANS/EDIT_CLAN_SEARCH_LABEL"), 0)
	var_15_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_11:SetAlignment(LUI.Alignment.Left)
	var_15_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1790, _1080p * 264, _1080p * 300)
	var_15_0:addElement(var_15_11)

	var_15_0.SearchLabelTitle = var_15_11

	local var_15_12
	local var_15_13 = LUI.UIText.new()

	var_15_13.id = "SearchLabelDesc"

	var_15_13:setText(Engine.CBBHFCGDIC("CLANS/EDIT_CLAN_SEARCH_LABEL_DESC"), 0)
	var_15_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_13:SetAlignment(LUI.Alignment.Left)
	var_15_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1627, _1080p * 314, _1080p * 342)
	var_15_0:addElement(var_15_13)

	var_15_0.SearchLabelDesc = var_15_13

	local var_15_14
	local var_15_15 = LUI.UIText.new()

	var_15_15.id = "CurrentLabels"

	var_15_15:setText(Engine.CBBHFCGDIC("CLANS/CURRENT_CLAN_LABELS"), 0)
	var_15_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_15:SetAlignment(LUI.Alignment.Left)
	var_15_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1423, _1080p * 739, _1080p * 769)
	var_15_0:addElement(var_15_15)

	var_15_0.CurrentLabels = var_15_15

	local var_15_16
	local var_15_17 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_15_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanLabelWidget", {
				controllerIndex = var_15_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 152,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_15_18 = LUI.UIGrid.new(var_15_17)

	var_15_18.id = "CurrentLabelsGrid"

	var_15_18:setUseStencil(true)
	var_15_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1790, _1080p * 788, _1080p * 860)
	var_15_0:addElement(var_15_18)

	var_15_0.CurrentLabelsGrid = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIText.new()

	var_15_20.id = "EmptySearchLabels"

	var_15_20:setText(Engine.CBBHFCGDIC("CLANS/NO_SEARCH_LABELS_ACTION_MENU"), 0)
	var_15_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_20:SetAlignment(LUI.Alignment.Left)
	var_15_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 923, _1080p * 1790, _1080p * 788, _1080p * 818)
	var_15_0:addElement(var_15_20)

	var_15_0.EmptySearchLabels = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "TabBacker"

	var_15_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_15_0:addElement(var_15_22)

	var_15_0.TabBacker = var_15_22

	local var_15_23
	local var_15_24 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_15_1
	})

	var_15_24.id = "MenuTitle"

	var_15_24.MenuTitle:setText(ToUpperCase(""), 0)
	var_15_24.Line:SetLeft(0, 0)
	var_15_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_15_0:addElement(var_15_24)

	var_15_0.MenuTitle = var_15_24

	local var_15_25

	if CONDITIONS.InFrontend() then
		local var_15_26 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_15_1
		})

		var_15_26.id = "LobbyMembersFooter"

		var_15_26:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_15_0:addElement(var_15_26)

		var_15_0.LobbyMembersFooter = var_15_26
	end

	local var_15_27

	if CONDITIONS.IsUserSignedInDemonware(var_15_1) then
		local var_15_28 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_15_1
		})

		var_15_28.id = "PlayerDetailsMP"

		var_15_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_15_0:addElement(var_15_28)

		var_15_0.PlayerDetailsMP = var_15_28
	end

	local var_15_29 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_15_9,
		startCap = var_15_9.startCap,
		endCap = var_15_9.endCap,
		sliderArea = var_15_9.sliderArea,
		slider = var_15_9.sliderArea and var_15_9.sliderArea.slider,
		fixedSizeSlider = var_15_9.sliderArea and var_15_9.sliderArea.fixedSizeSlider
	})

	var_15_7:AddScrollbar(var_15_29)
	var_0_8(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("ClanEditSearchLabels", ClanEditSearchLabels)
LockTable(_M)
