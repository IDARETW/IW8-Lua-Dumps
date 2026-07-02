module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.HeaderText:getLocalRect()
	local var_1_4 = var_1_1 * 2

	local function var_1_5(arg_2_0, arg_2_1)
		arg_2_0:SetAnchorsAndPosition(arg_2_0._curDimensions.leftAnchor, arg_2_0._curDimensions.rightAnchor, arg_2_0._curDimensions.topAnchor, arg_2_0._curDimensions.bottomAnchor, arg_2_0._curDimensions.left, arg_2_0._curDimensions.right, arg_2_0._curDimensions.top, arg_2_0._curDimensions.top + arg_2_1, 150)
	end

	local var_1_6 = var_1_4 + LAYOUT.GetTextHeightWithWrapping(arg_1_0.HeaderText, arg_1_0.HeaderText:getText())

	if arg_1_0._isShowing and arg_1_0._maps then
		local var_1_7 = math.ceil(#arg_1_0._maps / 2)

		var_1_7 = var_1_7 <= arg_1_0.MapsAvailable:GetMaxVisibleRows() and var_1_7 or arg_1_0.MapsAvailable:GetMaxVisibleRows()
		var_1_6 = var_1_6 + var_1_7 * 146 * _1080p
	end

	var_1_5(arg_1_0, var_1_6)
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0._maps = {}

	for iter_3_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		local var_3_0 = Lobby.CJEHDHDGBH(iter_3_0)
		local var_3_1 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_3_0, CSV.mpMapTable.cols.bradleyEnabled)

		if var_3_1 and #var_3_1 > 0 and tonumber(var_3_1) == 1 then
			local var_3_2 = {
				name = Lobby.CAAHCDGEDH(iter_3_0),
				image = MP.GetMapImage(var_3_0)
			}

			table.insert(arg_3_0._maps, var_3_2)
		end
	end
end

local function var_0_2(arg_4_0)
	local var_4_0 = ""

	if arg_4_0._isShowing then
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/HIDE_AVAILABLE_MAPS")
	else
		var_4_0 = Engine.CBBHFCGDIC("LUA_MENU/SHOW_AVAILABLE_MAPS")
	end

	arg_4_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_left_trigger",
		helper_text = var_4_0
	}, {
		replaceTop = true
	})
end

local function var_0_3(arg_5_0)
	arg_5_0.MapsAvailable:SetNumChildren(#arg_5_0._maps)
	arg_5_0.MapsAvailable:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		local var_6_0 = arg_6_1 + arg_6_2 * arg_5_0.MapsAvailable:GetNumColumns()

		arg_6_0.Name:setText(arg_5_0._maps[var_6_0 + 1].name)
		arg_6_0.Image:setImage(RegisterMaterial(arg_5_0._maps[var_6_0 + 1].image))
	end)
end

local function var_0_4(arg_7_0, arg_7_1)
	arg_7_0._isShowing = arg_7_1

	ACTIONS.AnimateSequence(arg_7_0, arg_7_0._isShowing and "Show" or "Hide")
	var_0_2(arg_7_0)

	if arg_7_0._curDimensions then
		arg_7_0:UpdatePanel()
	end
end

local function var_0_5(arg_8_0, arg_8_1)
	arg_8_0._isVisible = arg_8_1

	arg_8_0:SetAlpha(arg_8_1 and 1 or 0)
	arg_8_0:SetShowing(false)
end

local function var_0_6(arg_9_0)
	arg_9_0.BindButton = LUI.UIBindButton.new()
	arg_9_0.BindButton.id = "BindButton"

	arg_9_0:addElement(arg_9_0.BindButton)
	arg_9_0.BindButton:addEventHandler("button_left_trigger", function(arg_10_0, arg_10_1)
		if arg_9_0._isVisible then
			arg_9_0:SetShowing(not arg_9_0._isShowing)
			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)
		end
	end)
	arg_9_0.BindButton:addEventHandler("gamepad_button", function(arg_11_0, arg_11_1)
		if arg_9_0._isShowing and arg_11_1.down then
			if arg_11_1.button == "up" then
				arg_9_0.MapsAvailable:Scroll(arg_11_1.button)
			elseif arg_11_1.button == "down" then
				arg_9_0.MapsAvailable:Scroll(arg_11_1.button)
			end
		end
	end)
