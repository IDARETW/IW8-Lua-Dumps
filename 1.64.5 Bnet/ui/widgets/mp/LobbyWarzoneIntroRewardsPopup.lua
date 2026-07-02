module(..., package.seeall)

local function var_0_0(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "PlunderReward")

	local var_1_0 = Dvar.CFHDGABACF("LNKPLSSRQ") or 170696
	local var_1_1 = LOOT.GetLootCardData(controllerIndex, var_1_0)

	arg_1_0.LootItemBack:UpdateCardConfig(var_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.PlunderRewards = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "TrainingReward")

	local var_2_0 = Dvar.CFHDGABACF("NOMPNRSPRL") or 128
	local var_2_1 = LOOT.GetLootCardData(arg_2_1, var_2_0)

	arg_2_0.LootItemFront:UpdateCardConfig(var_2_1)

	local var_2_2 = Dvar.CFHDGABACF("LPKRQLLLNQ") or 30080
	local var_2_3 = LOOT.GetLootCardData(arg_2_1, var_2_2)

	arg_2_0.LootItemBack:UpdateCardConfig(var_2_3)
end

function LobbyWarzoneIntroRewardsPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 305 * _1080p)

	var_3_0.id = "LobbyWarzoneIntroRewardsPopup"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "GradientTutorial"

	var_3_4:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 176, _1080p * 9, _1080p * 38)
	var_3_0:addElement(var_3_4)

	var_3_0.GradientTutorial = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "GradientPratice"

	var_3_6:SetRGBFromTable(SWATCHES.CH2.Ch2Brown, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 203, _1080p * 375, _1080p * 9, _1080p * 38)
	var_3_0:addElement(var_3_6)

	var_3_0.GradientPratice = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "TutorialTitle"

	var_3_8:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/TUT_REWARDS"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(2000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(2000)
	var_3_8:SetAnimMoveSpeed(150)
	var_3_8:SetEndDelay(2000)
	var_3_8:SetCrossfadeTime(250)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 176, _1080p * 14, _1080p * 34)
	var_3_0:addElement(var_3_8)

	var_3_0.TutorialTitle = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "PraticeTitle"

	var_3_10:SetRGBFromTable(SWATCHES.CH2.CH2_Highlight, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/TUT_PRACTICE"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_10:SetStartupDelay(2000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(2000)
	var_3_10:SetAnimMoveSpeed(150)
	var_3_10:SetEndDelay(2000)
	var_3_10:SetCrossfadeTime(250)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 203, _1080p * 375, _1080p * 14, _1080p * 34)
	var_3_0:addElement(var_3_10)

	var_3_0.PraticeTitle = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "LootItemBack"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 176, _1080p * 38, _1080p * 267)
	var_3_0:addElement(var_3_12)

	var_3_0.LootItemBack = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "LootItemFront"

	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 203, _1080p * 375, _1080p * 38, _1080p * 266)
	var_3_0:addElement(var_3_14)

	var_3_0.LootItemFront = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_4:RegisterAnimationSequence("PlunderReward", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("PlunderReward", var_3_18)

	local var_3_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_8:RegisterAnimationSequence("PlunderReward", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("PlunderReward", var_3_20)

	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_12:RegisterAnimationSequence("PlunderReward", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("PlunderReward", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("PlunderReward")
		var_3_6:AnimateSequence("PlunderReward")
		var_3_8:AnimateSequence("PlunderReward")
		var_3_10:AnimateSequence("PlunderReward")
		var_3_12:AnimateSequence("PlunderReward")
		var_3_14:AnimateSequence("PlunderReward")
	end

	var_3_0._sequences.PlunderReward = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_4:RegisterAnimationSequence("TrainingReward", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("TrainingReward", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_8:RegisterAnimationSequence("TrainingReward", var_3_27)

	local var_3_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("TrainingReward", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 276
		}
	}

	var_3_12:RegisterAnimationSequence("TrainingReward", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("TrainingReward", var_3_30)

	local function var_3_31()
		var_3_4:AnimateSequence("TrainingReward")
		var_3_6:AnimateSequence("TrainingReward")
		var_3_8:AnimateSequence("TrainingReward")
		var_3_10:AnimateSequence("TrainingReward")
		var_3_12:AnimateSequence("TrainingReward")
		var_3_14:AnimateSequence("TrainingReward")
	end

	var_3_0._sequences.TrainingReward = var_3_31

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyWarzoneIntroRewardsPopup", LobbyWarzoneIntroRewardsPopup)
LockTable(_M)
