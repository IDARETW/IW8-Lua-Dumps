module(..., package.seeall)

local var_0_0 = 38

local function var_0_1(arg_1_0, arg_1_1)
	return function(arg_2_0, arg_2_1)
		Dvar.IICIFEEDC(arg_1_1, arg_2_0)
		Engine.EBIDFIDHIE("profile_menuDvarsFinish " .. arg_2_1)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "setting_updated",
			controller = arg_2_1
		})
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if Engine.BECCFCBIAA("gpadEnabled", arg_3_1) then
		for iter_3_0 = #arg_3_0._buttonListData, 1, -1 do
			local var_3_0 = arg_3_0._buttonListData[iter_3_0]

			if not arg_3_2 and var_3_0.gamepadOnly then
				arg_3_0[var_3_0.id]:addElementAfter(var_3_0.categoryWidget)
			end

			if var_3_0.kbmOnly then
				arg_3_0:RemoveElement(arg_3_0[var_3_0.id])
			end
		end
	else
		for iter_3_1 = #arg_3_0._buttonListData, 1, -1 do
			local var_3_1 = arg_3_0._buttonListData[iter_3_1]

			if not arg_3_2 and var_3_1.kbmOnly then
				arg_3_0[var_3_1.id]:addElementAfter(var_3_1.categoryWidget)
			end

			if var_3_1.gamepadOnly then
				arg_3_0:RemoveElement(arg_3_0[var_3_1.id])
			end
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ControlsSpacer)
	assert(arg_4_0.AccessibilitySpacer)
	assert(arg_4_0.GraphicsSpacer)

	arg_4_0._buttonListData = {}

	table.insert(arg_4_0._buttonListData, {
		id = "Subtitles",
		csv = CSV.generalOptions,
		categoryWidget = arg_4_0.AccessibilitySpacer
	})
	table.insert(arg_4_0._buttonListData, {
		id = "Colorblind",
		csv = CSV.generalOptions,
		categoryWidget = arg_4_0.AccessibilitySpacer
	})

	if Engine.CIEGIACHAE() then
		table.insert(arg_4_0._buttonListData, {
			id = "MenuCursorSensitivityMultiplier",
			kbmOnly = true,
			csv = CSV.options,
			categoryWidget = arg_4_0.ControlsSpacer
		})
	end

	table.insert(arg_4_0._buttonListData, {
		id = "InvertPitchKBM",
		kbmOnly = true,
		csv = CSV.keyboardAndMouseOptions,
		categoryWidget = arg_4_0.ControlsSpacer
	})
	table.insert(arg_4_0._buttonListData, {
		id = "LayoutButton",
		gamepadOnly = true,
		categoryWidget = arg_4_0.ControlsSpacer,
		optionData = OPTIONS_DATA.optionsDataList.ButtonLayoutBootOptions
	})
	table.insert(arg_4_0._buttonListData, {
		id = "LayoutStick",
		gamepadOnly = true,
		categoryWidget = arg_4_0.ControlsSpacer,
		optionData = OPTIONS_DATA.optionsDataList.StickLayoutBootOptions
	})
	table.insert(arg_4_0._buttonListData, {
		id = "InvertPitchGamepad",
		gamepadOnly = true,
		csv = CSV.gamepadOptions,
		categoryWidget = arg_4_0.ControlsSpacer
	})

	if Engine.CGABICJHAI() then
		table.insert(arg_4_0._buttonListData, {
			id = "DisplayMode",
			csv = CSV.videoOptions,
			categoryWidget = arg_4_0.GraphicsSpacer
		})
		table.insert(arg_4_0._buttonListData, {
			id = "Monitor",
			csv = CSV.videoOptions,
			categoryWidget = arg_4_0.GraphicsSpacer
		})

		if OPTIONS_DATA.optionsDataList.Brightness.buildCondition(arg_4_1) then
			table.insert(arg_4_0._buttonListData, {
				id = "Brightness",
				csv = CSV.generalOptions,
				categoryWidget = arg_4_0.GraphicsSpacer
			})
		elseif OPTIONS_DATA.optionsDataList.HDRCalibration.buildCondition(arg_4_1) then
			table.insert(arg_4_0._buttonListData, {
				id = "HDRCalibration",
				csv = CSV.generalOptions,
				categoryWidget = arg_4_0.GraphicsSpacer
			})
		end
	else
		arg_4_0.GraphicsLabel:SetAlpha(0)
	end

	local var_4_0 = arg_4_0.Continue

	if Engine.CGABICJHAI() then
		var_4_0 = arg_4_0.ContinuePC
	end

	OPTIONS.SetFocusEventHandlerForActiveState(var_4_0, arg_4_1, {})
	OPTIONS.SetActiveEventHandler(var_4_0)

	var_4_0.buttonName = var_4_0.Text:getText()

	var_4_0:addEventHandler("gain_focus", function(arg_5_0, arg_5_1)
		if LUI.IsLastInputGamepad(arg_4_1) then
			arg_4_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
			})
		end
	end)
	var_4_0:addEventHandler("lose_focus", function(arg_6_0, arg_6_1)
		arg_4_0:RemoveButtonHelperText("button_primary", "left")
	end)
	var_4_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		Engine.EBIDFIDHIE("vid_reconfig")
		Engine.CJAEBHAHBB(arg_4_1)
		LUI.FlowManager.RequestLeaveMenu(arg_4_0, true)
	end)

	local var_4_1 = OPTIONS.InitOptionsList(arg_4_0, arg_4_1)

	if Engine.JDFDCGCIJ(arg_4_1) then
		BOOT.CreateInputMethodLogic(arg_4_0, arg_4_1, var_4_1)
	else
		arg_4_0:RemoveElement(arg_4_0.InputMethod)
	end

	arg_4_0._options = {}

	arg_4_0:SetNotifyOnLayoutInit(true)
	arg_4_0:addEventHandler("layout_initialized", function(arg_8_0, arg_8_1)
		arg_8_0._options = {}

		for iter_8_0 = #arg_8_0._buttonListData, 1, -1 do
			local var_8_0 = arg_8_0._buttonListData[iter_8_0]
			local var_8_1 = var_8_0.optionData or OPTIONS.GetOptionsDataByIdentifier(arg_8_0, arg_4_1, var_4_1, var_8_0.id, var_8_0.csv)

			if var_8_1 then
				var_8_1.customPreviewButtonAction = nil

				local var_8_2 = OPTIONS.CreateOption(arg_8_0, arg_4_1, var_8_1)

				var_8_2.isBootOptions = true

				if var_8_2.action then
					var_8_2.action = BOOT.AddSettingUpdatedEvent(arg_8_0, arg_4_1, var_8_2.action)
				end

				var_8_2:RemoveToolTipData()
				var_8_2:SetBottom(_1080p * var_0_0)
				var_8_2:addElementAfter(var_8_0.categoryWidget)

				arg_8_0[var_8_0.id] = var_8_2

				table.insert(arg_8_0._options, var_8_2)
			end
		end

		arg_8_0.UpdateBootOptionControlsLayout = var_0_2

		var_0_2(arg_8_0, arg_4_1, true)
	end)
	arg_4_0:addEventHandler("onVideoChange", function()
		arg_4_0.DisplayMode:processEvent({
			name = "seek_value",
			controller = arg_4_1
		})
		arg_4_0.Monitor:processEvent({
			name = "seek_value",
			controller = arg_4_1
		})
	end)
	arg_4_0:registerEventHandler("gamepad_button", function(arg_10_0, arg_10_1)
		local var_10_0 = LUI.FlowManager.GetScopedData(arg_10_0)

		if var_10_0._redirectBindButtonEventTarget and var_10_0._redirectBindButtonEventTarget:processEvent(arg_10_1) then
			return true
		end
	end)
	arg_4_0:SetActiveParentBehavior()
