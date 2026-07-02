module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.scoreType == "time" then
		return Engine.JCBDICCAH(TIME.FormatMilliseconds(arg_1_1["tier" .. arg_1_0], TIME.Format.STOPWATCH))
	end

	return arg_1_1["tier" .. arg_1_0]
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.bestScore and arg_2_1.bestScore ~= 0 then
		if arg_2_1.scoreType and arg_2_1.scoreType == "time" then
			arg_2_0.Best.Text:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_TIME", Engine.JCBDICCAH(TIME.FormatMilliseconds(arg_2_1.bestScore, TIME.Format.STOPWATCH))))
		else
			arg_2_0.Best.Text:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_SCORE", arg_2_1.bestScore))
		end
	else
		arg_2_0.Best.Text:setText(Engine.CBBHFCGDIC("TRIALEVENT/INCOMPLETE"))
	end

	arg_2_0.Gold:setText(Engine.CBBHFCGDIC("TRIALEVENT/GOLD"))
	arg_2_0.GoldReq:setText(var_0_0(3, arg_2_1))
	arg_2_0.Silver:setText(Engine.CBBHFCGDIC("TRIALEVENT/SILVER"))
	arg_2_0.SilverReq:setText(var_0_0(2, arg_2_1))
	arg_2_0.Bronze:setText(Engine.CBBHFCGDIC("TRIALEVENT/BRONZE"))
	arg_2_0.BronzeReq:setText(var_0_0(1, arg_2_1))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.RefreshData = var_0_1
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.lootCards = {
		arg_3_0.LootItemCard0,
		arg_3_0.LootItemCard1,
		arg_3_0.LootItemCard2
	}
end

function TrialEventRewardsDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 408 * _1080p, 0, 300 * _1080p)

	var_4_0.id = "TrialEventRewardsDetails"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Gold"

	var_4_6:SetRGBFromTable(SWATCHES.trialEvent.trialGold, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -132, _1080p * -20, _1080p * 174, _1080p * 204)
	var_4_0:addElement(var_4_6)

	var_4_0.Gold = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Silver"

	var_4_8:SetRGBFromTable(SWATCHES.trialEvent.trialSilver, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -56, _1080p * 56, _1080p * 174, _1080p * 204)
	var_4_0:addElement(var_4_8)

	var_4_0.Silver = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Bronze"

	var_4_10:SetRGBFromTable(SWATCHES.trialEvent.trialBronze, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 132, _1080p * 174, _1080p * 204)
	var_4_0:addElement(var_4_10)

	var_4_0.Bronze = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "GoldMedal"

	var_4_12:setImage(RegisterMaterial("trial_medal_gold"), 0)
	var_4_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -114, _1080p * -38, _1080p * 79, _1080p * 155)
	var_4_0:addElement(var_4_12)

	var_4_0.GoldMedal = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "SilverMedal"

	var_4_14:setImage(RegisterMaterial("trial_medal_silver"), 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -38, _1080p * 38, _1080p * 79, _1080p * 155)
	var_4_0:addElement(var_4_14)

	var_4_0.SilverMedal = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "BronzeMedal"

	var_4_16:setImage(RegisterMaterial("trial_medal_bronze"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 114, _1080p * 79, _1080p * 155)
	var_4_0:addElement(var_4_16)

	var_4_0.BronzeMedal = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Best"

	var_4_18.Text:setText("", 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 263, 0, _1080p * 46)
	var_4_0:addElement(var_4_18)

	var_4_0.Best = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIText.new()

	var_4_20.id = "GoldReq"

	var_4_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_20:setText("", 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_20:SetAlignment(LUI.Alignment.Center)
	var_4_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -132, _1080p * -20, _1080p * 204, _1080p * 240)
	var_4_0:addElement(var_4_20)

	var_4_0.GoldReq = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIText.new()

	var_4_22.id = "SilverReq"

	var_4_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_22:setText("", 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_22:SetAlignment(LUI.Alignment.Center)
	var_4_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -59, _1080p * 59, _1080p * 204, _1080p * 240)
	var_4_0:addElement(var_4_22)

	var_4_0.SilverReq = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIText.new()

	var_4_24.id = "BronzeReq"

	var_4_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_4_24:setText("", 0)
	var_4_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_24:SetAlignment(LUI.Alignment.Center)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 132, _1080p * 204, _1080p * 240)
	var_4_0:addElement(var_4_24)

	var_4_0.BronzeReq = var_4_24

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TrialEventRewardsDetails", TrialEventRewardsDetails)
LockTable(_M)
