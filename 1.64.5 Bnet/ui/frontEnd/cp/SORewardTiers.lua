module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TotalStars)

	local var_1_0 = {
		arg_1_0.RewardTier1,
		arg_1_0.RewardTier2,
		arg_1_0.RewardTier3
	}
	local var_1_1 = {
		arg_1_0.StarsTier1,
		arg_1_0.StarsTier2,
		arg_1_0.StarsTier3
	}
	local var_1_2 = CP.GetStarUnlocksTable()

	for iter_1_0 = 1, math.min(#var_1_0, #var_1_2) do
		local var_1_3 = var_1_0[iter_1_0]
		local var_1_4 = var_1_1[iter_1_0]
		local var_1_5 = var_1_2[iter_1_0]

		ACTIONS.AnimateSequence(var_1_3, "Mini")
		var_1_3:UpdateCardConfig(var_1_5.lootReward)
		var_1_4:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/N_STARS", var_1_5.stars))
	end

	if not IsSystemLink() then
		local var_1_6, var_1_7 = CP.GetTotalStarsEarned()

		arg_1_0.TotalStars:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_X_OF_Y", var_1_6, var_1_7))
	else
		arg_1_0:SetAlpha(0)
	end
end

function SORewardTiers(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 358 * _1080p, 0, 590 * _1080p)

	var_2_0.id = "SORewardTiers"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "RewardTier3"

	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 53, _1080p * 135, _1080p * 432, _1080p * 542)
	var_2_0:addElement(var_2_6)

	var_2_0.RewardTier3 = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "RewardTier2"

	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 53, _1080p * 135, _1080p * 280, _1080p * 390)
	var_2_0:addElement(var_2_8)

	var_2_0.RewardTier2 = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "RewardTier1"

	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 53, _1080p * 135, _1080p * 128, _1080p * 238)
	var_2_0:addElement(var_2_10)

	var_2_0.RewardTier1 = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "StarsTier3"

	var_2_12:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/N_STARS"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 32, _1080p * 463, _1080p * 511)
	var_2_0:addElement(var_2_12)

	var_2_0.StarsTier3 = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "StarsTier2"

	var_2_14:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_14:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/N_STARS"), 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 32, _1080p * 311, _1080p * 359)
	var_2_0:addElement(var_2_14)

	var_2_0.StarsTier2 = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "StarsTier1"

	var_2_16:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_16:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/N_STARS"), 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Center)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 32, _1080p * 159, _1080p * 207)
	var_2_0:addElement(var_2_16)

	var_2_0.StarsTier1 = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "StarIcon"

	var_2_18:setImage(RegisterMaterial("star_on"), 0)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * -115, _1080p * 63, _1080p * 103)
	var_2_0:addElement(var_2_18)

	var_2_0.StarIcon = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIText.new()

	var_2_20.id = "TotalStars"

	var_2_20:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_20:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_X_OF_Y"), 0)
	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -101, _1080p * 135, _1080p * 65, _1080p * 101)
	var_2_0:addElement(var_2_20)

	var_2_0.TotalStars = var_2_20

	local var_2_21
	local var_2_22 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_2_1
	})

	var_2_22.id = "RewardsTitle"

	var_2_22.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_PLURAL"), 0)
	var_2_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 49)
	var_2_0:addElement(var_2_22)

	var_2_0.RewardsTitle = var_2_22

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SORewardTiers", SORewardTiers)
LockTable(_M)
