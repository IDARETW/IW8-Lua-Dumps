module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Date:setText(arg_1_2.currentDateTime)
	arg_1_0.TeamName:setText(arg_1_2.winningTeamName .. " [" .. arg_1_2.winningTeamId .. "]")
	arg_1_0.Information:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/FORFEIT_TEAM_ABSENT", Engine.JCBDICCAH(arg_1_2.forfeitTeamName .. " [" .. arg_1_2.forfeitTeamId .. "]"), Engine.JCBDICCAH(arg_1_2.matchID)))
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_2_0)
	end)
end

function GameBattlesMatchForfeit(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1710 * _1080p, 0, 450 * _1080p)

	var_3_0.id = "GameBattlesMatchForfeit"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -226, _1080p * 225)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ConfirmButton"

	var_3_6.Text:SetLeft(_1080p * 20, 0)
	var_3_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONTINUE")), 0)
	var_3_6.Text:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 445, _1080p * 378, _1080p * 416)
	var_3_0:addElement(var_3_6)

	var_3_0.ConfirmButton = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Information"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/FORFEIT_TEAM_ABSENT"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 980, _1080p * 182, _1080p * 206)
	var_3_0:addElement(var_3_8)

	var_3_0.Information = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "TeamName"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 980, _1080p * 131, _1080p * 161)
	var_3_0:addElement(var_3_10)

	var_3_0.TeamName = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Date"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 980, _1080p * 107, _1080p * 131)
	var_3_0:addElement(var_3_12)

	var_3_0.Date = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Divider"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_14:SetAlpha(0.6, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 563, _1080p * 80, _1080p * 81)
	var_3_0:addElement(var_3_14)

	var_3_0.Divider = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Logo"

	var_3_16:setImage(RegisterMaterial("gamebattles_logo_large"), 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -669, _1080p * -43, _1080p * 56, _1080p * 394)
	var_3_0:addElement(var_3_16)

	var_3_0.Logo = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "Title"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/CAPS"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_18:SetAlignment(LUI.Alignment.Right)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 563, _1080p * 26, _1080p * 86)
	var_3_0:addElement(var_3_18)

	var_3_0.Title = var_3_18

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameBattlesMatchForfeit", GameBattlesMatchForfeit)
LockTable(_M)
