module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.TierText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION", BATTLEPASS.GetTier(arg_1_0._controllerIndex))))

	local var_1_0 = BATTLEPASS.GetBaseEmblem()

	if var_1_0 and var_1_0 ~= "" then
		arg_1_0.Emblem:setImage(RegisterMaterial(var_1_0))
	end

	if arg_1_0._currentSeason and arg_1_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_1_0, "PulseS5")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Spinning")
	end
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0, "DoubleXP")
	arg_2_0.TierText:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION", BATTLEPASS.GetTier(arg_2_0._controllerIndex))))

	if arg_2_0._currentSeason and arg_2_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_2_0, "PulseS5")
	else
		ACTIONS.AnimateSequence(arg_2_0, "Spinning")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.StartAnimation = var_0_0
	arg_3_0.ShowDoubleXPIcon = var_0_1
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0._currentSeason = SEASON.GetCurrentSeason()

	if arg_3_0._currentSeason and arg_3_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_3_0, "S5")
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.Darkener)

	local function var_3_0()
		local var_4_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_3_0.TierPurchaseBG:SetScale(var_4_0)
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_0)
end

function BattlePassPurchaseBackground(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "BattlePassPurchaseBackground"
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

	var_5_4.id = "TierPurchaseBG"

	var_5_4:setImage(RegisterMaterial("battlepass_background_tierpurchase"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.TierPurchaseBG = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Darkener"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 423, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.Darkener = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Emblem"

	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -133, _1080p * 133, _1080p * -208, _1080p * 58)
	var_5_0:addElement(var_5_8)

	var_5_0.Emblem = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Circle"

	var_5_10:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_10:setImage(RegisterMaterial("battlepass_celebration_tier_circle"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -310, _1080p * 202)
	var_5_0:addElement(var_5_10)

	var_5_0.Circle = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "TierText"

	var_5_12:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_CELEBRATION"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -142, _1080p * 142, _1080p * -268, _1080p * -232)
	var_5_0:addElement(var_5_12)

	var_5_0.TierText = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "BattlePassTokenText"

	var_5_14:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOKEN_BONUS"), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -232, _1080p * -210)
	var_5_0:addElement(var_5_14)

	var_5_0.BattlePassTokenText = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 60000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_5_10:RegisterAnimationSequence("Spinning", var_5_17)

	local function var_5_18()
		var_5_10:AnimateLoop("Spinning")
	end

	var_5_0._sequences.Spinning = var_5_18

	local var_5_19
	local var_5_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("HideBattlePassInfo", var_5_20)

	local var_5_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("HideBattlePassInfo", var_5_21)

	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("HideBattlePassInfo", var_5_22)

	local function var_5_23()
		var_5_8:AnimateSequence("HideBattlePassInfo")
		var_5_10:AnimateSequence("HideBattlePassInfo")
		var_5_12:AnimateSequence("HideBattlePassInfo")
	end

	var_5_0._sequences.HideBattlePassInfo = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_double_battle_xp")
		}
	}

	var_5_8:RegisterAnimationSequence("DoubleXP", var_5_25)

	local var_5_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("DoubleXP", var_5_26)

	local function var_5_27()
		var_5_8:AnimateSequence("DoubleXP")
		var_5_14:AnimateSequence("DoubleXP")
	end

	var_5_0._sequences.DoubleXP = var_5_27

	local var_5_28
	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_5_14:RegisterAnimationSequence("AR", var_5_29)

	local function var_5_30()
		var_5_14:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.35,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_5_10:RegisterAnimationSequence("PulseS5", var_5_32)

	local function var_5_33()
		var_5_10:AnimateLoop("PulseS5")
	end

	var_5_0._sequences.PulseS5 = var_5_33

	local var_5_34
	local var_5_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_5_10:RegisterAnimationSequence("S5", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.ShadowLight
		}
	}

	var_5_12:RegisterAnimationSequence("S5", var_5_36)

	local function var_5_37()
		var_5_10:AnimateSequence("S5")
		var_5_12:AnimateSequence("S5")
	end

	var_5_0._sequences.S5 = var_5_37

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BattlePassPurchaseBackground", BattlePassPurchaseBackground)
LockTable(_M)
