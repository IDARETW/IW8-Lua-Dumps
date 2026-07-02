LUI.UICountdown = LUI.Class(LUI.UIText)
LUI.UICountdown.CustomFormatType = {
	SECMSEC = 4,
	MSEC = 5,
	SEC = 3,
	HRMINSEC = 1,
	MINSEC = 2,
	DAYHRMIN = 6,
	NONE = 0
}

function LUI.UICountdown.build(arg_1_0, arg_1_1)
	return (LUI.UICountdown.new(arg_1_1))
end

function LUI.UICountdown.init(arg_2_0, arg_2_1)
	LUI.UIElement.init(arg_2_0)

	arg_2_1 = arg_2_1 or {}

	if LUI.UIElement.setupUICountdown ~= nil then
		if arg_2_1.endTime == "round_end" then
			arg_2_0:setupUICountdown()
		else
			arg_2_0:setupUICountdown(arg_2_1.endTime or 0)
		end
	end

	arg_2_0.m_timeToStart1SecEvents = 0
	arg_2_0.m_customEventThreshold = -1
	arg_2_0.m_customFormatType = LUI.UICountdown.CustomFormatType.NONE
	arg_2_0.m_countdownStyledText = LUI.UIStyledText.new()
	arg_2_0.m_countdownStyledText.id = "countdownStyledText"

	arg_2_0:addElement(arg_2_0.m_countdownStyledText)
end

function LUI.UICountdown.freeze(arg_3_0)
	arg_3_0.m_frozen = true
	arg_3_0.m_endTimeWasSet = true
	arg_3_0.m_timeWhenFrozen = Game.CAIAFFIDE()
end

function LUI.UICountdown.unfreeze(arg_4_0)
	arg_4_0.m_frozen = false
end

function LUI.UICountdown.isFrozen(arg_5_0)
	return arg_5_0.m_frozen
end

function LUI.UICountdown.useLocalizedFormat(arg_6_0)
	arg_6_0.m_useLocalizedCountdownFormat = true
end

function LUI.UICountdown.setTimeToStart1SecEvents(arg_7_0, arg_7_1)
	arg_7_0.m_timeToStart1SecEvents = arg_7_1
end

function LUI.UICountdown.setAlwaysSend1SecEvents(arg_8_0)
	arg_8_0.m_timeToStart1SecEvents = -1
end

function LUI.UICountdown.SetCustomEventThreshold(arg_9_0, arg_9_1)
	arg_9_0.m_customEventThreshold = arg_9_1
end

function LUI.UICountdown.ClearCustomEventThreshold(arg_10_0)
	arg_10_0.m_customEventThreshold = -1
end

function LUI.UICountdown.SetCustomFormatType(arg_11_0, arg_11_1)
	arg_11_0.m_customFormatType = arg_11_1
end

function LUI.UICountdown.ClearCustomFormatType(arg_12_0)
	arg_12_0.m_customFormatType = LUI.UICountdown.CustomFormatType.NONE
end

function LUI.UICountdown.SetCustomFormat(arg_13_0, arg_13_1)
	arg_13_0.m_customFormat = arg_13_1
end

function LUI.UICountdown.ClearCustomFormat(arg_14_0)
	arg_14_0.m_customFormat = nil
end

function LUI.UICountdown.setEndTime(arg_15_0, arg_15_1)
	if LUI.UIElement.setEndTimeInC ~= nil then
		arg_15_0:setEndTimeInC(arg_15_1)

		arg_15_0.m_endTimeWasSet = true
	end
end

function LUI.UICountdown.setShowDecimalsAtTime(arg_16_0, arg_16_1)
	if LUI.UIElement.setShowDecimalsAtTimeInC ~= nil then
		arg_16_0:setShowDecimalsAtTimeInC(arg_16_1)
	end
end

function LUI.UICountdown.setTextStyle(arg_17_0, arg_17_1)
	arg_17_0.m_textStyle = arg_17_1
end

function LUI.UICountdown.SetFont(arg_18_0, arg_18_1)
	arg_18_0.m_countdownStyledText:SetFont(arg_18_1)
end

function LUI.UICountdown.SetFontSize(arg_19_0, arg_19_1)
	arg_19_0.m_countdownStyledText:SetFontSize(arg_19_1)
end

function LUI.UICountdown.SetTracking(arg_20_0, arg_20_1)
	arg_20_0.m_countdownStyledText:SetTracking(arg_20_1)
end

function LUI.UICountdown.SetLeading(arg_21_0, arg_21_1)
	arg_21_0.m_countdownStyledText:SetLeading(arg_21_1)
end

function LUI.UICountdown.SetAlignment(arg_22_0, arg_22_1)
	arg_22_0.m_countdownStyledText:SetAlignment(arg_22_1)
end

function LUI.UICountdown.SetVerticalAlignment(arg_23_0, arg_23_1)
	arg_23_0.m_countdownStyledText:SetVerticalAlignment(arg_23_1)
end

function LUI.UICountdown.SetWordWrap(arg_24_0, arg_24_1)
	arg_24_0.m_countdownStyledText:SetWordWrap(arg_24_1)
end

function LUI.UICountdown.SetOptOutRightToLeftAlignmentFlip(arg_25_0, arg_25_1)
	arg_25_0.m_countdownStyledText:SetOptOutRightToLeftAlignmentFlip(arg_25_1)
end

function LUI.UICountdown.SetTintFontIcons(arg_26_0, arg_26_1)
	arg_26_0.m_countdownStyledText:SetTintFontIcons(arg_26_1)
end

function LUI.UICountdown.GetStyledText(arg_27_0)
	return arg_27_0.m_countdownStyledText
end

LUI.UICountdown.id = "LUICountdown"
