module(..., package.seeall)

function ExitPopup(arg_1_0, arg_1_1)
	Dvar.DHEGHJJJHI("MTMMPLSRNL", false)
	LUI.FlowManager.RequestLeaveMenu(arg_1_0)
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = DataSources.frontEnd.primaryPlayerUserName:GetValue(arg_2_1)

	if var_2_0 == nil or var_2_0 == "" then
		var_2_0 = ToUpperCase(Engine.CBBHFCGDIC("XBOXLIVE/NOTSIGNEDIN"), 0)
	else
		var_2_0 = Engine.JCBDICCAH(var_2_0)
	end

	arg_2_0.TextBoxTitle:setText(Engine.DDFHCEDJEA("PLATFORM/GAMEBATTLES_REGISTER_POPUP", var_2_0))
	arg_2_0.PopupButton:registerEventHandler("button_action", ExitPopup)

	local var_2_1 = LUI.UIBindButton.new()

	var_2_1.id = "GameBattlesUnregisteredUserPopup_id"

	var_2_1:registerEventHandler("button_secondary", ExitPopup)
	arg_2_0:addElement(var_2_1)
end

function GameBattlesUnregisteredUserPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 659 * _1080p)

	var_3_0.id = "GameBattlesUnregisteredUserPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "TextBoxTitle"

	var_3_4:setText(Engine.CBBHFCGDIC("PLATFORM/GAMEBATTLES_REGISTER_POPUP"), 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 768.5, _1080p * 28.5, _1080p * 52.5)
	var_3_0:addElement(var_3_4)

	var_3_0.TextBoxTitle = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "PopupButton"

	var_3_6.Label:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/EXIT")), 0)
	var_3_6.Label:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 800, _1080p * 625, _1080p * 655)
	var_3_0:addElement(var_3_6)

	var_3_0.PopupButton = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("CallingCardImage", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "CallingCardRegisteredToGamebattles"

	var_3_8.CallingCardTexture:setImage(RegisterMaterial("ui_playercard_696"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 643, _1080p * 399, _1080p * 590)
	var_3_0:addElement(var_3_8)

	var_3_0.CallingCardRegisteredToGamebattles = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameBattlesUnregisteredUserPopup", GameBattlesUnregisteredUserPopup)
LockTable(_M)
