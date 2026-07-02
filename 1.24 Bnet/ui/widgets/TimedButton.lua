module(..., package.seeall)

local var_0_0 = 2000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		arg_1_0._waitTime = arg_1_1
	end

	arg_1_0:SetButtonDisabled(true)
	arg_1_0.GenericProgressBar:SetAlpha(1, 0)
	arg_1_0.GenericProgressBar:SetProgress(0, 0)
	arg_1_0.GenericProgressBar:SetProgress(1, arg_1_0._waitTime)

	local var_1_0

	local function var_1_1()
		arg_1_0.GenericProgressBar:SetAlpha(0, 100)
		arg_1_0:SetButtonDisabled(false)

		if arg_1_2 then
			arg_1_0:dispatchEventToCurrentMenu({
				name = "timer_complete",
				controller = controllerIndex
			})
		end
	end

	if arg_1_0._waitTime and arg_1_0._waitTime > 0 then
		arg_1_0:Wait(arg_1_0._waitTime, true).onComplete = var_1_1
	else
		var_1_1()
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Text)
	arg_3_0.Text:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.StartTimer = var_0_1
	arg_4_0.SetText = var_0_2
	arg_4_0._waitTime = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function TimedButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_5_0.id = "TimedButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetButtonDisabled(true)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Background"

	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericProgressBar"

	var_5_6.DialogueBackground:SetAlpha(0, 0)
	var_5_6.Fill:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled, 0)
	var_5_6.Fill:SetAlpha(0.4, 0)
	var_5_6.Frame:SetAlpha(0, 0)
	var_5_6.Cap:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericProgressBar = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Text"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_8:SetStartupDelay(2000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(300)
	var_5_8:SetAnimMoveSpeed(50)
	var_5_8:SetEndDelay(1500)
	var_5_8:SetCrossfadeTime(750)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(1)
	var_5_8:SetOutlineRGBFromInt(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -11, _1080p * 13)
	var_5_0:addElement(var_5_8)

	var_5_0.Text = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Lock"

	var_5_10:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_5_10:setImage(RegisterMaterial("icon_lock"), 0)
	var_5_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_5_0:addElement(var_5_10)

	var_5_0.Lock = var_5_10

	local function var_5_11()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_13)

	local var_5_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_14)

	local function var_5_15()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_17)

	local var_5_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_18)

	local function var_5_19()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_19

	local var_5_20
	local var_5_21 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOverDisabled", var_5_21)

	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOverDisabled", var_5_22)

	local function var_5_23()
		var_5_8:AnimateSequence("ButtonOverDisabled")
		var_5_10:AnimateSequence("ButtonOverDisabled")
	end

	var_5_0._sequences.ButtonOverDisabled = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUpDisabled", var_5_25)

	local var_5_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUpDisabled", var_5_26)

	local function var_5_27()
		var_5_8:AnimateSequence("ButtonUpDisabled")
		var_5_10:AnimateSequence("ButtonUpDisabled")
	end

	var_5_0._sequences.ButtonUpDisabled = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_29)

	local function var_5_30()
		var_5_8:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_30

	var_5_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_5_0:addEventHandler("button_disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUpDisabled")
	end)
	var_5_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOverDisabled")
	end)
	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("TimedButton", TimedButton)
LockTable(_M)
