module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.XPCard:SetAlpha(0)
	arg_1_0.RewardXP:SetAlpha(0)
	arg_1_0.LootCard:SetAlpha(0)
	arg_1_0.RewardLoot:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2.lootReward.isValid then
		arg_2_0.LootCard:UpdateCardConfig(arg_2_2.lootReward)
		arg_2_0.LootCard:SetAlpha(1)

		if arg_2_2.lootReward.rarityImage and #arg_2_2.lootReward.rarityImage > 0 then
			arg_2_0.RewardLoot:SetAlpha(1)

			return
		end
	end

	arg_2_0.LootCard:SetAlpha(0)
	arg_2_0.RewardLoot:SetAlpha(0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2.xpReward.isValid then
		ACTIONS.AnimateSequence(arg_3_0, "DefaultSequence")
		arg_3_0.XPCard:UpdateCardConfig(arg_3_2.xpReward)
		arg_3_0.XPCard:SetAlpha(1)
		arg_3_0.RewardXP:SetAlpha(1)
	else
		ACTIONS.AnimateSequence(arg_3_0, "LootOnly")
		arg_3_0.XPCard:SetAlpha(0)
		arg_3_0.RewardXP:SetAlpha(0)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = RegisterMaterial(arg_4_2.weaponIcon)

	arg_4_0.WeaponIcon:setImage(var_4_0)
	arg_4_0.WeaponIcon:SetAlpha(1)

	if Engine.DFEIGFBEH(var_4_0) > 1 then
		ACTIONS.AnimateSequence(arg_4_0, "Icon2x1")
	else
		ACTIONS.AnimateSequence(arg_4_0, "Icon1x1")
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = Challenge.GetMissionDataByID(arg_5_1, arg_5_2.id)

	if var_5_0 then
		local var_5_1, var_5_2 = Challenge.GetQuestStageByRef(arg_5_2.ref)
		local var_5_3 = var_5_0.isFinalStage and var_5_0.isFinalStage == "1" or false
		local var_5_4 = tonumber(var_5_0.totalStageValue) or 0

		if not var_5_3 and var_5_4 > 0 and var_5_2 > 0 then
			arg_5_0.Pips:SetAlpha(1)
			arg_5_0.Pips:SetActive(true)
			arg_5_0.Pips:Setup(var_5_4, var_5_2, LUI.Alignment.Center)
		else
			arg_5_0.Pips:SetAlpha(0)
		end

		if var_5_3 then
			arg_5_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/ALL_COMPLETED"))
			arg_5_0.Border:SetAlpha(0)
		else
			arg_5_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", var_5_2, var_5_4))
			arg_5_0.Border:SetAlpha(0.1)
		end

		arg_5_0.ObjectivesTitle:SetAlpha(1)
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	var_0_0(arg_6_0, arg_6_1)

	local var_6_0 = Challenge.GetTypeName(arg_6_2.type)

	arg_6_0.AARContentHeader.Text:setText(var_6_0)
	arg_6_0.Desc:setText(arg_6_2.isCamo and arg_6_2.desc or Engine.CBBHFCGDIC(arg_6_2.desc, arg_6_2.amount))
	var_0_1(arg_6_0, arg_6_1, arg_6_2)
	var_0_2(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.ObjectivesTitle:SetAlpha(0)
	arg_6_0.Pips:SetAlpha(0)
	arg_6_0.Border:SetAlpha(0)

	if arg_6_2.isGoldCamo then
		var_0_3(arg_6_0, arg_6_1, arg_6_2)
	elseif arg_6_2.type == Challenge.Type.MISSION then
		var_0_4(arg_6_0, arg_6_1, arg_6_2)
	end
end

function PostLoadFunc(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.InitChallenge = var_0_5
end

function AARChallengeItemStandard(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 840 * _1080p, 0, 300 * _1080p)

	var_8_0.id = "AARChallengeItemStandard"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Backer"

	var_8_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_8_4:SetAlpha(0.5, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Backer = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "LootCard"

	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 645, _1080p * 795, _1080p * 73, _1080p * 273)
	var_8_0:addElement(var_8_6)

	var_8_0.LootCard = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "RewardLoot"

	var_8_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LOOT_MP/LOOT")), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 645, _1080p * 815, _1080p * 48, _1080p * 72)
	var_8_0:addElement(var_8_8)

	var_8_0.RewardLoot = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "XPCard"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 420, _1080p * 570, _1080p * 73, _1080p * 273)
	var_8_0:addElement(var_8_10)

	var_8_0.XPCard = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "RewardXP"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_12:setText(Engine.CBBHFCGDIC("LOOT_MP/XP"), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 420, _1080p * 590, _1080p * 48, _1080p * 72)
	var_8_0:addElement(var_8_12)

	var_8_0.RewardXP = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "AARContentHeader"

	var_8_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 302, _1080p * 2, _1080p * 47)
	var_8_0:addElement(var_8_14)

	var_8_0.AARContentHeader = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "WeaponIcon"

	var_8_16:SetAlpha(0, 0)
	var_8_16:SetScale(-0.2, 0)
	var_8_16:setImage(RegisterMaterial("icon_challenge_camo"), 0)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 258, _1080p * 43, _1080p * 299)
	var_8_0:addElement(var_8_16)

	var_8_0.WeaponIcon = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIImage.new()

	var_8_18.id = "AdditionImage"

	var_8_18:SetAlpha(0, 0)
	var_8_18:SetScale(-0.2, 0)
	var_8_18:setImage(RegisterMaterial("icon_challenge_camo"), 0)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 292, _1080p * 548, _1080p * 32, _1080p * 288)
	var_8_0:addElement(var_8_18)

	var_8_0.AdditionImage = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "Pips"

	var_8_20:SetAlpha(0, 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 204, _1080p * 218, _1080p * 261, _1080p * 265)
	var_8_0:addElement(var_8_20)

	var_8_0.Pips = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIStyledText.new()

	var_8_22.id = "ObjectivesTitle"

	var_8_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_22:SetAlpha(0, 0)
	var_8_22:setText("", 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_22:SetAlignment(LUI.Alignment.Center)
	var_8_22:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 2, _1080p * 420, _1080p * -81, _1080p * -53)
	var_8_0:addElement(var_8_22)

	var_8_0.ObjectivesTitle = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIText.new()

	var_8_24.id = "Desc"

	var_8_24:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_24:setText("", 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_24:SetAlignment(LUI.Alignment.Left)
	var_8_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 395, _1080p * 47, _1080p * 69)
	var_8_0:addElement(var_8_24)

	var_8_0.Desc = var_8_24

	local var_8_25
	local var_8_26 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_27 = LUI.UIBorder.new(var_8_26)

	var_8_27.id = "Border"

	var_8_27:SetAlpha(0, 0)
	var_8_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 395, _1080p * 209, _1080p * 273)
	var_8_0:addElement(var_8_27)

	var_8_0.Border = var_8_27

	local var_8_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 645
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 795
		}
	}

	var_8_6:RegisterAnimationSequence("DefaultSequence", var_8_28)

	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 675
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 845
		}
	}

	var_8_8:RegisterAnimationSequence("DefaultSequence", var_8_29)

	local function var_8_30()
		var_8_6:AnimateSequence("DefaultSequence")
		var_8_8:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_30

	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 441
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 289
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 57
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		}
	}

	var_8_16:RegisterAnimationSequence("Icon2x1", var_8_31)

	local function var_8_32()
		var_8_16:AnimateSequence("Icon2x1")
	end

	var_8_0._sequences.Icon2x1 = var_8_32

	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 299
		}
	}

	var_8_16:RegisterAnimationSequence("Icon1x1", var_8_33)

	local function var_8_34()
		var_8_16:AnimateSequence("Icon1x1")
	end

	var_8_0._sequences.Icon1x1 = var_8_34

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 570
		}
	}

	var_8_6:RegisterAnimationSequence("LootOnly", var_8_35)

	local var_8_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 420
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 590
		}
	}

	var_8_8:RegisterAnimationSequence("LootOnly", var_8_36)

	local var_8_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("LootOnly", var_8_37)

	local function var_8_38()
		var_8_6:AnimateSequence("LootOnly")
		var_8_8:AnimateSequence("LootOnly")
		var_8_10:AnimateSequence("LootOnly")
	end

	var_8_0._sequences.LootOnly = var_8_38

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("AARChallengeItemStandard", AARChallengeItemStandard)
LockTable(_M)
