module(..., package.seeall)

local var_0_0 = 2000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 then
		arg_1_0._waitTime = arg_1_1
	end

	ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
	arg_1_0.GenericProgressBar:SetProgress(0, 0)
	arg_1_0:SetButtonDisabled(true)
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
	assert(arg_3_0.Button.Text)
	arg_3_0.Button.Text:setText(arg_3_1)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.StartTimer = var_0_1
	arg_4_0.SetText = var_0_2
	arg_4_0._waitTime = var_0_0

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0.Button, "ButtonOver")
		ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_6_0.Button, "ButtonUp")
		ACTIONS.AnimateSequence(arg_6_0, "ButtonUp")
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_7_0.Button, "ButtonUpDisabled")
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUpDisabled")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_8_0.Button, "ButtonOverDisabled")
		ACTIONS.AnimateSequence(arg_8_0, "ButtonOverDisabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	ACTIONS.AnimateSequence(arg_4_0, "Setup")
end

function BattlePassTimedButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_9_0.id = "BattlePassTimedButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:SetButtonDisabled(true)

	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Button"

	var_9_4.Text:setText("Testing", 0)
	var_9_4.Text:SetAlignment(LUI.Alignment.Left)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Button = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "GenericProgressBar"

	var_9_6.Fill:SetRGBFromTable(SWATCHES.tabManager.tabTextDisabled, 0)
	var_9_6.Fill:SetAlpha(0.4, 0)
	var_9_6.Frame:SetAlpha(0, 0)
	var_9_6.Cap:SetAlpha(0, 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
	var_9_0:addElement(var_9_6)

	var_9_0.GenericProgressBar = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Lock"

	var_9_8:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_9_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -7, _1080p * -13, _1080p * 13)
	var_9_0:addElement(var_9_8)

	var_9_0.Lock = var_9_8

	local var_9_9
	local var_9_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("DefaultSequence", var_9_10)

	local var_9_11 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("DefaultSequence", var_9_11)

	local function var_9_12()
		var_9_6:AnimateSequence("DefaultSequence")
		var_9_8:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_12

	local var_9_13
	local var_9_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUpDisabled", var_9_14)

	local function var_9_15()
		var_9_8:AnimateSequence("ButtonUpDisabled")
	end

	var_9_0._sequences.ButtonUpDisabled = var_9_15

	local var_9_16
	local var_9_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		}
	}

	var_9_8:RegisterAnimationSequence("Setup", var_9_17)

	local function var_9_18()
		var_9_8:AnimateSequence("Setup")
	end

	var_9_0._sequences.Setup = var_9_18

	local var_9_19
	local var_9_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_20)

	local function var_9_21()
		var_9_8:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOverDisabled", var_9_23)

	local function var_9_24()
		var_9_8:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_24

	local var_9_25
	local var_9_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_26)

	local function var_9_27()
		var_9_8:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_27

	var_0_3(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("BattlePassTimedButton", BattlePassTimedButton)
LockTable(_M)
