module(..., package.seeall)

function TournamentRewards(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 650 * _1080p)

	var_1_0.id = "TournamentRewards"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bg, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 800, 0, _1080p * 650)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "TextureLayer"

	var_1_6:SetAlpha(0.1, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.8, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 800, 0, _1080p * 70)
	var_1_0:addElement(var_1_6)

	var_1_0.TextureLayer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Rewards"

	var_1_8:setText(Engine.CBBHFCGDIC("TOURNAMENT/REWARDS"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -26, _1080p * 17, _1080p * -597)
	var_1_0:addElement(var_1_8)

	var_1_0.Rewards = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "First"

	var_1_10:setText(Engine.CBBHFCGDIC("TOURNAMENT/FIRST"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -696, _1080p * 106, _1080p * -510)
	var_1_0:addElement(var_1_10)

	var_1_0.First = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "Second"

	var_1_12:setText(Engine.CBBHFCGDIC("TOURNAMENT/SECOND"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -696, _1080p * 283, _1080p * -337)
	var_1_0:addElement(var_1_12)

	var_1_0.Second = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "Third"

	var_1_14:setText(Engine.CBBHFCGDIC("TOURNAMENT/THIRD"), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 10, _1080p * -696, _1080p * 462, _1080p * -158)
	var_1_0:addElement(var_1_14)

	var_1_0.Third = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("TournamentRewardsList", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "TournamentRewardsList"

	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 784, _1080p * 106, _1080p * 622)
	var_1_0:addElement(var_1_16)

	var_1_0.TournamentRewardsList = var_1_16

	return var_1_0
end

MenuBuilder.registerType("TournamentRewards", TournamentRewards)
LockTable(_M)