end

local function var_0_7(arg_12_0, arg_12_1)
	arg_12_0._curDimensions = arg_12_1
end

local function var_0_8(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.SetShowing = var_0_4
	arg_13_0.SetVisible = var_0_5
	arg_13_0.UpdatePanel = var_0_0
	arg_13_0.InitializeDimensions = var_0_7
	arg_13_0._curDimensions = nil

	arg_13_0:SetShowing(false)
	arg_13_0:SetVisible(false)
	var_0_1(arg_13_0, arg_13_1)
	var_0_2(arg_13_0)
	var_0_3(arg_13_0)
	var_0_6(arg_13_0)
end

function MapsStreakAvailable(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 372 * _1080p)

	var_14_0.id = "MapsStreakAvailable"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "DoubleNotchedBacker"

	var_14_4:SetAlpha(0.75, 0)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.DoubleNotchedBacker = var_14_4

	local var_14_5
	local var_14_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 2,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_14_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MapNameWithImage", {
				controllerIndex = var_14_1
			})
		end,
		refreshChild = function(arg_16_0, arg_16_1, arg_16_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 136,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom
	}
	local var_14_7 = LUI.UIGrid.new(var_14_6)

	var_14_7.id = "MapsAvailable"

	var_14_7:setUseStencil(true)
	var_14_7:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 26, _1080p * 434, _1080p * -304, _1080p * -22)
	var_14_0:addElement(var_14_7)

	var_14_0.MapsAvailable = var_14_7

	local var_14_8
	local var_14_9 = LUI.UIText.new()

	var_14_9.id = "HeaderText"

	var_14_9:SetRGBFromInt(10853781, 0)
	var_14_9:setText(Engine.CBBHFCGDIC("LUA_MENU/AVAILABLE_ON_MAPS"), 0)
	var_14_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_9:SetAlignment(LUI.Alignment.Left)
	var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 434, _1080p * 18, _1080p * 37)
	var_14_0:addElement(var_14_9)

	var_14_0.HeaderText = var_14_9

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "ButtonHelperBar"

	var_14_11.Background:SetAlpha(0, 0)
	var_14_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -107, _1080p * 373, _1080p * 1, _1080p * 59)
	var_14_0:addElement(var_14_11)

	var_14_0.ButtonHelperBar = var_14_11

	local var_14_12
	local var_14_13 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_14_1
	})

	var_14_13.id = "VerticalScrollbar"

	var_14_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 448, _1080p * 458, _1080p * 68, _1080p * 350)
	var_14_0:addElement(var_14_13)

	var_14_0.VerticalScrollbar = var_14_13

	local function var_14_14()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_14

	local var_14_15
	local var_14_16 = {
		{
			value = 0.85,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("Show", var_14_16)

	local var_14_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_7:RegisterAnimationSequence("Show", var_14_17)

	local var_14_18 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("Show", var_14_18)

	local function var_14_19()
		var_14_4:AnimateSequence("Show")
		var_14_7:AnimateSequence("Show")
		var_14_13:AnimateSequence("Show")
	end

	var_14_0._sequences.Show = var_14_19

	local var_14_20
	local var_14_21 = {
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("Hide", var_14_21)

	local var_14_22 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_7:RegisterAnimationSequence("Hide", var_14_22)

	local var_14_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("Hide", var_14_23)

	local function var_14_24()
		var_14_4:AnimateSequence("Hide")
		var_14_7:AnimateSequence("Hide")
		var_14_13:AnimateSequence("Hide")
	end

	var_14_0._sequences.Hide = var_14_24

	local var_14_25 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_14_13,
		startCap = var_14_13.startCap,
		endCap = var_14_13.endCap,
		sliderArea = var_14_13.sliderArea,
		slider = var_14_13.sliderArea and var_14_13.sliderArea.slider,
		fixedSizeSlider = var_14_13.sliderArea and var_14_13.sliderArea.fixedSizeSlider
	})

	var_14_7:AddScrollbar(var_14_25)
	var_0_8(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("MapsStreakAvailable", MapsStreakAvailable)
LockTable(_M)
