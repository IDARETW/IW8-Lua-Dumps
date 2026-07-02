module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.QuitButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		Engine.DJEDDFJEIG()
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Background)

	arg_1_0.isQuickAccessShortcutsDisabled = true
end

function ProgramDetectedErrorPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "ProgramDetectedErrorPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 310, _1080p * 770)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "MenuTitle"

	var_3_8.MenuTitle:setText("ERROR", 0)
	var_3_8.Line:SetLeft(0, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 169, _1080p * -225, _1080p * -121)
	var_3_0:addElement(var_3_8)

	var_3_0.MenuTitle = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "QuitButton"

	var_3_10.Text:SetLeft(_1080p * 20, 0)
	var_3_10.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")), 0)
	var_3_10.Text:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -343, _1080p * 139, _1080p * 177)
	var_3_0:addElement(var_3_10)

	var_3_0.QuitButton = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Line"

	var_3_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -300, _1080p * -124, _1080p * -124)
	var_3_0:addElement(var_3_12)

	var_3_0.Line = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "TextPart2"

	var_3_14:SetAlpha(0.6, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU/OVERWOLF_ERR_MSG_PT2"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -189, _1080p * 30, _1080p * 48)
	var_3_0:addElement(var_3_14)

	var_3_0.TextPart2 = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "ProgramName"

	var_3_16:setText(Engine.CBBHFCGDIC("LUA_MENU/OVERWOLF"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -263, _1080p * -30, _1080p * -5)
	var_3_0:addElement(var_3_16)

	var_3_0.ProgramName = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "TextPart1"

	var_3_18:SetAlpha(0.6, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/OVERWOLF_ERR_MSG_PT1"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -763, _1080p * -76, _1080p * -83, _1080p * -65)
	var_3_0:addElement(var_3_18)

	var_3_0.TextPart1 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "Image"

	var_3_20:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_3_20:SetAlpha(0.25, 0)
	var_3_20:setImage(RegisterMaterial("logo_wz"), 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 377, _1080p * 658, _1080p * -170, _1080p * 158)
	var_3_0:addElement(var_3_20)

	var_3_0.Image = var_3_20

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ProgramDetectedErrorPopup", ProgramDetectedErrorPopup)
LockTable(_M)
