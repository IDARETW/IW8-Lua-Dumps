module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = ATTACHMENT.GetRef(arg_1_1, arg_1_2)
	local var_1_1 = ATTACHMENT.GetImage(var_1_0)
	local var_1_2 = ATTACHMENT.GetName(var_1_0)
	local var_1_3 = ATTACHMENT.GetCategory(var_1_0)
	local var_1_4 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(var_1_3))
	local var_1_5, var_1_6, var_1_7, var_1_8 = arg_1_0:getLocalRect()

	arg_1_0.Image:setImage(RegisterMaterial(var_1_1))
	arg_1_0.Name:setText(var_1_2)
	arg_1_0.Category:setText(var_1_4)
	arg_1_0:registerEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "equip_attachment",
			ref = arg_1_1
		})
	end)
	arg_1_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		arg_1_0:dispatchEventToCurrentMenu({
			name = "preview_attachment",
			ref = arg_1_1
		})
	end)
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Image)

	arg_4_0.Setup = var_0_0
end

function SwapAttachButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "SwapAttachButton"
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
	var_5_8:SetAnimMoveTime(2000)
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
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "Category"

	var_5_12:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetWordWrap(false)
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_12:SetStartupDelay(1000)
	var_5_12:SetLineHoldTime(400)
	var_5_12:SetAnimMoveTime(150)
	var_5_12:SetAnimMoveSpeed(50)
	var_5_12:SetEndDelay(1000)
	var_5_12:SetCrossfadeTime(400)
	var_5_12:SetFadeInTime(300)
	var_5_12:SetFadeOutTime(300)
	var_5_12:SetMaxVisibleLines(1)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -32, _1080p * 32, _1080p * 103, _1080p * 123)
	var_5_0:addElement(var_5_12)

	var_5_0.Category = var_5_12

	local var_5_13
	local var_5_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_5_15 = LUI.UIBorder.new(var_5_14)

	var_5_15.id = "Border"

	var_5_15:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_5_15:SetAlpha(0, 0)
	var_5_0:addElement(var_5_15)

	var_5_0.Border = var_5_15

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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Swap", var_5_24)

	local var_5_25 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("Swap", var_5_25)

	local function var_5_26()
		var_5_4:AnimateSequence("Swap")
		var_5_8:AnimateSequence("Swap")
		var_5_10:AnimateSequence("Swap")
		var_5_12:AnimateSequence("Swap")
		var_5_15:AnimateSequence("Swap")
	end

	var_5_0._sequences.Swap = var_5_26

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("SwapStreak", var_5_27)

	local var_5_28 = {
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

	var_5_8:RegisterAnimationSequence("SwapStreak", var_5_28)

	local var_5_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("SwapStreak", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("SwapStreak", var_5_30)

	local var_5_31 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_15:RegisterAnimationSequence("SwapStreak", var_5_31)

	local function var_5_32()
		var_5_4:AnimateSequence("SwapStreak")
		var_5_8:AnimateSequence("SwapStreak")
		var_5_10:AnimateSequence("SwapStreak")
		var_5_12:AnimateSequence("SwapStreak")
		var_5_15:AnimateSequence("SwapStreak")
	end

	var_5_0._sequences.SwapStreak = var_5_32

	var_5_12:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_12:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SwapAttachButton", SwapAttachButton)
LockTable(_M)
