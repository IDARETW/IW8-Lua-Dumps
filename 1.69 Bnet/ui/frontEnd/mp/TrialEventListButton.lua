module(..., package.seeall)

local var_0_0 = {
	"trial_medal_bronze_sm",
	"trial_medal_silver_sm",
	"trial_medal_gold_sm"
}

local function var_0_1(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "EventDone")
end

local function var_0_2(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "TrialAvailable")
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0.Name:setText(Engine.CBBHFCGDIC(arg_3_1.ui_name))
	arg_3_0.Medal:SetAlpha(arg_3_1.bestMedal > 0 and 1 or 0)

	if arg_3_1.bestMedal > 0 then
		arg_3_0.Medal:setImage(RegisterMaterial(var_0_0[arg_3_1.bestMedal]))
	end

	local var_3_0 = tonumber(Engine.DEIDGHDBHD() or Engine.DCJHCAFIIA())

	if var_3_0 > Dvar.CFHDGABACF("MOKTSOLQMP") then
		var_0_1(arg_3_0)
	else
		local var_3_1 = arg_3_1.startTime - var_3_0

		if var_3_1 > 0 then
			if var_3_1 > 86400 then
				arg_3_0.Countdown:SetCustomFormat("TRIALEVENT/START_TIME_DAYS")
				arg_3_0.Countdown:SetCustomFormatType(LUI.UICountdown.CustomFormatType.DAYHRMIN)
			else
				arg_3_0.Countdown:SetCustomFormat("TRIALEVENT/START_TIME")
				arg_3_0.Countdown:SetCustomFormatType(LUI.UICountdown.CustomFormatType.HRMINSEC)
			end

			ACTIONS.AnimateSequence(arg_3_0, "ComingSoon")
			arg_3_0.Countdown:setEndTime(Engine.BFBIDEGDFB() + var_3_1 * 1000)
		else
			var_0_2(arg_3_0)
		end
	end

	if arg_3_1.ui_previewMapImage then
		arg_3_0.BG:setImage(RegisterMaterial(arg_3_1.ui_previewMapImage))
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupButton = var_0_3
	arg_4_0.PlayEventDoneAnim = var_0_1
	arg_4_0.PlayUnlockedAnim = var_0_2

	arg_4_0.Countdown:useLocalizedFormat()

	arg_4_0.bindButton = LUI.UIBindButton.new()
	arg_4_0.bindButton.id = "selfBindButton"

	arg_4_0:addElement(arg_4_0.bindButton)
	arg_4_0:SetFocusable(true)
	arg_4_0:SetHandleMouse(true)
end

function TrialEventListButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 210 * _1080p)

	var_5_0.id = "TrialEventListButton"
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

	var_5_4.id = "BG"

	var_5_0:addElement(var_5_4)

	var_5_0.BG = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Gradient"

	var_5_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:SetPixelGridEnabled(true)
	var_5_6:SetPixelGridContrast(0.2, 0)
	var_5_6:SetPixelGridBlockWidth(2, 0)
	var_5_6:SetPixelGridBlockHeight(2, 0)
	var_5_6:SetPixelGridGutterWidth(1, 0)
	var_5_6:SetPixelGridGutterHeight(1, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Gradient = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "DisableBG"

	var_5_8:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:SetPixelGridEnabled(true)
	var_5_8:SetPixelGridContrast(0.5, 0)
	var_5_8:SetPixelGridBlockWidth(2, 0)
	var_5_8:SetPixelGridBlockHeight(2, 0)
	var_5_8:SetPixelGridGutterWidth(1, 0)
	var_5_8:SetPixelGridGutterHeight(1, 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, 0, _1080p * 210)
	var_5_0:addElement(var_5_8)

	var_5_0.DisableBG = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "NameBG"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_10:SetAlpha(0.75, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -41, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.NameBG = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "Name"

	var_5_12:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * -12, _1080p * -32, _1080p * -8)
	var_5_0:addElement(var_5_12)

	var_5_0.Name = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "CountdownBG"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_14:SetAlpha(0.6, 0)
	var_5_14:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -125, _1080p * -41)
	var_5_0:addElement(var_5_14)

	var_5_0.CountdownBG = var_5_14

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "Countdown"

	var_5_16:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:setEndTime(0)
	var_5_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * -11, _1080p * -67, _1080p * -47)
	var_5_0:addElement(var_5_16)

	var_5_0.Countdown = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "Available"

	var_5_18:SetAlpha(0, 0)
	var_5_18:setText(Engine.CBBHFCGDIC("TRIALEVENT/TRIAL_IS_ACTIVE"), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * -12, _1080p * -71, _1080p * -47)
	var_5_0:addElement(var_5_18)

	var_5_0.Available = var_5_18

	local var_5_19
	local var_5_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_20.id = "HighlightTop"

	var_5_20:SetAlpha(0, 0)
	var_5_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_5_0:addElement(var_5_20)

	var_5_0.HighlightTop = var_5_20

	local var_5_21
	local var_5_22 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_22.id = "HighlightBottom"

	var_5_22:SetAlpha(0, 0)
	var_5_22:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_5_0:addElement(var_5_22)

	var_5_0.HighlightBottom = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIImage.new()

	var_5_24.id = "Medal"

	var_5_24:setImage(RegisterMaterial("trial_medal_gold_sm"), 0)
	var_5_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -38, _1080p * -6, _1080p * 174, _1080p * 206)
	var_5_0:addElement(var_5_24)

	var_5_0.Medal = var_5_24

	local var_5_25
	local var_5_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("DefaultSequence", var_5_26)

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("DefaultSequence", var_5_27)

	local function var_5_28()
		var_5_16:AnimateSequence("DefaultSequence")
		var_5_18:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_28

	local var_5_29
	local var_5_30 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonOver", var_5_30)

	local var_5_31 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonOver", var_5_31)

	local var_5_32 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("ButtonOver", var_5_32)

	local function var_5_33()
		var_5_6:AnimateSequence("ButtonOver")
		var_5_20:AnimateSequence("ButtonOver")
		var_5_22:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("TrialAvailable", var_5_35)

	local var_5_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("TrialAvailable", var_5_36)

	local var_5_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_18:RegisterAnimationSequence("TrialAvailable", var_5_37)

	local function var_5_38()
		var_5_8:AnimateSequence("TrialAvailable")
		var_5_16:AnimateSequence("TrialAvailable")
		var_5_18:AnimateSequence("TrialAvailable")
	end

	var_5_0._sequences.TrialAvailable = var_5_38

	local var_5_39
	local var_5_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ComingSoon", var_5_40)

	local var_5_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ComingSoon", var_5_41)

	local var_5_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("ComingSoon", var_5_42)

	local function var_5_43()
		var_5_8:AnimateSequence("ComingSoon")
		var_5_16:AnimateSequence("ComingSoon")
		var_5_18:AnimateSequence("ComingSoon")
	end

	var_5_0._sequences.ComingSoon = var_5_43

	local var_5_44
	local var_5_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ButtonUp", var_5_45)

	local var_5_46 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonUp", var_5_46)

	local var_5_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("ButtonUp", var_5_47)

	local function var_5_48()
		var_5_6:AnimateSequence("ButtonUp")
		var_5_20:AnimateSequence("ButtonUp")
		var_5_22:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -337
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_50)

	local function var_5_51()
		var_5_24:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_51

	local var_5_52
	local var_5_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("EventDone", var_5_53)

	local var_5_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("EventDone", var_5_54)

	local var_5_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("EventDone", var_5_55)

	local function var_5_56()
		var_5_8:AnimateSequence("EventDone")
		var_5_16:AnimateSequence("EventDone")
		var_5_18:AnimateSequence("EventDone")
	end

	var_5_0._sequences.EventDone = var_5_56

	var_5_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_4(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	if CONDITIONS.IsArabic(var_5_0) then
		ACTIONS.AnimateSequence(var_5_0, "AR")
	end

	return var_5_0
end

MenuBuilder.registerType("TrialEventListButton", TrialEventListButton)
LockTable(_M)
