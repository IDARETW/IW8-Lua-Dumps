module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "Collapse")
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_2_0, "Expand")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
	end)
	ACTIONS.AnimateSequence(arg_1_0.NewItemSmallIcon, "Store")
	arg_1_0.LoadoutItemButtonBackground:SetupTheme(true)
end

function BlueprintStoreButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 40 * _1080p, 0, 134 * _1080p)

	var_4_0.id = "BlueprintStoreButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:setUseStencil(true)

	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LoadoutItemButtonBackground"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.LoadoutItemButtonBackground = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Arrow"

	var_4_6:SetRGBFromTable(SWATCHES.MPArmory.bundleTextDefault, 0)
	var_4_6:SetAlpha(0.8, 0)
	var_4_6:setImage(RegisterMaterial("wdg_button_arrow_tip"), 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -11, _1080p * -4, _1080p * -5, _1080p * 7)
	var_4_0:addElement(var_4_6)

	var_4_0.Arrow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Icon"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_8:setImage(RegisterMaterial("icon_blueprint_bundle_lg"), 0)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * 28, _1080p * -28, _1080p * 28)
	var_4_0:addElement(var_4_8)

	var_4_0.Icon = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Title"

	var_4_10:SetRGBFromTable(SWATCHES.MPArmory.bundleTextDefault, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_10:SetStartupDelay(2000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(2000)
	var_4_10:SetAnimMoveSpeed(150)
	var_4_10:SetEndDelay(2000)
	var_4_10:SetCrossfadeTime(250)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(1)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -35, _1080p * 35, _1080p * 7, _1080p * 31)
	var_4_0:addElement(var_4_10)

	var_4_0.Title = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "NewItemSmallIcon"

	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -15, _1080p * -7, _1080p * -15, _1080p * -7)
	var_4_0:addElement(var_4_12)

	var_4_0.NewItemSmallIcon = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "BlueprintCount"

	var_4_14:SetRGBFromTable(SWATCHES.MPArmory.bundleGlow1, 0)
	var_4_14:setText("99", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -38, _1080p * -16, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_14)

	var_4_0.BlueprintCount = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("DefaultSequence", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("DefaultSequence", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("DefaultSequence", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("DefaultSequence")
		var_4_8:AnimateSequence("DefaultSequence")
		var_4_10:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_19

	local var_4_20
	local var_4_21 = {
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

	var_4_6:RegisterAnimationSequence("Collapse", var_4_21)

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Collapse", var_4_22)

	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Collapse", var_4_23)

	local var_4_24 = {
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
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
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
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Collapse", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("Collapse")
		var_4_8:AnimateSequence("Collapse")
		var_4_10:AnimateSequence("Collapse")
		var_4_14:AnimateSequence("Collapse")
	end

	var_4_0._sequences.Collapse = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Expand", var_4_27)

	local var_4_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Expand", var_4_28)

	local var_4_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Expand", var_4_29)

	local var_4_30 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
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
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Expand", var_4_30)

	local function var_4_31()
		var_4_6:AnimateSequence("Expand")
		var_4_8:AnimateSequence("Expand")
		var_4_10:AnimateSequence("Expand")
		var_4_14:AnimateSequence("Expand")
	end

	var_4_0._sequences.Expand = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_33)

	local var_4_34 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextFocus
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonOver", var_4_34)

	local var_4_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleGlow1
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonOver", var_4_35)

	local function var_4_36()
		var_4_8:AnimateSequence("ButtonOver")
		var_4_10:AnimateSequence("ButtonOver")
		var_4_14:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_36

	local var_4_37
	local var_4_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_38)

	local var_4_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_39)

	local var_4_40 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.bundleTextDefault
		}
	}

	var_4_10:RegisterAnimationSequence("ButtonUp", var_4_40)

	local function var_4_41()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
		var_4_10:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_41

	var_0_0(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("BlueprintStoreButton", BlueprintStoreButton)
LockTable(_M)
