module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.WebView:SetAlpha(arg_1_1 and 1 or 0)
	arg_1_0.Spinner:SetAlpha(arg_1_1 and 0 or 1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:addEventHandler("gamepad_button", function(arg_3_0, arg_3_1)
		if arg_3_1.qualifier == "gamepad" and arg_3_1.button == "alt2" or arg_3_1.qualifier == "keyboard" and arg_3_1.button == "secondary" then
			if arg_3_1.down == true then
				LUI.WebViewManager.Instance():RequestCloseFullScreen(true)
			end

			return true
		end
	end)

	local var_2_0 = LUI.DataSourceInGlobalModel.new("telescope.loadcomplete")

	arg_2_0:SubscribeToModel(var_2_0:GetModel(0), function(arg_4_0)
		var_0_0(arg_2_0, DataModel.JJEHAEBDF(arg_4_0))
	end)
	arg_2_0.WebView:processEvent({
		name = "gain_focus"
	})
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
end

function FullScreenWeb(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "FullScreenWeb"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetScale(1, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 270, _1080p * -270)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = {
		focusable = true,
		usage = LUI.WebViewManager.USAGE_FULLSCREEN,
		controllerIndex = var_5_1
	}
	local var_5_7 = MenuBuilder.BuildRegisteredType("WebView", var_5_6)

	var_5_7.id = "WebView"

	var_5_7:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_5_0:addElement(var_5_7)

	var_5_0.WebView = var_5_7

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("Spinner", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "Spinner"

	var_5_9:setImage(RegisterMaterial("spinner_loading"), 0)
	var_5_9:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -150, _1080p * 150, _1080p * -5, _1080p * 5)
	var_5_0:addElement(var_5_9)

	var_5_0.Spinner = var_5_9

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("FullScreenWeb", FullScreenWeb)
LockTable(_M)
