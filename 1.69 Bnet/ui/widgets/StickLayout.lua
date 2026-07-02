module(..., package.seeall)

local var_0_0 = "options.stickLayout"

local function var_0_1()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	if arg_2_0.PS4Layout == nil then
		local var_2_0 = MenuBuilder.BuildRegisteredType("PS4StickLayout", {
			controllerIndex = arg_2_1
		})

		var_2_0.id = "PS4Layout"

		var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1488, _1080p * 216, _1080p * 728)
		arg_2_0:addElement(var_2_0)

		arg_2_0.PS4Layout = var_2_0
	end

	arg_2_0.controlLayout = arg_2_0.PS4Layout
end

local function var_0_3(arg_3_0, arg_3_1)
	if arg_3_0.XB3Layout == nil then
		local var_3_0 = MenuBuilder.BuildRegisteredType("XB3StickLayout", {
			controllerIndex = arg_3_1
		})

		var_3_0.id = "XB3Layout"

		var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1488, _1080p * 200, _1080p * 712)
		arg_3_0:addElement(var_3_0)

		arg_3_0.XB3Layout = var_3_0
	end

	arg_3_0.controlLayout = arg_3_0.XB3Layout
end

local function var_0_4(arg_4_0, arg_4_1)
	if arg_4_0.PS4VitaLayout == nil then
		local var_4_0 = MenuBuilder.BuildRegisteredType("PS4VitaStickLayout", {
			controllerIndex = arg_4_1
		})

		var_4_0.id = "PS4VitaLayout"

		var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 236, _1080p * 748)
		arg_4_0:addElement(var_4_0)

		arg_4_0.PS4VitaLayout = var_4_0
	end

	arg_4_0.controlLayout = arg_4_0.PS4VitaLayout
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MenuBackgroundImage)

	arg_5_0.CreatePS4Layout = var_0_2
	arg_5_0.CreateXB3Layout = var_0_3
	arg_5_0.CreateVitaLayout = var_0_4

	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("PLATFORM/THUMBSTICK_LAYOUT_CAPS"))

	if not Engine.DDJFBBJAIG() then
		arg_5_0:addEventHandler("menu_create", function()
			arg_5_0:AddButtonHelperText({
				clickable = true,
				priority = 2,
				side = "left",
				kbmTooltipPromptOverload = "button_dismiss_pause_menu",
				button_ref = "button_start",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DISMISS_MENU")
			})
		end)
		arg_5_0.bindButton:addEventHandler("button_start", function(arg_7_0, arg_7_1)
			if Engine.CAADCDEEIA() then
				ACTIONS.ResumeGame(arg_7_0)
			end

			LUI.FlowManager.RequestCloseAllMenus()

			return true
		end)
		MenuUtils.AddDismissPauseMenuKBMHandler(arg_5_0)
	end

	assert(arg_5_0.StickLayoutButtons.StickLayouts)

	local var_5_0 = StringTable.BFHCAIIDA(CSV.stickLayouts.file)
	local var_5_1 = LUI.DataSourceFromList.new(var_5_0)
	local var_5_2 = CSV.ReadRow(CSV.stickLayouts, 0)
	local var_5_3 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".oldColor", GetIntForColor(SWATCHES.layouts.oldLayout))
	local var_5_4 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".newColor", GetIntForColor(SWATCHES.layouts.newLayout))

	local function var_5_5(arg_8_0, arg_8_1)
		return arg_8_0[arg_8_1] == var_5_2[arg_8_1] and var_5_3 or var_5_4
	end

	function var_5_1.MakeDataSourceAtIndex(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = CSV.ReadRow(CSV.stickLayouts, arg_9_1)
		local var_9_1 = var_0_0 .. "." .. arg_9_1

		return {
			ref = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".ref", var_9_0.cfg),
			name = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".name", Engine.CBBHFCGDIC(var_9_0.name)),
			left = {
				up = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".left.up", Engine.CBBHFCGDIC(var_9_0.leftUp)),
				upColor = var_5_5(var_9_0, "leftUp"),
				down = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".left.down", Engine.CBBHFCGDIC(var_9_0.leftDown)),
				downColor = var_5_5(var_9_0, "leftDown"),
				left = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".left.left", Engine.CBBHFCGDIC(var_9_0.leftLeft)),
				leftColor = var_5_5(var_9_0, "leftLeft"),
				right = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".left.right", Engine.CBBHFCGDIC(var_9_0.leftRight)),
				rightColor = var_5_5(var_9_0, "leftRight"),
				button = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".left.button", Engine.CBBHFCGDIC(var_9_0.leftButton)),
				buttonColor = var_5_5(var_9_0, "leftButton")
			},
			right = {
				up = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".right.up", Engine.CBBHFCGDIC(var_9_0.rightUp)),
				upColor = var_5_5(var_9_0, "rightUp"),
				down = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".right.down", Engine.CBBHFCGDIC(var_9_0.rightDown)),
				downColor = var_5_5(var_9_0, "rightDown"),
				left = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".right.left", Engine.CBBHFCGDIC(var_9_0.rightLeft)),
				leftColor = var_5_5(var_9_0, "rightLeft"),
				right = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".right.right", Engine.CBBHFCGDIC(var_9_0.rightRight)),
				rightColor = var_5_5(var_9_0, "rightRight"),
				button = LUI.DataSourceInGlobalModel.new(var_9_1 .. ".right.button", Engine.CBBHFCGDIC(var_9_0.rightButton)),
				buttonColor = var_5_5(var_9_0, "rightButton")
			}
		}
	end

	function var_5_1.GetDefaultFocusIndex()
		local var_10_0 = Engine.BECCFCBIAA("gpadSticksConfig", arg_5_1)

		for iter_10_0 = 0, var_5_1:GetCountValue(arg_5_1) do
			if var_10_0 == var_5_1:GetDataSourceAtIndex(iter_10_0).ref:GetValue(arg_5_1) then
				return iter_10_0
			end
		end
	end

	arg_5_0.StickLayoutButtons.StickLayouts:SetGridDataSource(var_5_1, arg_5_1)

	if LUI.IsLastInputKeyboardMouse(arg_5_1) then
		arg_5_0.StickLayoutButtons.StickLayouts:GainFocus()
	end

	arg_5_0:registerAndCallEventHandler("input_connection", function(arg_11_0, arg_11_1)
		if Engine.CIEGIACHAE() then
			if Engine.BIAEDEEBJI(arg_5_1) then
				if arg_11_0.PS4Layout then
					arg_11_0:RemoveElement(arg_11_0.PS4Layout)
					arg_11_0.PS4Layout:closeTree()

					arg_11_0.PS4Layout = nil
				end

				arg_11_0:CreateVitaLayout(arg_11_1.controllerIndex)
			else
				if arg_11_0.PS4VitaLayout then
					arg_11_0:RemoveElement(arg_11_0.PS4VitaLayout)
					arg_11_0.PS4VitaLayout:closeTree()

					arg_11_0.PS4VitaLayout = nil
				end

				arg_11_0:CreatePS4Layout(arg_11_1.controllerIndex)
			end
		elseif Engine.BAHIIBFDDG() then
			assert(arg_11_0.XB3Layout)

			arg_11_0.controlLayout = arg_11_0.XB3Layout
		elseif not Engine.HDGDBCJFG() then
			if Engine.GGFCHCDDE(arg_11_1.controllerIndex) or Engine.FIIDEFBHJ(arg_11_1.controllerIndex) then
				if arg_11_0.XB3Layout then
					arg_11_0:RemoveElement(arg_11_0.XB3Layout)
					arg_11_0.XB3Layout:closeTree()

					arg_11_0.XB3Layout = nil
				end

				arg_11_0:CreatePS4Layout(arg_11_1.controllerIndex)
			else
				if arg_11_0.PS4Layout then
					arg_11_0:RemoveElement(arg_11_0.PS4Layout)
					arg_11_0.PS4Layout:closeTree()

					arg_11_0.PS4Layout = nil
				end

				arg_11_0:CreateXB3Layout(arg_11_1.controllerIndex)
			end
		end

		if arg_11_0.controlLayout then
			arg_11_0.controlLayout:SetDataSourceThroughElement(arg_11_0.StickLayoutButtons.StickLayouts, nil)
		end
	end, {
		name = "input_connection",
		controllerIndex = arg_5_1
	})
	arg_5_0.bindButton:addEventHandler("button_select", function(arg_12_0, arg_12_1)
		ACTIONS.LeaveMenu(arg_5_0)
	end)
	arg_5_0.MenuBackgroundImage:SetVideoSizeUpdateHandler()