end

function QuickSetupVerticalList(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIVerticalList.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 534 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "QuickSetupVerticalList"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0

	var_11_0:SetSpacing(11 * _1080p)

	local var_11_3

	if Engine.HDGDBCJFG() then
		local var_11_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_11_1
		})

		var_11_4.id = "Continue"

		if Engine.HDGDBCJFG() then
			var_11_4.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/CONTINUE_BOOT_DESC")
		end

		var_11_4.Text:SetLeft(_1080p * 20, 0)
		var_11_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
		var_11_4.Text:SetAlignment(LUI.Alignment.Left)
		var_11_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
		var_11_0:addElement(var_11_4)

		var_11_0.Continue = var_11_4
	end

	local var_11_5
	local var_11_6 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_6.id = "ContinueSpacerBottom"

	var_11_6.SpacerImage:SetAlpha(0, 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 51, _1080p * 56)
	var_11_0:addElement(var_11_6)

	var_11_0.ContinueSpacerBottom = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "ControlsLabel"

	var_11_8.OptionSubcategory:setText(Engine.CBBHFCGDIC("MENU/CONTROLS"), 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 620, _1080p * 67, _1080p * 93)
	var_11_0:addElement(var_11_8)

	var_11_0.ControlsLabel = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "ControlsSpacerEnd"

	var_11_10.SpacerImage:SetAlpha(0, 0)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 104, _1080p * 104)
	var_11_0:addElement(var_11_10)

	var_11_0.ControlsSpacerEnd = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("GenericToggleButton", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "InputMethod"
	var_11_12.buttonDescription = Engine.CBBHFCGDIC("PLATFORM/INPUT_METHOD_DESC")

	var_11_12.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/INPUT_METHOD"), 0)
	var_11_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 115, _1080p * 153)
	var_11_0:addElement(var_11_12)

	var_11_0.InputMethod = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "ControlsSpacer"

	var_11_14.SpacerImage:SetAlpha(0, 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 164, _1080p * 164)
	var_11_0:addElement(var_11_14)

	var_11_0.ControlsSpacer = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "InputMethodSpacerEnd"

	var_11_16.SpacerImage:SetAlpha(0, 0)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 175, _1080p * 175)
	var_11_0:addElement(var_11_16)

	var_11_0.InputMethodSpacerEnd = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "AccessibilityLabel"

	var_11_18.OptionSubcategory:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCESSIBILITY"), 0)
	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 620, _1080p * 186, _1080p * 212)
	var_11_0:addElement(var_11_18)

	var_11_0.AccessibilityLabel = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "AccessibilitySpacer"

	var_11_20.SpacerImage:SetAlpha(0, 0)
	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 223, _1080p * 223)
	var_11_0:addElement(var_11_20)

	var_11_0.AccessibilitySpacer = var_11_20

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "AccessibilitySpacerEnd"

	var_11_22.SpacerImage:SetAlpha(0, 0)
	var_11_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 234, _1080p * 234)
	var_11_0:addElement(var_11_22)

	var_11_0.AccessibilitySpacerEnd = var_11_22

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("GenericOptionSubcategoryTitle", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "GraphicsLabel"

	var_11_24.OptionSubcategory:setText(Engine.CBBHFCGDIC("MENU/GRAPHICS"), 0)
	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 620, _1080p * 245, _1080p * 271)
	var_11_0:addElement(var_11_24)

	var_11_0.GraphicsLabel = var_11_24

	local var_11_25
	local var_11_26 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_26.id = "GraphicsSpacer"

	var_11_26.SpacerImage:SetAlpha(0, 0)
	var_11_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 282, _1080p * 282)
	var_11_0:addElement(var_11_26)

	var_11_0.GraphicsSpacer = var_11_26

	local var_11_27
	local var_11_28 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_11_1
	})

	var_11_28.id = "GraphicsSpacerEnd"

	var_11_28.SpacerImage:SetAlpha(0, 0)
	var_11_28:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 293, _1080p * 293)
	var_11_0:addElement(var_11_28)

	var_11_0.GraphicsSpacerEnd = var_11_28

	local var_11_29

	if not Engine.HDGDBCJFG() then
		local var_11_30 = LUI.UIImage.new()

		var_11_30.id = "LineSpacer"

		var_11_30:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
		var_11_30:SetAlpha(0.6, 0)
		var_11_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 187, _1080p * 432, _1080p * 304, _1080p * 305)
		var_11_0:addElement(var_11_30)

		var_11_0.LineSpacer = var_11_30
	end

	local var_11_31

	if not Engine.HDGDBCJFG() then
		local var_11_32 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
			controllerIndex = var_11_1
		})

		var_11_32.id = "ContinueSpacerTop"

		var_11_32.SpacerImage:SetAlpha(0, 0)
		var_11_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 534, _1080p * 316, _1080p * 321)
		var_11_0:addElement(var_11_32)

		var_11_0.ContinueSpacerTop = var_11_32
	end

	local var_11_33

	if not Engine.HDGDBCJFG() then
		local var_11_34 = MenuBuilder.BuildRegisteredType("GenericButton", {
			controllerIndex = var_11_1
		})

		var_11_34.id = "ContinuePC"

		if not Engine.HDGDBCJFG() then
			var_11_34.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/CONTINUE_BOOT_DESC")
		end

		var_11_34.Text:SetLeft(_1080p * 20, 0)
		var_11_34.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
		var_11_34.Text:SetAlignment(LUI.Alignment.Left)
		var_11_34:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 332, _1080p * 372)
		var_11_0:addElement(var_11_34)

		var_11_0.ContinuePC = var_11_34
	end

	var_0_3(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("QuickSetupVerticalList", QuickSetupVerticalList)
LockTable(_M)
