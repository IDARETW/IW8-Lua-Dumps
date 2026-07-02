module(..., package.seeall)

local var_0_0 = "options.buttonLayout"
local var_0_1 = SWATCHES.layouts.oldLayout
local var_0_2 = SWATCHES.layouts.newLayout

local function var_0_3()
	WipeControllerModelsAtPath(var_0_0)
end

local function var_0_4(arg_2_0, arg_2_1)
	local var_2_0 = Engine.CAADCDEEIA()
	local var_2_1 = arg_2_0.name
	local var_2_2 = var_2_0 and arg_2_0.leftTriggerSP or arg_2_0.leftTrigger
	local var_2_3 = var_2_0 and arg_2_0.leftShoulderSP or arg_2_0.leftShoulder
	local var_2_4 = var_2_0 and arg_2_0.rightTriggerSP or arg_2_0.rightTrigger
	local var_2_5 = var_2_0 and arg_2_0.rightShoulderSP or arg_2_0.rightShoulder
	local var_2_6 = arg_2_0.cfg

	if arg_2_1 then
		var_2_3, var_2_2 = var_2_2, var_2_3
		var_2_5, var_2_4 = var_2_4, var_2_5
		var_2_1 = var_2_1 .. "_alt"
		var_2_6 = var_2_6 .. "_alt"
	end

	return {
		cfg = var_2_6,
		layoutName = var_2_1,
		leftTrigger = var_2_2,
		leftShoulder = var_2_3,
		rightTrigger = var_2_4,
		rightShoulder = var_2_5
	}
end

local function var_0_5(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.ButtonLayoutButtons.ButtonLayouts:GetFocusPositionIndex()
	local var_3_1 = arg_3_0.ButtonLayoutButtons.ButtonLayouts:GetPositionForIndex(var_3_0, {
		relativePosition = false
	})
	local var_3_2 = arg_3_0.ButtonLayoutButtons.ButtonLayouts:GetElementAtPosition(var_3_1.x, var_3_1.y):GetDataSource().name:GetValue(arg_3_1)

	arg_3_0.CurrentLayoutName:setText(var_3_2)
end

local function var_0_6(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ButtonLayoutButtons.ButtonLayouts)

	local var_4_0 = arg_4_0.ButtonLayoutButtons.ButtonLayouts:GetGridDataSource()
	local var_4_1 = var_4_0:GetCountValue(arg_4_1) - 1

	for iter_4_0 = 0, var_4_1 do
		local var_4_2 = CSV.ReadRow(OPTIONS.GetCurrentCSVButtonLayouts(arg_4_0.isBR), iter_4_0)
		local var_4_3 = var_4_0:GetDataSourceAtIndex(iter_4_0)
		local var_4_4 = var_0_4(var_4_2, arg_4_2)

		var_4_3.ref:SetValue(arg_4_1, var_4_4.cfg)
		var_4_3.name:SetValue(arg_4_1, Engine.CBBHFCGDIC(var_4_4.layoutName))
		var_4_3.leftTrigger:SetValue(arg_4_1, Engine.CBBHFCGDIC(var_4_4.leftTrigger))
		var_4_3.rightTrigger:SetValue(arg_4_1, Engine.CBBHFCGDIC(var_4_4.rightTrigger))
		var_4_3.leftShoulder:SetValue(arg_4_1, Engine.CBBHFCGDIC(var_4_4.leftShoulder))
		var_4_3.rightShoulder:SetValue(arg_4_1, Engine.CBBHFCGDIC(var_4_4.rightShoulder))
	end

	local var_4_5 = Engine.BECCFCBIAA(OPTIONS.GetCurrentGpadButtonsConfigName(arg_4_0.isBR), arg_4_1)

	if arg_4_2 then
		Engine.CBCIHEGADA(var_4_5 .. "_alt", arg_4_1, arg_4_0.isBR)
	else
		Engine.CBCIHEGADA(string.gsub(var_4_5, "_alt", ""), arg_4_1, arg_4_0.isBR)
	end

	var_0_5(arg_4_0, arg_4_1)
end

local function var_0_7(arg_5_0, arg_5_1)
	if arg_5_0.PS4Layout == nil then
		local var_5_0 = MenuBuilder.BuildRegisteredType("PS4Layout", {
			controllerIndex = arg_5_1
		})

		var_5_0.id = "PS4Layout"

		var_5_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 61, _1080p * 573, _1080p * -292, _1080p * 220)
		arg_5_0:addElement(var_5_0)

		arg_5_0.PS4Layout = var_5_0
	end

	arg_5_0.controlLayout = arg_5_0.PS4Layout
