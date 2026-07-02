module(..., package.seeall)

function CodCasterTeamIdentityInformation(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 183 * _1080p)

	var_1_0.id = "CodCasterTeamIdentityInformation"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "ColoredBackground"

	var_1_4:SetRGBFromInt(657930, 0)
	var_1_4:SetPixelGridEnabled(true)
	var_1_4:SetPixelGridContrast(0.5, 0)
	var_1_4:SetPixelGridBlockWidth(2, 0)
	var_1_4:SetPixelGridBlockHeight(2, 0)
	var_1_4:SetPixelGridGutterWidth(1, 0)
	var_1_4:SetPixelGridGutterHeight(1, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 563, _1080p * 54, _1080p * 106)
	var_1_0:addElement(var_1_4)

	var_1_0.ColoredBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TeamSecondaryColorImage"

	var_1_6:SetRGBFromTable(SWATCHES.Reticles.White, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 205, _1080p * 210, _1080p * 80, _1080p * 106)
	var_1_0:addElement(var_1_6)

	var_1_0.TeamSecondaryColorImage = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TeamColorImage"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 205, _1080p * 210, _1080p * 54, _1080p * 80)
	var_1_0:addElement(var_1_8)

	var_1_0.TeamColorImage = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "TeamNameText"

	var_1_10:setText(Engine.CBBHFCGDIC("MENU/FACTION_ALLEGIANCE_NAME"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetWordWrap(false)
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_10:SetStartupDelay(800)
	var_1_10:SetLineHoldTime(450)
	var_1_10:SetAnimMoveTime(750)
	var_1_10:SetAnimMoveSpeed(5)
	var_1_10:SetEndDelay(1010)
	var_1_10:SetCrossfadeTime(410)
	var_1_10:SetFadeInTime(300)
	var_1_10:SetFadeOutTime(300)
	var_1_10:SetMaxVisibleLines(1)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 218, _1080p * 557, _1080p * 62, _1080p * 98)
	var_1_0:addElement(var_1_10)

	var_1_0.TeamNameText = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "TeamNameTitle"

	var_1_12:SetAlpha(0, 0)
	var_1_12:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_NAME"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 206, _1080p * 421, _1080p * 54, _1080p * 72)
	var_1_0:addElement(var_1_12)

	var_1_0.TeamNameTitle = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "TeamLogoImage"

	var_1_14:setImage(RegisterMaterial("icon_faction_west_gray_large"), 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 186, _1080p * 16, _1080p * 167)
	var_1_0:addElement(var_1_14)

	var_1_0.TeamLogoImage = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "TeamColorTitle"

	var_1_16:SetAlpha(0, 0)
	var_1_16:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_COLOR"), 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_16:SetAlignment(LUI.Alignment.Left)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 230, _1080p * 510, _1080p * 87.5, _1080p * 107.5)
	var_1_0:addElement(var_1_16)

	var_1_0.TeamColorTitle = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIText.new()

	var_1_18.id = "TeamLogoTitle"

	var_1_18:SetAlpha(0, 0)
	var_1_18:setText(Engine.CBBHFCGDIC("CODCASTER/TEAM1_LOGO"), 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Left)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 286, _1080p * 13.5, _1080p * 33.5)
	var_1_0:addElement(var_1_18)

	var_1_0.TeamLogoTitle = var_1_18

	local var_1_19
	local var_1_20 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 0
	}
	local var_1_21 = LUI.UIBorder.new(var_1_20)

	var_1_21.id = "Border"

	var_1_21:SetRGBFromInt(789516, 0)
	var_1_21:SetBorderThicknessRight(_1080p * 0, 0)
	var_1_21:SetBorderThicknessTop(_1080p * 0, 0)
	var_1_21:SetBorderThicknessBottom(_1080p * 0, 0)
	var_1_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 218, _1080p * 54, _1080p * 106)
	var_1_0:addElement(var_1_21)

	var_1_0.Border = var_1_21

	return var_1_0
end

MenuBuilder.registerType("CodCasterTeamIdentityInformation", CodCasterTeamIdentityInformation)
LockTable(_M)
