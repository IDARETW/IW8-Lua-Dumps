module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Contribution:setText(Engine.CBEAHDFCFC(arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Hint:setText(arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	ACTIONS.AnimateSequence(arg_3_0, arg_3_1 and "ShowHint" or "HideHint")
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetValue = var_0_0
	arg_4_0.SetHint = var_0_1
	arg_4_0.ShowHint = var_0_2

	arg_4_0:SetValue(Engine.JCBDICCAH(0))
	arg_4_0:ShowHint(false)
end

function SeasonalEventContributionIndicator(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 168 * _1080p)

	var_5_0.id = "SeasonalEventContributionIndicator"
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

	var_5_4.id = "DarkBG"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_4:SetAlpha(0.3, 0)
	var_5_4:setImage(RegisterMaterial("hud_bkgd_glow"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 200, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.DarkBG = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "HintBG"

	var_5_6:SetAlpha(0.6, 0)
	var_5_6:setImage(RegisterMaterial("wdg_ellipse_glow"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -140, _1080p * 340, _1080p * 59, _1080p * 219)
	var_5_0:addElement(var_5_6)

	var_5_0.HintBG = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "Hint"

	var_5_8:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PROGRESS_DESC_H"), 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -25, _1080p * 225, _1080p * -54, _1080p * -34)
	var_5_0:addElement(var_5_8)

	var_5_0.Hint = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "ContributionBacker"

	var_5_10:SetRGBFromInt(8686977, 0)
	var_5_10:SetAlpha(0.4, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 200, _1080p * -168, _1080p * -68)
	var_5_0:addElement(var_5_10)

	var_5_0.ContributionBacker = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "Contribution"

	var_5_12:setText("34                           Hero point", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * -84, _1080p * 284, _1080p * -132, _1080p * -108)
	var_5_0:addElement(var_5_12)

	var_5_0.Contribution = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIText.new()

	var_5_14.id = "YouContributed"

	var_5_14:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/YOU_CONTRIBUTED")), 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -30, _1080p * 230, _1080p * 13, _1080p * 31)
	var_5_0:addElement(var_5_14)

	var_5_0.YouContributed = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16
	local var_5_17 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ShowHint", var_5_17)

	local var_5_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ShowHint", var_5_18)

	local var_5_19 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ShowHint", var_5_19)

	local function var_5_20()
		var_5_6:AnimateSequence("ShowHint")
		var_5_8:AnimateSequence("ShowHint")
		var_5_10:AnimateSequence("ShowHint")
	end

	var_5_0._sequences.ShowHint = var_5_20

	local var_5_21
	local var_5_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("HideHint", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("HideHint", var_5_23)

	local function var_5_24()
		var_5_6:AnimateSequence("HideHint")
		var_5_8:AnimateSequence("HideHint")
	end

	var_5_0._sequences.HideHint = var_5_24

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SeasonalEventContributionIndicator", SeasonalEventContributionIndicator)
LockTable(_M)
