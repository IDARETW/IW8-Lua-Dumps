module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = true
	local var_1_1 = 1000

	arg_1_0.GenericButton:StartTimer(var_1_1)

	arg_1_0:Wait(var_1_1).onComplete = function()
		var_1_0 = false
	end

	local function var_1_2(arg_3_0)
		if not var_1_0 then
			LUI.FlowManager.RequestLeaveMenu(arg_3_0)
		end
	end

	arg_1_0.GenericButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		var_1_2(arg_4_0)
	end)

	local var_1_3 = LUI.UIBindButton.new()

	var_1_3.id = "selfBindButton"

	arg_1_0:addElement(var_1_3)

	arg_1_0.bindButton = var_1_3

	arg_1_0.bindButton:addEventHandler("button_primary", function(arg_5_0, arg_5_1)
		var_1_2(arg_1_0)
	end)
end

local function var_0_1(arg_6_0, arg_6_1, arg_6_2)
	var_0_0(arg_6_0, arg_6_1)

	local var_6_0 = arg_6_2.currentSeason
	local var_6_1 = "Season" .. var_6_0

	if arg_6_0._sequences and arg_6_0._sequences[var_6_1] then
		ACTIONS.AnimateSequence(arg_6_0, var_6_1)
		PlayerData.BFFBGAJGD(arg_6_1, CoD.StatsGroup.NonGame).lastSeasonProgressionPopup:set(var_6_0)
	else
		if Engine.BHICADFIHA() and CONDITIONS.IsPostSeason() ~= true then
			LUI.FlowManager.RequestPopupMenu(arg_6_0, "PopupOK", true, arg_6_1, false, {
				message = "[ProgressionTitleTransitionPopup] Could not find corresponding animation for season " .. var_6_0 .. ", if we are moving to a new season, please add the corresponding animation sequence"
			})
		end

		LUI.FlowManager.RequestLeaveMenu(arg_6_0)
	end
end

function ProgressionTitleTransitionPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "ProgressionTitleTransitionPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = {
		worldBlur = 1,
		controllerIndex = var_7_1
	}
	local var_7_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_7_4)

	var_7_5.id = "WorldBlur"

	var_7_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_7_0:addElement(var_7_5)

	var_7_0.WorldBlur = var_7_5

	local var_7_6
	local var_7_7 = LUI.UIImage.new()

	var_7_7.id = "Darken"

	var_7_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_7:SetAlpha(0.9, 0)
	var_7_0:addElement(var_7_7)

	var_7_0.Darken = var_7_7

	local var_7_8
	local var_7_9 = LUI.UIImage.new()

	var_7_9.id = "SeasonImage03"

	var_7_9:setImage(RegisterMaterial("onboarding_wz_only_seasonal_03"), 0)
	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 985, _1080p * 1565, _1080p * 625, _1080p * 905)
	var_7_0:addElement(var_7_9)

	var_7_0.SeasonImage03 = var_7_9

	local var_7_10
	local var_7_11 = LUI.UIImage.new()

	var_7_11.id = "SeasonImage02"

	var_7_11:setImage(RegisterMaterial("onboarding_wz_only_seasonal_02"), 0)
	var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 901, _1080p * 625, _1080p * 905)
	var_7_0:addElement(var_7_11)

	var_7_0.SeasonImage02 = var_7_11

	local var_7_12
	local var_7_13 = LUI.UIImage.new()

	var_7_13.id = "SeasonImage01"

	var_7_13:setImage(RegisterMaterial("onboarding_wz_only_seasonal_01"), 0)
	var_7_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 1565, _1080p * 208, _1080p * 488)
	var_7_0:addElement(var_7_13)

	var_7_0.SeasonImage01 = var_7_13

	local var_7_14
	local var_7_15 = LUI.UIStyledText.new()

	var_7_15.id = "NewRanksTitle"

	var_7_15:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_15:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_MILITARY_RANKS_AND_SEASONS")), 0)
	var_7_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_15:SetAlignment(LUI.Alignment.Left)
	var_7_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_15:SetStartupDelay(1000)
	var_7_15:SetLineHoldTime(500)
	var_7_15:SetAnimMoveTime(250)
	var_7_15:SetAnimMoveSpeed(50)
	var_7_15:SetEndDelay(1000)
	var_7_15:SetCrossfadeTime(500)
	var_7_15:SetFadeInTime(300)
	var_7_15:SetFadeOutTime(300)
	var_7_15:SetMaxVisibleLines(1)
	var_7_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 1565, _1080p * 164, _1080p * 200)
	var_7_0:addElement(var_7_15)

	var_7_0.NewRanksTitle = var_7_15

	local var_7_16
	local var_7_17 = LUI.UIStyledText.new()

	var_7_17.id = "PrestigeTitle"

	var_7_17:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_17:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MEMORIAL_AND_REWARDS")), 0)
	var_7_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_17:SetAlignment(LUI.Alignment.Left)
	var_7_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_17:SetStartupDelay(1000)
	var_7_17:SetLineHoldTime(500)
	var_7_17:SetAnimMoveTime(250)
	var_7_17:SetAnimMoveSpeed(50)
	var_7_17:SetEndDelay(1000)
	var_7_17:SetCrossfadeTime(500)
	var_7_17:SetFadeInTime(300)
	var_7_17:SetFadeOutTime(300)
	var_7_17:SetMaxVisibleLines(1)
	var_7_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 901, _1080p * 578, _1080p * 614)
	var_7_0:addElement(var_7_17)

	var_7_0.PrestigeTitle = var_7_17

	local var_7_18
	local var_7_19 = LUI.UIStyledText.new()

	var_7_19.id = "NewChallengesTitle"

	var_7_19:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_19:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLENGES")), 0)
	var_7_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_19:SetAlignment(LUI.Alignment.Left)
	var_7_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_19:SetStartupDelay(1000)
	var_7_19:SetLineHoldTime(500)
	var_7_19:SetAnimMoveTime(250)
	var_7_19:SetAnimMoveSpeed(50)
	var_7_19:SetEndDelay(1000)
	var_7_19:SetCrossfadeTime(500)
	var_7_19:SetFadeInTime(300)
	var_7_19:SetFadeOutTime(300)
	var_7_19:SetMaxVisibleLines(1)
	var_7_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 985, _1080p * 1565, _1080p * 578, _1080p * 614)
	var_7_0:addElement(var_7_19)

	var_7_0.NewChallengesTitle = var_7_19

	local var_7_20
	local var_7_21 = LUI.UIStyledText.new()

	var_7_21.id = "Title"

	var_7_21:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_21:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_IS_COMING")), 0)
	var_7_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_21:SetAlignment(LUI.Alignment.Center)
	var_7_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_21:SetStartupDelay(1000)
	var_7_21:SetLineHoldTime(500)
	var_7_21:SetAnimMoveTime(250)
	var_7_21:SetAnimMoveSpeed(50)
	var_7_21:SetEndDelay(1000)
	var_7_21:SetCrossfadeTime(500)
	var_7_21:SetFadeInTime(300)
	var_7_21:SetFadeOutTime(300)
	var_7_21:SetMaxVisibleLines(1)
	var_7_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 54, _1080p * 124)
	var_7_0:addElement(var_7_21)

	var_7_0.Title = var_7_21

	local var_7_22
	local var_7_23 = LUI.UIText.new()

	var_7_23.id = "MilitaryExplanationLabel"

	var_7_23:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_23:setText(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_EXPLANATION_PRESTIGE"), 0)
	var_7_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_23:SetAlignment(LUI.Alignment.Left)
	var_7_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 1565, _1080p * 499, _1080p * 517)
	var_7_0:addElement(var_7_23)

	var_7_0.MilitaryExplanationLabel = var_7_23

	local var_7_24
	local var_7_25 = LUI.UIText.new()

	var_7_25.id = "HistoryExplanationLabel"

	var_7_25:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_25:setText(Engine.CBBHFCGDIC("LUA_MENU/HISTORY_EXPLANATION_PRESTIGE_EXPLANATION"), 0)
	var_7_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_25:SetAlignment(LUI.Alignment.Left)
	var_7_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 901, _1080p * 917, _1080p * 934.9)
	var_7_0:addElement(var_7_25)

	var_7_0.HistoryExplanationLabel = var_7_25

	local var_7_26
	local var_7_27 = LUI.UIText.new()

	var_7_27.id = "ChallengesExplanationLabel"

	var_7_27:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_27:setText(Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION_PRESTIGE"), 0)
	var_7_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_27:SetAlignment(LUI.Alignment.Left)
	var_7_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 985, _1080p * 1565, _1080p * 916, _1080p * 934)
	var_7_0:addElement(var_7_27)

	var_7_0.ChallengesExplanationLabel = var_7_27

	local var_7_28
	local var_7_29 = LUI.UIText.new()

	var_7_29.id = "SeasonExplanationLabel"

	var_7_29:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_7_29:SetAlpha(0, 0)
	var_7_29:setText("", 0)
	var_7_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_29:SetAlignment(LUI.Alignment.Center)
	var_7_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 1565, _1080p * 878, _1080p * 902)
	var_7_0:addElement(var_7_29)

	var_7_0.SeasonExplanationLabel = var_7_29

	local var_7_30
	local var_7_31 = LUI.UIText.new()

	var_7_31.id = "MilitaryRankExplainationLabel"

	var_7_31:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_7_31:SetAlpha(0, 0)
	var_7_31:setText(ToUpperCase(""), 0)
	var_7_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_31:SetAlignment(LUI.Alignment.Center)
	var_7_31:SetVerticalAlignment(LUI.Alignment.Center)
	var_7_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 321, _1080p * 1565, _1080p * 935, _1080p * 959)
	var_7_0:addElement(var_7_31)

	var_7_0.MilitaryRankExplainationLabel = var_7_31

	local var_7_32
	local var_7_33 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_7_1
	})

	var_7_33.id = "GenericButton"

	var_7_33.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_7_33.Text:SetAlignment(LUI.Alignment.Center)
	var_7_33:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 750, _1080p * 1170, _1080p * 442, _1080p * 480)
	var_7_0:addElement(var_7_33)

	var_7_0.GenericButton = var_7_33

	local function var_7_34()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_34

	local var_7_35
	local var_7_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 985
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 625
		}
	}

	var_7_9:RegisterAnimationSequence("Season12", var_7_36)

	local var_7_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 625
		}
	}

	var_7_11:RegisterAnimationSequence("Season12", var_7_37)

	local var_7_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		}
	}

	var_7_13:RegisterAnimationSequence("Season12", var_7_38)

	local var_7_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_MILITARY_RANKS_AND_SEASONS"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season12", var_7_39)

	local var_7_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MEMORIAL_AND_REWARDS"))
		}
	}

	var_7_17:RegisterAnimationSequence("Season12", var_7_40)

	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLENGES"))
		}
	}

	var_7_19:RegisterAnimationSequence("Season12", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_IS_COMING"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season12", var_7_42)

	local var_7_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/MILITARY_EXPLANATION_PRESTIGE")
		}
	}

	var_7_23:RegisterAnimationSequence("Season12", var_7_43)

	local var_7_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/HISTORY_EXPLANATION_PRESTIGE_EXPLANATION")
		}
	}

	var_7_25:RegisterAnimationSequence("Season12", var_7_44)

	local var_7_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION_PRESTIGE")
		}
	}

	var_7_27:RegisterAnimationSequence("Season12", var_7_45)

	local function var_7_46()
		var_7_9:AnimateSequence("Season12")
		var_7_11:AnimateSequence("Season12")
		var_7_13:AnimateSequence("Season12")
		var_7_15:AnimateSequence("Season12")
		var_7_17:AnimateSequence("Season12")
		var_7_19:AnimateSequence("Season12")
		var_7_21:AnimateSequence("Season12")
		var_7_23:AnimateSequence("Season12")
		var_7_25:AnimateSequence("Season12")
		var_7_27:AnimateSequence("Season12")
	end

	var_7_0._sequences.Season12 = var_7_46

	local var_7_47
	local var_7_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_9:RegisterAnimationSequence("Season13", var_7_48)

	local var_7_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_11:RegisterAnimationSequence("Season13", var_7_49)

	local var_7_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/7_NEW_PRESTIGE"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season13", var_7_50)

	local var_7_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_BLUEPRINT"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_17:RegisterAnimationSequence("Season13", var_7_51)

	local var_7_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLNGES_13"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_19:RegisterAnimationSequence("Season13", var_7_52)

	local var_7_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_13_TITLE"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season13", var_7_53)

	local var_7_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("Season13", var_7_54)

	local var_7_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("Season13", var_7_55)

	local var_7_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("Season13", var_7_56)

	local var_7_57 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		}
	}

	var_7_29:RegisterAnimationSequence("Season13", var_7_57)

	local var_7_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_RANK_EXPLANIATION"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 932
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 956
		}
	}

	var_7_31:RegisterAnimationSequence("Season13", var_7_58)

	local function var_7_59()
		var_7_9:AnimateSequence("Season13")
		var_7_11:AnimateSequence("Season13")
		var_7_15:AnimateSequence("Season13")
		var_7_17:AnimateSequence("Season13")
		var_7_19:AnimateSequence("Season13")
		var_7_21:AnimateSequence("Season13")
		var_7_23:AnimateSequence("Season13")
		var_7_25:AnimateSequence("Season13")
		var_7_27:AnimateSequence("Season13")
		var_7_29:AnimateSequence("Season13")
		var_7_31:AnimateSequence("Season13")
	end

	var_7_0._sequences.Season13 = var_7_59

	local var_7_60
	local var_7_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_9:RegisterAnimationSequence("Season14", var_7_61)

	local var_7_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_11:RegisterAnimationSequence("Season14", var_7_62)

	local var_7_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/7_NEW_PRESTIGE"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season14", var_7_63)

	local var_7_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_BLUEPRINT"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_17:RegisterAnimationSequence("Season14", var_7_64)

	local var_7_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLNGES_13"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_19:RegisterAnimationSequence("Season14", var_7_65)

	local var_7_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_14_TITLE"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season14", var_7_66)

	local var_7_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("Season14", var_7_67)

	local var_7_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("Season14", var_7_68)

	local var_7_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("Season14", var_7_69)

	local var_7_70 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		}
	}

	var_7_29:RegisterAnimationSequence("Season14", var_7_70)

	local var_7_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_RANK_EXPLANIATION"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 932
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 956
		}
	}

	var_7_31:RegisterAnimationSequence("Season14", var_7_71)

	local function var_7_72()
		var_7_9:AnimateSequence("Season14")
		var_7_11:AnimateSequence("Season14")
		var_7_15:AnimateSequence("Season14")
		var_7_17:AnimateSequence("Season14")
		var_7_19:AnimateSequence("Season14")
		var_7_21:AnimateSequence("Season14")
		var_7_23:AnimateSequence("Season14")
		var_7_25:AnimateSequence("Season14")
		var_7_27:AnimateSequence("Season14")
		var_7_29:AnimateSequence("Season14")
		var_7_31:AnimateSequence("Season14")
	end

	var_7_0._sequences.Season14 = var_7_72

	local var_7_73
	local var_7_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_9:RegisterAnimationSequence("Season15", var_7_74)

	local var_7_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_11:RegisterAnimationSequence("Season15", var_7_75)

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/7_NEW_PRESTIGE"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season15", var_7_76)

	local var_7_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_BLUEPRINT"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_17:RegisterAnimationSequence("Season15", var_7_77)

	local var_7_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLNGES_13"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_19:RegisterAnimationSequence("Season15", var_7_78)

	local var_7_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_14_TITLE"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season15", var_7_79)

	local var_7_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("Season15", var_7_80)

	local var_7_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("Season15", var_7_81)

	local var_7_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("Season15", var_7_82)

	local var_7_83 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		}
	}

	var_7_29:RegisterAnimationSequence("Season15", var_7_83)

	local var_7_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_RANK_EXPLANIATION"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 932
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 956
		}
	}

	var_7_31:RegisterAnimationSequence("Season15", var_7_84)

	local function var_7_85()
		var_7_9:AnimateSequence("Season15")
		var_7_11:AnimateSequence("Season15")
		var_7_15:AnimateSequence("Season15")
		var_7_17:AnimateSequence("Season15")
		var_7_19:AnimateSequence("Season15")
		var_7_21:AnimateSequence("Season15")
		var_7_23:AnimateSequence("Season15")
		var_7_25:AnimateSequence("Season15")
		var_7_27:AnimateSequence("Season15")
		var_7_29:AnimateSequence("Season15")
		var_7_31:AnimateSequence("Season15")
	end

	var_7_0._sequences.Season15 = var_7_85

	local var_7_86
	local var_7_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_9:RegisterAnimationSequence("Season16", var_7_87)

	local var_7_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_11:RegisterAnimationSequence("Season16", var_7_88)

	local var_7_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/7_NEW_PRESTIGE"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season16", var_7_89)

	local var_7_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_BLUEPRINT"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_17:RegisterAnimationSequence("Season16", var_7_90)

	local var_7_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLNGES_13"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_19:RegisterAnimationSequence("Season16", var_7_91)

	local var_7_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_14_TITLE"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season16", var_7_92)

	local var_7_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("Season16", var_7_93)

	local var_7_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("Season16", var_7_94)

	local var_7_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("Season16", var_7_95)

	local var_7_96 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		}
	}

	var_7_29:RegisterAnimationSequence("Season16", var_7_96)

	local var_7_97 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_RANK_EXPLANIATION"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 932
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 956
		}
	}

	var_7_31:RegisterAnimationSequence("Season16", var_7_97)

	local function var_7_98()
		var_7_9:AnimateSequence("Season16")
		var_7_11:AnimateSequence("Season16")
		var_7_15:AnimateSequence("Season16")
		var_7_17:AnimateSequence("Season16")
		var_7_19:AnimateSequence("Season16")
		var_7_21:AnimateSequence("Season16")
		var_7_23:AnimateSequence("Season16")
		var_7_25:AnimateSequence("Season16")
		var_7_27:AnimateSequence("Season16")
		var_7_29:AnimateSequence("Season16")
		var_7_31:AnimateSequence("Season16")
	end

	var_7_0._sequences.Season16 = var_7_98

	local var_7_99
	local var_7_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_9:RegisterAnimationSequence("Season17", var_7_100)

	local var_7_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 565
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 845
		}
	}

	var_7_11:RegisterAnimationSequence("Season17", var_7_101)

	local var_7_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/7_NEW_PRESTIGE"))
		}
	}

	var_7_15:RegisterAnimationSequence("Season17", var_7_102)

	local var_7_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_BLUEPRINT"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_17:RegisterAnimationSequence("Season17", var_7_103)

	local var_7_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/NEW_SEASON_CHALLNGES_13"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 518
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_7_19:RegisterAnimationSequence("Season17", var_7_104)

	local var_7_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SEASON_14_TITLE"))
		}
	}

	var_7_21:RegisterAnimationSequence("Season17", var_7_105)

	local var_7_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_23:RegisterAnimationSequence("Season17", var_7_106)

	local var_7_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_25:RegisterAnimationSequence("Season17", var_7_107)

	local var_7_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_27:RegisterAnimationSequence("Season17", var_7_108)

	local var_7_109 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/SEASON_EXPLANATION")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1610
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		}
	}

	var_7_29:RegisterAnimationSequence("Season17", var_7_109)

	local var_7_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MILITARY_RANK_EXPLANIATION"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 932
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 956
		}
	}

	var_7_31:RegisterAnimationSequence("Season17", var_7_110)

	local function var_7_111()
		var_7_9:AnimateSequence("Season17")
		var_7_11:AnimateSequence("Season17")
		var_7_15:AnimateSequence("Season17")
		var_7_17:AnimateSequence("Season17")
		var_7_19:AnimateSequence("Season17")
		var_7_21:AnimateSequence("Season17")
		var_7_23:AnimateSequence("Season17")
		var_7_25:AnimateSequence("Season17")
		var_7_27:AnimateSequence("Season17")
		var_7_29:AnimateSequence("Season17")
		var_7_31:AnimateSequence("Season17")
	end

	var_7_0._sequences.Season17 = var_7_111

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ProgressionTitleTransitionPopup", ProgressionTitleTransitionPopup)
LockTable(_M)
