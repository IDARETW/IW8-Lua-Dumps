module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CompactDropdownButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 26 * _1080p)

	var_2_0.id = "CompactDropdownButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Highlight"

	var_2_4:SetRGBFromInt(6710886, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Highlight = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericFooterButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ButtonBackground"

	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * 1)
	var_2_0:addElement(var_2_6)

	var_2_0.ButtonBackground = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "ButtonLabel"

	var_2_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetWordWrap(false)
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_8:SetStartupDelay(2000)
	var_2_8:SetLineHoldTime(400)
	var_2_8:SetAnimMoveTime(2000)
	var_2_8:SetAnimMoveSpeed(150)
	var_2_8:SetEndDelay(1000)
	var_2_8:SetCrossfadeTime(1000)
	var_2_8:SetFadeInTime(300)
	var_2_8:SetFadeOutTime(300)
	var_2_8:SetMaxVisibleLines(1)
	var_2_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 13, _1080p * -22, _1080p * -9, _1080p * 9)
	var_2_0:addElement(var_2_8)

	var_2_0.ButtonLabel = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonOver", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_11

	local var_2_12 = {
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("ButtonUp", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_13

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_14)

	local function var_2_15()
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_15

	var_2_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CompactDropdownButton", CompactDropdownButton)
LockTable(_M)
