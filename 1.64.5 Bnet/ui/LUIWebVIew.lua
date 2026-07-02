LUI.WebView = LUI.Class(LUI.UIElement)

local function var_0_0(arg_1_0, arg_1_1)
	LUI.WebViewManager.Instance():GainFocus(arg_1_0)
end

local function var_0_1(arg_2_0, arg_2_1)
	LUI.WebViewManager.Instance():LoseFocus(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1.qualifier ~= "mousewheel" then
		LUI.WebViewManager.Instance():ButtonPress(arg_3_0, arg_3_1)
	else
		LUI.WebViewManager.Instance():MouseWheel(arg_3_0, arg_3_1)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1.qualifier ~= "mousewheel" then
		LUI.WebViewManager.Instance():ButtonEvent(arg_4_0, arg_4_1)
	else
		LUI.WebViewManager.Instance():MouseWheel(arg_4_0, arg_4_1)
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	if not LUI.IsLastInputKeyboardMouse(arg_5_1.controller) then
		return
	end

	if not arg_5_1.insideWindow then
		return
	end

	LUI.WebViewManager.Instance():MouseMove(arg_5_0, arg_5_1)
end

local function var_0_5(arg_6_0, arg_6_1)
	LUI.WebViewManager.Instance():MouseAction(arg_6_0, arg_6_1)
end

local function var_0_6(arg_7_0)
	arg_7_0:SetHandleMouse(true)
	arg_7_0:addEventHandler("gain_focus", var_0_0)
	arg_7_0:addEventHandler("lose_focus", var_0_1)
	arg_7_0:addEventHandler("mouseenter", var_0_0)
	arg_7_0:addEventHandler("mouseleave", var_0_1)

	if Dvar.IBEGCHEFE("SPMSSPPTO") then
		arg_7_0:addEventHandler("gamepad_button", var_0_3)
	else
		arg_7_0:addEventHandler("gamepad_button", var_0_2)
	end

	arg_7_0:addEventHandler("mousemove", var_0_4)
	arg_7_0:addEventHandler("mousedown", var_0_5)
	arg_7_0:addEventHandler("mouseup", var_0_5)
end

function LUI.WebView.init(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or {}

	LUI.WebView.super.init(arg_8_0, arg_8_1)

	arg_8_0.options = arg_8_1

	LUI.WebViewManager.Instance():Setup(arg_8_0)

	if arg_8_1.focusable then
		var_0_6(arg_8_0)
	end
end

function LUI.WebView.GetSize(arg_9_0)
	local var_9_0 = arg_9_0:GetCurrentAnchorsAndPositions()
	local var_9_1 = math.floor((var_9_0.right - var_9_0.left) / _1080p + 0.5)
	local var_9_2 = math.floor((var_9_0.bottom - var_9_0.top) / _1080p + 0.5)

	return var_9_1, var_9_2
end

LUI.WebView.id = "LUIWebView"

MenuBuilder.registerType("WebView", function(arg_10_0, arg_10_1)
	return LUI.WebView.new(arg_10_1)
end)
