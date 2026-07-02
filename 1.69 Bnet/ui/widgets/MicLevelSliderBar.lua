module(..., package.seeall)

local var_0_0 = 120
local var_0_1 = 2
local var_0_2 = 45
local var_0_3 = 0
local var_0_4 = {
	{
		fillPercentage = 0,
		color = COLORS.grey140
	},
	{
		fillPercentage = 0.3,
		color = COLORS.yellowGolden1
	},
	{
		fillPercentage = 0.55,
		color = COLORS.red
	}
}
local var_0_5 = {
	{
		settingName = "VoiceChatMuteAllStrategy",
		action = function(arg_1_0, arg_1_1)
			if arg_1_1 == MuteStrategy.MuteStrategyMuteAll + 1 then
				arg_1_0:Hide()
			else
				arg_1_0:Show()
			end
		end
	},
	{
		settingName = "OpenMicRecordingSensitivity",
		action = function(arg_2_0, arg_2_1)
			arg_2_0._threshold = arg_2_1 / 100
		end
	},
	{
		settingName = "VoiceChatRecordingMode",
		action = function(arg_3_0, arg_3_1)
			arg_3_0._pushToTalk = arg_3_1 == OPTIONS.disableButtonOptions.DISABLED
		end
	}
}

local function var_0_6(arg_4_0)
	local var_4_0 = 0
	local var_4_1 = 1

	for iter_4_0, iter_4_1 in pairs(var_0_4) do
		if arg_4_0 >= var_0_4[iter_4_0].fillPercentage and var_4_0 <= arg_4_0 then
			var_4_1 = iter_4_0
			var_4_0 = var_0_4[iter_4_0].fillPercentage
		end
	end

	return var_4_1
end

