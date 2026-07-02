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
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonUp")
	end)
end

local function var_0_1(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Image)

	arg_5_0.Setup = var_0_0

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

function SwapAttachButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_6_0.id = "SwapAttachButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "LoadoutItemButtonBackground"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.LoadoutItemButtonBackground = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Image"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * -38, _1080p * 38)
	var_6_0:addElement(var_6_6)

	var_6_0.Image = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Name"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_8:setText("", 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_8:SetStartupDelay(1000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(2000)
	var_6_8:SetAnimMoveSpeed(50)
	var_6_8:SetEndDelay(1000)
	var_6_8:SetCrossfadeTime(400)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(1)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -32, _1080p * 32, _1080p * 123, _1080p * 143)
	var_6_0:addElement(var_6_8)

	var_6_0.Name = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "SwapImage"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_6_10:SetAlpha(0, 0)
	var_6_10:SetZRotation(90, 0)
	var_6_10:setImage(RegisterMaterial("ui_attachment_swap"), 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -106, _1080p * -66)
	var_6_0:addElement(var_6_10)

	var_6_0.SwapImage = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIStyledText.new()

	var_6_12.id = "Category"

	var_6_12:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_6_12:setText("", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetWordWrap(false)
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_12:SetStartupDelay(1000)
	var_6_12:SetLineHoldTime(400)
	var_6_12:SetAnimMoveTime(150)
	var_6_12:SetAnimMoveSpeed(50)
	var_6_12:SetEndDelay(1000)
	var_6_12:SetCrossfadeTime(400)
	var_6_12:SetFadeInTime(300)
	var_6_12:SetFadeOutTime(300)
	var_6_12:SetMaxVisibleLines(1)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -32, _1080p * 32, _1080p * 103, _1080p * 123)
	var_6_0:addElement(var_6_12)

	var_6_0.Category = var_6_12

	local var_6_13
	local var_6_14 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_15 = LUI.UIBorder.new(var_6_14)

	var_6_15.id = "Border"

	var_6_15:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_6_15:SetAlpha(0, 0)
	var_6_0:addElement(var_6_15)

	var_6_0.Border = var_6_15

	local function var_6_16()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_18)

	local function var_6_19()
		var_6_8:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_21)

	local function var_6_22()
		var_6_8:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Swap", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Swap", var_6_25)

	local var_6_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("Swap", var_6_26)

	local var_6_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Swap", var_6_27)

	local var_6_28 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_15:RegisterAnimationSequence("Swap", var_6_28)

	local function var_6_29()
		var_6_4:AnimateSequence("Swap")
		var_6_8:AnimateSequence("Swap")
		var_6_10:AnimateSequence("Swap")
		var_6_12:AnimateSequence("Swap")
		var_6_15:AnimateSequence("Swap")
	end

	var_6_0._sequences.Swap = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("SwapStreak", var_6_31)

	local var_6_32 = {
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

	var_6_8:RegisterAnimationSequence("SwapStreak", var_6_32)

	local var_6_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("SwapStreak", var_6_33)

	local var_6_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("SwapStreak", var_6_34)

	local var_6_35 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_15:RegisterAnimationSequence("SwapStreak", var_6_35)

	local function var_6_36()
		var_6_4:AnimateSequence("SwapStreak")
		var_6_8:AnimateSequence("SwapStreak")
		var_6_10:AnimateSequence("SwapStreak")
		var_6_12:AnimateSequence("SwapStreak")
		var_6_15:AnimateSequence("SwapStreak")
	end

	var_6_0._sequences.SwapStreak = var_6_36

	local var_6_37
	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_38)

	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipSetup", var_6_39)

	local function var_6_40()
		var_6_8:AnimateSequence("WZWipSetup")
		var_6_10:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_40

	local var_6_41
	local var_6_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonOver", var_6_42)

	local function var_6_43()
		var_6_8:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_43

	local var_6_44
	local var_6_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipButtonUp", var_6_45)

	local function var_6_46()
		var_6_8:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_46

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SwapAttachButton", SwapAttachButton)
LockTable(_M)
