module(..., package.seeall)

function TrialSkinnyRewardTier(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 181 * _1080p, 0, 110 * _1080p)

	var_1_0.id = "TrialSkinnyRewardTier"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "Score"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.accent, 0)
	var_1_4:setText("00:00", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_4:SetAlignment(LUI.Alignment.Center)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 170, _1080p * 50, _1080p * 100)
	var_1_0:addElement(var_1_4)

	var_1_0.Score = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("TrialRewardStarsSmall", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "Stars"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 180, _1080p * 5, _1080p * 55)
	var_1_0:addElement(var_1_6)

	var_1_0.Stars = var_1_6

	return var_1_0
end

MenuBuilder.registerType("TrialSkinnyRewardTier", TrialSkinnyRewardTier)
LockTable(_M)
