module(..., package.seeall)

function RefreshAnimation(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1)
	end
end

local function var_0_0(arg_2_0)
	if arg_2_0._isMuted then
		arg_2_0._wasMuted = true

		if arg_2_0._isScoreboard then
			RefreshAnimation(arg_2_0, "MutedOnScoreboard")
		else
			RefreshAnimation(arg_2_0, "Muted")
		end
	elseif arg_2_0._isTalking then
		arg_2_0._wasTalking = true

		RefreshAnimation(arg_2_0, "Talking")
	elseif arg_2_0._wasTalking then
		arg_2_0._wasTalking = false

		RefreshAnimation(arg_2_0, "TalkingComplete")
	elseif arg_2_0._wasMuted and not arg_2_0._isScoreboard or arg_2_0._forceHide then
		arg_2_0._wasMuted = false

		RefreshAnimation(arg_2_0, "Hide")
	elseif arg_2_0._isScoreboard then
		arg_2_0.iconTalking:SetRGBFromTable(SWATCHES.HUD.normal)
		arg_2_0.iconMicOn:SetRGBFromTable(SWATCHES.HUD.normal)
		arg_2_0.iconMuted:SetRGBFromTable(SWATCHES.HUD.normal)
		RefreshAnimation(arg_2_0, "MicOn")
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0._isTalking = arg_3_1

	var_0_0(arg_3_0)
end

local function var_0_2(arg_4_0, arg_4_1)
	arg_4_0._isMuted = arg_4_1

	var_0_0(arg_4_0)
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0._isScoreboard = arg_5_1

	var_0_0(arg_5_0)
end

local function var_0_4(arg_6_0, arg_6_1)
	arg_6_0._forceHide = arg_6_1

	var_0_0(arg_6_0)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._isTalking = arg_7_1
	arg_7_0._isMuted = arg_7_2

	var_0_0(arg_7_0)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._wasMuted = false
	arg_8_0._isMuted = false
	arg_8_0._isTalking = false
	arg_8_0._wasTalking = false
	arg_8_0._isScoreboard = false
	arg_8_0._forceHide = false
	arg_8_0.SetMutedState = var_0_2
	arg_8_0.SetTalkingState = var_0_1
	arg_8_0.SetIsScoreboardState = var_0_3
	arg_8_0.SetForceHideState = var_0_4
	arg_8_0.SetState = var_0_5

	RefreshAnimation(arg_8_0, "Hide")
end

function PlayerMicDisplay(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_9_0.id = "PlayerMicDisplay"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "iconTalking"

	var_9_4:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_9_4:setImage(RegisterMaterial("icon_mic_talking"), 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_9_0:addElement(var_9_4)

	var_9_0.iconTalking = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "iconMicOn"

	var_9_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_9_6:setImage(RegisterMaterial("icon_mic_on"), 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_9_0:addElement(var_9_6)

	var_9_0.iconMicOn = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "iconMuted"

	var_9_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_9_8:setImage(RegisterMaterial("icon_mic_muted"), 0)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_9_0:addElement(var_9_8)

	var_9_0.iconMuted = var_9_8

	local var_9_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("DefaultSequence", var_9_9)

	local var_9_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("DefaultSequence", var_9_10)

	local var_9_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("DefaultSequence", var_9_11)

	local function var_9_12()
		var_9_4:AnimateSequence("DefaultSequence")
		var_9_6:AnimateSequence("DefaultSequence")
		var_9_8:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_12

	local var_9_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("Hide", var_9_13)

	local var_9_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Hide", var_9_14)

	local var_9_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Hide", var_9_15)

	local function var_9_16()
		var_9_4:AnimateSequence("Hide")
		var_9_6:AnimateSequence("Hide")
		var_9_8:AnimateSequence("Hide")
	end

	var_9_0._sequences.Hide = var_9_16

	local var_9_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("Muted", var_9_17)

	local var_9_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Muted", var_9_18)

	local var_9_19 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Muted", var_9_19)

	local function var_9_20()
		var_9_4:AnimateSequence("Muted")
		var_9_6:AnimateSequence("Muted")
		var_9_8:AnimateSequence("Muted")
	end

	var_9_0._sequences.Muted = var_9_20

	local var_9_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 190,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("Talking", var_9_21)

	local var_9_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("Talking", var_9_22)

	local var_9_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("Talking", var_9_23)

	local function var_9_24()
		var_9_4:AnimateLoop("Talking")
		var_9_6:AnimateLoop("Talking")
		var_9_8:AnimateLoop("Talking")
	end

	var_9_0._sequences.Talking = var_9_24

	local var_9_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("MicOn", var_9_25)

	local var_9_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("MicOn", var_9_26)

	local var_9_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("MicOn", var_9_27)

	local function var_9_28()
		var_9_4:AnimateSequence("MicOn")
		var_9_6:AnimateSequence("MicOn")
		var_9_8:AnimateSequence("MicOn")
	end

	var_9_0._sequences.MicOn = var_9_28

	local var_9_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 325,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("TalkingComplete", var_9_29)

	local function var_9_30()
		var_9_4:AnimateSequence("TalkingComplete")
	end

	var_9_0._sequences.TalkingComplete = var_9_30

	local var_9_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("MutedOnScoreboard", var_9_31)

	local var_9_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("MutedOnScoreboard", var_9_32)

	local var_9_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("MutedOnScoreboard", var_9_33)

	local function var_9_34()
		var_9_4:AnimateSequence("MutedOnScoreboard")
		var_9_6:AnimateSequence("MutedOnScoreboard")
		var_9_8:AnimateSequence("MutedOnScoreboard")
	end

	var_9_0._sequences.MutedOnScoreboard = var_9_34

	var_0_6(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("PlayerMicDisplay", PlayerMicDisplay)
LockTable(_M)
