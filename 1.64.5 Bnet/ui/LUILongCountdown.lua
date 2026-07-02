LUI.UILongCountdown = LUI.Class(LUI.UIText)

function LUI.UILongCountdown.build(arg_1_0, arg_1_1)
	return (LUI.UILongCountdown.new(arg_1_1))
end

function LUI.UILongCountdown.init(arg_2_0, arg_2_1)
	LUI.UIElement.init(arg_2_0)

	arg_2_1 = arg_2_1 or {}

	if LUI.UIElement.setupUILongCountdown ~= nil then
		arg_2_0:setupUILongCountdown(arg_2_1.endTime)
	end

	if arg_2_1.endTime then
		arg_2_0:setEndTime(arg_2_1.endTime)
	end

	arg_2_0.m_localizedFormatString = "LUA_MENU_MP/COUNTDOWN_DAYS"
	arg_2_0.m_countdownStyledText = LUI.UIStyledText.new()
	arg_2_0.m_countdownStyledText.id = "countdownStyledText"

	arg_2_0:addElement(arg_2_0.m_countdownStyledText)
end

function LUI.UILongCountdown.setEndTime(arg_3_0, arg_3_1)
	if LUI.UIElement.setEndTimeInC ~= nil then
		arg_3_0:setEndTimeInC(arg_3_1)
	end
end

function LUI.UILongCountdown.useLocalizedFormat(arg_4_0)
	arg_4_0.m_useLocalizedCountdownFormat = true
end

function LUI.UILongCountdown.setLocalizedFormatString(arg_5_0, arg_5_1)
	arg_5_0.m_localizedFormatString = arg_5_1
end

function LUI.UILongCountdown.setTextStyle(arg_6_0, arg_6_1)
	arg_6_0.m_textStyle = arg_6_1
end

function LUI.UILongCountdown.SetFont(arg_7_0, arg_7_1)
	arg_7_0.m_countdownStyledText:SetFont(arg_7_1)
end

function LUI.UILongCountdown.SetFontSize(arg_8_0, arg_8_1)
	arg_8_0.m_countdownStyledText:SetFontSize(arg_8_1)
end

function LUI.UILongCountdown.SetTracking(arg_9_0, arg_9_1)
	arg_9_0.m_countdownStyledText:SetTracking(arg_9_1)
end

function LUI.UILongCountdown.SetLeading(arg_10_0, arg_10_1)
	arg_10_0.m_countdownStyledText:SetLeading(arg_10_1)
end

function LUI.UICountdown.GetStyledText(arg_11_0)
	return arg_11_0.m_countdownStyledText
end

LUI.UILongCountdown.id = "LUICountdown"
