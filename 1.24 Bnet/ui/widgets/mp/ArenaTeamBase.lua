module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or false

	if arg_1_1 then
		if IsLanguageChinese() or IsLanguageKorean() then
			ACTIONS.AnimateSequence(arg_1_0, "KORZHT")
		elseif IsLanguageJapanese() then
			ACTIONS.AnimateSequence(arg_1_0, "JPT")
		else
			ACTIONS.AnimateSequence(arg_1_0, "InTournament")
		end
	elseif IsLanguageChinese() or IsLanguageKorean() then
		ACTIONS.AnimateSequence(arg_1_0, "KORZH")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	else
		ACTIONS.AnimateSequence(arg_1_0, "NotInTournament")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateConfig = var_0_0

	arg_2_0.Icon:SetMask(arg_2_0.IconMask)
end

function ArenaTeamBase(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -75 * _1080p, 75 * _1080p, -50 * _1080p, 50 * _1080p)

	var_3_0.id = "ArenaTeamBase"
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

	var_3_4.id = "DarkIcon"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:setImage(RegisterMaterial("icon_faction_east_small"), 0)
	var_3_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -192, _1080p * -64, _1080p * -38, _1080p * 90)
	var_3_0:addElement(var_3_4)

	var_3_0.DarkIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Icon"

	var_3_6:setImage(RegisterMaterial("icon_faction_east_small"), 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -192, _1080p * -64, _1080p * -40, _1080p * 88)
	var_3_0:addElement(var_3_6)

	var_3_0.Icon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "IconMask"

	var_3_8:SetZRotation(-45, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -242, _1080p * 42, _1080p * -42, _1080p * 148)
	var_3_0:addElement(var_3_8)

	var_3_0.IconMask = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Score"

	var_3_10:setText("0000", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Right)
	var_3_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_10:SetStartupDelay(1000)
	var_3_10:SetLineHoldTime(400)
	var_3_10:SetAnimMoveTime(150)
	var_3_10:SetAnimMoveSpeed(50)
	var_3_10:SetEndDelay(1000)
	var_3_10:SetCrossfadeTime(400)
	var_3_10:SetFadeInTime(300)
	var_3_10:SetFadeOutTime(300)
	var_3_10:SetMaxVisibleLines(1)
	var_3_10:SetOutlineMinDistance(-0.2, 0)
	var_3_10:SetOutlineMaxDistance(0.2, 0)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -82, 0, _1080p * 36, _1080p * 106)
	var_3_0:addElement(var_3_10)

	var_3_0.Score = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "NameBacker"

	var_3_12:SetRGBFromInt(0, 0)
	var_3_12:SetAlpha(0.6, 0)
	var_3_12:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, 0, 0, _1080p * 24)
	var_3_0:addElement(var_3_12)

	var_3_0.NameBacker = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "Name"

	var_3_14:setText(ToUpperCase(""), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Right)
	var_3_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetStartupDelay(1000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(150)
	var_3_14:SetAnimMoveSpeed(50)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetOutlineRGBFromInt(0, 0)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -128, 0, _1080p * 24, _1080p * 48)
	var_3_0:addElement(var_3_14)

	var_3_0.Name = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "Underline"

	var_3_16:SetAlpha(0, 0)
	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, 0, 0, _1080p * 97, _1080p * 103)
	var_3_0:addElement(var_3_16)

	var_3_0.Underline = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "TournamentTeamName"

	var_3_18:setText(ToUpperCase(""), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Right)
	var_3_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_18:SetStartupDelay(1000)
	var_3_18:SetLineHoldTime(400)
	var_3_18:SetAnimMoveTime(150)
	var_3_18:SetAnimMoveSpeed(50)
	var_3_18:SetEndDelay(1000)
	var_3_18:SetCrossfadeTime(400)
	var_3_18:SetFadeInTime(300)
	var_3_18:SetFadeOutTime(300)
	var_3_18:SetMaxVisibleLines(1)
	var_3_18:SetOutlineRGBFromInt(0, 0)
	var_3_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -150, 0, 0, _1080p * 24)
	var_3_0:addElement(var_3_18)

	var_3_0.TournamentTeamName = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("HideIcon", var_3_21)

	local var_3_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("HideIcon", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("HideIcon")
		var_3_6:AnimateSequence("HideIcon")
	end

	var_3_0._sequences.HideIcon = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowIcon", var_3_25)

	local var_3_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("ShowIcon", var_3_26)

	local function var_3_27()
		var_3_4:AnimateSequence("ShowIcon")
		var_3_6:AnimateSequence("ShowIcon")
	end

	var_3_0._sequences.ShowIcon = var_3_27

	local var_3_28
	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_3_10:RegisterAnimationSequence("DisplayWin", var_3_29)

	local var_3_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("DisplayWin", var_3_30)

	local function var_3_31()
		var_3_10:AnimateSequence("DisplayWin")
		var_3_16:AnimateSequence("DisplayWin")
	end

	var_3_0._sequences.DisplayWin = var_3_31

	local var_3_32
	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_3_10:RegisterAnimationSequence("DisplayLoss", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("DisplayLoss", var_3_34)

	local function var_3_35()
		var_3_10:AnimateSequence("DisplayLoss")
		var_3_16:AnimateSequence("DisplayLoss")
	end

	var_3_0._sequences.DisplayLoss = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		}
	}

	var_3_10:RegisterAnimationSequence("KORZH", var_3_37)

	local var_3_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_3_14:RegisterAnimationSequence("KORZH", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_3_16:RegisterAnimationSequence("KORZH", var_3_39)

	local function var_3_40()
		var_3_10:AnimateSequence("KORZH")
		var_3_14:AnimateSequence("KORZH")
		var_3_16:AnimateSequence("KORZH")
	end

	var_3_0._sequences.KORZH = var_3_40

	local var_3_41
	local var_3_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		}
	}

	var_3_10:RegisterAnimationSequence("JP", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_3_14:RegisterAnimationSequence("JP", var_3_43)

	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		}
	}

	var_3_16:RegisterAnimationSequence("JP", var_3_44)

	local function var_3_45()
		var_3_10:AnimateSequence("JP")
		var_3_14:AnimateSequence("JP")
		var_3_16:AnimateSequence("JP")
	end

	var_3_0._sequences.JP = var_3_45

	local var_3_46
	local var_3_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 106
		}
	}

	var_3_10:RegisterAnimationSequence("InTournament", var_3_47)

	local var_3_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		}
	}

	var_3_14:RegisterAnimationSequence("InTournament", var_3_48)

	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 97
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 103
		}
	}

	var_3_16:RegisterAnimationSequence("InTournament", var_3_49)

	local var_3_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("InTournament", var_3_50)

	local function var_3_51()
		var_3_10:AnimateSequence("InTournament")
		var_3_14:AnimateSequence("InTournament")
		var_3_16:AnimateSequence("InTournament")
		var_3_18:AnimateSequence("InTournament")
	end

	var_3_0._sequences.InTournament = var_3_51

	local var_3_52
	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_3_10:RegisterAnimationSequence("NotInTournament", var_3_53)

	local var_3_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		}
	}

	var_3_14:RegisterAnimationSequence("NotInTournament", var_3_54)

	local var_3_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		}
	}

	var_3_16:RegisterAnimationSequence("NotInTournament", var_3_55)

	local var_3_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("NotInTournament", var_3_56)

	local function var_3_57()
		var_3_10:AnimateSequence("NotInTournament")
		var_3_14:AnimateSequence("NotInTournament")
		var_3_16:AnimateSequence("NotInTournament")
		var_3_18:AnimateSequence("NotInTournament")
	end

	var_3_0._sequences.NotInTournament = var_3_57

	local var_3_58
	local var_3_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		}
	}

	var_3_10:RegisterAnimationSequence("JPT", var_3_59)

	local var_3_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		}
	}

	var_3_16:RegisterAnimationSequence("JPT", var_3_60)

	local function var_3_61()
		var_3_10:AnimateSequence("JPT")
		var_3_16:AnimateSequence("JPT")
	end

	var_3_0._sequences.JPT = var_3_61

	local var_3_62
	local var_3_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_3_10:RegisterAnimationSequence("KORZHT", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 101
		}
	}

	var_3_16:RegisterAnimationSequence("KORZHT", var_3_64)

	local function var_3_65()
		var_3_10:AnimateSequence("KORZHT")
		var_3_16:AnimateSequence("KORZHT")
	end

	var_3_0._sequences.KORZHT = var_3_65

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ArenaTeamBase", ArenaTeamBase)
LockTable(_M)
