module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = StringTable.BFHCAIIDA(CSV.progressionItems.file)
	local var_1_1 = PROGRESSION.GetPlayerRank(arg_1_1)
	local var_1_2 = var_1_1 == var_1_0 and true or false
	local var_1_3 = PROGRESSION.GetRankBigIcon(var_1_1, 0)
	local var_1_4 = PROGRESSION.GetRankDisplay(var_1_1)
	local var_1_5 = PROGRESSION.GetRankName(var_1_1)
	local var_1_6 = var_1_2 and 1 or var_1_1 + 1
	local var_1_7 = var_1_2 and 1 or PROGRESSION.GetRankDisplay(var_1_6)
	local var_1_8 = PROGRESSION.GetRankBigIcon(var_1_6, var_1_2 and 1 or 0)
	local var_1_9 = var_1_2 and Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_VALUE", 1) or PROGRESSION.GetRankName(var_1_6)

	if var_1_8 ~= "" then
		arg_1_0.NextRankIcon:setImage(RegisterMaterial(var_1_8))
		arg_1_0.NextRankValue:setText(var_1_7)
		arg_1_0.NextRankText:setText(var_1_9)

		local var_1_10 = PROGRESSION.GetPlayerXP(arg_1_1)
		local var_1_11 = PROGRESSION.GetRankMinXP(var_1_1)
		local var_1_12 = PROGRESSION.GetRankMaxXP(var_1_1)

		assert(var_1_12 - var_1_11 > 0)

		local var_1_13 = (var_1_10 - var_1_11) / (var_1_12 - var_1_11)
		local var_1_14 = LUI.clamp(var_1_13, 0, 1)

		arg_1_0.LevelUpXPDetails:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_REQUIRED_RANK", var_1_10 - var_1_11, var_1_12 - var_1_11))
		arg_1_0.RankProgressBar:SetProgress(var_1_14, 0)
	else
		ACTIONS.AnimateSequence(arg_1_0, "Prestige")
	end

	arg_1_0.CurRankIcon:setImage(RegisterMaterial(var_1_3))
	arg_1_0.CurRankValue:setText(var_1_4)
	arg_1_0.CurRankText:setText(var_1_5)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.AnimateSequence(arg_1_0.EarnRateBuff, "LabelLeft")
end