end

local function var_0_8(arg_6_0, arg_6_1)
	if arg_6_0.XB3Layout == nil then
		local var_6_0 = MenuBuilder.BuildRegisteredType("XB3Layout", {
			controllerIndex = arg_6_1
		})

		var_6_0.id = "XB3Layout"

		var_6_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 60, _1080p * 573, _1080p * 284, _1080p * 796)
		arg_6_0:addElement(var_6_0)

		arg_6_0.XB3Layout = var_6_0
	end

	arg_6_0.controlLayout = arg_6_0.XB3Layout
end

local function var_0_9(arg_7_0, arg_7_1)
	if arg_7_0.PS4VitaLayout == nil then
		local var_7_0 = MenuBuilder.BuildRegisteredType("PS4VitaLayout", {
			controllerIndex = arg_7_1
		})

		var_7_0.id = "PS4VitaLayout"

		if Engine.CIEGIACHAE() then
			var_7_0.ControllerImage:SetLeft(0, 0)
		end

		if Engine.CIEGIACHAE() then
			var_7_0.ControllerImage:SetRight(_1080p * 512, 0)
		end

		if Engine.CIEGIACHAE() then
			var_7_0.ControllerImage:SetTop(_1080p * 1, 0)
		end

		if Engine.CIEGIACHAE() then
			var_7_0.ControllerImage:SetBottom(_1080p * 513, 0)
		end

		var_7_0.Primary:SetLeft(_1080p * 538, 0)
		var_7_0.Primary:SetRight(_1080p * 742, 0)
		var_7_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 27, _1080p * 539, _1080p * -273, _1080p * 239)
		arg_7_0:addElement(var_7_0)

		arg_7_0.PS4VitaLayout = var_7_0
	end

	arg_7_0.controlLayout = arg_7_0.PS4VitaLayout
end