local function var_0_7(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(var_0_5) do
		if iter_5_1.settingName == arg_5_0 then
			return iter_5_0
		end
	end
end

local function var_0_8(arg_6_0, arg_6_1)
	local var_6_0 = var_0_6(arg_6_1)

	arg_6_0.NoiseLevelProgressBar:SetProgress(arg_6_1, var_0_0, var_0_1, var_0_4[var_6_0].color)
end

local function var_0_9(arg_7_0)
	if arg_7_0._pushToTalk then
		arg_7_0.ThresholdProgressBar:SetProgress(0, var_0_0, var_0_1)
	else
		arg_7_0.ThresholdProgressBar:SetProgress(arg_7_0._threshold, var_0_0, var_0_1)
	end
end

local function var_0_10(arg_8_0)
	if arg_8_0._testingMic then
		arg_8_0._micTimer = LUI.UITimer.new({
			event = "mic_tick",
			interval = var_0_2
		})

		arg_8_0:addElement(arg_8_0._micTimer)
		Dvar.DHEGHJJJHI("voice_loopback", true)
		arg_8_0.RecordStopButton:Record()
	else
		if arg_8_0._micTimer then
			arg_8_0._micTimer:closeTree()

			arg_8_0._micTimer = nil
		end

		var_0_8(arg_8_0, 0)
		Dvar.DHEGHJJJHI("voice_loopback", false)
		arg_8_0.RecordStopButton:Pause()
	end
end

local function var_0_11(arg_9_0)
	if not arg_9_0._disabled then
		arg_9_0._testingMic = not arg_9_0._testingMic

		var_0_10(arg_9_0)
	end
end

local function var_0_12(arg_10_0)
	arg_10_0._testingMic = false

	var_0_10(arg_10_0)
end

local function var_0_13(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_1 ~= nil then
		local var_11_0 = var_0_7(arg_11_1)

		if var_11_0 ~= nil then
			var_0_5[var_11_0].action(arg_11_0, arg_11_2)
			var_0_9(arg_11_0)
		end
	end
end

local function var_0_14(arg_12_0)
	local var_12_0 = Engine.BJEDCJAEHH()

	var_0_8(arg_12_0, var_12_0)
end

local function var_0_15(arg_13_0)
	arg_13_0:SetAlpha(1, var_0_3)

	arg_13_0._disabled = false
end

local function var_0_16(arg_14_0)
	arg_14_0:SetAlpha(0, var_0_3)

	arg_14_0._disabled = true

	if arg_14_0._testingMic then
		var_0_12(arg_14_0)
	end
end

local function var_0_17(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._testingMic = false
	arg_15_0._disabled = true
	arg_15_0._threshold = 0
	arg_15_0._pushToTalk = false
	arg_15_0.ToggleMicTest = var_0_11
	arg_15_0.StopMicTest = var_0_12
	arg_15_0.Show = var_0_15
	arg_15_0.Hide = var_0_16

	local var_15_0 = LUI.UIBindButton.new()

	var_15_0.id = "selfBindButton"

	arg_15_0:addElement(var_15_0)

	arg_15_0.bindButton = var_15_0

	arg_15_0.bindButton:addEventHandler("button_left_trigger", function(arg_16_0, arg_16_1)
		arg_15_0:ToggleMicTest()
	end)
	arg_15_0:registerEventHandler("update_config", function(arg_17_0, arg_17_1)
		var_0_13(arg_17_0, arg_17_1.changedSetting, arg_17_1.changedSettingValue)
	end)
	arg_15_0:registerEventHandler("mic_tick", function(arg_18_0, arg_18_1)
		var_0_14(arg_18_0)
	end)
	arg_15_0:registerEventHandler("on_close", function(arg_19_0)
		if arg_19_0._testingMic then
			arg_19_0:StopMicTest()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_15_0, "AR")
	end
end

function MicLevelSliderBar(arg_20_0, arg_20_1)
	local var_20_0 = LUI.UIElement.new()

	var_20_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 65 * _1080p)

	var_20_0.id = "MicLevelSliderBar"
	var_20_0._animationSets = var_20_0._animationSets or {}
	var_20_0._sequences = var_20_0._sequences or {}

	local var_20_1 = arg_20_1 and arg_20_1.controllerIndex

	if not var_20_1 and not Engine.DDJFBBJAIG() then
		var_20_1 = var_20_0:getRootController()
	end

	assert(var_20_1)

	local var_20_2 = var_20_0
	local var_20_3
	local var_20_4 = LUI.UIImage.new()

	var_20_4.id = "BG"

	var_20_4:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_20_4:SetAlpha(0.5, 0)
	var_20_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 39, 0, _1080p * 30, _1080p * 65)
	var_20_0:addElement(var_20_4)

	var_20_0.BG = var_20_4

	local var_20_5
	local var_20_6 = MenuBuilder.BuildRegisteredType("RecordStopButton", {
		controllerIndex = var_20_1
	})

	var_20_6.id = "RecordStopButton"

	var_20_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 35, _1080p * 30, _1080p * 65)
	var_20_0:addElement(var_20_6)

	var_20_0.RecordStopButton = var_20_6

	local var_20_7
	local var_20_8 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_20_1
	})

	var_20_8.id = "NoiseLevelProgressBar"

	var_20_8.Frame:SetAlpha(0, 0)
	var_20_8.Cap:SetAlpha(0, 0)
	var_20_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 49, _1080p * -10, _1080p * 43, _1080p * 53)
	var_20_0:addElement(var_20_8)

	var_20_0.NoiseLevelProgressBar = var_20_8

	local var_20_9
	local var_20_10 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_20_1
	})

	var_20_10.id = "ThresholdProgressBar"

	var_20_10.Fill:SetRGBFromInt(0, 0)
	var_20_10.Fill:SetAlpha(0.5, 0)
	var_20_10.Frame:SetAlpha(0, 0)
	var_20_10.Cap:SetAlpha(0, 0)
	var_20_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 49, _1080p * -10, _1080p * 43, _1080p * 53)
	var_20_0:addElement(var_20_10)

	var_20_0.ThresholdProgressBar = var_20_10

	local var_20_11
	local var_20_12 = LUI.UIText.new()

	var_20_12.id = "Title"

	var_20_12:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_20_12:setText(Engine.CBBHFCGDIC("LUA_MENU/MICROPHONE_TEST"), 0)
	var_20_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_20_12:SetAlignment(LUI.Alignment.Left)
	var_20_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 2, _1080p * 2, 0, _1080p * 19)
	var_20_0:addElement(var_20_12)

	var_20_0.Title = var_20_12

	local var_20_13
	local var_20_14 = LUI.UIImage.new()

	var_20_14.id = "Line"

	var_20_14:SetRGBFromInt(14936290, 0)
	var_20_14:SetAlpha(0.6, 0)
	var_20_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 23, _1080p * 24)
	var_20_0:addElement(var_20_14)

	var_20_0.Line = var_20_14

	local function var_20_15()
		return
	end

	var_20_0._sequences.DefaultSequence = var_20_15

	local var_20_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -38
		}
	}

	var_20_4:RegisterAnimationSequence("AR", var_20_16)

	local var_20_17 = {
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
			value = _1080p * -35
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_20_6:RegisterAnimationSequence("AR", var_20_17)

	local var_20_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		}
	}

	var_20_8:RegisterAnimationSequence("AR", var_20_18)

	local var_20_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -48
		}
	}

	var_20_10:RegisterAnimationSequence("AR", var_20_19)

	local var_20_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -8
		}
	}

	var_20_12:RegisterAnimationSequence("AR", var_20_20)

	local function var_20_21()
		var_20_4:AnimateSequence("AR")
		var_20_6:AnimateSequence("AR")
		var_20_8:AnimateSequence("AR")
		var_20_10:AnimateSequence("AR")
		var_20_12:AnimateSequence("AR")
	end

	var_20_0._sequences.AR = var_20_21

	var_20_6:addEventHandler("button_action", function(arg_23_0, arg_23_1)
		local var_23_0 = arg_23_1.controller or var_20_1

		ACTIONS.ToggleMicTest(var_20_0, var_20_0.RecordStopButton, var_23_0)
	end)

	local var_20_22 = LUI.UIBindButton.new()

	var_20_22.id = "selfBindButton"

	var_20_0:addElement(var_20_22)

	var_20_0.bindButton = var_20_22

	var_20_0.bindButton:addEventHandler("button_r3", function(arg_24_0, arg_24_1)
		local var_24_0 = arg_24_1.controller or var_20_1

		ACTIONS.ToggleMicTest(var_20_0, arg_24_0, var_24_0)
	end)
	var_0_17(var_20_0, var_20_1, arg_20_1)

	return var_20_0
end

MenuBuilder.registerType("MicLevelSliderBar", MicLevelSliderBar)
LockTable(_M)
