module(..., package.seeall)

local var_0_0 = 1000

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = PROGRESSION.GetPlayerSeasonRank(arg_1_1, arg_1_2) + 1

	if PROGRESSION.IsPlayerLifeTimeXPMax(arg_1_1) then
		ACTIONS.AnimateSequence(arg_1_0, "MaxSeasonXP")
	elseif var_1_0 > PROGRESSION.GetMaxElderRank() then
		ACTIONS.AnimateSequence(arg_1_0, "MaxSeasonRank")
	else
		ACTIONS.AnimateSequence(arg_1_0, "NotMaxSeasonRank")

		local var_1_1 = PROGRESSION.GetSeasonRankBigIcon(var_1_0, 0)
		local var_1_2 = PROGRESSION.GetSeasonRankName(var_1_0)

		arg_1_0.NextRankIcon:setImage(RegisterMaterial(var_1_1))
		arg_1_0.NextRankName:setText(var_1_2)
		arg_1_0.NextRankNum:setText(PROGRESSION.GetPlayerLifeTimeDisplayRank(arg_1_1, arg_1_2) + 1)

		local var_1_3 = PROGRESSION.GetSeasonRankMaxXP(PROGRESSION.GetPlayerSeasonRank(arg_1_1, arg_1_2))
		local var_1_4 = PROGRESSION.GetSeasonRankMinXP(PROGRESSION.GetPlayerSeasonRank(arg_1_1, arg_1_2))
		local var_1_5 = PROGRESSION.GetPlayerSeasonXP(arg_1_1, arg_1_2) - var_1_4
		local var_1_6 = var_1_3 - var_1_4
		local var_1_7 = math.max(0, var_1_5)
		local var_1_8 = math.max(0, var_1_6)

		arg_1_0.NextRankXP:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_REQUIRED_RANK", var_1_7, var_1_8))
	end

	if arg_1_2 ~= SEASON.GetCurrentSeason() then
		ACTIONS.AnimateSequence(arg_1_0, "PrevSeason")
	end

	arg_1_0.SeasonName:setText(Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", arg_1_2))
	arg_1_0.RadialRankProgressBar:UpdateRankDisplay(arg_1_1, arg_1_2)
	arg_1_0.RankResetText:SetAlpha(arg_1_2 == SEASON.GetCurrentSeason() and 1 or 0)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.NextRankName)
	assert(arg_2_0.NextRankIcon)
	assert(arg_2_0.NextRankNum)

	arg_2_0.UpdateRankDisplay = var_0_1

	local var_2_0 = SEASON.GetCurrentSeason()
	local var_2_1 = PROGRESSION.GetPlayerDisplayLevel(arg_2_1)

	arg_2_0.MWLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/MW_LEVEL", var_2_1))
	var_0_1(arg_2_0, arg_2_1, var_2_0)
	Challenge.SetupSeasonEndsTimer(arg_2_0, arg_2_0.RankResetText, "ELDER_PROGRESSION/RANK_RESET_TIME")
	ACTIONS.AnimateSequence(arg_2_0.EarnRateBuff, "LabelLeft")
end

function ElderProgressionRankPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 840 * _1080p)

	var_3_0.id = "ElderProgressionRankPanel"
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

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "SeasonName"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -195, _1080p * 196, _1080p * 73, _1080p * 103)
	var_3_0:addElement(var_3_6)

	var_3_0.SeasonName = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "RankResetText"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -133, _1080p * 133, _1080p * 110, _1080p * 130)
	var_3_0:addElement(var_3_8)

	var_3_0.RankResetText = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("RadialRankProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "RadialRankProgressBar"

	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -135, _1080p * 135, _1080p * 150, _1080p * 420)
	var_3_0:addElement(var_3_10)

	var_3_0.RadialRankProgressBar = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "MaxRankProgressionBar"

	var_3_12:SetRGBFromInt(11976384, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setImage(RegisterMaterial("ui_prog_radial_whole"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 350, _1080p * 150, _1080p * 420)
	var_3_0:addElement(var_3_12)

	var_3_0.MaxRankProgressionBar = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "MWLevel"

	var_3_14:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU/MW_LEVEL"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -155, _1080p * 155, _1080p * 438, _1080p * 474)
	var_3_0:addElement(var_3_14)

	var_3_0.MWLevel = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "NextRankIcon"

	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 53, _1080p * 159, _1080p * 263)
	var_3_0:addElement(var_3_16)

	var_3_0.NextRankIcon = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "NextRankName"

	var_3_18:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * 289, _1080p * 313)
	var_3_0:addElement(var_3_18)

	var_3_0.NextRankName = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "NextRankNum"

	var_3_20:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_3_20:setText("", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * 317, _1080p * 345)
	var_3_0:addElement(var_3_20)

	var_3_0.NextRankNum = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "NextRankXP"

	var_3_22:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * 350, _1080p * 370)
	var_3_0:addElement(var_3_22)

	var_3_0.NextRankXP = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIText.new()

	var_3_24.id = "NextRankTitle"

	var_3_24:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_24:setText(Engine.CBBHFCGDIC("LUA_MENU/NEXT_RANK"), 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 108, _1080p * 138)
	var_3_0:addElement(var_3_24)

	var_3_0.NextRankTitle = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIImage.new()

	var_3_26.id = "DividerBottomRight"

	var_3_26:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_26:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_26:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -120, 0, _1080p * 123, _1080p * 124)
	var_3_0:addElement(var_3_26)

	var_3_0.DividerBottomRight = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIImage.new()

	var_3_28.id = "DividerBottomLeft"

	var_3_28:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_28:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 120, 0, _1080p * 123, _1080p * 124)
	var_3_0:addElement(var_3_28)

	var_3_0.DividerBottomLeft = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIText.new()

	var_3_30.id = "RankMaxLabel"

	var_3_30:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_30:SetAlpha(0, 0)
	var_3_30:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_RANK_REACHED"), 0)
	var_3_30:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_30:SetAlignment(LUI.Alignment.Center)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 42, _1080p * 389, _1080p * 616, _1080p * 666)
	var_3_0:addElement(var_3_30)

	var_3_0.RankMaxLabel = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIText.new()

	var_3_32.id = "CurRankTitle"

	var_3_32:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_32:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_RANK"), 0)
	var_3_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_32:SetAlignment(LUI.Alignment.Center)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 31, _1080p * 60)
	var_3_0:addElement(var_3_32)

	var_3_0.CurRankTitle = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIImage.new()

	var_3_34.id = "DividerTopRight"

	var_3_34:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_34:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 310, _1080p * 430, _1080p * 46, _1080p * 47)
	var_3_0:addElement(var_3_34)

	var_3_0.DividerTopRight = var_3_34

	local var_3_35
	local var_3_36 = LUI.UIImage.new()

	var_3_36.id = "DividerTopLeft"

	var_3_36:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_3_36:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, 0, _1080p * 46, _1080p * 47)
	var_3_0:addElement(var_3_36)

	var_3_0.DividerTopLeft = var_3_36

	local var_3_37
	local var_3_38 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_3_1
	})

	var_3_38.id = "EarnRateBuff"

	var_3_38.EarnRate:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 221, _1080p * 421, _1080p * 6, _1080p * 38)
	var_3_0:addElement(var_3_38)

	var_3_0.EarnRateBuff = var_3_38

	local function var_3_39()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_39

	local var_3_40
	local var_3_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideSeason", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_3_8:RegisterAnimationSequence("HideSeason", var_3_42)

	local var_3_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 352
		}
	}

	var_3_10:RegisterAnimationSequence("HideSeason", var_3_43)

	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 438
		}
	}

	var_3_12:RegisterAnimationSequence("HideSeason", var_3_44)

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 369
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 405
		}
	}

	var_3_14:RegisterAnimationSequence("HideSeason", var_3_45)

	local function var_3_46()
		var_3_6:AnimateSequence("HideSeason")
		var_3_8:AnimateSequence("HideSeason")
		var_3_10:AnimateSequence("HideSeason")
		var_3_12:AnimateSequence("HideSeason")
		var_3_14:AnimateSequence("HideSeason")
	end

	var_3_0._sequences.HideSeason = var_3_46

	local var_3_47
	local var_3_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("MaxSeasonRank", var_3_48)

	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("MaxSeasonRank", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("MaxSeasonRank", var_3_50)

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("MaxSeasonRank", var_3_51)

	local var_3_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("MaxSeasonRank", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("MaxSeasonRank", var_3_53)

	local var_3_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("MaxSeasonRank", var_3_54)

	local function var_3_55()
		var_3_16:AnimateSequence("MaxSeasonRank")
		var_3_18:AnimateSequence("MaxSeasonRank")
		var_3_20:AnimateSequence("MaxSeasonRank")
		var_3_22:AnimateSequence("MaxSeasonRank")
		var_3_24:AnimateSequence("MaxSeasonRank")
		var_3_26:AnimateSequence("MaxSeasonRank")
		var_3_28:AnimateSequence("MaxSeasonRank")
	end

	var_3_0._sequences.MaxSeasonRank = var_3_55

	local var_3_56
	local var_3_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("NotMaxSeasonRank", var_3_57)

	local var_3_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("NotMaxSeasonRank", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("NotMaxSeasonRank", var_3_59)

	local var_3_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("NotMaxSeasonRank", var_3_60)

	local var_3_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("NotMaxSeasonRank", var_3_61)

	local var_3_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("NotMaxSeasonRank", var_3_62)

	local var_3_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("NotMaxSeasonRank", var_3_63)

	local var_3_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("NotMaxSeasonRank", var_3_64)

	local function var_3_65()
		var_3_16:AnimateSequence("NotMaxSeasonRank")
		var_3_18:AnimateSequence("NotMaxSeasonRank")
		var_3_20:AnimateSequence("NotMaxSeasonRank")
		var_3_22:AnimateSequence("NotMaxSeasonRank")
		var_3_24:AnimateSequence("NotMaxSeasonRank")
		var_3_26:AnimateSequence("NotMaxSeasonRank")
		var_3_28:AnimateSequence("NotMaxSeasonRank")
		var_3_30:AnimateSequence("NotMaxSeasonRank")
	end

	var_3_0._sequences.NotMaxSeasonRank = var_3_65

	local var_3_66
	local var_3_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("MaxSeasonXP", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("MaxSeasonXP", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("MaxSeasonXP", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("MaxSeasonXP", var_3_70)

	local var_3_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("MaxSeasonXP", var_3_71)

	local var_3_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("MaxSeasonXP", var_3_72)

	local var_3_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("MaxSeasonXP", var_3_73)

	local var_3_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("MaxSeasonXP", var_3_74)

	local function var_3_75()
		var_3_16:AnimateSequence("MaxSeasonXP")
		var_3_18:AnimateSequence("MaxSeasonXP")
		var_3_20:AnimateSequence("MaxSeasonXP")
		var_3_22:AnimateSequence("MaxSeasonXP")
		var_3_24:AnimateSequence("MaxSeasonXP")
		var_3_26:AnimateSequence("MaxSeasonXP")
		var_3_28:AnimateSequence("MaxSeasonXP")
		var_3_30:AnimateSequence("MaxSeasonXP")
	end

	var_3_0._sequences.MaxSeasonXP = var_3_75

	local var_3_76
	local var_3_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("PrevSeason", var_3_77)

	local var_3_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("PrevSeason", var_3_78)

	local var_3_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("PrevSeason", var_3_79)

	local var_3_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("PrevSeason", var_3_80)

	local var_3_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("PrevSeason", var_3_81)

	local var_3_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_26:RegisterAnimationSequence("PrevSeason", var_3_82)

	local var_3_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_28:RegisterAnimationSequence("PrevSeason", var_3_83)

	local var_3_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("PrevSeason", var_3_84)

	local function var_3_85()
		var_3_16:AnimateSequence("PrevSeason")
		var_3_18:AnimateSequence("PrevSeason")
		var_3_20:AnimateSequence("PrevSeason")
		var_3_22:AnimateSequence("PrevSeason")
		var_3_24:AnimateSequence("PrevSeason")
		var_3_26:AnimateSequence("PrevSeason")
		var_3_28:AnimateSequence("PrevSeason")
		var_3_30:AnimateSequence("PrevSeason")
	end

	var_3_0._sequences.PrevSeason = var_3_85

	var_0_2(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ElderProgressionRankPanel", ElderProgressionRankPanel)
LockTable(_M)