local function var_0_10(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.MenuBackgroundImage)

	arg_8_0.CreatePS4Layout = var_0_7
	arg_8_0.CreateXB3Layout = var_0_8
	arg_8_0.CreateVitaLayout = var_0_9
	arg_8_0.isBR = CONDITIONS.IsMagmaGameMode()

	local var_8_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_8_1)
	local var_8_1 = Engine.BECCFCBIAA(OPTIONS.GetCurrentGpadButtonsConfigName(arg_8_0.isBR), arg_8_1)
	local var_8_2 = StringTable.DIFCHIGDFB(CSV.stickLayouts.file, CSV.stickLayouts.cols.cfg, var_8_0, CSV.stickLayouts.cols.swapStickButtons) == "1"
	local var_8_3 = string.match(var_8_1, "_alt$") ~= nil

	if arg_8_0.isBR then
		arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/BR_BUTTON_LAYOUT"))
	else
		arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT_CAPS"))
	end

	assert(arg_8_0.bindButton)

	if not Engine.DDJFBBJAIG() then
		arg_8_0:addEventHandler("menu_create", function()
			arg_8_0:AddButtonHelperText({
				clickable = true,
				priority = 2,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_8_0.bindButton:addEventHandler("button_start", function(arg_10_0, arg_10_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_10_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_8_0)
	end

	arg_8_0:registerEventHandler("update_layout_title", function(arg_11_0, arg_11_1)
		arg_11_0.CurrentLayoutName:setText(arg_11_1.titleName)

		return true
	end)
	assert(arg_8_0.ButtonLayoutButtons.ButtonLayouts)

	local var_8_4 = OPTIONS.GetCurrentCSVButtonLayouts(arg_8_0.isBR)
	local var_8_5 = StringTable.BFHCAIIDA(var_8_4.file)
	local var_8_6 = LUI.DataSourceFromList.new(var_8_5)

	function var_8_6.MakeDataSourceAtIndex(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = CSV.ReadRow(var_8_4, arg_12_1)
		local var_12_1 = CSV.ReadRow(var_8_4, 0)
		local var_12_2 = var_0_0 .. "." .. arg_12_1
		local var_12_3 = Engine.CAADCDEEIA()
		local var_12_4 = Engine.EAIICIFIFA()
		local var_12_5 = var_12_0.select

		if var_12_3 then
			var_12_5 = var_12_0.selectSP
		elseif var_12_4 then
			var_12_5 = var_12_0.selectCP
		end

		local var_12_6 = var_12_0.leftStick
		local var_12_7 = var_12_0.rightStick

		if var_8_2 then
			var_12_6 = var_12_0.rightStick
			var_12_7 = var_12_0.leftStick
		end

		local var_12_8 = var_0_4(var_12_0, var_8_3)
		local var_12_9 = GetIntForColor(var_0_1)
		local var_12_10 = GetIntForColor(var_0_2)

		local function var_12_11(arg_13_0)
			return function()
				local var_14_0 = var_12_3 and arg_13_0 .. "SP" or arg_13_0
				local var_14_1 = var_0_4(var_12_0, var_8_3)

				if var_12_1[var_14_0] == var_14_1[arg_13_0] then
					return var_12_9
				else
					return var_12_10
				end
			end
		end

		local var_12_12

		if CONDITIONS.IsMagmaEnabled() then
			var_12_12 = Engine.CBBHFCGDIC(var_12_0.dPadUp)
		else
			var_12_12 = Engine.CBBHFCGDIC("LUA_MENU_MP/CUSTOMIZE_GESTURE")
		end

		local var_12_13 = LUI.DataSourceInControllerModel.new(var_12_2 .. ".leftTrigger", Engine.CBBHFCGDIC(var_12_8.leftTrigger))
		local var_12_14 = LUI.DataSourceInControllerModel.new(var_12_2 .. ".leftShoulder", Engine.CBBHFCGDIC(var_12_8.leftShoulder))
		local var_12_15 = LUI.DataSourceInControllerModel.new(var_12_2 .. ".rightTrigger", Engine.CBBHFCGDIC(var_12_8.rightTrigger))
		local var_12_16 = LUI.DataSourceInControllerModel.new(var_12_2 .. ".rightShoulder", Engine.CBBHFCGDIC(var_12_8.rightShoulder))
		local var_12_17 = Dvar.IBEGCHEFE("NOKSLTKTRT") and Engine.CBBHFCGDIC(var_12_0.dPadLeft) or Engine.CBBHFCGDIC("MENU/DPAD_LEFT_DESC_NO_INSPECT")

		return {
			ref = LUI.DataSourceInControllerModel.new(var_12_2 .. ".ref", var_12_8.cfg),
			name = LUI.DataSourceInControllerModel.new(var_12_2 .. ".name", Engine.CBBHFCGDIC(var_12_8.layoutName)),
			leftStick = LUI.DataSourceInControllerModel.new(var_12_2 .. ".leftStick", Engine.CBBHFCGDIC(var_12_6)),
			leftStickColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".leftStickColor", var_12_1.leftStick == var_12_0.leftStick and var_12_9 or var_12_10),
			rightStick = LUI.DataSourceInControllerModel.new(var_12_2 .. ".rightStick", Engine.CBBHFCGDIC(var_12_7)),
			rightStickColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".rightStickColor", var_12_1.rightStick == var_12_0.rightStick and var_12_9 or var_12_10),
			leftTrigger = var_12_13,
			leftTriggerColor = var_12_13:Filter("leftTriggerColor", var_12_11("leftTrigger")),
			rightTrigger = var_12_15,
			rightTriggerColor = var_12_15:Filter("rightTriggerColor", var_12_11("rightTrigger")),
			leftShoulder = var_12_14,
			leftShoulderColor = var_12_14:Filter("leftShoulderColor", var_12_11("leftShoulder")),
			rightShoulder = var_12_16,
			rightShoulderColor = var_12_16:Filter("rightShoulderColor", var_12_11("rightShoulder")),
			primary = LUI.DataSourceInControllerModel.new(var_12_2 .. ".primary", Engine.CBBHFCGDIC(var_12_0.primary)),
			primaryColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".primaryColor", var_12_1.primary == var_12_0.primary and var_12_9 or var_12_10),
			secondary = LUI.DataSourceInControllerModel.new(var_12_2 .. ".secondary", Engine.CBBHFCGDIC(var_12_0.secondary)),
			secondaryColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".secondaryColor", var_12_1.secondary == var_12_0.secondary and var_12_9 or var_12_10),
			altOne = LUI.DataSourceInControllerModel.new(var_12_2 .. ".altOne", Engine.CBBHFCGDIC(var_12_0.altOne)),
			altOneColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".altOneColor", var_12_1.altOne == var_12_0.altOne and var_12_9 or var_12_10),
			altTwo = LUI.DataSourceInControllerModel.new(var_12_2 .. ".altTwo", Engine.CBBHFCGDIC(var_12_0.altTwo)),
			altTwoColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".altTwoColor", var_12_1.altTwo == var_12_0.altTwo and var_12_9 or var_12_10),
			dPad = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPad", Engine.CBBHFCGDIC(var_12_0.dPad)),
			dPadColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadColor", var_12_1.dPad == var_12_0.dPad and var_12_9 or var_12_10),
			dPadUp = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadUp", var_12_12),
			dPadUpColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadUpColor", var_12_1.dPadUp == var_12_0.dPadUp and var_12_9 or var_12_10),
			dPadRight = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadRight", Engine.CBBHFCGDIC(var_12_0.dPadRight)),
			dPadRightColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadRightColor", var_12_1.dPadRight == var_12_0.dPadRight and var_12_9 or var_12_10),
			dPadDown = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadDown", Engine.CBBHFCGDIC(var_12_0.dPadDown)),
			dPadDownColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadDownColor", var_12_1.dPadDown == var_12_0.dPadDown and var_12_9 or var_12_10),
			dPadLeft = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadLeft", var_12_17),
			dPadLeftColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".dPadLeftColor", var_12_1.dPadLeft == var_12_0.dPadLeft and var_12_9 or var_12_10),
			start = LUI.DataSourceInControllerModel.new(var_12_2 .. ".start", var_12_4 and Engine.CBBHFCGDIC(var_12_0.startCP) or Engine.CBBHFCGDIC(var_12_0.start)),
			startColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".startColor", var_12_1.start == var_12_0.start and var_12_9 or var_12_10),
			select = LUI.DataSourceInControllerModel.new(var_12_2 .. ".select", Engine.CBBHFCGDIC(var_12_5)),
			selectColor = LUI.DataSourceInControllerModel.new(var_12_2 .. ".selectColor", var_12_1.select == var_12_0.select and var_12_9 or var_12_10)
		}
	end

	function var_8_6.GetDefaultFocusIndex()
		for iter_15_0 = 0, var_8_6:GetCountValue(arg_8_1) do
			local var_15_0 = var_8_6:GetDataSourceAtIndex(iter_15_0).ref:GetValue(arg_8_1)
			local var_15_1 = var_15_0 .. "_alt"

			if var_8_1 == var_15_0 or var_8_1 == var_15_1 then
				if var_8_1 == "buttons_bumper_jumper_tac" then
					ACTIONS.SetText(arg_8_0.CurrentLayoutName, "MENU/" .. ToUpperCase("bumper_jumper_tactical"))
				elseif var_8_1 == "buttons_bumper_jumper_tac_alt" then
					ACTIONS.SetText(arg_8_0.CurrentLayoutName, "MENU/" .. ToUpperCase("bumper_jumper_tactical_alt"))
				else
					ACTIONS.SetText(arg_8_0.CurrentLayoutName, "MENU/" .. ToUpperCase(var_8_1:sub(9, var_8_1:len())))
				end

				return iter_15_0
			end
		end
	end

	arg_8_0.ButtonLayoutButtons.ButtonLayouts:SetGridDataSource(var_8_6, arg_8_1)
	arg_8_0:registerAndCallEventHandler("input_connection", function(arg_16_0, arg_16_1)
		if Engine.CIEGIACHAE() then
			if Engine.BIAEDEEBJI(arg_8_1) then
				if arg_16_0.PS4Layout then
					arg_16_0:RemoveElement(arg_16_0.PS4Layout)
					arg_16_0.PS4Layout:closeTree()

					arg_16_0.PS4Layout = nil
				end

				arg_16_0:CreateVitaLayout(arg_16_1.controllerIndex)
			else
				if arg_16_0.PS4VitaLayout then
					arg_16_0:RemoveElement(arg_16_0.PS4VitaLayout)
					arg_16_0.PS4VitaLayout:closeTree()

					arg_16_0.PS4VitaLayout = nil
				end

				arg_16_0:CreatePS4Layout(arg_16_1.controllerIndex)
			end
		elseif Engine.BAHIIBFDDG() then
			assert(arg_16_0.XB3Layout)

			arg_16_0.controlLayout = arg_16_0.XB3Layout
		elseif not Engine.HDGDBCJFG() then
			if Engine.GGFCHCDDE(arg_16_1.controllerIndex) or Engine.FIIDEFBHJ(arg_16_1.controllerIndex) then
				if arg_16_0.XB3Layout then
					arg_16_0:RemoveElement(arg_16_0.XB3Layout)
					arg_16_0.XB3Layout:closeTree()

					arg_16_0.XB3Layout = nil
				end

				arg_16_0:CreatePS4Layout(arg_16_1.controllerIndex)
			else
				if arg_16_0.PS4Layout then
					arg_16_0:RemoveElement(arg_16_0.PS4Layout)
					arg_16_0.PS4Layout:closeTree()

					arg_16_0.PS4Layout = nil
				end

				arg_16_0:CreateXB3Layout(arg_16_1.controllerIndex)
			end
		end

		if arg_16_0.controlLayout then
			arg_16_0.controlLayout:SetDataSourceThroughElement(arg_16_0.ButtonLayoutButtons.ButtonLayouts, nil)
		end
	end, {
		name = "input_connection",
		controllerIndex = arg_8_1
	})

	if LUI.IsLastInputKeyboardMouse(arg_8_1) then
		arg_8_0.ButtonLayoutButtons.ButtonLayouts:GainFocus()
	end

	arg_8_0.bindButton:addEventHandler("button_alt1", function(arg_17_0, arg_17_1)
		if var_8_3 then
			var_8_3 = false
		else
			var_8_3 = true
		end

		var_0_6(arg_8_0, arg_8_1, var_8_3)

		if arg_17_1.qualifier == "keyboard" or arg_17_1.qualifier == "gamepad" then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_8_0.bindButton:addEventHandler("button_select", function(arg_18_0, arg_18_1)
		ACTIONS.LeaveMenu(arg_8_0)
	end)
	arg_8_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()

	if CONDITIONS.IsSplitscreen(arg_8_0) then
		ACTIONS.AnimateSequence(arg_8_0.ButtonLayoutButtons, "Splitscreen")
	end
end

function ButtonLayout(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0.id = "ButtonLayout"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	var_19_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_19_1
	})
	var_19_0.HelperBar.id = "HelperBar"

	var_19_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_19_0.HelperBar:setPriority(10)
	var_19_0:addElement(var_19_0.HelperBar)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "MenuBackgroundImage"

	var_19_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.MenuBackgroundImage = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "MenuTitle"

	var_19_6.MenuTitle:setText(Engine.CBBHFCGDIC("MENU/BUTTON_LAYOUT_CAPS"), 0)
	var_19_6.Line:SetLeft(0, 0)
	var_19_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_19_0:addElement(var_19_6)

	var_19_0.MenuTitle = var_19_6

	local var_19_7

	if Engine.CIEGIACHAE() then
		var_19_7 = MenuBuilder.BuildRegisteredType("PS4VitaLayout", {
			controllerIndex = var_19_1
		})
		var_19_7.id = "PS4VitaLayout"

		if Engine.CIEGIACHAE() then
			var_19_7.ControllerImage:SetLeft(0, 0)
		end

		if Engine.CIEGIACHAE() then
			var_19_7.ControllerImage:SetRight(_1080p * 512, 0)
		end

		if Engine.CIEGIACHAE() then
			var_19_7.ControllerImage:SetTop(_1080p * 1, 0)
		end

		if Engine.CIEGIACHAE() then
			var_19_7.ControllerImage:SetBottom(_1080p * 513, 0)
		end

		var_19_7.Primary:SetLeft(_1080p * 538, 0)
		var_19_7.Primary:SetRight(_1080p * 742, 0)
		var_19_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 85.5, _1080p * 597.5, _1080p * -200, _1080p * 312)
		var_19_0:addElement(var_19_7)

		var_19_0.PS4VitaLayout = var_19_7
	end

	local var_19_8

	if CONDITIONS.IsPCOrPS4(var_19_0) then
		var_19_8 = MenuBuilder.BuildRegisteredType("PS4Layout", {
			controllerIndex = var_19_1
		})
		var_19_8.id = "PS4Layout"

		var_19_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 83.5, _1080p * 595.5, _1080p * -269, _1080p * 243)
		var_19_0:addElement(var_19_8)

		var_19_0.PS4Layout = var_19_8
	end

	local var_19_9

	if CONDITIONS.IsPCOrXB3(var_19_0) then
		var_19_9 = MenuBuilder.BuildRegisteredType("XB3Layout", {
			controllerIndex = var_19_1
		})
		var_19_9.id = "XB3Layout"

		var_19_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 83.5, _1080p * 597.5, _1080p * -256, _1080p * 256)
		var_19_0:addElement(var_19_9)

		var_19_0.XB3Layout = var_19_9
	end

	local var_19_10
	local var_19_11 = MenuBuilder.BuildRegisteredType("ButtonLayoutButtons", {
		controllerIndex = var_19_1
	})

	var_19_11.id = "ButtonLayoutButtons"

	var_19_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -264, _1080p * -302, _1080p * 338)
	var_19_0:addElement(var_19_11)

	var_19_0.ButtonLayoutButtons = var_19_11

	local var_19_12
	local var_19_13 = MenuBuilder.BuildRegisteredType("SwapTriggersPrompt", {
		controllerIndex = var_19_1
	})

	var_19_13.id = "SwapTriggersPrompt"

	var_19_13.Background:SetAlpha(0.13, 0)
	var_19_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -185, _1080p * 864, _1080p * -302, _1080p * -262)
	var_19_0:addElement(var_19_13)

	var_19_0.SwapTriggersPrompt = var_19_13

	local var_19_14
	local var_19_15 = LUI.UIText.new()

	var_19_15.id = "CurrentLayoutName"

	var_19_15:setText("", 0)
	var_19_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_19_15:SetAlignment(LUI.Alignment.Center)
	var_19_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -185, _1080p * 864, _1080p * -293, _1080p * -269)
	var_19_0:addElement(var_19_15)

	var_19_0.CurrentLayoutName = var_19_15

	local function var_19_16()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_16

	local var_19_17

	if Engine.CIEGIACHAE() then
		local var_19_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1036
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1548
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 133
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 645
			},
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
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_19_7:RegisterAnimationSequence("Splitscreen", var_19_18)
	end

	if CONDITIONS.IsPCOrPS4(var_19_0) then
		local var_19_19 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1038
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1546
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 61
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 573
			},
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
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_19_8:RegisterAnimationSequence("Splitscreen", var_19_19)
	end

	if CONDITIONS.IsPCOrXB3(var_19_0) then
		local var_19_20 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1036
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1548
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 77
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 589
			},
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
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_19_9:RegisterAnimationSequence("Splitscreen", var_19_20)
	end

	local var_19_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 784
		}
	}

	var_19_11:RegisterAnimationSequence("Splitscreen", var_19_21)

	local var_19_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 765
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_19_13:RegisterAnimationSequence("Splitscreen", var_19_22)

	local var_19_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 765
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1824
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_19_15:RegisterAnimationSequence("Splitscreen", var_19_23)

	local function var_19_24()
		if Engine.CIEGIACHAE() then
			var_19_7:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrPS4(var_19_0) then
			var_19_8:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrXB3(var_19_0) then
			var_19_9:AnimateSequence("Splitscreen")
		end

		var_19_11:AnimateSequence("Splitscreen")
		var_19_13:AnimateSequence("Splitscreen")
		var_19_15:AnimateSequence("Splitscreen")
	end

	var_19_0._sequences.Splitscreen = var_19_24

	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_19_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_19_25 = LUI.UIBindButton.new()

	var_19_25.id = "selfBindButton"

	var_19_0:addElement(var_19_25)

	var_19_0.bindButton = var_19_25

	var_19_0.bindButton:addEventHandler("button_secondary", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_19_1
		end

		ACTIONS.LeaveMenu(var_19_0)
	end)
	var_0_10(var_19_0, var_19_1, arg_19_1)

	if CONDITIONS.IsSplitscreen(var_19_0) then
		ACTIONS.AnimateSequence(var_19_0, "Splitscreen")
	end

	return var_19_0
end

MenuBuilder.registerType("ButtonLayout", ButtonLayout)
LUI.FlowManager.RegisterStackPopBehaviour("ButtonLayout", var_0_3)
LockTable(_M)
