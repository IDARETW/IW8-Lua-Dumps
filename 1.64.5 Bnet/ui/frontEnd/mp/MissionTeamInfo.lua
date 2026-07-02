module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Loot.DEBEIFJEEG(arg_1_1, LOOT.DoubleXPTokenID)

	if var_1_0 > 0 then
		arg_1_0.DoubleXPTokenValue:setText(var_1_0)

		if not arg_1_0.doubleXPTokenShown then
			arg_1_0.DoubleXPTokenValue:SetShadowVOffset(-0.001)
			ACTIONS.AnimateSequence(arg_1_0, "DoubleXPTokenAvailable")

			arg_1_0.doubleXPTokenShown = true
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	return
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateDoubleXPTokens = var_0_0

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		arg_3_0.TeamName:SetShadowVOffset(-0.001)
		arg_3_0.TeamRank:SetShadowVOffset(-0.001)

		if IsLanguageOversizedFont() or IsLanguageItalian() then
			arg_3_0.TeamName:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -360, _1080p * 8, _1080p * 35)
		end

		var_0_0(arg_3_0, arg_3_1)
	end

	arg_3_0.KeysValue:SetShadowVOffset(-0.001)
	arg_3_0.PartsValue:SetShadowVOffset(-0.001)

	if arg_3_0.CODPointsValue then
		arg_3_0.CODPointsValue:SetShadowVOffset(-0.001)
	end

	arg_3_0.SetupMissionTeam = var_0_1

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_0_1(arg_3_0, arg_3_1)
	end
end

