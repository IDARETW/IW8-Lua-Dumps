module(..., package.seeall)

function TournamentReward(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 662 * _1080p, 0, 158 * _1080p)

	var_1_0.id = "TournamentReward"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "VerticalDividerFirst"

	var_1_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 285, _1080p * 286, 0, _1080p * 158)
	var_1_0:addElement(var_1_4)

	var_1_0.VerticalDividerFirst = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "AdditionalRewards"

	var_1_6:setText(Engine.CBBHFCGDIC("TOURNAMENT/ADDITIONAL_REWARDS"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 305, _1080p * 661, 0, _1080p * 24)
	var_1_0:addElement(var_1_6)

	var_1_0.AdditionalRewards = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "AdditionalReward1"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 305, _1080p * 661, _1080p * 49, _1080p * 69)
	var_1_0:addElement(var_1_8)

	var_1_0.AdditionalReward1 = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "AdditionalReward2"

	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 305, _1080p * 661, _1080p * 80, _1080p * 100)
	var_1_0:addElement(var_1_10)

	var_1_0.AdditionalReward2 = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIText.new()

	var_1_12.id = "AdditionalReward3"

	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 305, _1080p * 661, _1080p * 111, _1080p * 131)
	var_1_0:addElement(var_1_12)

	var_1_0.AdditionalReward3 = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("TournamentRewardItem", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "TournamentRewardItem"

	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 256, 0, _1080p * 158)
	var_1_0:addElement(var_1_14)

	var_1_0.TournamentRewardItem = var_1_14

	return var_1_0
end

MenuBuilder.registerType("TournamentReward", TournamentReward)
LockTable(_M)
