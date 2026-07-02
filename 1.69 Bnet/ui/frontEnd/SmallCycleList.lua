module(..., package.seeall)

local var_0_0 = 1 / _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0._currentTier = arg_1_1
end

local function var_0_2(arg_2_0)
	return arg_2_0._currentTier
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0.pipsPosition == nil then
		arg_3_0:CalculatePositions(arg_3_2)
	end

	arg_3_0:SetPipPosition(arg_3_1)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.PipsLine:GetCurrentAnchorsAndPositions().left * var_0_0
	local var_4_1 = LAYOUT.GetElementWidth(arg_4_0.PipsLine) * var_0_0 / arg_4_2

	return var_4_0 + (arg_4_1 - 1) * var_4_1, var_4_0 + arg_4_1 * var_4_1
end

local function var_0_5(arg_5_0, arg_5_1)
	arg_5_0.pipsPosition = {}

	for iter_5_0 = 1, arg_5_1 do
		local var_5_0, var_5_1 = arg_5_0.CalculatePipPosition(arg_5_0, iter_5_0, arg_5_1)

		table.insert(arg_5_0.pipsPosition, {
			var_5_0,
			var_5_1
		})
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	if arg_6_1 <= #arg_6_0.pipsPosition then
		local var_6_0 = arg_6_0.pipsPosition[arg_6_1]

		arg_6_0.Pip:SetLeft(_1080p * var_6_0[1])
		arg_6_0.Pip:SetRight(_1080p * var_6_0[2])
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.UpdatePip = var_0_3
	arg_7_0.SetPipPosition = var_0_6
	arg_7_0.CalculatePipPosition = var_0_4
	arg_7_0.CalculatePositions = var_0_5
	arg_7_0.SetCurrentTier = var_0_1
	arg_7_0.GetCurrentTier = var_0_2
end

function SmallCycleList(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 70 * _1080p, 0, 30 * _1080p)

	var_8_0.id = "SmallCycleList"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "PipsLine"

	var_8_4:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_8_4:SetAlpha(0.75, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 70, _1080p * 27, _1080p * 28)
	var_8_0:addElement(var_8_4)

	var_8_0.PipsLine = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericCycleListPip", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "Pip"

	var_8_6:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 70, _1080p * 25, _1080p * 27)
	var_8_0:addElement(var_8_6)

	var_8_0.Pip = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "Text"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_8:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetWordWrap(false)
	var_8_8:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetUseEllipses(ELLIPSES.enabled_default)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, _1080p * 34, _1080p * 3, _1080p * 23)
	var_8_0:addElement(var_8_8)

	var_8_0.Text = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("MasterChallengesArrowButton", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "ArrowLeft"

	var_8_10:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_8_10.Image:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 44, _1080p * 8, _1080p * 18)
	var_8_0:addElement(var_8_10)

	var_8_0.ArrowLeft = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("MasterChallengesArrowButton", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "ArrowRight"

	var_8_12:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_8_12.Image:SetZRotation(180, 0)
	var_8_12.Image:setImage(RegisterMaterial("icon_option_arrow"), 0)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 54, _1080p * 64, _1080p * 8, _1080p * 18)
	var_8_0:addElement(var_8_12)

	var_8_0.ArrowRight = var_8_12

	local function var_8_13()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_13

	local var_8_14
	local var_8_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.active
		}
	}

	var_8_8:RegisterAnimationSequence("Active", var_8_15)

	local function var_8_16()
		var_8_8:AnimateSequence("Active")
	end

	var_8_0._sequences.Active = var_8_16

	local var_8_17
	local var_8_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_8_8:RegisterAnimationSequence("NotActive", var_8_18)

	local function var_8_19()
		var_8_8:AnimateSequence("NotActive")
	end

	var_8_0._sequences.NotActive = var_8_19

	local var_8_20
	local var_8_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_21)

	local function var_8_22()
		var_8_6:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_22

	local var_8_23
	local var_8_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_24)

	local function var_8_25()
		var_8_6:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankCareer
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipActive", var_8_27)

	local function var_8_28()
		var_8_8:AnimateSequence("WZWipActive")
	end

	var_8_0._sequences.WZWipActive = var_8_28

	local var_8_29
	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonOver", var_8_30)

	local function var_8_31()
		var_8_6:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipButtonUp", var_8_33)

	local function var_8_34()
		var_8_6:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_34

	local var_8_35
	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_8_8:RegisterAnimationSequence("WZWipNotActive", var_8_36)

	local function var_8_37()
		var_8_8:AnimateSequence("WZWipNotActive")
	end

	var_8_0._sequences.WZWipNotActive = var_8_37

	var_0_7(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SmallCycleList", SmallCycleList)
LockTable(_M)
