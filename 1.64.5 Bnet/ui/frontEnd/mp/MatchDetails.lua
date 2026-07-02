module(..., package.seeall)

function MatchDetails(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 140 * _1080p)

	var_1_0.id = "MatchDetails"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "GameType"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetDecodeLetterLength(25)
	var_1_4:SetDecodeMaxRandChars(3)
	var_1_4:SetDecodeUpdatesPerLetter(4)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 17, _1080p * 2, _1080p * 24, _1080p * 54)

	local function var_1_5()
		local var_2_0 = DataSources.frontEnd.lobby.gameTypeNameWithModifier:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:setText(var_2_0, 0)
		end
	end

	local var_1_6 = DataSources.frontEnd.lobby.gameTypeNameWithModifier

	var_1_4:SubscribeToModel(var_1_6:GetModel(var_1_1), var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.GameType = var_1_4

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "MapName"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_8:SetAlpha(0.5, 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetDecodeLetterLength(25)
	var_1_8:SetDecodeMaxRandChars(3)
	var_1_8:SetDecodeUpdatesPerLetter(4)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 17, _1080p * 2, _1080p * 108, _1080p * 140)

	local function var_1_9()
		local var_3_0 = DataSources.frontEnd.lobby.mapName:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_8:setText(var_3_0, 0)
		end
	end

	local var_1_10 = DataSources.frontEnd.lobby.mapName

	var_1_8:SubscribeToModel(var_1_10:GetModel(var_1_1), var_1_9)
	var_1_0:addElement(var_1_8)

	var_1_0.MapName = var_1_8

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "GameModeHeader"

	var_1_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_12:SetAlpha(0.8, 0)
	var_1_12:setText(Engine.CBBHFCGDIC("MENU/GAME_TYPE"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 17, _1080p * 2, _1080p * -4, _1080p * 20)
	var_1_0:addElement(var_1_12)

	var_1_0.GameModeHeader = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "MapHeader"

	var_1_14:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_14:SetAlpha(0.8, 0)
	var_1_14:setText(Engine.CBBHFCGDIC("GAME/VOTE_MAP"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 17, _1080p * 2, _1080p * 80, _1080p * 104)
	var_1_0:addElement(var_1_14)

	var_1_0.MapHeader = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "Node1"

	var_1_16:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_16:SetAlpha(0.8, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 50)
	var_1_0:addElement(var_1_16)

	var_1_0.Node1 = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIImage.new()

	var_1_18.id = "Node2"

	var_1_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_18:SetAlpha(0.8, 0)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 6, _1080p * 84, _1080p * 134)
	var_1_0:addElement(var_1_18)

	var_1_0.Node2 = var_1_18

	return var_1_0
end

MenuBuilder.registerType("MatchDetails", MatchDetails)
LockTable(_M)
