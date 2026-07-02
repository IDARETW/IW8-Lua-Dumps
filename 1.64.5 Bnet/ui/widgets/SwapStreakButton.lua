module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0:getLocalRect()

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "preview_streak",
			streakData = arg_1_1
		})
	end)
	arg_1_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if arg_3_0.MenuButtonAction then
			arg_3_0.MenuButtonAction(arg_3_0, arg_3_1)
		end
	end)
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Image)

	arg_4_0.Setup = var_0_0
end

function SwapStreakButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "SwapStreakButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "LoadoutItemButtonBackground"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.LoadoutItemButtonBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Image"

	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * -38, _1080p * 38)
	var_5_0:addElement(var_5_6)

	var_5_0.Image = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Name"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_8:SetStartupDelay(1000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(150)
	var_5_8:SetAnimMoveSpeed(50)
	var_5_8:SetEndDelay(1000)
	var_5_8:SetCrossfadeTime(400)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(1)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -32, _1080p * 32, _1080p * 123, _1080p * 143)
	var_5_0:addElement(var_5_8)

	var_5_0.Name = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "SwapImage"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_5_10:SetAlpha(0, 0)
	var_5_10:SetZRotation(90, 0)
	var_5_10:setImage(RegisterMaterial("ui_attachment_swap"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -106, _1080p * -66)
	var_5_0:addElement(var_5_10)

	var_5_0.SwapImage = var_5_10

	local var_5_11
	local var_5_12 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_13 = LUI.UIBorder.new(var_5_12)

	var_5_13.id = "Border"

	var_5_13:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_13:SetAlpha(0, 0)
	var_5_0:addElement(var_5_13)

	var_5_0.Border = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIStyledText.new()

	var_5_15.id = "Cost"

	var_5_15:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_15:setText("", 0)
	var_5_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_15:SetWordWrap(false)
	var_5_15:SetAlignment(LUI.Alignment.Center)
	var_5_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_15:SetStartupDelay(1000)
	var_5_15:SetLineHoldTime(400)
	var_5_15:SetAnimMoveTime(150)
	var_5_15:SetAnimMoveSpeed(50)
	var_5_15:SetEndDelay(1000)
	var_5_15:SetCrossfadeTime(400)
	var_5_15:SetFadeInTime(300)
	var_5_15:SetFadeOutTime(300)
	var_5_15:SetMaxVisibleLines(1)
	var_5_15:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -32, _1080p * 32, _1080p * 103, _1080p * 123)
	var_5_0:addElement(var_5_15)

	var_5_0.Cost = var_5_15

	local function var_5_16()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_16

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_17)

	local function var_5_18()
		var_5_8:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_18

	local var_5_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_19)

	local function var_5_20()
		var_5_8:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_20

	local var_5_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Swap", var_5_21)

	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 123
		}
	}

	var_5_8:RegisterAnimationSequence("Swap", var_5_22)

	local var_5_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Swap", var_5_23)

	local var_5_24 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_13:RegisterAnimationSequence("Swap", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Swap", var_5_25)

	local function var_5_26()
		var_5_4:AnimateSequence("Swap")
		var_5_8:AnimateSequence("Swap")
		var_5_10:AnimateSequence("Swap")
		var_5_13:AnimateSequence("Swap")
		var_5_15:AnimateSequence("Swap")
	end

	var_5_0._sequences.Swap = var_5_26

	var_5_15:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_15:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SwapStreakButton", SwapStreakButton)
LockTable(_M)