function UnlocksRankPanel(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 788 * _1080p)

	var_2_0.id = "UnlocksRankPanel"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "DoubleNotchedBacker"

	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.DoubleNotchedBacker = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "NextRankIcon"

	var_2_6:setImage(RegisterMaterial("icon_rank_01"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 326, _1080p * 395, _1080p * 617)
	var_2_0:addElement(var_2_6)

	var_2_0.NextRankIcon = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "NextRankValue"

	var_2_8:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 641, _1080p * 669)
	var_2_0:addElement(var_2_8)

	var_2_0.NextRankValue = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "NextRankText"

	var_2_10:SetRGBFromTable(SWATCHES.Tournament.teamNeutral, 0)
	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Center)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 617, _1080p * 641)
	var_2_0:addElement(var_2_10)

	var_2_0.NextRankText = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "NextRankTitle"

	var_2_12:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("LUA_MENU/NEXT_RANK"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_12:SetAlignment(LUI.Alignment.Center)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 364, _1080p * 394)
	var_2_0:addElement(var_2_12)

	var_2_0.NextRankTitle = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "CurRankText"

	var_2_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_14:setText("", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 285, _1080p * 309)
	var_2_0:addElement(var_2_14)

	var_2_0.CurRankText = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "CurRankValue"

	var_2_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_16:setText("", 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Center)
	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 309, _1080p * 337)
	var_2_0:addElement(var_2_16)

	var_2_0.CurRankValue = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIImage.new()

	var_2_18.id = "CurRankIcon"

	var_2_18:setImage(RegisterMaterial("icon_rank_25"), 0)
	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 326, _1080p * 63, _1080p * 285)
	var_2_0:addElement(var_2_18)

	var_2_0.CurRankIcon = var_2_18

	local var_2_19
	local var_2_20 = LUI.UIText.new()

	var_2_20.id = "CurRankTitle"

	var_2_20:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_20:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_RANK"), 0)
	var_2_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_20:SetAlignment(LUI.Alignment.Center)
	var_2_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 33, _1080p * 63)
	var_2_0:addElement(var_2_20)

	var_2_0.CurRankTitle = var_2_20

	local var_2_21
	local var_2_22 = LUI.UIImage.new()

	var_2_22.id = "DividerTopRight"

	var_2_22:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_22:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 310, _1080p * 430, _1080p * 46, _1080p * 47)
	var_2_0:addElement(var_2_22)

	var_2_0.DividerTopRight = var_2_22

	local var_2_23
	local var_2_24 = LUI.UIImage.new()

	var_2_24.id = "DividerTopLeft"

	var_2_24:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_24:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, 0, _1080p * 46, _1080p * 47)
	var_2_0:addElement(var_2_24)

	var_2_0.DividerTopLeft = var_2_24

	local var_2_25
	local var_2_26 = LUI.UIImage.new()

	var_2_26.id = "DividerBottomRight"

	var_2_26:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_26:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 310, _1080p * 430, _1080p * 379, _1080p * 380)
	var_2_0:addElement(var_2_26)

	var_2_0.DividerBottomRight = var_2_26

	local var_2_27
	local var_2_28 = LUI.UIImage.new()

	var_2_28.id = "DividerBottomLeft"

	var_2_28:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_28:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, 0, _1080p * 379, _1080p * 380)
	var_2_0:addElement(var_2_28)

	var_2_0.DividerBottomLeft = var_2_28

	local var_2_29
	local var_2_30 = LUI.UIText.new()

	var_2_30.id = "LevelUpXPDetails"

	var_2_30:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_30:setText("", 0)
	var_2_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_30:SetAlignment(LUI.Alignment.Center)
	var_2_30:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_30:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 52, _1080p * -51, _1080p * 716, _1080p * 736)
	var_2_0:addElement(var_2_30)

	var_2_0.LevelUpXPDetails = var_2_30

	local var_2_31
	local var_2_32 = LUI.UIImage.new()

	var_2_32.id = "ProgressBG"

	var_2_32:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_2_32:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 51, _1080p * -51, _1080p * 693, _1080p * 703)
	var_2_0:addElement(var_2_32)

	var_2_0.ProgressBG = var_2_32

	local var_2_33
	local var_2_34 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_2_1
	})

	var_2_34.id = "RankProgressBar"

	var_2_34.Fill:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_2_34.Frame:SetAlpha(0, 0)
	var_2_34.Cap:SetAlpha(0, 0)
	var_2_34:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 51, _1080p * -51, _1080p * 693, _1080p * 703)
	var_2_0:addElement(var_2_34)

	var_2_0.RankProgressBar = var_2_34

	local var_2_35
	local var_2_36 = LUI.UIText.new()

	var_2_36.id = "XPNumber"

	var_2_36:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_2_36:setText("", 0)
	var_2_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_36:SetAlignment(LUI.Alignment.Right)
	var_2_36:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 52, _1080p * -242, _1080p * 716, _1080p * 736)
	var_2_0:addElement(var_2_36)

	var_2_0.XPNumber = var_2_36

	local var_2_37
	local var_2_38 = MenuBuilder.BuildRegisteredType("EarnRateBuff", {
		controllerIndex = var_2_1
	})

	var_2_38.id = "EarnRateBuff"

	var_2_38.EarnRate:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 222, _1080p * 422, _1080p * 8, _1080p * 40)
	var_2_0:addElement(var_2_38)

	var_2_0.EarnRateBuff = var_2_38

	local function var_2_39()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_39

	local function var_2_40()
		return
	end

	var_2_0._sequences.Icon1x1 = var_2_40

	local function var_2_41()
		return
	end

	var_2_0._sequences.Icon2x1 = var_2_41

	local var_2_42
	local var_2_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Intro", var_2_43)

	local var_2_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Intro", var_2_44)

	local var_2_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Intro", var_2_45)

	local var_2_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("Intro", var_2_46)

	local var_2_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("Intro", var_2_47)

	local var_2_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("Intro", var_2_48)

	local var_2_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("Intro", var_2_49)

	local var_2_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_20:RegisterAnimationSequence("Intro", var_2_50)

	local var_2_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_22:RegisterAnimationSequence("Intro", var_2_51)

	local function var_2_52()
		var_2_6:AnimateSequence("Intro")
		var_2_8:AnimateSequence("Intro")
		var_2_10:AnimateSequence("Intro")
		var_2_12:AnimateSequence("Intro")
		var_2_14:AnimateSequence("Intro")
		var_2_16:AnimateSequence("Intro")
		var_2_18:AnimateSequence("Intro")
		var_2_20:AnimateSequence("Intro")
		var_2_22:AnimateSequence("Intro")
	end

	var_2_0._sequences.Intro = var_2_52

	local var_2_53
	local var_2_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Prestige", var_2_54)

	local var_2_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("Prestige", var_2_55)

	local var_2_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("Prestige", var_2_56)

	local var_2_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("Prestige", var_2_57)

	local var_2_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_26:RegisterAnimationSequence("Prestige", var_2_58)

	local var_2_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_28:RegisterAnimationSequence("Prestige", var_2_59)

	local var_2_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_30:RegisterAnimationSequence("Prestige", var_2_60)

	local var_2_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_32:RegisterAnimationSequence("Prestige", var_2_61)

	local var_2_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_34:RegisterAnimationSequence("Prestige", var_2_62)

	local function var_2_63()
		var_2_6:AnimateSequence("Prestige")
		var_2_8:AnimateSequence("Prestige")
		var_2_10:AnimateSequence("Prestige")
		var_2_12:AnimateSequence("Prestige")
		var_2_26:AnimateSequence("Prestige")
		var_2_28:AnimateSequence("Prestige")
		var_2_30:AnimateSequence("Prestige")
		var_2_32:AnimateSequence("Prestige")
		var_2_34:AnimateSequence("Prestige")
	end

	var_2_0._sequences.Prestige = var_2_63

	local var_2_64
	local var_2_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 649
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 683
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_65)

	local var_2_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 649
		}
	}

	var_2_10:RegisterAnimationSequence("AR", var_2_66)

	local var_2_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 354
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 386
		}
	}

	var_2_12:RegisterAnimationSequence("AR", var_2_67)

	local var_2_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314
		}
	}

	var_2_14:RegisterAnimationSequence("AR", var_2_68)

	local var_2_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 314
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 348
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_69)

	local var_2_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		}
	}

	var_2_20:RegisterAnimationSequence("AR", var_2_70)

	local var_2_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 748
		}
	}

	var_2_30:RegisterAnimationSequence("AR", var_2_71)

	local var_2_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 697
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 707
		}
	}

	var_2_32:RegisterAnimationSequence("AR", var_2_72)

	local var_2_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 697
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 707
		}
	}

	var_2_34:RegisterAnimationSequence("AR", var_2_73)

	local function var_2_74()
		var_2_8:AnimateSequence("AR")
		var_2_10:AnimateSequence("AR")
		var_2_12:AnimateSequence("AR")
		var_2_14:AnimateSequence("AR")
		var_2_16:AnimateSequence("AR")
		var_2_20:AnimateSequence("AR")
		var_2_30:AnimateSequence("AR")
		var_2_32:AnimateSequence("AR")
		var_2_34:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_74

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("UnlocksRankPanel", UnlocksRankPanel)
LockTable(_M)
