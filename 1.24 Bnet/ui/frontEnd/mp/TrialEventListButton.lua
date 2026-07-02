module(..., package.seeall)

local var_0_0 = {
	"trial_medal_bronze_sm",
	"trial_medal_silver_sm",
	"trial_medal_gold_sm"
}

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.Name:setText(Engine.CBBHFCGDIC(arg_1_1.ui_name))
	arg_1_0.Medal:SetAlpha(arg_1_1.bestMedal > 0 and 1 or 0)

	if arg_1_1.bestMedal > 0 then
		arg_1_0.Medal:setImage(RegisterMaterial(var_0_0[arg_1_1.bestMedal]))
	end

	local var_1_0 = Engine.DCJHCAFIIA()
	local var_1_1 = arg_1_1.startTime - var_1_0

	if var_1_1 > 0 then
		if var_1_1 > 86400 then
			arg_1_0.Countdown:SetCustomFormat("TRIALEVENT/START_TIME_DAYS")
			arg_1_0.Countdown:SetCustomFormatType(LUI.UICountdown.CustomFormatType.DAYHRMIN)
		else
			arg_1_0.Countdown:SetCustomFormat("TRIALEVENT/START_TIME")
			arg_1_0.Countdown:SetCustomFormatType(LUI.UICountdown.CustomFormatType.HRMINSEC)
		end

		ACTIONS.AnimateSequence(arg_1_0, "ComingSoon")
		arg_1_0.Countdown:setEndTime(Engine.BFBIDEGDFB() + var_1_1 * 1000)
	else
		ACTIONS.AnimateSequence(arg_1_0, "TrialAvailable")
	end

	if arg_1_1.ui_previewMapImage then
		arg_1_0.BG:setImage(RegisterMaterial(arg_1_1.ui_previewMapImage))
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupButton = var_0_1

	arg_2_0.Countdown:useLocalizedFormat()

	arg_2_0.bindButton = LUI.UIBindButton.new()
	arg_2_0.bindButton.id = "selfBindButton"

	arg_2_0:addElement(arg_2_0.bindButton)
	arg_2_0:SetFocusable(true)
	arg_2_0:SetHandleMouse(true)
end

function TrialEventListButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 210 * _1080p)

	var_3_0.id = "TrialEventListButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "BG"

	var_3_0:addElement(var_3_4)

	var_3_0.BG = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Gradient"

	var_3_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.2, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Gradient = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "DisableBG"

	var_3_8:SetRGBFromTable(SWATCHES.BattlePass.DarkGrey, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:SetPixelGridEnabled(true)
	var_3_8:SetPixelGridContrast(0.5, 0)
	var_3_8:SetPixelGridBlockWidth(2, 0)
	var_3_8:SetPixelGridBlockHeight(2, 0)
	var_3_8:SetPixelGridGutterWidth(1, 0)
	var_3_8:SetPixelGridGutterHeight(1, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, 0, _1080p * 210)
	var_3_0:addElement(var_3_8)

	var_3_0.DisableBG = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "NameBG"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_10:SetAlpha(0.6, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -41, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.NameBG = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Name"

	var_3_12:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * -11, _1080p * -32, _1080p * -8)
	var_3_0:addElement(var_3_12)

	var_3_0.Name = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Countdown"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:setEndTime(0)
	var_3_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * -11, _1080p * -67, _1080p * -47)
	var_3_0:addElement(var_3_14)

	var_3_0.Countdown = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "Available"

	var_3_16:SetAlpha(0, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("TRIALEVENT/TRIAL_IS_ACTIVE"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 12, _1080p * 3, _1080p * -71, _1080p * -47)
	var_3_0:addElement(var_3_16)

	var_3_0.Available = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "HighlightTop"

	var_3_18:SetAlpha(0, 0)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_3_0:addElement(var_3_18)

	var_3_0.HighlightTop = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "HighlightBottom"

	var_3_20:SetAlpha(0, 0)
	var_3_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_3_0:addElement(var_3_20)

	var_3_0.HighlightBottom = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "Medal"

	var_3_22:setImage(RegisterMaterial("trial_medal_gold_sm"), 0)
	var_3_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -38, _1080p * -6, _1080p * 174, _1080p * 206)
	var_3_0:addElement(var_3_22)

	var_3_0.Medal = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("DefaultSequence", var_3_24)

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("DefaultSequence", var_3_25)

	local function var_3_26()
		var_3_14:AnimateSequence("DefaultSequence")
		var_3_16:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_28)

	local var_3_29 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonOver", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("ButtonOver", var_3_30)

	local function var_3_31()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_18:AnimateSequence("ButtonOver")
		var_3_20:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_31

	local var_3_32
	local var_3_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("TrialAvailable", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("TrialAvailable", var_3_34)

	local var_3_35 = {
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

	var_3_16:RegisterAnimationSequence("TrialAvailable", var_3_35)

	local function var_3_36()
		var_3_8:AnimateSequence("TrialAvailable")
		var_3_14:AnimateSequence("TrialAvailable")
		var_3_16:AnimateSequence("TrialAvailable")
	end

	var_3_0._sequences.TrialAvailable = var_3_36

	local var_3_37
	local var_3_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ComingSoon", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ComingSoon", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("ComingSoon", var_3_40)

	local function var_3_41()
		var_3_8:AnimateSequence("ComingSoon")
		var_3_14:AnimateSequence("ComingSoon")
		var_3_16:AnimateSequence("ComingSoon")
	end

	var_3_0._sequences.ComingSoon = var_3_41

	local var_3_42
	local var_3_43 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ButtonUp", var_3_44)

	local var_3_45 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("ButtonUp", var_3_45)

	local function var_3_46()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_18:AnimateSequence("ButtonUp")
		var_3_20:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_46

	var_3_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_2(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("TrialEventListButton", TrialEventListButton)
LockTable(_M)
