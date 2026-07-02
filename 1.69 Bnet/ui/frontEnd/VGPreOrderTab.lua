module(..., package.seeall)

local function var_0_0(arg_1_0)
	return true
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_1 then
		Engine.BJDBIAGIDA(SOUND_SETS.default.gainFocus)
		ACTIONS.AnimateSequence(arg_2_0, arg_2_2)
	else
		WZWIP.AnimateThemeElement(arg_2_0, "UnFocused")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.IsEnabled = var_0_0
	arg_3_0.SetTabSelected = var_0_1

	function arg_3_0.Setup(arg_4_0, arg_4_1)
		arg_4_0.TabText:setText(ToUpperCase(arg_4_1.name))
	end

	TAB.SetUp(arg_3_0)
end

function VGPreOrderTab(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 220 * _1080p, 0, 52 * _1080p)

	var_5_0.id = "VGPreOrderTab"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Backer"

	var_5_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTab, 0)
	var_5_4:SetAlpha(0, 0)
	var_5_4:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -5, _1080p * 3)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "TabText"

	var_5_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTab, 0)
	var_5_6:setText("VGPreOrderTab", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_6:SetAlignment(LUI.Alignment.Center)
	var_5_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_6:SetStartupDelay(5000)
	var_5_6:SetLineHoldTime(4000)
	var_5_6:SetAnimMoveTime(2000)
	var_5_6:SetAnimMoveSpeed(300)
	var_5_6:SetEndDelay(1000)
	var_5_6:SetCrossfadeTime(400)
	var_5_6:SetFadeInTime(300)
	var_5_6:SetFadeOutTime(300)
	var_5_6:SetMaxVisibleLines(2)
	var_5_6:SetShadowRGBFromTable(SWATCHES.tabManager.wzBackground, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -9, _1080p * 9)
	var_5_0:addElement(var_5_6)

	var_5_0.TabText = var_5_6

	local function var_5_7()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_7

	local var_5_8
	local var_5_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_4:RegisterAnimationSequence("TabUltimateEdition", var_5_9)

	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_6:RegisterAnimationSequence("TabUltimateEdition", var_5_10)

	local function var_5_11()
		var_5_4:AnimateSequence("TabUltimateEdition")
		var_5_6:AnimateSequence("TabUltimateEdition")
	end

	var_5_0._sequences.TabUltimateEdition = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_4:RegisterAnimationSequence("TabCrossGenEdition", var_5_13)

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_6:RegisterAnimationSequence("TabCrossGenEdition", var_5_14)

	local function var_5_15()
		var_5_4:AnimateSequence("TabCrossGenEdition")
		var_5_6:AnimateSequence("TabCrossGenEdition")
	end

	var_5_0._sequences.TabCrossGenEdition = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("TabStandardEdition", var_5_17)

	local function var_5_18()
		var_5_4:AnimateSequence("TabStandardEdition")
	end

	var_5_0._sequences.TabStandardEdition = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("UnFocused", var_5_20)

	local function var_5_21()
		var_5_4:AnimateSequence("UnFocused")
	end

	var_5_0._sequences.UnFocused = var_5_21

	local var_5_22
	local var_5_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Focused", var_5_23)

	local var_5_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_6:RegisterAnimationSequence("Focused", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("Focused")
		var_5_6:AnimateSequence("Focused")
	end

	var_5_0._sequences.Focused = var_5_25

	local var_5_26
	local var_5_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("FocusedNoSound", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_5_6:RegisterAnimationSequence("FocusedNoSound", var_5_28)

	local function var_5_29()
		var_5_4:AnimateSequence("FocusedNoSound")
		var_5_6:AnimateSequence("FocusedNoSound")
	end

	var_5_0._sequences.FocusedNoSound = var_5_29

	local var_5_30
	local var_5_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Highlighted", var_5_31)

	local function var_5_32()
		var_5_4:AnimateSequence("Highlighted")
	end

	var_5_0._sequences.Highlighted = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Disabled", var_5_34)

	local var_5_35 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Disabled", var_5_35)

	local function var_5_36()
		var_5_4:AnimateSequence("Disabled")
		var_5_6:AnimateSequence("Disabled")
	end

	var_5_0._sequences.Disabled = var_5_36

	local var_5_37
	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipUnFocused", var_5_38)

	local function var_5_39()
		var_5_4:AnimateSequence("WZWipUnFocused")
	end

	var_5_0._sequences.WZWipUnFocused = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipFocused", var_5_41)

	local function var_5_42()
		var_5_4:AnimateSequence("WZWipFocused")
	end

	var_5_0._sequences.WZWipFocused = var_5_42

	local var_5_43
	local var_5_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipHighlighted", var_5_44)

	local function var_5_45()
		var_5_4:AnimateSequence("WZWipHighlighted")
	end

	var_5_0._sequences.WZWipHighlighted = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipFocusedNoSound", var_5_47)

	local function var_5_48()
		var_5_4:AnimateSequence("WZWipFocusedNoSound")
	end

	var_5_0._sequences.WZWipFocusedNoSound = var_5_48

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("VGPreOrderTab", VGPreOrderTab)
LockTable(_M)
