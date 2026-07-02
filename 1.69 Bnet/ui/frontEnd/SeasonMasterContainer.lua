module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = CSV.seasonalProgressionChallenges
	local var_1_1 = {
		{
			col = var_1_0.cols.seasonNum,
			key = arg_1_2
		},
		{
			key = 1,
			col = var_1_0.cols.isMastery
		}
	}
	local var_1_2 = StringTable.BABCABFJEJ(var_1_0.file, var_1_1)
	local var_1_3 = CSV.ReadRowWithFileAndColumns(var_1_0.file, var_1_2, var_1_0.cols)

	var_1_3.progress = OnlineProgression.BHFJJDBEHG(arg_1_1, var_1_3.challengeID)

	return var_1_3
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0:GetSeasonMasterDataForSeason(arg_2_1, arg_2_2)

	arg_2_0.WZContainer:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/SEASON_X_MASTER", SEASON.GetLocalizedName({
		seasonDataNumToUse = arg_2_2
	})), {
		useUppercase = true
	})
	arg_2_0.Description:setText(Engine.CBBHFCGDIC(var_2_0.description))

	local var_2_1 = tonumber(var_2_0.progress) or 0
	local var_2_2 = tonumber(var_2_0.tier1Quantity) or 20
	local var_2_3 = var_2_2 ~= 0 and var_2_1 / var_2_2 or 0
	local var_2_4 = LUI.clamp(var_2_3, 0, 1)

	arg_2_0.Progress:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_2_1, var_2_2))
	arg_2_0.ProgressBarMaster:SetProgress(var_2_4, 0)
	arg_2_0.Card:SetDetailsFromChallengeData(var_2_0)
	ACTIONS.AnimateSequence(arg_2_0.Card, "NoTitleAndBacker")
	arg_2_0.Reward.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_XP", var_2_0.tier1XP or 0))
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateContentForSeason = var_0_1
	arg_3_0.GetSeasonMasterDataForSeason = var_0_0

	arg_3_0.Icon:SetMask(arg_3_0.IconMask)
end

