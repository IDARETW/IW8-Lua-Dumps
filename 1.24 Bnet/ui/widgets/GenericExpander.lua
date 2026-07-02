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

	var_4_8:SetRGBFromInt(8092539, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 13, _1080p * 15, _1080p * 50, _1080p * -13)
	var_4_0:addElement(var_4_8)

	var_4_0.ChildLineVert = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "ChildLineHorz"

	var_4_10:SetRGBFromInt(8092539, 0)
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

	local var_4_14 = {
		{
			value = 7985663,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ExpandedGlow", var_4_14)

	local var_4_15 = {
		{
			value = 7985663,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_10:RegisterAnimationSequence("ExpandedGlow", var_4_15)

	local function var_4_16()
		var_4_8:AnimateSequence("ExpandedGlow")
		var_4_10:AnimateSequence("ExpandedGlow")
	end

	var_4_0._sequences.ExpandedGlow = var_4_16

	local var_4_17 = {
		{
			value = 8092539,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_4_8:RegisterAnimationSequence("ExpandedIdle", var_4_17)

	local var_4_18 = {
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

	var_4_10:RegisterAnimationSequence("ExpandedIdle", var_4_18)

	local function var_4_19()
		var_4_8:AnimateSequence("ExpandedIdle")
		var_4_10:AnimateSequence("ExpandedIdle")
	end

	var_4_0._sequences.ExpandedIdle = var_4_19

	local var_4_20 = {
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

	var_4_6:RegisterAnimationSequence("AR", var_4_20)

	local var_4_21 = {
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

	var_4_8:RegisterAnimationSequence("AR", var_4_21)

	local var_4_22 = {
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

	var_4_10:RegisterAnimationSequence("AR", var_4_22)

	local var_4_23 = {
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

	var_4_12:RegisterAnimationSequence("AR", var_4_23)

	local function var_4_24()
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
		var_4_10:AnimateSequence("AR")
		var_4_12:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_24

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GenericExpander", GenericExpander)
LockTable(_M)
