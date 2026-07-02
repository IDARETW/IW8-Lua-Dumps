module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		arg_2_0.ExpandButton:UpdatePrompt(true)
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		arg_3_0.ExpandButton:UpdatePrompt(false)
	end)

	local var_1_0 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt1",
				button_ref = "button_alt1",
				helper_text = ""
			}
		}
	}

	arg_1_0.ExpandButton:AddTooltipData(arg_1_1, var_1_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GenericExpander(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 88 * _1080p)

	var_4_0.id = "GenericExpander"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "DummyInnerWidget"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_4_0:addElement(var_4_4)

	var_4_0.DummyInnerWidget = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericExpanderExpandWidget", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ExpandButton"

	var_4_6.ExpandMe:setText(Engine.CBBHFCGDIC("LUA_MENU/EXPANDER_ADVANCED"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 30, 0, _1080p * -28, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.ExpandButton = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "ChildLineVert"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.nodeFrame, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 13, _1080p * 15, _1080p * 50, _1080p * -13)
	var_4_0:addElement(var_4_8)

	var_4_0.ChildLineVert = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "ChildLineHorz"

	var_4_10:SetRGBFromTable(SWATCHES.CAC.nodeFrame, 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 15, _1080p * 30, _1080p * -15, _1080p * -13)
	var_4_0:addElement(var_4_10)

	var_4_0.ChildLineHorz = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "DummyChildrenContainer"

	var_4_12:SetRGBFromInt(16711680, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, 0, _1080p * 59, _1080p * 59)
	var_4_0:addElement(var_4_12)

	var_4_0.DummyChildrenContainer = var_4_12

	local function var_4_13()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			value = 7985663,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ExpandedGlow", var_4_15)

	local var_4_16 = {
		{
			value = 7985663,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_10:RegisterAnimationSequence("ExpandedGlow", var_4_16)

	local function var_4_17()
		var_4_8:AnimateSequence("ExpandedGlow")
		var_4_10:AnimateSequence("ExpandedGlow")
	end

	var_4_0._sequences.ExpandedGlow = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			value = 8092539,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ExpandedIdle", var_4_19)

	local var_4_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			value = 8092539,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_10:RegisterAnimationSequence("ExpandedIdle", var_4_20)

	local function var_4_21()
		var_4_8:AnimateSequence("ExpandedIdle")
		var_4_10:AnimateSequence("ExpandedIdle")
	end

	var_4_0._sequences.ExpandedIdle = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -30
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_23)

	local var_4_24 = {
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
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_24)

	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
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
		}
	}

	var_4_10:RegisterAnimationSequence("AR", var_4_25)

	local var_4_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_4_12:RegisterAnimationSequence("AR", var_4_26)

	local function var_4_27()
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_27

	local var_4_28
	local var_4_29 = {
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

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_29)

	local var_4_30 = {
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

	var_4_10:RegisterAnimationSequence("WZWipSetup", var_4_30)

	local function var_4_31()
		var_4_8:AnimateSequence("WZWipSetup")
		var_4_10:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipExpandedGlow", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipExpandedGlow", var_4_34)

	local function var_4_35()
		var_4_8:AnimateSequence("WZWipExpandedGlow")
		var_4_10:AnimateSequence("WZWipExpandedGlow")
	end

	var_4_0._sequences.WZWipExpandedGlow = var_4_35

	local var_4_36
	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipExpandedIdle", var_4_37)

	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("WZWipExpandedIdle", var_4_38)

	local function var_4_39()
		var_4_8:AnimateSequence("WZWipExpandedIdle")
		var_4_10:AnimateSequence("WZWipExpandedIdle")
	end

	var_4_0._sequences.WZWipExpandedIdle = var_4_39

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericExpander", GenericExpander)
LockTable(_M)
