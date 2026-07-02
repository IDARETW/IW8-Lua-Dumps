module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.scoreType == "time" then
		return Engine.JCBDICCAH(TIME.FormatMilliseconds(arg_1_1["tier" .. arg_1_0], TIME.Format.STOPWATCH))
	end

	return arg_1_1["tier" .. arg_1_0]
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = var_0_0(arg_2_1, arg_2_2)

	arg_2_0.Objective:setText(var_2_0)

	local var_2_1 = LOOT.GetLootCardData(arg_2_0._controllerIndex, arg_2_2.lootIds[arg_2_1])

	arg_2_0.LootItemCardMini:UpdateCardConfig(var_2_1)

	if arg_2_1 <= arg_2_2.bestRewardedLoot then
		ACTIONS.AnimateSequence(arg_2_0, "Unlocked")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupData = var_0_1
end

function TrialEventStartPopupMedalContainer(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 214 * _1080p, 0, 500 * _1080p)

	var_4_0.id = "TrialEventStartPopupMedalContainer"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LootItemCardMini"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 321)
	var_4_0:addElement(var_4_4)

	var_4_0.LootItemCardMini = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "DoneBG"

	var_4_6:SetRGBFromTable(SWATCHES.CAC.greenDark, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 68)
	var_4_0:addElement(var_4_6)

	var_4_0.DoneBG = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "DoneLabel"

	var_4_8:SetAlpha(0, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("TRIALEVENT/MEDAL_ALREADY_EARNED"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 42, _1080p * 60)
	var_4_0:addElement(var_4_8)

	var_4_0.DoneLabel = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Medal"

	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -36.5, _1080p * 37.5, _1080p * 358, _1080p * 432)
	var_4_0:addElement(var_4_10)

	var_4_0.Medal = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "Name"

	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 443, _1080p * 473)
	var_4_0:addElement(var_4_12)

	var_4_0.Name = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "Objective"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 470, _1080p * 500)
	var_4_0:addElement(var_4_14)

	var_4_0.Objective = var_4_14

	local var_4_15
	local var_4_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_4_17 = LUI.UIBorder.new(var_4_16)

	var_4_17.id = "CheckboxFrame"

	var_4_17:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_17:SetAlpha(0, 0)
	var_4_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -24, 0, _1080p * 36, _1080p * 60)
	var_4_0:addElement(var_4_17)

	var_4_0.CheckboxFrame = var_4_17

	local var_4_18
	local var_4_19 = LUI.UIImage.new()

	var_4_19.id = "Checkbox"

	var_4_19:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_4_19:SetAlpha(0, 0)
	var_4_19:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_4_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -24, 0, _1080p * 36, _1080p * 60)
	var_4_0:addElement(var_4_19)

	var_4_0.Checkbox = var_4_19

	local var_4_20
	local var_4_21 = LUI.UIImage.new()

	var_4_21.id = "Frame"

	var_4_21:SetAlpha(0, 0)
	var_4_21:setImage(RegisterMaterial("battlepass_lootcard_trim_gold_9slice"), 0)
	var_4_21:Setup9SliceImage(_1080p * 70, _1080p * 70, 0.5, 0.5)
	var_4_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 36, _1080p * 321)
	var_4_0:addElement(var_4_21)

	var_4_0.Frame = var_4_21

	local function var_4_22()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_22

	local var_4_23
	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_17:RegisterAnimationSequence("Unlocked", var_4_24)

	local var_4_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_19:RegisterAnimationSequence("Unlocked", var_4_25)

	local var_4_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_21:RegisterAnimationSequence("Unlocked", var_4_26)

	local function var_4_27()
		var_4_17:AnimateSequence("Unlocked")
		var_4_19:AnimateSequence("Unlocked")
		var_4_21:AnimateSequence("Unlocked")
	end

	var_4_0._sequences.Unlocked = var_4_27

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TrialEventStartPopupMedalContainer", TrialEventStartPopupMedalContainer)
LockTable(_M)