function SeasonMasterContainer(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 364 * _1080p, 0, 324 * _1080p)

	var_4_0.id = "SeasonMasterContainer"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "WZContainer"

	var_4_4.TitleBackground:SetLeft(_1080p * 3, 0)
	var_4_4.TitleBackground:SetRight(_1080p * -3, 0)
	var_4_4.TitleBackground:SetTop(_1080p * 3, 0)
	var_4_4.TitleBackground:SetBottom(_1080p * 47, 0)
	var_4_4.TitleBackground:SetAlpha(0.2, 0)
	var_4_4.Title:SetLeft(_1080p * 14, 0)
	var_4_4.Title:SetRight(_1080p * -14, 0)
	var_4_4.Title:SetTop(_1080p * 12, 0)
	var_4_4.Title:SetBottom(_1080p * 36, 0)
	var_4_4.Title:setText("", 0)
	var_4_4.Title:SetAlignment(LUI.Alignment.Center)
	var_4_4.BorderBacker:SetLeft(0, 0)
	var_4_4.BorderBacker:SetRight(0, 0)
	var_4_4.BorderBacker:SetTop(0, 0)
	var_4_4.BorderBacker:SetBottom(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.WZContainer = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "XpContainer"

	var_4_6.Background:SetAlpha(0.8, 0)
	var_4_6.TitleBackground:SetLeft(_1080p * 2, 0)
	var_4_6.TitleBackground:SetRight(_1080p * -2, 0)
	var_4_6.TitleBackground:SetTop(0, 0)
	var_4_6.TitleBackground:SetBottom(_1080p * 44, 0)
	var_4_6.TitleBackground:SetAlpha(0, 0)
	var_4_6.Title:SetLeft(_1080p * 14, 0)
	var_4_6.Title:SetRight(_1080p * -14, 0)
	var_4_6.Title:SetTop(_1080p * -1, 0)
	var_4_6.Title:SetBottom(_1080p * 34, 0)
	var_4_6.Title:SetAlpha(0, 0)
	var_4_6.Title:setText("", 0)
	var_4_6.Title:SetAlignment(LUI.Alignment.Center)
	var_4_6.BorderBacker:SetLeft(0, 0)
	var_4_6.BorderBacker:SetRight(0, 0)
	var_4_6.BorderBacker:SetTop(0, 0)
	var_4_6.BorderBacker:SetBottom(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 247, _1080p * 309)
	var_4_0:addElement(var_4_6)

	var_4_0.XpContainer = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "CardContainer"

	var_4_8.TitleBackground:SetLeft(_1080p * 2, 0)
	var_4_8.TitleBackground:SetRight(_1080p * -2, 0)
	var_4_8.TitleBackground:SetTop(0, 0)
	var_4_8.TitleBackground:SetBottom(_1080p * 44, 0)
	var_4_8.TitleBackground:SetAlpha(0, 0)
	var_4_8.Title:SetLeft(_1080p * 14, 0)
	var_4_8.Title:SetRight(_1080p * -14, 0)
	var_4_8.Title:SetTop(_1080p * 10, 0)
	var_4_8.Title:SetBottom(_1080p * 34, 0)
	var_4_8.Title:SetAlpha(0, 0)
	var_4_8.Title:setText("", 0)
	var_4_8.Title:SetAlignment(LUI.Alignment.Center)
	var_4_8.BorderBacker:SetLeft(0, 0)
	var_4_8.BorderBacker:SetRight(0, 0)
	var_4_8.BorderBacker:SetTop(0, 0)
	var_4_8.BorderBacker:SetBottom(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 141, _1080p * 237)
	var_4_0:addElement(var_4_8)

	var_4_0.CardContainer = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("SeasonMasterReward", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Reward"

	var_4_10.Backer:SetAlpha(0, 0)
	var_4_10.Icon:SetLeft(_1080p * 10, 0)
	var_4_10.Icon:SetRight(_1080p * 54, 0)
	var_4_10.Icon:SetTop(_1080p * 9, 0)
	var_4_10.Icon:SetBottom(_1080p * 53, 0)
	var_4_10.Title:SetLeft(_1080p * 45, 0)
	var_4_10.Title:SetRight(_1080p * 132, 0)
	var_4_10.Title:SetTop(_1080p * 20, 0)
	var_4_10.Title:SetBottom(_1080p * 38, 0)
	var_4_10.Title:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_4_10.Title:SetAlignment(LUI.Alignment.Left)
	var_4_10.DivDottedLine:SetAlpha(0, 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -356, _1080p * -286, _1080p * 247, _1080p * 309)
	var_4_0:addElement(var_4_10)

	var_4_0.Reward = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "ProgressBarMaster"

	var_4_12.Fill:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_4_12.Frame:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_4_12.Frame:SetAlpha(0.5, 0)
	var_4_12.Cap:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 85, _1080p * 95)
	var_4_0:addElement(var_4_12)

	var_4_0.ProgressBarMaster = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "Progress"

	var_4_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_14:SetAlignment(LUI.Alignment.Right)
	var_4_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -125, _1080p * -15, _1080p * 60, _1080p * 76)
	var_4_0:addElement(var_4_14)

	var_4_0.Progress = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "Description"

	var_4_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_4_16:SetScale(-0.2, 0)
	var_4_16:setText("", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -20, _1080p * -27, _1080p * 59, _1080p * 77)
	var_4_0:addElement(var_4_16)

	var_4_0.Description = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("PrestigeChallengeCard", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "Card"

	var_4_18:SetScale(0.21, 0)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -133, _1080p * 133, _1080p * 154, _1080p * 224)
	var_4_0:addElement(var_4_18)

	var_4_0.Card = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIText.new()

	var_4_20.id = "MasteryRewardTitle"

	var_4_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_20:setText(ToUpperCase(Engine.CBBHFCGDIC("PRESTIGE/MASTERY_REWARDS")), 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_20:SetWordWrap(false)
	var_4_20:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 15, _1080p * -15, _1080p * 115, _1080p * 133)
	var_4_0:addElement(var_4_20)

	var_4_0.MasteryRewardTitle = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIImage.new()

	var_4_22.id = "Icon"

	var_4_22:SetAlpha(0.2, 0)
	var_4_22:setImage(RegisterMaterial("icon_xp"), 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 173, _1080p * 353, _1080p * 252, _1080p * 432)
	var_4_0:addElement(var_4_22)

	var_4_0.Icon = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "IconMask"

	var_4_24:setImage(RegisterMaterial("stencil_mask"), 0)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 117, _1080p * 342, _1080p * 249, _1080p * 307)
	var_4_0:addElement(var_4_24)

	var_4_0.IconMask = var_4_24

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonMasterContainer", SeasonMasterContainer)
LockTable(_M)
