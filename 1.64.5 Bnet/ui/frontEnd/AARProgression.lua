module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.AARBreakdown:InitProgression(arg_1_1, arg_1_2)

	local var_1_0 = PROGRESSION.GetPlayerProgressionData({
		_controllerIndex = arg_1_1
	})
	local var_1_1 = var_1_0._rankIcon
	local var_1_2 = PROGRESSION.GetPlayerRankMinXP(arg_1_1)
	local var_1_3 = PROGRESSION.GetPlayerRankMaxXP(arg_1_1)

	assert(var_1_3 - var_1_2 > 0)

	local var_1_4 = var_1_0._xpForCurrentRank / (var_1_3 - var_1_2)
	local var_1_5 = LUI.clamp(var_1_4, 0, 1)

	arg_1_0.RankValue:setText(Engine.JCBDICCAH(var_1_0._rankDisplay))

	if var_1_0._prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
		arg_1_0.RankValue:SetRGBFromTable(var_1_0._prestigeMasterColor)
	end

	arg_1_0.RankName:setText(var_1_0._rankName)

	if var_1_1 and #var_1_1 > 0 then
		arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_1))
	end

	if var_1_0._isUsingSeasonalRank then
		arg_1_0.ElderProgressBar:SetProgress(0, 0, nil, true)
		arg_1_0.ElderProgressBar:SetProgress(var_1_0._rankPercentage, 1000, nil, true)
		ACTIONS.AnimateSequence(arg_1_0, "ElderIntro")

		if var_1_0._isXpProgressionComplete then
			ACTIONS.AnimateSequence(arg_1_0, "RankMax")
		end
	else
		local var_1_6 = var_1_0._xpForCurrentRank

		arg_1_0.XPRequiredValue:setText(Engine.CBBHFCGDIC("MPUI/XP_NEXT_LEVEL", var_1_6, var_1_0._xpTillNextRank))
		arg_1_0.BorderlessFillBar:SetPercent(var_1_0._rankPercentage)
		ACTIONS.AnimateSequence(arg_1_0, "RegularIntro")
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitProgression = var_0_0

	arg_2_0.Mask1:SetAlpha(1)
	arg_2_0.ElderProgressBar:SetMask(arg_2_0.Mask1)
end

