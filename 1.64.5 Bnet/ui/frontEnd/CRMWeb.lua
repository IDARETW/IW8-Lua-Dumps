module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	LUI.WebViewManager.Instance():CloseByElement(arg_1_0.WebView)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = LUI.IsLastInputGamepad(arg_2_1)

	arg_2_0.ActionPrompt:SetAlpha(var_2_0 and 1 or 0)
	ACTIONS.AnimateSequence(arg_2_0, var_2_0 and "SetInputGamePad" or "SetInputKBM")
end

local function var_0_2(arg_3_0, arg_3_1)
	var_0_1(arg_3_0, arg_3_1.controllerIndex)
end

local function var_0_3(arg_4_0)
	local var_4_0 = arg_4_0._isVisible and arg_4_0._isLoadComplete

	arg_4_0:SetAlpha(var_4_0 and 1 or 0)
end

local function var_0_4(arg_5_0)
	return arg_5_0._isVisible and arg_5_0._isLoadComplete
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0._isLoadComplete = arg_6_1

	var_0_3(arg_6_0)
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0._isVisible = arg_7_1

	var_0_3(arg_7_0)
end

local function var_0_7(arg_8_0, arg_8_1)
	return arg_8_1.focusType == nil or arg_8_1.focusType == FocusType.MenuFlow
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	if not LUI.WebViewManager.MotdEnabled() then
		return
	end

	LUI.WebViewManager.Instance():OpenByElement(arg_9_0.WebView)
	arg_9_0:addEventHandler("gain_focus", var_0_7)
	arg_9_0:addEventHandler("on_close", var_0_0)

	arg_9_0.SwitchVisibility = var_0_6
	arg_9_0.IsVisible = var_0_4
	arg_9_0._isLoadComplete = false
	arg_9_0._isVisible = true

	local var_9_0 = LUI.UIBindButton.new()

	var_9_0.id = "selfBindButton"

	arg_9_0:addElement(var_9_0)
	var_9_0:addEventHandler("button_right_trigger", function(arg_10_0, arg_10_1)
		if arg_10_1.qualifier == "gamepad" and var_0_4(arg_9_0) then
			LUI.WebViewManager.Instance():RequestOpenFullScreen(arg_9_0.WebView, true)
		end
	end)
	var_0_1(arg_9_0, arg_9_1)
	arg_9_0:registerEventHandler("update_input_type", var_0_2)

	local var_9_1 = LUI.DataSourceInGlobalModel.new("telescope.loadcomplete")

	arg_9_0:SubscribeToModel(var_9_1:GetModel(0), function(arg_11_0)
		var_0_5(arg_9_0, DataModel.JJEHAEBDF(arg_11_0))
	end)
end

function CRMWeb(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 250 * _1080p)

	var_12_0.id = "CRMWeb"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3

	if CONDITIONS.IsMagmaGameMode() then
		var_12_3 = LUI.UIImage.new()
		var_12_3.id = "Background"

		var_12_3:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
		var_12_3:SetAlpha(0.5, 0)
		var_12_3:SetXRotation(180, 0)
		var_12_3:SetZRotation(180, 0)
		var_12_3:setImage(RegisterMaterial("ui_mp_wz_bkg_challenge"), 0)
		var_12_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -10, _1080p * -25)
		var_12_0:addElement(var_12_3)

		var_12_0.Background = var_12_3
	end

	local var_12_4
	local var_12_5 = {
		focusable = true,
		usage = LUI.WebViewManager.USAGE_MOTD,
		controllerIndex = var_12_1
	}
	local var_12_6 = MenuBuilder.BuildRegisteredType("WebView", var_12_5)

	var_12_6.id = "WebView"

	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 419, _1080p * -1, _1080p * 215)
	var_12_0:addElement(var_12_6)

	var_12_0.WebView = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIText.new()

	var_12_8.id = "ActionPrompt"

	var_12_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_12_8:setText(Engine.CBBHFCGDIC("LUA_MENU/OPEN_CRM_POPUP"), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_8:SetWordWrap(false)
	var_12_8:SetAlignment(LUI.Alignment.Right)
	var_12_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -138, _1080p * -11, _1080p * -32, _1080p * -12)
	var_12_0:addElement(var_12_8)

	var_12_0.ActionPrompt = var_12_8

	local function var_12_9()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_9

	local var_12_10

	if CONDITIONS.IsMagmaGameMode() then
		local var_12_11 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -10
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -9
			}
		}

		var_12_3:RegisterAnimationSequence("SetInputGamePad", var_12_11)
	end

	local function var_12_12()
		if CONDITIONS.IsMagmaGameMode() then
			var_12_3:AnimateSequence("SetInputGamePad")
		end
	end

	var_12_0._sequences.SetInputGamePad = var_12_12

	local var_12_13

	if CONDITIONS.IsMagmaGameMode() then
		local var_12_14 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -10
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -25
			}
		}

		var_12_3:RegisterAnimationSequence("SetInputKBM", var_12_14)
	end

	local function var_12_15()
		if CONDITIONS.IsMagmaGameMode() then
			var_12_3:AnimateSequence("SetInputKBM")
		end
	end

	var_12_0._sequences.SetInputKBM = var_12_15

	var_0_8(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("CRMWeb", CRMWeb)
LockTable(_M)
