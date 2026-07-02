module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonOver" or "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonUp" or "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_active", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonUpActive" or "ButtonUpActive")
	end)
	arg_1_0:addEventHandler("button_over_active", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZButtonOver" or "ButtonOver")
	end)
	arg_1_0:addEventHandler("disable", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "Disabled")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonOverDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpDisabled")
	end)
	arg_1_0:addEventHandler("disable_active", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "DisabledActive")
	end)
	arg_1_0:addEventHandler("button_disable_active", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpDisabledActive")
	end)
	arg_1_0:addEventHandler("button_over_disable_active", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonOverDisabledActive")
	end)
	arg_1_0:addEventHandler("active", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = arg_1_1
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._wzTheme and "WZActive" or "Active")
	end)
	arg_1_0:addEventHandler("binding", function(arg_13_0, arg_13_1)
		if arg_13_0.GenericButtonBackground then
			arg_13_0.GenericButtonBackground:processEvent({
				name = "binding"
			})
			arg_13_0.GenericButtonBackground:AnimateSequence("Binding")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericOptionButtonBase(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_14_0.id = "GenericOptionButtonBase"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "GenericButtonBackground"

	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.GenericButtonBackground = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIStyledText.new()

	var_14_6.id = "Title"

	var_14_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_14_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetWordWrap(false)
	var_14_6:SetAlignment(LUI.Alignment.Left)
	var_14_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_14_6:SetOutlineRGBFromInt(0, 0)
	var_14_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 11)
	var_14_0:addElement(var_14_6)

	var_14_0.Title = var_14_6

	local var_14_7
	local var_14_8 = {
		{
			value = 5863813,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("DefaultSequence", var_14_8)

	local function var_14_9()
		var_14_6:AnimateSequence("DefaultSequence")
	end

	var_14_0._sequences.DefaultSequence = var_14_9

	local var_14_10
	local var_14_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_11)

	local function var_14_12()
		var_14_6:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_12

	local var_14_13
	local var_14_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_14)

	local function var_14_15()
		var_14_6:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_15

	local var_14_16
	local var_14_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("Active", var_14_17)

	local function var_14_18()
		var_14_6:AnimateSequence("Active")
	end

	var_14_0._sequences.Active = var_14_18

	local var_14_19
	local var_14_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverActive", var_14_20)

	local function var_14_21()
		var_14_6:AnimateSequence("ButtonOverActive")
	end

	var_14_0._sequences.ButtonOverActive = var_14_21

	local var_14_22
	local var_14_23 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpActive", var_14_23)

	local function var_14_24()
		var_14_6:AnimateSequence("ButtonUpActive")
	end

	var_14_0._sequences.ButtonUpActive = var_14_24

	local var_14_25
	local var_14_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("Disabled", var_14_26)

	local function var_14_27()
		var_14_6:AnimateSequence("Disabled")
	end

	var_14_0._sequences.Disabled = var_14_27

	local var_14_28
	local var_14_29 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_29)

	local function var_14_30()
		var_14_6:AnimateSequence("ButtonOverDisabled")
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_30

	local var_14_31
	local var_14_32 = {
		{
			value = 6710886,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabled", var_14_32)

	local function var_14_33()
		var_14_6:AnimateSequence("ButtonUpDisabled")
	end

	var_14_0._sequences.ButtonUpDisabled = var_14_33

	local var_14_34
	local var_14_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_6:RegisterAnimationSequence("DisabledActive", var_14_35)

	local function var_14_36()
		var_14_6:AnimateSequence("DisabledActive")
	end

	var_14_0._sequences.DisabledActive = var_14_36

	local var_14_37
	local var_14_38 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_14_38)

	local function var_14_39()
		var_14_6:AnimateSequence("ButtonOverDisabledActive")
	end

	var_14_0._sequences.ButtonOverDisabledActive = var_14_39

	local var_14_40
	local var_14_41 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_14_41)

	local function var_14_42()
		var_14_6:AnimateSequence("ButtonUpDisabledActive")
	end

	var_14_0._sequences.ButtonUpDisabledActive = var_14_42

	local var_14_43
	local var_14_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_14_6:RegisterAnimationSequence("AR", var_14_44)

	local function var_14_45()
		var_14_6:AnimateSequence("AR")
	end

	var_14_0._sequences.AR = var_14_45

	local var_14_46
	local var_14_47 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_14_6:RegisterAnimationSequence("WZButtonOver", var_14_47)

	local function var_14_48()
		var_14_6:AnimateSequence("WZButtonOver")
	end

	var_14_0._sequences.WZButtonOver = var_14_48

	local var_14_49
	local var_14_50 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow2
		}
	}

	var_14_6:RegisterAnimationSequence("WZButtonUpActive", var_14_50)

	local function var_14_51()
		var_14_6:AnimateSequence("WZButtonUpActive")
	end

	var_14_0._sequences.WZButtonUpActive = var_14_51

	local var_14_52
	local var_14_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_14_6:RegisterAnimationSequence("WZActive", var_14_53)

	local function var_14_54()
		var_14_6:AnimateSequence("WZActive")
	end

	var_14_0._sequences.WZActive = var_14_54

	local var_14_55
	local var_14_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow1
		}
	}

	var_14_6:RegisterAnimationSequence("WZButtonOverActive", var_14_56)

	local function var_14_57()
		var_14_6:AnimateSequence("WZButtonOverActive")
	end

	var_14_0._sequences.WZButtonOverActive = var_14_57

	local var_14_58
	local var_14_59 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneGlow2
		}
	}

	var_14_6:RegisterAnimationSequence("WZButtonUp", var_14_59)

	local function var_14_60()
		var_14_6:AnimateSequence("WZButtonUp")
	end

	var_14_0._sequences.WZButtonUp = var_14_60

	PostLoadFunc(var_14_0, var_14_1, arg_14_1)
	ACTIONS.AnimateSequence(var_14_0, "DefaultSequence")

	return var_14_0
end

MenuBuilder.registerType("GenericOptionButtonBase", GenericOptionButtonBase)
LockTable(_M)
