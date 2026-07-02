module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ConfirmButton)
	assert(arg_1_0.CountdownTimer)
	arg_1_0.CountdownTimer:setEndTime(Engine.BFBIDEGDFB() + arg_1_2.duration)
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if arg_1_2.onAccept then
			arg_1_2.onAccept()
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function TournamentBannedPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "TournamentBannedPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "GenericPopupFrame"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.GenericPopupFrame = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image"

	var_3_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_6:SetAlpha(0.6, 0)
	var_3_6:setImage(RegisterMaterial("mm_element_logo_white"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1037, _1080p * 1801, _1080p * 322, _1080p * 758)
	var_3_0:addElement(var_3_6)

	var_3_0.Image = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "BanMessage"

	var_3_8:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/BAN_MESSAGE"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -22, _1080p * -109, _1080p * -81)
	var_3_0:addElement(var_3_8)

	var_3_0.BanMessage = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "MenuTitle"

	var_3_10.MenuTitle:setText(Engine.CBBHFCGDIC("TOURNAMENT/BANNED"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -705, _1080p * 21, _1080p * 284, _1080p * 389)
	var_3_0:addElement(var_3_10)

	var_3_0.MenuTitle = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Line"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.border, 0)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -705, _1080p * -153, _1080p * -151)
	var_3_0:addElement(var_3_12)

	var_3_0.Line = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "TimerMessage"

	var_3_14:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("TOURNAMENT/BAN_TIMER_MESSAGE"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -620, _1080p * -22, _1080p * -14, _1080p * 14)
	var_3_0:addElement(var_3_14)

	var_3_0.TimerMessage = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "CountdownTimer"

	var_3_16:SetRGBFromTable(SWATCHES.fieldOrders.highlight, 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:setEndTime(0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 340, _1080p * 448, _1080p * 568, _1080p * 598)
	var_3_0:addElement(var_3_16)

	var_3_0.CountdownTimer = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "ConfirmButton"

	var_3_18.Text:SetLeft(_1080p * 20, 0)
	var_3_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("TOURNAMENT/BAN_CONFIRM")), 0)
	var_3_18.Text:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 340, _1080p * 760, _1080p * 642, _1080p * 680)
	var_3_0:addElement(var_3_18)

	var_3_0.ConfirmButton = var_3_18

	var_3_4:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.ScaleFullscreen(var_3_0.GenericPopupFrame)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentBannedPopup", TournamentBannedPopup)
LockTable(_M)
