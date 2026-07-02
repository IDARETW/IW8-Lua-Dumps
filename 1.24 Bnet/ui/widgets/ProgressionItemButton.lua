module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function ProgressionItemButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 62 * _1080p)

	var_2_0.id = "ProgressionItemButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Icon"

	var_2_6:SetRGBFromTable(SWATCHES.CAC.labelText, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 56, _1080p * -23, _1080p * 23)
	var_2_0:addElement(var_2_6)

	var_2_0.Icon = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "Selected"

	var_2_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -7, _1080p * -8, _1080p * 8)
	var_2_0:addElement(var_2_8)

	var_2_0.Selected = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "Text"

	var_2_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_10:setText(ToUpperCase(""), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_10:SetStartupDelay(2000)
	var_2_10:SetLineHoldTime(400)
	var_2_10:SetAnimMoveTime(2000)
	var_2_10:SetAnimMoveSpeed(50)
	var_2_10:SetEndDelay(1500)
	var_2_10:SetCrossfadeTime(750)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(1)
	var_2_10:SetOutlineRGBFromInt(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 68, _1080p * -60, _1080p * -12, _1080p * 12)
	var_2_0:addElement(var_2_10)

	var_2_0.Text = var_2_10

	local var_2_11

	if not CONDITIONS.IsSplitscreen(var_2_0) then
		local var_2_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_2_1
		})

		var_2_12.id = "NewItemNotification"

		var_2_12:SetAlpha(0, 0)
		var_2_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
		var_2_0:addElement(var_2_12)

		var_2_0.NewItemNotification = var_2_12
	end

	local function var_2_13()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_13

	local var_2_14
	local var_2_15 = {
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOverParent", var_2_15)

	local var_2_16 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOverParent", var_2_16)

	local function var_2_17()
		var_2_6:AnimateSequence("ButtonOverParent")
		var_2_10:AnimateSequence("ButtonOverParent")
	end

	var_2_0._sequences.ButtonOverParent = var_2_17

	local var_2_18
	local var_2_19 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUpParent", var_2_19)

	local var_2_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUpParent", var_2_20)

	local function var_2_21()
		var_2_6:AnimateSequence("ButtonUpParent")
		var_2_10:AnimateSequence("ButtonUpParent")
	end

	var_2_0._sequences.ButtonUpParent = var_2_21

	local var_2_22
	local var_2_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_2_6:RegisterAnimationSequence("Disabled", var_2_23)

	local var_2_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_10:RegisterAnimationSequence("Disabled", var_2_24)

	local function var_2_25()
		var_2_6:AnimateSequence("Disabled")
		var_2_10:AnimateSequence("Disabled")
	end

	var_2_0._sequences.Disabled = var_2_25

	local var_2_26
	local var_2_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_2_6:RegisterAnimationSequence("Enabled", var_2_27)

	local var_2_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_10:RegisterAnimationSequence("Enabled", var_2_28)

	local function var_2_29()
		var_2_6:AnimateSequence("Enabled")
		var_2_10:AnimateSequence("Enabled")
	end

	var_2_0._sequences.Enabled = var_2_29

	local var_2_30
	local var_2_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_31)

	local function var_2_32()
		var_2_10:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_32

	local var_2_33
	local var_2_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonOverDisabledParent", var_2_34)

	local function var_2_35()
		var_2_10:AnimateSequence("ButtonOverDisabledParent")
	end

	var_2_0._sequences.ButtonOverDisabledParent = var_2_35

	local var_2_36
	local var_2_37 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_2_10:RegisterAnimationSequence("ButtonUpDisabledParent", var_2_37)

	local function var_2_38()
		var_2_10:AnimateSequence("ButtonUpDisabledParent")
	end

	var_2_0._sequences.ButtonUpDisabledParent = var_2_38

	local var_2_39
	local var_2_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 56
		}
	}

	var_2_6:RegisterAnimationSequence("Icon1x1", var_2_40)

	local function var_2_41()
		var_2_6:AnimateSequence("Icon1x1")
	end

	var_2_0._sequences.Icon1x1 = var_2_41

	local var_2_42
	local var_2_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 57
		}
	}

	var_2_6:RegisterAnimationSequence("Icon2x1", var_2_43)

	local function var_2_44()
		var_2_6:AnimateSequence("Icon2x1")
	end

	var_2_0._sequences.Icon2x1 = var_2_44

	local var_2_45
	local var_2_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("NoIcon", var_2_46)

	local var_2_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		}
	}

	var_2_10:RegisterAnimationSequence("NoIcon", var_2_47)

	local function var_2_48()
		var_2_6:AnimateSequence("NoIcon")
		var_2_10:AnimateSequence("NoIcon")
	end

	var_2_0._sequences.NoIcon = var_2_48

	var_2_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOverParent")
	end)
	var_2_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpParent")
	end)
	var_2_0:addEventHandler("button_disable", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUpDisabledParent")
	end)
	var_2_0:addEventHandler("button_over_disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOverDisabledParent")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ProgressionItemButton", ProgressionItemButton)
LockTable(_M)
