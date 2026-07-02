module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.BLMFullScreenSeen")

		DataModel.DBEBGEAJHJ(var_2_0:GetModel(), true)
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end

	arg_1_0.Button:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
		var_1_0(arg_3_0, arg_3_1)
	end)

	local var_1_1 = LUI.UIBindButton.new()

	var_1_1:registerEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		var_1_0(arg_4_0, arg_4_1)
	end)
	arg_1_0:addElement(var_1_1)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)

	arg_1_0.isQuickAccessShortcutsDisabled = true

	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.BlackoutImage)
end

function BLMFullScreen(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIHorizontalNavigator.new()

	var_5_0.id = "BLMFullScreen"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "BlackoutImage"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.BlackoutImage = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIStyledText.new()

	var_5_6.id = "BLMTitle"

	var_5_6:SetRGBFromTable(SWATCHES.BLM.Title, 0)
	var_5_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/BLM")), 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_6:SetAlignment(LUI.Alignment.Center)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -762, _1080p * 762, _1080p * -110, _1080p * -40)
	var_5_0:addElement(var_5_6)

	var_5_0.BLMTitle = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "BLMText"

	var_5_8:SetRGBFromTable(SWATCHES.BLM.Body, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("MENU/BLM_DESC"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -12, _1080p * 12)
	var_5_0:addElement(var_5_8)

	var_5_0.BLMText = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "Button"

	var_5_10.Label:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE")), 0)
	var_5_10.Label:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -210, _1080p * 210, _1080p * 892, _1080p * 932)
	var_5_0:addElement(var_5_10)

	var_5_0.Button = var_5_10

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BLMFullScreen", BLMFullScreen)
LockTable(_M)
