module(..., package.seeall)

function TournamentMapInfo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 108 * _1080p)

	var_1_0.id = "TournamentMapInfo"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "MapImage"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 201, 0, _1080p * 108)
	var_1_0:addElement(var_1_4)

	var_1_0.MapImage = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Round"

	var_1_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_6:setText("Round 1", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 209, _1080p * 375, 0, _1080p * 22)
	var_1_0:addElement(var_1_6)

	var_1_0.Round = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "MapName"

	var_1_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 209, _1080p * 375, _1080p * 26, _1080p * 48)
	var_1_0:addElement(var_1_8)

	var_1_0.MapName = var_1_8

	return var_1_0
end

MenuBuilder.registerType("TournamentMapInfo", TournamentMapInfo)
LockTable(_M)
