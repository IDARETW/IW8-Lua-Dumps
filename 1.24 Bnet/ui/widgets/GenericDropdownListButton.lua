module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericDropdownListButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 880 * _1080p, 0, 54 * _1080p)

	var_2_0.id = "GenericDropdownListButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "GenericButtonBackground"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 5, _1080p * -5)
	var_2_0:addElement(var_2_4)

	var_2_0.GenericButtonBackground = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Text"

	var_2_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("MENU/NEW"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_2_6:SetOutlineRGBFromInt(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_6)

	var_2_0.Text = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "Icon"

	var_2_8:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_2_8:SetAlpha(0, 0)
	var_2_8:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_2_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -11, _1080p * -11, _1080p * 11)
	var_2_0:addElement(var_2_8)

	var_2_0.Icon = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "NewItemSmallIcon"

	var_2_10:SetAlpha(0, 0)
	var_2_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -26, _1080p * -18, _1080p * 22, _1080p * 30)
	var_2_0:addElement(var_2_10)

	var_2_0.NewItemSmallIcon = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_13)

	local function var_2_14()
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_14

	local var_2_15
	local var_2_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_16)

	local function var_2_17()
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_17

	local var_2_18
	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_2_6:RegisterAnimationSequence("Active", var_2_19)

	local function var_2_20()
		var_2_6:AnimateSequence("Active")
	end

	var_2_0._sequences.Active = var_2_20

	local var_2_21
	local var_2_22 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverActive", var_2_22)

	local function var_2_23()
		var_2_6:AnimateSequence("ButtonOverActive")
	end

	var_2_0._sequences.ButtonOverActive = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpActive", var_2_25)

	local function var_2_26()
		var_2_6:AnimateSequence("ButtonUpActive")
	end

	var_2_0._sequences.ButtonUpActive = var_2_26

	local var_2_27
	local var_2_28 = {
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

	var_2_6:RegisterAnimationSequence("Disabled", var_2_28)

	local function var_2_29()
		var_2_6:AnimateSequence("Disabled")
	end

	var_2_0._sequences.Disabled = var_2_29

	local var_2_30
	local var_2_31 = {
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

	var_2_6:RegisterAnimationSequence("ButtonOverDisabled", var_2_31)

	local function var_2_32()
		var_2_6:AnimateSequence("ButtonOverDisabled")
	end

	var_2_0._sequences.ButtonOverDisabled = var_2_32

	local var_2_33
	local var_2_34 = {
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

	var_2_6:RegisterAnimationSequence("ButtonUpDisabled", var_2_34)

	local function var_2_35()
		var_2_6:AnimateSequence("ButtonUpDisabled")
	end

	var_2_0._sequences.ButtonUpDisabled = var_2_35

	local var_2_36
	local var_2_37 = {
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

	var_2_6:RegisterAnimationSequence("DisabledActive", var_2_37)

	local function var_2_38()
		var_2_6:AnimateSequence("DisabledActive")
	end

	var_2_0._sequences.DisabledActive = var_2_38

	local var_2_39
	local var_2_40 = {
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

	var_2_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_2_40)

	local function var_2_41()
		var_2_6:AnimateSequence("ButtonOverDisabledActive")
	end

	var_2_0._sequences.ButtonOverDisabledActive = var_2_41

	local var_2_42
	local var_2_43 = {
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

	var_2_6:RegisterAnimationSequence("ButtonUpDisabledActive", var_2_43)

	local function var_2_44()
		var_2_6:AnimateSequence("ButtonUpDisabledActive")
	end

	var_2_0._sequences.ButtonUpDisabledActive = var_2_44

	local var_2_45
	local var_2_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		}
	}

	var_2_6:RegisterAnimationSequence("Selected", var_2_46)

	local var_2_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Selected", var_2_47)

	local function var_2_48()
		var_2_6:AnimateSequence("Selected")
		var_2_8:AnimateSequence("Selected")
	end

	var_2_0._sequences.Selected = var_2_48

	local var_2_49
	local var_2_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_2_6:RegisterAnimationSequence("NotSelected", var_2_50)

	local function var_2_51()
		var_2_6:AnimateSequence("NotSelected")
	end

	var_2_0._sequences.NotSelected = var_2_51

	local var_2_52
	local var_2_53 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpSelected", var_2_53)

	local function var_2_54()
		var_2_6:AnimateSequence("ButtonUpSelected")
	end

	var_2_0._sequences.ButtonUpSelected = var_2_54

	local var_2_55
	local var_2_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		}
	}

	var_2_6:RegisterAnimationSequence("AR", var_2_56)

	local function var_2_57()
		var_2_6:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_57

	local var_2_58
	local var_2_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 48
		}
	}

	var_2_6:RegisterAnimationSequence("SelectedAR", var_2_59)

	local var_2_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_2_8:RegisterAnimationSequence("SelectedAR", var_2_60)

	local function var_2_61()
		var_2_6:AnimateSequence("SelectedAR")
		var_2_8:AnimateSequence("SelectedAR")
	end

	var_2_0._sequences.SelectedAR = var_2_61

	local var_2_62
	local var_2_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("NotificationOn", var_2_63)

	local function var_2_64()
		var_2_10:AnimateSequence("NotificationOn")
	end

	var_2_0._sequences.NotificationOn = var_2_64

	local var_2_65
	local var_2_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("NotificationOff", var_2_66)

	local function var_2_67()
		var_2_10:AnimateSequence("NotificationOff")
	end

	var_2_0._sequences.NotificationOff = var_2_67

	local var_2_68
	local var_2_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 33
		}
	}

	var_2_10:RegisterAnimationSequence("NotificationOnAR", var_2_69)

	local function var_2_70()
		var_2_10:AnimateSequence("NotificationOnAR")
	end

	var_2_0._sequences.NotificationOnAR = var_2_70

	var_2_0:addEventHandler("button_over", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_2_0:addEventHandler("button_active", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpActive")
	end)
	var_2_0:addEventHandler("button_over_active", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("disable", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "Disabled")
	end)
	var_2_0:addEventHandler("button_over_disable", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOverDisabled")
	end)
	var_2_0:addEventHandler("button_disable", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpDisabled")
	end)
	var_2_0:addEventHandler("disable_active", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "DisabledActive")
	end)
	var_2_0:addEventHandler("button_disable_active", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpDisabledActive")
	end)
	var_2_0:addEventHandler("button_over_disable_active", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOverDisabledActive")
	end)
	var_2_0:addEventHandler("active", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "Active")
	end)
	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericDropdownListButton", GenericDropdownListButton)
LockTable(_M)
