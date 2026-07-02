module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.BlueprintCount:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.BlueprintCount)

	arg_2_0.Setup = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Collapse")
	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_3_0, "Expand")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
	end)
end

function BlueprintButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 40 * _1080p, 0, 134 * _1080p)

	var_5_0.id = "BlueprintButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

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

	var_5_6.id = "Arrow"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_6:SetAlpha(0.8, 0)
	var_5_6:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_5_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -11, _1080p * -4, _1080p * -5, _1080p * 7)
	var_5_0:addElement(var_5_6)

	var_5_0.Arrow = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "BlueprintCount"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_8:setText("99", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -38, _1080p * -16, _1080p * -11, _1080p * 11)
	var_5_0:addElement(var_5_8)

	var_5_0.BlueprintCount = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "ArmoryIcon"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_10:setImage(RegisterMaterial("icon_armory"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * 28, _1080p * -28, _1080p * 28)
	var_5_0:addElement(var_5_10)

	var_5_0.ArmoryIcon = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "ArmoryTitle"

	var_5_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("LUA_MENU/ARMORY"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_12:SetStartupDelay(2000)
	var_5_12:SetLineHoldTime(400)
	var_5_12:SetAnimMoveTime(2000)
	var_5_12:SetAnimMoveSpeed(150)
	var_5_12:SetEndDelay(2000)
	var_5_12:SetCrossfadeTime(250)
	var_5_12:SetFadeInTime(300)
	var_5_12:SetFadeOutTime(300)
	var_5_12:SetMaxVisibleLines(1)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -35, _1080p * 35, _1080p * 7, _1080p * 31)
	var_5_0:addElement(var_5_12)

	var_5_0.ArmoryTitle = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "NewItemSmallIcon"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -15, _1080p * -7, _1080p * -15, _1080p * -7)
	var_5_0:addElement(var_5_14)

	var_5_0.NewItemSmallIcon = var_5_14

	local var_5_15
	local var_5_16 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("DefaultSequence", var_5_16)

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_5_8:RegisterAnimationSequence("DefaultSequence", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("DefaultSequence", var_5_18)

	local var_5_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("DefaultSequence", var_5_19)

	local function var_5_20()
		var_5_6:AnimateSequence("DefaultSequence")
		var_5_8:AnimateSequence("DefaultSequence")
		var_5_10:AnimateSequence("DefaultSequence")
		var_5_12:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_20

	local var_5_21
	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Collapse", var_5_22)

	local var_5_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 11
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Collapse", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Collapse", var_5_24)

	local var_5_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Collapse", var_5_25)

	local function var_5_26()
		var_5_6:AnimateSequence("Collapse")
		var_5_8:AnimateSequence("Collapse")
		var_5_10:AnimateSequence("Collapse")
		var_5_12:AnimateSequence("Collapse")
	end

	var_5_0._sequences.Collapse = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Expand", var_5_28)

	local var_5_29 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("Expand", var_5_29)

	local var_5_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("Expand", var_5_30)

	local var_5_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("Expand", var_5_31)

	local function var_5_32()
		var_5_6:AnimateSequence("Expand")
		var_5_8:AnimateSequence("Expand")
		var_5_10:AnimateSequence("Expand")
		var_5_12:AnimateSequence("Expand")
	end

	var_5_0._sequences.Expand = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_34)

	local var_5_35 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_35)

	local var_5_36 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_36)

	local function var_5_37()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_37

	local var_5_38
	local var_5_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.loadoutButton.defaultText
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_39)

	local var_5_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_40)

	local var_5_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_41)

	local function var_5_42()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_42

	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("BlueprintButton", BlueprintButton)
LockTable(_M)
