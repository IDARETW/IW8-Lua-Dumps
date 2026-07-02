module(..., package.seeall)

function AARLootItemCard(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 450 * _1080p)

	var_1_0.id = "AARLootItemCard"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LootItemCardWrapper", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "LootItemCardWrapper"

	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -105, _1080p * 105, _1080p * -310, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LootItemCardWrapper = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "DailyChallengeGoalLabel"

	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_1_6:SetStartupDelay(1000)
	var_1_6:SetLineHoldTime(400)
	var_1_6:SetAnimMoveTime(1500)
	var_1_6:SetAnimMoveSpeed(30)
	var_1_6:SetEndDelay(1000)
	var_1_6:SetCrossfadeTime(400)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -220, _1080p * -196)
	var_1_0:addElement(var_1_6)

	var_1_0.DailyChallengeGoalLabel = var_1_6

	return var_1_0
end

MenuBuilder.registerType("AARLootItemCard", AARLootItemCard)
LockTable(_M)
