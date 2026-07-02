module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isComplete = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._isUnlocked = arg_2_1
end

local function var_0_2(arg_3_0)
	return arg_3_0._isComplete
end

local function var_0_3(arg_4_0)
	return arg_4_0._isUnlocked
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.SetComplete = var_0_0
	arg_5_0.SetUnlocked = var_0_1
	arg_5_0.GetComplete = var_0_2
	arg_5_0.GetUnlocked = var_0_3
	arg_5_0._isComplete = false
	arg_5_0._isUnlocked = false

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

function MasterChallengePip(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_6_0.id = "MasterChallengePip"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BackgroundImage"

	var_6_4:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.BackgroundImage = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIText.new()

	var_6_6.id = "Tier"

	var_6_6:SetRGBFromTable(SWATCHES.masterChallenges.darkBackground, 0)
	var_6_6:setText("", 0)
	var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_6:SetWordWrap(false)
	var_6_6:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_6)

	var_6_0.Tier = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Lock"

	var_6_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_8)

	var_6_0.Lock = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_9

	local var_6_10
	local var_6_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.progressBackground
		}
	}

	var_6_4:RegisterAnimationSequence("Locked", var_6_11)

	local var_6_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Locked", var_6_12)

	local var_6_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Locked", var_6_13)

	local function var_6_14()
		var_6_4:AnimateSequence("Locked")
		var_6_6:AnimateSequence("Locked")
		var_6_8:AnimateSequence("Locked")
	end

	var_6_0._sequences.Locked = var_6_14

	local var_6_15
	local var_6_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.highlight
		}
	}

	var_6_4:RegisterAnimationSequence("Unlocked", var_6_16)

	local var_6_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Unlocked", var_6_17)

	local var_6_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Unlocked", var_6_18)

	local function var_6_19()
		var_6_4:AnimateSequence("Unlocked")
		var_6_6:AnimateSequence("Unlocked")
		var_6_8:AnimateSequence("Unlocked")
	end

	var_6_0._sequences.Unlocked = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.masterChallenges.active
		}
	}

	var_6_4:RegisterAnimationSequence("Current", var_6_21)

	local var_6_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Current", var_6_22)

	local var_6_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Current", var_6_23)

	local function var_6_24()
		var_6_4:AnimateSequence("Current")
		var_6_6:AnimateSequence("Current")
		var_6_8:AnimateSequence("Current")
	end

	var_6_0._sequences.Current = var_6_24

	local var_6_25
	local var_6_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_6_4:RegisterAnimationSequence("Complete", var_6_26)

	local function var_6_27()
		var_6_4:AnimateSequence("Complete")
	end

	var_6_0._sequences.Complete = var_6_27

	local var_6_28
	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_6_4:RegisterAnimationSequence("Select", var_6_29)

	local function var_6_30()
		var_6_4:AnimateSequence("Select")
	end

	var_6_0._sequences.Select = var_6_30

	local var_6_31
	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipComplete", var_6_32)

	local var_6_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipComplete", var_6_33)

	local function var_6_34()
		var_6_4:AnimateSequence("WZWipComplete")
		var_6_8:AnimateSequence("WZWipComplete")
	end

	var_6_0._sequences.WZWipComplete = var_6_34

	local var_6_35
	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipCurrent", var_6_36)

	local var_6_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipCurrent", var_6_37)

	local var_6_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipCurrent", var_6_38)

	local function var_6_39()
		var_6_4:AnimateSequence("WZWipCurrent")
		var_6_6:AnimateSequence("WZWipCurrent")
		var_6_8:AnimateSequence("WZWipCurrent")
	end

	var_6_0._sequences.WZWipCurrent = var_6_39

	local var_6_40
	local var_6_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipLocked", var_6_41)

	local var_6_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipLocked", var_6_42)

	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipLocked", var_6_43)

	local function var_6_44()
		var_6_4:AnimateSequence("WZWipLocked")
		var_6_6:AnimateSequence("WZWipLocked")
		var_6_8:AnimateSequence("WZWipLocked")
	end

	var_6_0._sequences.WZWipLocked = var_6_44

	local var_6_45
	local var_6_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipSelect", var_6_46)

	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2DarkBlue
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSelect", var_6_47)

	local function var_6_48()
		var_6_4:AnimateSequence("WZWipSelect")
		var_6_8:AnimateSequence("WZWipSelect")
	end

	var_6_0._sequences.WZWipSelect = var_6_48

	local var_6_49
	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackgroundOnFocus
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipUnlocked", var_6_50)

	local var_6_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipUnlocked", var_6_51)

	local var_6_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipUnlocked", var_6_52)

	local function var_6_53()
		var_6_4:AnimateSequence("WZWipUnlocked")
		var_6_6:AnimateSequence("WZWipUnlocked")
		var_6_8:AnimateSequence("WZWipUnlocked")
	end

	var_6_0._sequences.WZWipUnlocked = var_6_53

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MasterChallengePip", MasterChallengePip)
LockTable(_M)