function MissionTeamInfo(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIHorizontalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 88 * _1080p)

	var_4_0.id = "MissionTeamInfo"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIBlur.new()

	var_4_4.id = "CurrencyBacker"

	var_4_4:SetRGBFromInt(11776947, 0)
	var_4_4:SetAlpha(0, 0)
	var_4_4:SetBlurStrength(1.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -40, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.CurrencyBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "CurrencyBackerDark"

	var_4_6:SetRGBFromInt(0, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -350, 0, _1080p * -40, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.CurrencyBackerDark = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "CurrencyBackerGradient"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -30, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.CurrencyBackerGradient = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIBlur.new()

	var_4_10.id = "MissionTeamBacker"

	var_4_10:SetAlpha(0, 0)
	var_4_10:SetBlurStrength(1.5, 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, 0, _1080p * 40)
	var_4_0:addElement(var_4_10)

	var_4_0.MissionTeamBacker = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "MissionTeamBackerDark"

	var_4_12:SetRGBFromInt(0, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -350, 0, 0, _1080p * 40)
	var_4_0:addElement(var_4_12)

	var_4_0.MissionTeamBackerDark = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "MissionTeamBackerGradient"

	var_4_14:SetRGBFromInt(0, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, 0, _1080p * 30)
	var_4_0:addElement(var_4_14)

	var_4_0.MissionTeamBackerGradient = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Divider"

	var_4_16:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_4_16:SetAlpha(0.8, 0)
	var_4_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -1, 0)
	var_4_0:addElement(var_4_16)

	var_4_0.Divider = var_4_16

	local var_4_17

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_4_18 = LUI.UIImage.new()

		var_4_18.id = "Icon"

		var_4_18:SetAlpha(0, 0)
		var_4_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -264, _1080p * -39, _1080p * -44.5, _1080p * 180.5)
		var_4_0:addElement(var_4_18)

		var_4_0.Icon = var_4_18
	end

	local var_4_19

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_4_20 = LUI.UIStyledText.new()

		var_4_20.id = "TeamRank"

		var_4_20:SetAlpha(0, 0)
		var_4_20:setText("99", 0)
		var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_20:SetAlignment(LUI.Alignment.Center)
		var_4_20:SetShadowMinDistance(-0.2, 0)
		var_4_20:SetShadowMaxDistance(0.2, 0)
		var_4_20:SetShadowRGBFromInt(0, 0)
		var_4_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -329, _1080p * -265, _1080p * 3, _1080p * 39)
		var_4_0:addElement(var_4_20)

		var_4_0.TeamRank = var_4_20
	end

	local var_4_21

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_4_22 = LUI.UIStyledText.new()

		var_4_22.id = "TeamName"

		var_4_22:SetAlpha(0, 0)
		var_4_22:setText("", 0)
		var_4_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_22:SetAlignment(LUI.Alignment.Right)
		var_4_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_22:SetStartupDelay(1000)
		var_4_22:SetLineHoldTime(400)
		var_4_22:SetAnimMoveTime(150)
		var_4_22:SetAnimMoveSpeed(50)
		var_4_22:SetEndDelay(1000)
		var_4_22:SetCrossfadeTime(400)
		var_4_22:SetFadeInTime(300)
		var_4_22:SetFadeOutTime(300)
		var_4_22:SetMaxVisibleLines(1)
		var_4_22:SetShadowMinDistance(-0.2, 0)
		var_4_22:SetShadowMaxDistance(0.2, 0)
		var_4_22:SetShadowRGBFromInt(0, 0)
		var_4_22:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -374, _1080p * 4, _1080p * 36)
		var_4_0:addElement(var_4_22)

		var_4_0.TeamName = var_4_22
	end

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "PartsIcon"

	var_4_24:setImage(RegisterMaterial("currency_parts_icon"), 0)
	var_4_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 119, _1080p * 155, _1080p * -39.5, _1080p * -3.5)
	var_4_0:addElement(var_4_24)

	var_4_0.PartsIcon = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIImage.new()

	var_4_26.id = "KeysIcon"

	var_4_26:setImage(RegisterMaterial("currency_keys_icon"), 0)
	var_4_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 234, _1080p * 270, _1080p * -39.5, _1080p * -3.5)
	var_4_0:addElement(var_4_26)

	var_4_0.KeysIcon = var_4_26

	local var_4_27

	if CONDITIONS.AreCODPointsEnabled(var_4_0) then
		local var_4_28 = LUI.UIImage.new()

		var_4_28.id = "CODPointsIcon"

		var_4_28:setImage(RegisterMaterial("currency_cod_points_icon"), 0)
		var_4_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 40, _1080p * -39.5, _1080p * -3.5)
		var_4_0:addElement(var_4_28)

		var_4_0.CODPointsIcon = var_4_28
	end

	local var_4_29
	local var_4_30 = LUI.UIStyledText.new()

	var_4_30.id = "PartsValue"

	var_4_30:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_4_30:SetAlpha(0.8, 0)
	var_4_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_30:SetAlignment(LUI.Alignment.Left)
	var_4_30:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_30:SetStartupDelay(1250)
	var_4_30:SetLineHoldTime(400)
	var_4_30:SetAnimMoveTime(300)
	var_4_30:SetAnimMoveSpeed(50)
	var_4_30:SetEndDelay(1000)
	var_4_30:SetCrossfadeTime(500)
	var_4_30:SetFadeInTime(300)
	var_4_30:SetFadeOutTime(300)
	var_4_30:SetMaxVisibleLines(1)
	var_4_30:SetShadowMinDistance(-0.2, 0)
	var_4_30:SetShadowMaxDistance(0.2, 0)
	var_4_30:SetShadowRGBFromInt(0, 0)
	var_4_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 153, _1080p * 225, _1080p * -33, _1080p * -9)

	local function var_4_31()
		local var_5_0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue(var_4_1)

		if var_5_0 ~= nil then
			var_4_30:setText(var_5_0, 0)
		end
	end

	local var_4_32 = DataSources.frontEnd.MP.commerce.craftingCurrency

	var_4_30:SubscribeToModel(var_4_32:GetModel(var_4_1), var_4_31)
	var_4_0:addElement(var_4_30)

	var_4_0.PartsValue = var_4_30

	local var_4_33
	local var_4_34 = LUI.UIStyledText.new()

	var_4_34.id = "KeysValue"

	var_4_34:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_4_34:SetAlpha(0.8, 0)
	var_4_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_34:SetAlignment(LUI.Alignment.Left)
	var_4_34:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_34:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_34:SetStartupDelay(1250)
	var_4_34:SetLineHoldTime(400)
	var_4_34:SetAnimMoveTime(300)
	var_4_34:SetAnimMoveSpeed(50)
	var_4_34:SetEndDelay(1000)
	var_4_34:SetCrossfadeTime(500)
	var_4_34:SetFadeInTime(300)
	var_4_34:SetFadeOutTime(300)
	var_4_34:SetMaxVisibleLines(1)
	var_4_34:SetShadowMinDistance(-0.2, 0)
	var_4_34:SetShadowMaxDistance(0.2, 0)
	var_4_34:SetShadowRGBFromInt(0, 0)
	var_4_34:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 274, _1080p * 346, _1080p * -33.5, _1080p * -9.5)

	local function var_4_35()
		local var_6_0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue(var_4_1)

		if var_6_0 ~= nil then
			var_4_34:setText(var_6_0, 0)
		end
	end

	local var_4_36 = DataSources.frontEnd.MP.commerce.inGameCurrency

	var_4_34:SubscribeToModel(var_4_36:GetModel(var_4_1), var_4_35)
	var_4_0:addElement(var_4_34)

	var_4_0.KeysValue = var_4_34

	local var_4_37

	if CONDITIONS.AreCODPointsEnabled(var_4_0) then
		var_4_37 = LUI.UIStyledText.new()
		var_4_37.id = "CODPointsValue"

		var_4_37:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
		var_4_37:SetAlpha(0.8, 0)
		var_4_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_37:SetAlignment(LUI.Alignment.Left)
		var_4_37:SetOptOutRightToLeftAlignmentFlip(true)
		var_4_37:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_37:SetStartupDelay(1250)
		var_4_37:SetLineHoldTime(400)
		var_4_37:SetAnimMoveTime(300)
		var_4_37:SetAnimMoveSpeed(50)
		var_4_37:SetEndDelay(1000)
		var_4_37:SetCrossfadeTime(500)
		var_4_37:SetFadeInTime(300)
		var_4_37:SetFadeOutTime(300)
		var_4_37:SetMaxVisibleLines(1)
		var_4_37:SetShadowMinDistance(-0.2, 0)
		var_4_37:SetShadowMaxDistance(0.2, 0)
		var_4_37:SetShadowRGBFromInt(0, 0)
		var_4_37:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 41, _1080p * 113, _1080p * -33.5, _1080p * -9.5)

		local function var_4_38()
			local var_7_0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue(var_4_1)

			if var_7_0 ~= nil then
				var_4_37:setText(var_7_0, 0)
			end
		end

		local var_4_39 = DataSources.frontEnd.MP.commerce.premiumCurrency

		var_4_37:SubscribeToModel(var_4_39:GetModel(var_4_1), var_4_38)
		var_4_0:addElement(var_4_37)

		var_4_0.CODPointsValue = var_4_37
	end

	local var_4_40
	local var_4_41 = LUI.UIImage.new()

	var_4_41.id = "DoubleXPTokenIcon"

	var_4_41:SetAlpha(0, 0)
	var_4_41:setImage(RegisterMaterial("icon_iw7_xp_token"), 0)
	var_4_41:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -95, _1080p * -59, _1080p * -39, _1080p * -3)
	var_4_0:addElement(var_4_41)

	var_4_0.DoubleXPTokenIcon = var_4_41

	local var_4_42

	if CONDITIONS.AreCODPointsEnabled(var_4_0) then
		var_4_42 = LUI.UIStyledText.new()
		var_4_42.id = "DoubleXPTokenValue"

		var_4_42:SetAlpha(0, 0)
		var_4_42:setText("00", 0)
		var_4_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_42:SetAlignment(LUI.Alignment.Left)
		var_4_42:SetOptOutRightToLeftAlignmentFlip(true)
		var_4_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_4_42:SetStartupDelay(1250)
		var_4_42:SetLineHoldTime(400)
		var_4_42:SetAnimMoveTime(300)
		var_4_42:SetAnimMoveSpeed(50)
		var_4_42:SetEndDelay(1000)
		var_4_42:SetCrossfadeTime(500)
		var_4_42:SetFadeInTime(300)
		var_4_42:SetFadeOutTime(300)
		var_4_42:SetMaxVisibleLines(1)
		var_4_42:SetShadowMinDistance(-0.2, 0)
		var_4_42:SetShadowMaxDistance(0.2, 0)
		var_4_42:SetShadowRGBFromInt(0, 0)
		var_4_42:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -58, _1080p * -3, _1080p * -33.5, _1080p * -9.5)
		var_4_0:addElement(var_4_42)

		var_4_0.DoubleXPTokenValue = var_4_42
	end

	local function var_4_43()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_43

	local var_4_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("CPInit", var_4_44)

	local var_4_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -700
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_6:RegisterAnimationSequence("CPInit", var_4_45)

	local var_4_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -43
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("CPInit", var_4_46)

	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("CPInit", var_4_47)

	local var_4_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("CPInit", var_4_48)

	local var_4_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("CPInit", var_4_49)

	local function var_4_50()
		var_4_4:AnimateSequence("CPInit")
		var_4_6:AnimateSequence("CPInit")
		var_4_8:AnimateSequence("CPInit")
		var_4_10:AnimateSequence("CPInit")
		var_4_12:AnimateSequence("CPInit")
		var_4_14:AnimateSequence("CPInit")
	end

	var_4_0._sequences.CPInit = var_4_50

	local var_4_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_24:RegisterAnimationSequence("CoDPointsDisabled", var_4_51)

	local var_4_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_26:RegisterAnimationSequence("CoDPointsDisabled", var_4_52)

	local var_4_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 180
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_30:RegisterAnimationSequence("CoDPointsDisabled", var_4_53)

	local var_4_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 301
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -33.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -9.5
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_34:RegisterAnimationSequence("CoDPointsDisabled", var_4_54)

	local function var_4_55()
		var_4_24:AnimateSequence("CoDPointsDisabled")
		var_4_26:AnimateSequence("CoDPointsDisabled")
		var_4_30:AnimateSequence("CoDPointsDisabled")
		var_4_34:AnimateSequence("CoDPointsDisabled")
	end

	var_4_0._sequences.CoDPointsDisabled = var_4_55

	local var_4_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -40
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_4:RegisterAnimationSequence("DoubleXPTokenAvailable", var_4_56)

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_8:RegisterAnimationSequence("DoubleXPTokenAvailable", var_4_57)

	local var_4_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -100
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_4_16:RegisterAnimationSequence("DoubleXPTokenAvailable", var_4_58)

	local var_4_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_41:RegisterAnimationSequence("DoubleXPTokenAvailable", var_4_59)

	if CONDITIONS.AreCODPointsEnabled(var_4_0) then
		local var_4_60 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_42:RegisterAnimationSequence("DoubleXPTokenAvailable", var_4_60)
	end

	local function var_4_61()
		var_4_4:AnimateSequence("DoubleXPTokenAvailable")
		var_4_8:AnimateSequence("DoubleXPTokenAvailable")
		var_4_16:AnimateSequence("DoubleXPTokenAvailable")
		var_4_41:AnimateSequence("DoubleXPTokenAvailable")

		if CONDITIONS.AreCODPointsEnabled(var_4_0) then
			var_4_42:AnimateSequence("DoubleXPTokenAvailable")
		end
	end

	var_4_0._sequences.DoubleXPTokenAvailable = var_4_61

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "CPInit")
	end

	if not CONDITIONS.AreCODPointsEnabled(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "CoDPointsDisabled")
	end

	return var_4_0
end

MenuBuilder.registerType("MissionTeamInfo", MissionTeamInfo)
LockTable(_M)