end

function StickLayout(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "StickLayout"
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
	local var_13_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "MenuBackgroundImage"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.MenuBackgroundImage = var_13_4

	local var_13_5

	if Engine.CIEGIACHAE() then
		var_13_5 = MenuBuilder.BuildRegisteredType("PS4VitaStickLayout", {
			controllerIndex = var_13_1
		})
		var_13_5.id = "PS4VitaLayout"

		var_13_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 937, _1080p * 1449, _1080p * 236, _1080p * 748)
		var_13_0:addElement(var_13_5)

		var_13_0.PS4VitaLayout = var_13_5
	end

	local var_13_6

	if CONDITIONS.IsPCOrPS4(var_13_0) then
		var_13_6 = MenuBuilder.BuildRegisteredType("PS4StickLayout", {
			controllerIndex = var_13_1
		})
		var_13_6.id = "PS4Layout"

		var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1488, _1080p * 216, _1080p * 728)
		var_13_0:addElement(var_13_6)

		var_13_0.PS4Layout = var_13_6
	end

	local var_13_7

	if CONDITIONS.IsPCOrXB3(var_13_0) then
		var_13_7 = MenuBuilder.BuildRegisteredType("XB3StickLayout", {
			controllerIndex = var_13_1
		})
		var_13_7.id = "XB3Layout"

		var_13_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 976, _1080p * 1488, _1080p * 200, _1080p * 712)
		var_13_0:addElement(var_13_7)

		var_13_0.XB3Layout = var_13_7
	end

	local var_13_8
	local var_13_9 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_9.id = "MenuTitle"

	var_13_9.MenuTitle:setText(Engine.CBBHFCGDIC("PLATFORM/THUMBSTICK_LAYOUT_CAPS"), 0)
	var_13_9.Line:SetLeft(0, 0)
	var_13_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_9)

	var_13_0.MenuTitle = var_13_9

	local var_13_10
	local var_13_11 = MenuBuilder.BuildRegisteredType("StickLayoutButtons", {
		controllerIndex = var_13_1
	})

	var_13_11.id = "StickLayoutButtons"

	var_13_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 300, _1080p * 750)
	var_13_0:addElement(var_13_11)

	var_13_0.StickLayoutButtons = var_13_11

	local function var_13_12()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_12

	local var_13_13

	if Engine.CIEGIACHAE() then
		local var_13_14 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 999
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1511
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 82
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 594
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

		var_13_5:RegisterAnimationSequence("Splitscreen", var_13_14)
	end

	if CONDITIONS.IsPCOrPS4(var_13_0) then
		local var_13_15 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 999
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1511
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -33
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 479
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

		var_13_6:RegisterAnimationSequence("Splitscreen", var_13_15)
	end

	if CONDITIONS.IsPCOrXB3(var_13_0) then
		local var_13_16 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 998
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1510
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -61
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 451
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

		var_13_7:RegisterAnimationSequence("Splitscreen", var_13_16)
	end

	local var_13_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 598
		}
	}

	var_13_11:RegisterAnimationSequence("Splitscreen", var_13_17)

	local function var_13_18()
		if Engine.CIEGIACHAE() then
			var_13_5:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrPS4(var_13_0) then
			var_13_6:AnimateSequence("Splitscreen")
		end

		if CONDITIONS.IsPCOrXB3(var_13_0) then
			var_13_7:AnimateSequence("Splitscreen")
		end

		var_13_11:AnimateSequence("Splitscreen")
	end

	var_13_0._sequences.Splitscreen = var_13_18

	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_13_19 = LUI.UIBindButton.new()

	var_13_19.id = "selfBindButton"

	var_13_0:addElement(var_13_19)

	var_13_0.bindButton = var_13_19

	var_13_0.bindButton:addEventHandler("button_secondary", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)
	var_0_5(var_13_0, var_13_1, arg_13_1)

	if CONDITIONS.IsSplitscreen(var_13_0) then
		ACTIONS.AnimateSequence(var_13_0, "Splitscreen")
	end

	return var_13_0
end

MenuBuilder.registerType("StickLayout", StickLayout)
LUI.FlowManager.RegisterStackPopBehaviour("StickLayout", var_0_1)
LockTable(_M)
