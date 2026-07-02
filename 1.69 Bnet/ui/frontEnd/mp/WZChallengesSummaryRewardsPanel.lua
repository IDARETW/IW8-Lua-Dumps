module(..., package.seeall)

local var_0_0 = 3 * _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TierSkipNum, "TierSkipNum is nil")
	assert(arg_1_0.TierSkipDesc, "TierSkipDesc is nil")
	arg_1_0.TierSkipNum:setText(BR.GetNumTierSkips(arg_1_1))

	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.TierSkipNum)
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0.TierSkipNum:getLocalRect()

	arg_1_0.TierSkipDesc:SetLeft(var_1_1 + var_1_0 + var_0_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function WZChallengesSummaryRewardsPanel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 100 * _1080p)

	var_2_0.id = "WZChallengesSummaryRewardsPanel"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "PanelBackground"

	var_2_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_2_4:SetAlpha(0.25, 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 100)
	var_2_0:addElement(var_2_4)

	var_2_0.PanelBackground = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "BackgroundGradiant"

	var_2_6:SetRGBFromTable(SWATCHES.CH2.CH2Backer, 0)
	var_2_6:SetAlpha(0.25, 0)
	var_2_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * -1, _1080p * 100)
	var_2_0:addElement(var_2_6)

	var_2_0.BackgroundGradiant = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "TierSkipIcon"

	var_2_8:setImage(RegisterMaterial("ui_t9_shared_icon_logos_challenges_dailyTierSkips"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 80, _1080p * -41, _1080p * 41)
	var_2_0:addElement(var_2_8)

	var_2_0.TierSkipIcon = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "TierSkipTitle"

	var_2_10:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_2_10:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/TIER_SKIP_REWARDS")), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetLeading(-3 * _1080p, 0)
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_10:SetStartupDelay(1500)
	var_2_10:SetLineHoldTime(400)
	var_2_10:SetAnimMoveTime(300)
	var_2_10:SetAnimMoveSpeed(50)
	var_2_10:SetEndDelay(1000)
	var_2_10:SetCrossfadeTime(500)
	var_2_10:SetFadeInTime(300)
	var_2_10:SetFadeOutTime(300)
	var_2_10:SetMaxVisibleLines(1)
	var_2_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 89, _1080p * 195, _1080p * -41, _1080p * -21)
	var_2_0:addElement(var_2_10)

	var_2_0.TierSkipTitle = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "Divider"

	var_2_12:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_12:SetAlpha(0.5, 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * -7, _1080p * -35, _1080p * 35)
	var_2_0:addElement(var_2_12)

	var_2_0.Divider = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIStyledText.new()

	var_2_14.id = "TierSkipNum"

	var_2_14:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_2_14:setText("9", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_14:SetWordWrap(false)
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 87, _1080p * 127, _1080p * -4, _1080p * 40)
	var_2_0:addElement(var_2_14)

	var_2_0.TierSkipNum = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIStyledText.new()

	var_2_16.id = "TierSkipDesc"

	var_2_16:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_16:setText(Engine.CBBHFCGDIC("LUA_MENU/AVAILABLE"), 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_16:SetWordWrap(false)
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_16:SetStartupDelay(1500)
	var_2_16:SetLineHoldTime(400)
	var_2_16:SetAnimMoveTime(300)
	var_2_16:SetAnimMoveSpeed(50)
	var_2_16:SetEndDelay(1000)
	var_2_16:SetCrossfadeTime(500)
	var_2_16:SetFadeInTime(300)
	var_2_16:SetFadeOutTime(300)
	var_2_16:SetMaxVisibleLines(1)
	var_2_16:SetShadowMinDistance(-0.2, 0)
	var_2_16:SetShadowMaxDistance(0.2, 0)
	var_2_16:SetShadowUOffset(-0.002, 0)
	var_2_16:SetShadowVOffset(-0.002, 0)
	var_2_16:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 127, _1080p * 203, _1080p * 55, _1080p * 73)
	var_2_0:addElement(var_2_16)

	var_2_0.TierSkipDesc = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "DailyIcon"

	var_2_18:SetRGBFromTable(SWATCHES.CH2.SnipeOverlayBOColdWar, 0)
	var_2_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -201, _1080p * -131, _1080p * -35, _1080p * 35)
	var_2_0:addElement(var_2_18)

	var_2_0.DailyIcon = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIStyledText.new()

	var_2_20.id = "DailyTitle"

	var_2_20:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_2_20:setText(ToUpperCase(Engine.CBBHFCGDIC("WZ_TU_TANGO/DAILY_REWARD")), 0)
	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetLeading(-3 * _1080p, 0)
	var_2_20:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_2_20:SetStartupDelay(1500)
	var_2_20:SetLineHoldTime(400)
	var_2_20:SetAnimMoveTime(300)
	var_2_20:SetAnimMoveSpeed(50)
	var_2_20:SetEndDelay(1000)
	var_2_20:SetCrossfadeTime(500)
	var_2_20:SetFadeInTime(300)
	var_2_20:SetFadeOutTime(300)
	var_2_20:SetMaxVisibleLines(1)
	var_2_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 310, _1080p * 423, _1080p * -35, _1080p * -15)
	var_2_0:addElement(var_2_20)

	var_2_0.DailyTitle = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIStyledText.new()

	var_2_22.id = "DailyDesc"

	var_2_22:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_22:setText(Engine.CBBHFCGDIC("WZ_TU_TANGO/LOOT_ITEM_NAME"), 0)
	var_2_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_22:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_22:SetStartupDelay(1500)
	var_2_22:SetLineHoldTime(400)
	var_2_22:SetAnimMoveTime(300)
	var_2_22:SetAnimMoveSpeed(50)
	var_2_22:SetEndDelay(1000)
	var_2_22:SetCrossfadeTime(500)
	var_2_22:SetFadeInTime(300)
	var_2_22:SetFadeOutTime(300)
	var_2_22:SetMaxVisibleLines(1)
	var_2_22:SetShadowMinDistance(-0.2, 0)
	var_2_22:SetShadowMaxDistance(0.2, 0)
	var_2_22:SetShadowUOffset(-0.002, 0)
	var_2_22:SetShadowVOffset(-0.002, 0)
	var_2_22:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_22:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -120, _1080p * -7, _1080p * 5, _1080p * 23)
	var_2_0:addElement(var_2_22)

	var_2_0.DailyDesc = var_2_22

	local var_2_23
	local var_2_24 = LUI.UIImage.new()

	var_2_24.id = "BorderTop"

	var_2_24:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_24:SetAlpha(0.2, 0)
	var_2_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * -1)
	var_2_0:addElement(var_2_24)

	var_2_0.BorderTop = var_2_24

	local function var_2_25()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_25

	local var_2_26
	local var_2_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_27)

	local var_2_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		}
	}

	var_2_14:RegisterAnimationSequence("AR", var_2_28)

	local var_2_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_29)

	local var_2_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		}
	}

	var_2_20:RegisterAnimationSequence("AR", var_2_30)

	local var_2_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_2_22:RegisterAnimationSequence("AR", var_2_31)

	local function var_2_32()
		var_2_10:AnimateSequence("AR")
		var_2_14:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
		var_2_20:AnimateSequence("AR")
		var_2_22:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_32

	var_0_1(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("WZChallengesSummaryRewardsPanel", WZChallengesSummaryRewardsPanel)
LockTable(_M)
