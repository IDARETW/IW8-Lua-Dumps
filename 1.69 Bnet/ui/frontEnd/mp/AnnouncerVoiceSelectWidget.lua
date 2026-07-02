module(..., package.seeall)

local var_0_0 = "frontEnd.MP.AnnouncerVoice"

function AddButtonHelperbar(arg_1_0, arg_1_1)
	local var_1_0
	local var_1_1 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_1_1
	})

	var_1_1.id = "ButtonHelperBar"

	var_1_1:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -10, _1080p * 10, _1080p * 11, _1080p * 66)
	arg_1_0:addElement(var_1_1)

	arg_1_0.ButtonHelperBar = var_1_1

	var_1_1.ButtonHelperText:PushButtonPrompt({
		10,
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_1_1.ButtonHelperText:PushButtonPrompt(arg_1_0.ButtonHelperBar, {
		10,
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_1_1.ButtonHelperText:PushButtonPrompt(arg_1_0.ButtonHelperBar, {
		10,
		side = "left",
		button_ref = "button_alt2",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_PREVIEW")
	})
end

function LeaveAnnouncerMenu(arg_2_0, arg_2_1)
	WipeGlobalModelsAtPath(var_0_0)
	WipeGlobalModelsAtPath(var_0_0 .. "." .. "voice")
	ACTIONS.LeaveMenu(arg_2_0)
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = PlayerData.BFFBGAJGD(arg_3_1, CoD.StatsGroup.Common).mp_announcer_type:get()
	local var_3_1 = StringTable.BFHCAIIDA(CSV.announcerVoiceDataTable.file)
	local var_3_2 = {}

	for iter_3_0 = 0, var_3_1 - 1 do
		local var_3_3 = CSV.ReadRow(CSV.announcerVoiceDataTable, iter_3_0)
		local var_3_4 = var_3_3.index

		if Engine.DIJFGHFJEJ(var_3_4) then
			table.insert(var_3_2, {
				announcerId = var_3_4,
				name = Engine.CBBHFCGDIC(var_3_3.name),
				preview = var_3_3.preview,
				isUnlocked = Engine.CGEIBHCJF(var_3_4),
				isSelected = tostring(var_3_4) == tostring(var_3_0)
			})
		end
	end

	local var_3_5 = LUI.DataSourceFromList.new(#var_3_2)

	function var_3_5.MakeDataSourceAtIndex(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = var_3_2[arg_4_1 + 1]
		local var_4_1 = var_0_0 .. ".voice." .. arg_4_1
		local var_4_2 = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".name", var_4_0.name)
		local var_4_3 = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".isUnlocked")
		local var_4_4 = LUI.DataSourceInGlobalModel.new(var_4_1 .. ".isSelected")

		var_4_4:SetValue(arg_4_2, var_4_0.isSelected)
		var_4_3:SetValue(arg_4_2, var_4_0.isUnlocked)

		return {
			name = var_4_2,
			isUnlocked = var_4_3,
			isSelected = var_4_4,
			announcerId = var_4_0.announcerId,
			preview = var_4_0.preview
		}
	end

	function var_3_5.GetDefaultFocusIndex()
		for iter_5_0 = 1, #var_3_2 do
			if tostring(var_3_2[iter_5_0].announcerId) == tostring(var_3_0) then
				return iter_5_0 - 1
			end
		end
	end

	local var_3_6 = LUI.UIBindButton.new()

	var_3_6.id = "selfBindButton"

	arg_3_0:addElement(var_3_6)

	arg_3_0.bindButton = var_3_6

	arg_3_0.VoiceList:SetGridDataSource(var_3_5, var_0_0)
	AddButtonHelperbar(arg_3_0, arg_3_1)
	arg_3_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		LeaveAnnouncerMenu(arg_3_0, arg_3_1)
	end)
	arg_3_0.bindButton:addEventHandler("button_alt2", function(arg_7_0, arg_7_1)
		local var_7_0 = arg_3_0.VoiceList:GetDataSource(arg_3_1)

		if not var_7_0 then
			return
		end

		assert(var_7_0.preview)
		Engine.BJDBIAGIDA(var_7_0.preview)
	end)
end

function AnnouncerVoiceSelectWidget(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 420 * _1080p)

	var_8_0.id = "AnnouncerVoiceSelectWidget"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = {
		maxVisibleRows = 7,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AnnouncerVoiceSelectButton", {
				controllerIndex = var_8_1
			})
		end,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 30,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_5 = LUI.UIDataSourceGrid.new(var_8_4)

	var_8_5.id = "VoiceList"

	var_8_5:setUseStencil(true)
	var_8_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112.25, _1080p * 612.25, _1080p * 87.25, _1080p * 333.25)
	var_8_0:addElement(var_8_5)

	var_8_0.VoiceList = var_8_5

	local var_8_6
	local var_8_7 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_7.id = "Scrollbar"

	var_8_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 79.25, _1080p * 96.25, _1080p * 72.5, _1080p * 348)
	var_8_0:addElement(var_8_7)

	var_8_0.Scrollbar = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("ArrowUp", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "ArrowUp"

	var_8_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 434.75, _1080p * 454.75, _1080p * 333.25, _1080p * 373.25)
	var_8_0:addElement(var_8_9)

	var_8_0.ArrowUp = var_8_9

	local var_8_10
	local var_8_11 = MenuBuilder.BuildRegisteredType("ArrowDown", {
		controllerIndex = var_8_1
	})

	var_8_11.id = "ArrowDown"

	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 269.75, _1080p * 289.75, _1080p * 333.25, _1080p * 373.25)
	var_8_0:addElement(var_8_11)

	var_8_0.ArrowDown = var_8_11

	local var_8_12
	local var_8_13 = LUI.UIText.new()

	var_8_13.id = "ListCount"

	var_8_13:setText("1/15", 0)
	var_8_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_13:SetAlignment(LUI.Alignment.Center)
	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 289.75, _1080p * 434.75, _1080p * 341.25, _1080p * 365.25)
	var_8_0:addElement(var_8_13)

	var_8_0.ListCount = var_8_13

	local var_8_14
	local var_8_15 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_8_1
	})

	var_8_15.id = "ButtonDescriptionText"

	var_8_15.Description:SetRight(_1080p * 500, 0)
	var_8_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112.25, _1080p * 612.25, _1080p * 373.25, _1080p * 405.25)
	var_8_0:addElement(var_8_15)

	var_8_0.ButtonDescriptionText = var_8_15

	local var_8_16
	local var_8_17 = LUI.UIText.new()

	var_8_17.id = "Text"

	var_8_17:setText(Engine.CBBHFCGDIC("LUA_MENU/ANNOUNCER_MESSAGE"), 0)
	var_8_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_17:SetAlignment(LUI.Alignment.Center)
	var_8_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 87.75, _1080p * 612.25, _1080p * 18.5, _1080p * 42.5)
	var_8_0:addElement(var_8_17)

	var_8_0.Text = var_8_17

	local var_8_18 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_7,
		startCap = var_8_7.startCap,
		endCap = var_8_7.endCap,
		sliderArea = var_8_7.sliderArea,
		slider = var_8_7.sliderArea and var_8_7.sliderArea.slider,
		fixedSizeSlider = var_8_7.sliderArea and var_8_7.sliderArea.fixedSizeSlider
	})

	var_8_5:AddScrollbar(var_8_18)
	var_8_5:AddArrow(var_8_9)
	var_8_5:AddArrow(var_8_11)
	var_8_5:AddItemNumbers(var_8_13)
	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("AnnouncerVoiceSelectWidget", AnnouncerVoiceSelectWidget)
LockTable(_M)
