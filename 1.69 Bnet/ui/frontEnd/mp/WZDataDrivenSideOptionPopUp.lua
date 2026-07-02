module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		maxVisibleRows = 20,
		wrapY = true,
		maxRows = 100,
		mouseWheelScrollingOffsetPx = 32,
		spacingY = 10 * _1080p,
		controllerIndex = arg_1_1
	})

	var_1_0:SetAnchorsAndPosition(0, 0, 0, 1, 100 * _1080p, 0, 179 * _1080p, 920 * _1080p)

	var_1_0.id = "buttonListId"

	var_1_0:setUseStencil(true)
	arg_1_0:addElement(var_1_0)

	arg_1_0.buttonList = var_1_0

	arg_1_0.buttonList:SetActiveParentBehavior()

	local var_1_1
	local var_1_2 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_1_1
	})

	var_1_2.id = "buttonListVScrollbar"

	local var_1_3, var_1_4, var_1_5, var_1_6 = arg_1_0.buttonList:getLocalRect()

	var_1_2:SetAnchorsAndPosition(0, 1, 0, 1, var_1_5 + 500 * _1080p, var_1_5 + 550 * _1080p, var_1_4, var_1_6)
	arg_1_0:addElement(var_1_2)

	arg_1_0.buttonListVScrollbar = var_1_2

	local var_1_7 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_1_2,
		startCap = var_1_2.startCap,
		endCap = var_1_2.endCap,
		sliderArea = var_1_2.sliderArea,
		slider = var_1_2.sliderArea and var_1_2.sliderArea.slider,
		fixedSizeSlider = var_1_2.sliderArea and var_1_2.sliderArea.fixedSizeSlider,
		mouseWheelTarget = arg_1_0.buttonList
	})

	arg_1_0.buttonList:AddScrollbar(var_1_7)
	var_1_7:UpdateSliderAreaVertical(false)
	var_1_7:SetKBMStyle(true)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._elemCount == 0 then
		return
	end

	local var_2_0
	local var_2_1 = LUI.UIImage.new()

	var_2_1.id = "Spacer" .. arg_2_0._elemCount

	var_2_1:SetAlpha(0)
	var_2_1:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 0, _1080p * arg_2_1)
	arg_2_0.buttonList:AddElement(var_2_1)

	arg_2_0.Spacer = var_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	var_0_1(arg_3_0, 15)

	local var_3_0
	local var_3_1 = "Header" .. arg_3_0._elemCount
	local var_3_2 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = arg_3_0._controllerIndex
	})

	var_3_2.id = var_3_1

	var_3_2.Title:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_3_1)))
	var_3_2.Title:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 6, _1080p * 33)
	var_3_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 530, _1080p * 4, _1080p * 44)
	arg_3_0.buttonList:AddElement(var_3_2)

	arg_3_0[var_3_1] = var_3_2
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0
	local var_4_1 = "Subheader" .. arg_4_0._elemCount
	local var_4_2 = LUI.UIStyledText.new()

	var_4_2.id = var_4_1

	var_4_2:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus)
	var_4_2:setText(Engine.CBBHFCGDIC(arg_4_1))
	var_4_2:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_2:SetAlignment(LUI.Alignment.Left)
	var_4_2:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 400, _1080p * 0, _1080p * 20)
	var_4_2:SetAlpha(70)
	arg_4_0.buttonList:AddElement(var_4_2)

	arg_4_0[var_4_1] = var_4_2
end

local function var_0_4(arg_5_0)
	return arg_5_0._buttons
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	if arg_6_0._buttons == nil then
		arg_6_0._buttons = {}
	end

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		iter_6_1.btnIdx = Lobby.lfpSideOptionsBtnCount

		local var_6_1 = arg_6_0:CreateButton(iter_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)

		table.insert(var_6_0, var_6_1)

		Lobby.lfpSideOptionsBtnCount = Lobby.lfpSideOptionsBtnCount + 1
	end

	return var_6_0
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if Lobby.BGIADHIHAG() then
		arg_7_1:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
			for iter_8_0, iter_8_1 in pairs(arg_8_0.buttonsList) do
				if iter_8_1.selectedState ~= true then
					arg_7_2(iter_8_1, arg_7_3, true)
				end
			end
		end)
	else
		arg_7_1:ElementDisable()
	end
end

local function var_0_7(arg_9_0)
	if arg_9_0._buttons == nil then
		arg_9_0._buttons = {}
	end

	local var_9_0
	local var_9_1 = "Button" .. arg_9_0._elemCount
	local var_9_2 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = arg_9_0._controllerIndex
	})

	var_9_2.id = var_9_1

	var_9_2.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SELECT_ALL")))
	var_9_2.Text:SetAlignment(LUI.Alignment.Left)
	var_9_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 530, _1080p * 500, _1080p * 540)
	arg_9_0.buttonList:AddElement(var_9_2)

	arg_9_0[var_9_1] = var_9_2

	table.insert(arg_9_0._buttons, var_9_2)

	return var_9_2
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	local var_10_0
	local var_10_1 = "Button" .. arg_10_0._elemCount
	local var_10_2 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = arg_10_0._controllerIndex
	})

	var_10_2.id = var_10_1

	var_10_2.Text:setText(ToUpperCase(arg_10_1[Lobby.LOOK_FOR_PARTY_METADATA.BUTTON_TEXT_REF]))
	var_10_2.Text:SetAlignment(LUI.Alignment.Left)
	var_10_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 530, _1080p * 500, _1080p * 540)
	arg_10_0.buttonList:AddElement(var_10_2)

	arg_10_0[var_10_1] = var_10_2

	table.insert(arg_10_0._buttons, var_10_2)

	var_10_2.buttonData = arg_10_1
	var_10_2.parentData = arg_10_5

	var_10_2:registerEventHandler("button_over", function(arg_11_0, arg_11_1)
		arg_10_3(arg_11_0, arg_10_4)
	end)

	if Lobby.BGIADHIHAG() then
		var_10_2:registerEventHandler("button_action", function(arg_12_0, arg_12_1)
			arg_10_2(arg_12_0, arg_10_4)
		end)
	else
		var_10_2:ElementDisable()
	end

	return var_10_2
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	var_0_0(arg_13_0, arg_13_1)

	arg_13_0.CreateHeader = var_0_2
	arg_13_0.CreateSubHeader = var_0_3
	arg_13_0.CreateButtons = var_0_5
	arg_13_0.CreateButton = var_0_8
	arg_13_0.CreateSelectAllButton = var_0_7
	arg_13_0.GetButtons = var_0_4
	arg_13_0.SetSelectAllButtonHandler = var_0_6
	arg_13_0._controllerIndex = arg_13_1
	arg_13_0._elemCount = 0
end

function WZDataDrivenSideOptionPopUp(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIVerticalNavigator.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_14_0.id = "WZDataDrivenSideOptionPopUp"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "WidgetTitle"

	var_14_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE")), 0)
	var_14_4.Line:SetLeft(0, 0)
	var_14_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 732, 0, _1080p * 105)
	var_14_0:addElement(var_14_4)

	var_14_0.WidgetTitle = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIText.new()

	var_14_6.id = "WidgetDescription"

	var_14_6:SetAlpha(0.6, 0)
	var_14_6:setText("Description goes here.", 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetAlignment(LUI.Alignment.Left)
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 534, _1080p * 109, _1080p * 129)
	var_14_0:addElement(var_14_6)

	var_14_0.WidgetDescription = var_14_6

	var_0_9(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("WZDataDrivenSideOptionPopUp", WZDataDrivenSideOptionPopUp)
LockTable(_M)