function AARProgression(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "AARProgression"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "XPRequiredValue"

	var_3_6:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 558, _1080p * 210, _1080p * 228)
	var_3_0:addElement(var_3_6)

	var_3_0.XPRequiredValue = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "RankName"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setText(ToUpperCase(""), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 558, _1080p * 150, _1080p * 180)
	var_3_0:addElement(var_3_8)

	var_3_0.RankName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "RankValue"

	var_3_10:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:setText("99", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 222, _1080p * 350, _1080p * 275, _1080p * 345)
	var_3_0:addElement(var_3_10)

	var_3_0.RankValue = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "RankIcon"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 157, _1080p * 116, _1080p * 244)
	var_3_0:addElement(var_3_12)

	var_3_0.RankIcon = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("BorderlessFillBar", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "BorderlessFillBar"

	var_3_14:SetAlpha(0, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 568, _1080p * 190, _1080p * 198)
	var_3_0:addElement(var_3_14)

	var_3_0.BorderlessFillBar = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("AARBreakdown", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "AARBreakdown"

	var_3_16.Text:setText(Engine.CBBHFCGDIC("AAR/XP_BREAKDOWN"), 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -560, _1080p * -10, _1080p * 51, _1080p * 341)
	var_3_0:addElement(var_3_16)

	var_3_0.AARBreakdown = var_3_16

	local var_3_17
	local var_3_18 = {
		Progress_segmentMaterial = "progress_circle_segment_big",
		controllerIndex = var_3_1
	}
	local var_3_19 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", var_3_18)

	var_3_19.id = "ElderProgressBar"

	var_3_19:SetAlpha(0.8, 0)
	var_3_19.Backer:setImage(RegisterMaterial("progress_circle_big"), 0)
	var_3_19.Progress:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_19.Progress:setImage(RegisterMaterial("progress_circle_segment_big"), 0)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 406, _1080p * 66, _1080p * 326)
	var_3_0:addElement(var_3_19)

	var_3_0.ElderProgressBar = var_3_19

	local var_3_20
	local var_3_21 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_21.id = "ProgressionHeader"

	var_3_21.Text:setText(Engine.CBBHFCGDIC("AAR/PROGRESSION"), 0)
	var_3_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -550, 0, _1080p * 47)
	var_3_0:addElement(var_3_21)

	var_3_0.ProgressionHeader = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIImage.new()

	var_3_23.id = "Mask1"

	var_3_23:SetScale(0, 0)
	var_3_23:setImage(RegisterMaterial("minimap_circle_mask"), 0)
	var_3_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 406, _1080p * 66, _1080p * 326)
	var_3_0:addElement(var_3_23)

	var_3_0.Mask1 = var_3_23

	local var_3_24
	local var_3_25 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_26 = LUI.UIBorder.new(var_3_25)

	var_3_26.id = "Border"

	var_3_26:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_26:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -544, _1080p * -26, _1080p * 44, _1080p * 336)
	var_3_0:addElement(var_3_26)

	var_3_0.Border = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIText.new()

	var_3_28.id = "RankMaxLabel"

	var_3_28:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_28:SetAlpha(0, 0)
	var_3_28:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK_REACHED"), 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_28:SetAlignment(LUI.Alignment.Center)
	var_3_28:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -544, _1080p * -26, _1080p * 155, _1080p * 205)
	var_3_0:addElement(var_3_28)

	var_3_0.RankMaxLabel = var_3_28

	local function var_3_29()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("RegularIntro", var_3_31)

	local var_3_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		},
		{
			duration = 160,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 150
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("RegularIntro", var_3_32)

	local var_3_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 152
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 145
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("RegularIntro", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 244
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("RegularIntro", var_3_34)

	local var_3_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("RegularIntro", var_3_35)

	local var_3_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("RegularIntro", var_3_36)

	local function var_3_37()
		var_3_6:AnimateSequence("RegularIntro")
		var_3_8:AnimateSequence("RegularIntro")
		var_3_10:AnimateSequence("RegularIntro")
		var_3_12:AnimateSequence("RegularIntro")
		var_3_14:AnimateSequence("RegularIntro")
		var_3_19:AnimateSequence("RegularIntro")
	end

	var_3_0._sequences.RegularIntro = var_3_37

	local var_3_38
	local var_3_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ElderIntro", var_3_39)

	local var_3_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 387
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 228
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		},
		{
			value = 0.01,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ElderIntro", var_3_40)

	local var_3_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 275
		},
		{
			value = 0.01,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ElderIntro", var_3_41)

	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 216
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("ElderIntro", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ElderIntro", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.01,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 140,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("ElderIntro", var_3_44)

	local function var_3_45()
		var_3_6:AnimateSequence("ElderIntro")
		var_3_8:AnimateSequence("ElderIntro")
		var_3_10:AnimateSequence("ElderIntro")
		var_3_12:AnimateSequence("ElderIntro")
		var_3_14:AnimateSequence("ElderIntro")
		var_3_19:AnimateSequence("ElderIntro")
	end

	var_3_0._sequences.ElderIntro = var_3_45

	local var_3_46
	local var_3_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("RankMax", var_3_47)

	local var_3_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("RankMax", var_3_48)

	local var_3_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("RankMax", var_3_49)

	local function var_3_50()
		var_3_16:AnimateSequence("RankMax")
		var_3_19:AnimateSequence("RankMax")
		var_3_28:AnimateSequence("RankMax")
	end

	var_3_0._sequences.RankMax = var_3_50

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARProgression", AARProgression)
LockTable(_M)
