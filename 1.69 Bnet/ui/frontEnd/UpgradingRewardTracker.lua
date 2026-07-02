module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.Desc:setText(Engine.CBBHFCGDIC(arg_1_1, arg_1_3))
	arg_1_0.Counter:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_2, arg_1_3))

	if arg_1_2 ~= 0 and arg_1_3 ~= 0 then
		arg_1_0.ProgressBar:SetProgress(arg_1_2 / arg_1_3)
	else
		arg_1_0.ProgressBar:SetProgress(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 then
		local var_2_0 = UPGRADING_REWARD.GetCurrentRewardLevel(arg_2_0.controllerIndex, arg_2_1)

		arg_2_0.Title:setText(Engine.CBBHFCGDIC(UPGRADING_REWARD.GetTitle(arg_2_1)))

		local var_2_1 = var_2_0 > UPGRADING_REWARD.GetMaxRewardLevel(arg_2_1)
		local var_2_2 = UPGRADING_REWARD.GetCurrentIconRef(arg_2_1, var_2_0)
		local var_2_3 = LOOT.GetItemIDFromRef(var_2_2)
		local var_2_4 = LOOT.GetTypeForID(var_2_3)

		if LOOT.IsValidItemType(var_2_4) then
			arg_2_0.IconImage:setImage(RegisterMaterial(LOOT.GetItemImage(var_2_4, var_2_2, var_2_3)), 0)
		else
			assert(false, "Invalid loot type from itemRef, check loot table")
		end

		local var_2_5 = LOOT.GetItemQuality(var_2_4, var_2_2, var_2_3)
		local var_2_6 = LOOT.GetRarityImage(var_2_5)

		if var_2_6 == "" then
			assert(false, "No rarity image found for item ref, check loot table")
		end

		arg_2_0.RarityIcon:setImage(RegisterMaterial(var_2_6), 0)
		LOOT.ApplyRarityIconColoring(arg_2_0.RarityIcon, var_2_5)

		if var_2_1 then
			ACTIONS.AnimateSequence(arg_2_0, "Complete")
			arg_2_0.Desc:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/COMPLETE"))

			return
		end

		ACTIONS.AnimateSequence(arg_2_0, "Normal")

		local var_2_7 = UPGRADING_REWARD.GetDescription(arg_2_1)

		if var_2_0 > 1 then
			local var_2_8 = UPGRADING_REWARD.GetValueForRewardTier(arg_2_0.controllerIndex, arg_2_1, false)
			local var_2_9 = UPGRADING_REWARD.GetValueForRewardTier(arg_2_0.controllerIndex, arg_2_1, true)

			var_0_0(arg_2_0, var_2_7, var_2_8, var_2_9)
		else
			local var_2_10 = UPGRADING_REWARD.GetRewardTiers(arg_2_1)
			local var_2_11 = UPGRADING_REWARD.GetCurrentValue(arg_2_0.controllerIndex, arg_2_1)

			var_0_0(arg_2_0, var_2_7, var_2_11, var_2_10[var_2_0])
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if UPGRADING_REWARD.IsValidID(arg_3_1) ~= "" then
		var_0_1(arg_3_0, arg_3_1)
	else
		assert(false, "Bad ID, check widget declaration and upgrading_rewards.csv")
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.controllerIndex = arg_4_1
	arg_4_0.InitializeRewardWidget = var_0_2
end

function UpgradingRewardTracker(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 140 * _1080p)

	var_5_0.id = "UpgradingRewardTracker"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_4:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Gradient"

	var_5_6:SetRGBFromInt(0, 0)
	var_5_6:SetAlpha(0.8, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 44, _1080p * 140)
	var_5_0:addElement(var_5_6)

	var_5_0.Gradient = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "TipDescription"

	var_5_8:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_5_8:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/UPGRADING_REWARD_TIP_DESC"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_8:SetStartupDelay(2000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(150)
	var_5_8:SetAnimMoveSpeed(50)
	var_5_8:SetEndDelay(1000)
	var_5_8:SetCrossfadeTime(400)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(2)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 94, _1080p * -11, _1080p * -43, _1080p * -23)
	var_5_0:addElement(var_5_8)

	var_5_0.TipDescription = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "TipTitle"

	var_5_10:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_5_10:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/UPGRADING_REWARD_TIP_TITLE"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_10:SetWordWrap(false)
	var_5_10:SetAlignment(LUI.Alignment.Right)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 83, _1080p * 97, _1080p * 117)
	var_5_0:addElement(var_5_10)

	var_5_0.TipTitle = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "ProgressBar"

	var_5_12.Overlay:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_5_12.Fill:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 94, _1080p * -11, _1080p * 69, _1080p * 81)
	var_5_0:addElement(var_5_12)

	var_5_0.ProgressBar = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "IconImage"

	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 83, _1080p * 9, _1080p * 81)
	var_5_0:addElement(var_5_14)

	var_5_0.IconImage = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "Desc"

	var_5_16:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 375, _1080p * 39, _1080p * 63)
	var_5_0:addElement(var_5_16)

	var_5_0.Desc = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "Title"

	var_5_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_18:setText("", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 375, _1080p * 9, _1080p * 39)
	var_5_0:addElement(var_5_18)

	var_5_0.Title = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "RarityBacker"

	var_5_20:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_20:SetAlpha(0.7, 0)
	var_5_20:SetZRotation(45, 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 29, _1080p * 61, _1080p * 84)
	var_5_0:addElement(var_5_20)

	var_5_0.RarityBacker = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "RarityIcon"

	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 30, _1080p * 60, _1080p * 85)
	var_5_0:addElement(var_5_22)

	var_5_0.RarityIcon = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIText.new()

	var_5_24.id = "Counter"

	var_5_24:SetRGBFromInt(14936290, 0)
	var_5_24:setText("#/#", 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetWordWrap(false)
	var_5_24:SetAlignment(LUI.Alignment.Right)
	var_5_24:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -48, _1080p * -11, _1080p * 44, _1080p * 68)
	var_5_0:addElement(var_5_24)

	var_5_0.Counter = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIImage.new()

	var_5_26.id = "Separator"

	var_5_26:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_5_26:SetAlpha(0.3, 0)
	var_5_26:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 11, _1080p * -11, _1080p * 91, _1080p * 92)
	var_5_0:addElement(var_5_26)

	var_5_0.Separator = var_5_26

	local function var_5_27()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_12:RegisterAnimationSequence("Complete", var_5_29)

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventAltColor
		}
	}

	var_5_16:RegisterAnimationSequence("Complete", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Complete", var_5_31)

	local function var_5_32()
		var_5_12:AnimateSequence("Complete")
		var_5_16:AnimateSequence("Complete")
		var_5_24:AnimateSequence("Complete")
	end

	var_5_0._sequences.Complete = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_5_0.ProgressBar.Fill
		}
	}

	var_5_12:RegisterAnimationSequence("Normal", var_5_34)

	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_16:RegisterAnimationSequence("Normal", var_5_35)

	local var_5_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("Normal", var_5_36)

	local function var_5_37()
		var_5_12:AnimateSequence("Normal")
		var_5_16:AnimateSequence("Normal")
		var_5_24:AnimateSequence("Normal")
	end

	var_5_0._sequences.Normal = var_5_37

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("UpgradingRewardTracker", UpgradingRewardTracker)
LockTable(_M)
