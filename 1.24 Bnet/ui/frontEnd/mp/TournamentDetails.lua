module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Tournament.BJDIDJCEAA()
	local var_1_1 = Tournament.EHBJJEAJH()
	local var_1_2 = Tournament.EACBBEFAEC()

	arg_1_0.AverageTimeCount:setText(Engine.CBBHFCGDIC("TOURNAMENT/TIME_MINUTES", var_1_2))
	arg_1_0.PartySizeCount:setText(Engine.CBBHFCGDIC("TOURNAMENT/MAX_PARTY", var_1_0))
	arg_1_0.TeamCount:setText(Engine.CBBHFCGDIC("TOURNAMENT/TEAM_COUNT", var_1_1, var_1_0))
end

function TournamentDetails(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 650 * _1080p)

	var_2_0.id = "TournamentDetails"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_4:SetRGBFromInt(2565927, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 800, 0, _1080p * 650)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "TournamentDetails"

	var_2_6:setText(Engine.CBBHFCGDIC("TOURNAMENT/DETAILS"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -26, _1080p * 17, _1080p * -597)
	var_2_0:addElement(var_2_6)

	var_2_0.TournamentDetails = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "HowToPlay"

	var_2_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/HOW_TO_PLAY"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -423, _1080p * 83, _1080p * -539)
	var_2_0:addElement(var_2_8)

	var_2_0.HowToPlay = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "Description"

	var_2_10:setText(Engine.CBBHFCGDIC("TOURNAMENT/HOW_TO_PLAY_DESC"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -415, _1080p * 141, _1080p * -487)
	var_2_0:addElement(var_2_10)

	var_2_0.Description = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "TextureLayer"

	var_2_12:SetAlpha(0.1, 0)
	var_2_12:SetPixelGridEnabled(true)
	var_2_12:SetPixelGridContrast(0.8, 0)
	var_2_12:SetPixelGridBlockWidth(2, 0)
	var_2_12:SetPixelGridBlockHeight(2, 0)
	var_2_12:SetPixelGridGutterWidth(1, 0)
	var_2_12:SetPixelGridGutterHeight(1, 0)
	var_2_12:setImage(RegisterMaterial("ui_default_white"), 0)
	var_2_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -580)
	var_2_0:addElement(var_2_12)

	var_2_0.TextureLayer = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "HorizontalDivider"

	var_2_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_14:SetAlpha(0.6, 0)
	var_2_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9.5, _1080p * -408, _1080p * 332, _1080p * -317)
	var_2_0:addElement(var_2_14)

	var_2_0.HorizontalDivider = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIImage.new()

	var_2_16.id = "VerticalDivider"

	var_2_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_16:SetAlpha(0.6, 0)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -2, _1080p * -1, _1080p * 124, _1080p * 622)
	var_2_0:addElement(var_2_16)

	var_2_0.VerticalDivider = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIText.new()

	var_2_18.id = "ModeVideo"

	var_2_18:setText(Engine.CBBHFCGDIC("TOURNAMENT/MODE_VIDEO"), 0)
	var_2_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_18:SetAlignment(LUI.Alignment.Left)
	var_2_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -513, _1080p * 305, _1080p * -325)
	var_2_0:addElement(var_2_18)

	var_2_0.ModeVideo = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIStyledText.new()

	var_2_20.id = "ModeSetup"

	var_2_20:setText(Engine.CBBHFCGDIC("TOURNAMENT/MODE_SETUP"), 0)
	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -423, _1080p * 353, _1080p * -269)
	var_2_0:addElement(var_2_20)

	var_2_0.ModeSetup = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIStyledText.new()

	var_2_22.id = "Maps"

	var_2_22:setText(Engine.CBBHFCGDIC("MENU/MAPS"), 0)
	var_2_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_22:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 415, _1080p * -18, _1080p * 83, _1080p * -539)
	var_2_0:addElement(var_2_22)

	var_2_0.Maps = var_2_22

	local var_2_23
	local var_2_24 = LUI.UIImage.new()

	var_2_24.id = "TournamentTimeIcon"

	var_2_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_24:setImage(RegisterMaterial("icon_playlist_match_time"), 0)
	var_2_24:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -726, _1080p * 404, _1080p * -184)
	var_2_0:addElement(var_2_24)

	var_2_0.TournamentTimeIcon = var_2_24

	local var_2_25
	local var_2_26 = LUI.UIImage.new()

	var_2_26.id = "PartySizeIcon"

	var_2_26:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_26:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_2_26:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 12, _1080p * -726, _1080p * 486, _1080p * -102)
	var_2_0:addElement(var_2_26)

	var_2_0.PartySizeIcon = var_2_26

	local var_2_27
	local var_2_28 = LUI.UIImage.new()

	var_2_28.id = "NumTeamsIcons"

	var_2_28:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_28:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_2_28:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 12, _1080p * -726, _1080p * 568, _1080p * -20)
	var_2_0:addElement(var_2_28)

	var_2_0.NumTeamsIcons = var_2_28

	local var_2_29
	local var_2_30 = LUI.UIText.new()

	var_2_30.id = "PartySizeHeader"

	var_2_30:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_30:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PARTYSIZE"), 0)
	var_2_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_30:SetWordWrap(false)
	var_2_30:SetAlignment(LUI.Alignment.Left)
	var_2_30:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -570, _1080p * 495, _1080p * -133)
	var_2_0:addElement(var_2_30)

	var_2_0.PartySizeHeader = var_2_30

	local var_2_31
	local var_2_32 = LUI.UIText.new()

	var_2_32.id = "NumTeamsHeader"

	var_2_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_32:setText(Engine.CBBHFCGDIC("TOURNAMENT/NUMBER_OF_TEAMS"), 0)
	var_2_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_32:SetWordWrap(false)
	var_2_32:SetAlignment(LUI.Alignment.Left)
	var_2_32:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -450, _1080p * 577, _1080p * -51)
	var_2_0:addElement(var_2_32)

	var_2_0.NumTeamsHeader = var_2_32

	local var_2_33
	local var_2_34 = LUI.UIText.new()

	var_2_34.id = "AverageTimeHeader"

	var_2_34:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_34:setText(Engine.CBBHFCGDIC("TOURNAMENT/TOURNAMENT_TIME"), 0)
	var_2_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_34:SetWordWrap(false)
	var_2_34:SetAlignment(LUI.Alignment.Left)
	var_2_34:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -427, _1080p * 413, _1080p * -215)
	var_2_0:addElement(var_2_34)

	var_2_0.AverageTimeHeader = var_2_34

	local var_2_35
	local var_2_36 = LUI.UIText.new()

	var_2_36.id = "TeamCount"

	var_2_36:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_36:setText("", 0)
	var_2_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_36:SetWordWrap(false)
	var_2_36:SetAlignment(LUI.Alignment.Left)
	var_2_36:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -450, _1080p * 608, _1080p * -20)
	var_2_0:addElement(var_2_36)

	var_2_0.TeamCount = var_2_36

	local var_2_37
	local var_2_38 = LUI.UIText.new()

	var_2_38.id = "PartySizeCount"

	var_2_38:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_38:setText("", 0)
	var_2_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_38:SetWordWrap(false)
	var_2_38:SetAlignment(LUI.Alignment.Left)
	var_2_38:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -423, _1080p * 526, _1080p * -102)
	var_2_0:addElement(var_2_38)

	var_2_0.PartySizeCount = var_2_38

	local var_2_39
	local var_2_40 = LUI.UIText.new()

	var_2_40.id = "AverageTimeCount"

	var_2_40:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_40:setText("", 0)
	var_2_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_40:SetWordWrap(false)
	var_2_40:SetAlignment(LUI.Alignment.Left)
	var_2_40:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 88, _1080p * -432, _1080p * 444, _1080p * -184)
	var_2_0:addElement(var_2_40)

	var_2_0.AverageTimeCount = var_2_40

	local var_2_41
	local var_2_42 = MenuBuilder.BuildRegisteredType("TournamentMapInfoList", {
		controllerIndex = var_2_1
	})

	var_2_42.id = "TournamentMapInfoList"

	var_2_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 415, _1080p * 790, _1080p * 124, _1080p * 624)
	var_2_0:addElement(var_2_42)

	var_2_0.TournamentMapInfoList = var_2_42

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("TournamentDetails", TournamentDetails)
LockTable(_M)
