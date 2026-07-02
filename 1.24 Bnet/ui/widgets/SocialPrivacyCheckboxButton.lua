module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "Check")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Uncheck")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetValue = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function SocialPrivacyCheckboxButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 57 * _1080p)

	var_3_0.id = "SocialPrivacyCheckboxButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Mode"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 445, _1080p * 5, _1080p * 27)
	var_3_0:addElement(var_3_6)

	var_3_0.Mode = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "ModeDesc"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(2000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(2000)
	var_3_8:SetAnimMoveSpeed(150)
	var_3_8:SetEndDelay(2000)
	var_3_8:SetCrossfadeTime(1000)
	var_3_8:SetFadeInTime(400)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 445, _1080p * -25, _1080p * -5)
	var_3_0:addElement(var_3_8)

	var_3_0.ModeDesc = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "EquipIcon"

	var_3_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_3_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 460, _1080p * 480, _1080p * 18, _1080p * 38)
	var_3_0:addElement(var_3_10)

	var_3_0.EquipIcon = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_12)

	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_13)

	local function var_3_14()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_8:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_14

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_15)

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.lockedText
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_16)

	local function var_3_17()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_8:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_17

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOverDisabled", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOverDisabled", var_3_19)

	local function var_3_20()
		var_3_6:AnimateSequence("ButtonOverDisabled")
		var_3_8:AnimateSequence("ButtonOverDisabled")
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_20

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUpDisabled", var_3_21)

	local var_3_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUpDisabled", var_3_22)

	local function var_3_23()
		var_3_6:AnimateSequence("ButtonUpDisabled")
		var_3_8:AnimateSequence("ButtonUpDisabled")
	end

	var_3_0._sequences.ButtonUpDisabled = var_3_23

	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_25)

	local function var_3_26()
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_26

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_fill")
		}
	}

	var_3_10:RegisterAnimationSequence("Check", var_3_27)

	local function var_3_28()
		var_3_10:AnimateSequence("Check")
	end

	var_3_0._sequences.Check = var_3_28

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cac_equip_ring")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_10:RegisterAnimationSequence("Uncheck", var_3_29)

	local function var_3_30()
		var_3_10:AnimateSequence("Uncheck")
	end

	var_3_0._sequences.Uncheck = var_3_30

	var_3_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOverDisabled")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUpDisabled")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialPrivacyCheckboxButton", SocialPrivacyCheckboxButton)
LockTable(_M)
