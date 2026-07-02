module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Challenge.GetCombinedDailyChallenges(arg_1_1)

	if var_1_0 and #var_1_0 > 0 then
		local var_1_1 = math.min(#var_1_0, #arg_1_0._dailyChallengeItems)

		if var_1_1 == 1 then
			ACTIONS.AnimateSequence(arg_1_0, "DailyX1")
		elseif var_1_1 == 2 then
			ACTIONS.AnimateSequence(arg_1_0, "DailyX2")
		end

		if not (CONDITIONS.IsMagmaGameMode() or CONDITIONS.IsBRTDMGameType()) and not CONDITIONS.IsThirdGameMode() then
			Challenge.SortByNearestComplete(var_1_0)
		end

		for iter_1_0 = 1, var_1_1 do
			arg_1_0._dailyChallengeItems[iter_1_0]:SetData(var_1_0[iter_1_0])

			if Dvar.IBEGCHEFE("LLQKSNOSS") then
				arg_1_0._dailyChallengeItems[iter_1_0]:SetDifficulty(var_1_0[iter_1_0])
			end
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideDaily")
	end

	Challenge.SetupDailyResetTimer(arg_1_0.ChallengeResetTimer, arg_1_0.ChallengeResetTimer.Text)
	arg_1_0.ChallengeResetTimer:SetupAlignment()
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Challenge.ActivationCategoryMP

	if CONDITIONS.IsBRGameType() or not Engine.CFHBIHABCB(arg_2_1) then
		var_2_0 = Challenge.ActivationCategoryBR
	elseif CONDITIONS.IsThirdGameMode() then
		var_2_0 = Challenge.ActivationCategoryCP
	end

	local var_2_1 = Challenge.GetActiveMissionData(arg_2_1, var_2_0)

	if var_2_1 then
		arg_2_0.MissionHeader.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSION_N", var_2_1.name))
		arg_2_0.Mission:SetData(var_2_1, true)
	else
		ACTIONS.AnimateSequence(arg_2_0.Mission, "TitleOnly")
		arg_2_0.Mission.Title:setText(Engine.CBBHFCGDIC("CHALLENGE/ACTIVATE_MISSION_MSG"))

		if IsLanguageArabic() then
			arg_2_0.Mission.Title:SetBottom(20)
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Mission:SetAlpha(arg_3_2 and 1 or 0)
	arg_3_0.MissionBackground:SetAlpha(arg_3_2 and 1 or 0)
	arg_3_0.MissionHeader:SetAlpha(arg_3_2 and 1 or 0)
end

local function var_0_3(arg_4_0)
	return arg_4_0.ViewChallengesPrompt
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.Daily1)
	assert(arg_5_0.Daily2)
	assert(arg_5_0.Daily3)
	assert(arg_5_0.ViewChallengesPrompt)

	arg_5_0.GetPromptContainer = var_0_3
	arg_5_0.SetupMissionChallengeVisibility = var_0_2

	arg_5_0.ChallengeResetTimer:SetupRightAlignment()

	arg_5_0._dailyChallengeItems = {
		arg_5_0.Daily1,
		arg_5_0.Daily2,
		arg_5_0.Daily3
	}

	var_0_0(arg_5_0, arg_5_1)
	var_0_1(arg_5_0, arg_5_1)

	local function var_5_0(arg_6_0, arg_6_1)
		if CONDITIONS.InFrontend() then
			if LUI.IsLastInputKeyboardMouse(arg_6_1.controllerIndex) then
				ACTIONS.AnimateSequence(arg_6_0, "PC")
			else
				ACTIONS.AnimateSequence(arg_6_0, "Console")
			end
		end
	end

	arg_5_0:addAndCallEventHandler("update_input_type", var_5_0, {
		controllerIndex = arg_5_1
	})

	if not CONDITIONS.InFrontend() then
		ACTIONS.AnimateSequence(arg_5_0, "HidePrompts")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	end

	arg_5_0:addEventHandler("new_daily_challenges", function(arg_7_0, arg_7_1)
		var_0_0(arg_7_0, arg_5_1)
	end)
	arg_5_0:addEventHandler("new_br_daily_challenges", function(arg_8_0, arg_8_1)
		var_0_0(arg_8_0, arg_5_1)
	end)
end

function ChallengesSummary(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 454 * _1080p)

	var_9_0.id = "ChallengesSummary"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Background"

	var_9_4:SetAlpha(0.5, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 156, _1080p * 460)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "MissionBackground"

	var_9_6:SetAlpha(0.5, 0)
	var_9_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 141)
	var_9_0:addElement(var_9_6)

	var_9_0.MissionBackground = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "Daily1"

	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 202, _1080p * 278)
	var_9_0:addElement(var_9_8)

	var_9_0.Daily1 = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "Daily2"

	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 278, _1080p * 354)
	var_9_0:addElement(var_9_10)

	var_9_0.Daily2 = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "Daily3"

	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 354, _1080p * 430)
	var_9_0:addElement(var_9_12)

	var_9_0.Daily3 = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("ChallengesSummaryItem", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "Mission"

	var_9_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 400, _1080p * 54, _1080p * 130)
	var_9_0:addElement(var_9_14)

	var_9_0.Mission = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "ChallengeHeader"

	var_9_16.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/DAILY_CHALLENGES"), 0)
	var_9_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 263, _1080p * 156, _1080p * 202)
	var_9_0:addElement(var_9_16)

	var_9_0.ChallengeHeader = var_9_16

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "MissionHeader"

	var_9_18.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/ACTIVE_MISSION"), 0)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 46)
	var_9_0:addElement(var_9_18)

	var_9_0.MissionHeader = var_9_18

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "ViewChallengesPrompt"

	if CONDITIONS.AlwaysFalse(var_9_0) then
		var_9_20.Label:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT"), 0)
	end

	var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 170, _1080p * 457, _1080p * 488)
	var_9_0:addElement(var_9_20)

	var_9_0.ViewChallengesPrompt = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIStyledText.new()

	var_9_22.id = "ViewChallengesLabel"

	var_9_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_22:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_ALL_PROMPT_CONTROLLER"), 0)
	var_9_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_22:SetWordWrap(false)
	var_9_22:SetAlignment(LUI.Alignment.Left)
	var_9_22:SetTintFontIcons(true)
	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 302, _1080p * 457, _1080p * 479)
	var_9_0:addElement(var_9_22)

	var_9_0.ViewChallengesLabel = var_9_22

	local var_9_23

	if CONDITIONS.InGame(var_9_0) then
		var_9_23 = MenuBuilder.BuildRegisteredType("DoubleXPNotifications", {
			controllerIndex = var_9_1
		})
		var_9_23.id = "DoubleXPNotifications"

		var_9_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 46, _1080p * 430, _1080p * 465, _1080p * 595)
		var_9_0:addElement(var_9_23)

		var_9_0.DoubleXPNotifications = var_9_23
	end

	local var_9_24
	local var_9_25 = MenuBuilder.BuildRegisteredType("ChallengeResetTimer", {
		controllerIndex = var_9_1
	})

	var_9_25.id = "ChallengeResetTimer"

	var_9_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 322, _1080p * 400, _1080p * 167, _1080p * 197)
	var_9_0:addElement(var_9_25)

	var_9_0.ChallengeResetTimer = var_9_25

	local function var_9_26()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_26

	local var_9_27
	local var_9_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("HideDaily", var_9_28)

	local var_9_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("HideDaily", var_9_29)

	local var_9_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("HideDaily", var_9_30)

	local var_9_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("HideDaily", var_9_31)

	local var_9_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("HideDaily", var_9_32)

	local var_9_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		}
	}

	var_9_20:RegisterAnimationSequence("HideDaily", var_9_33)

	local var_9_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 144
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 166
		}
	}

	var_9_22:RegisterAnimationSequence("HideDaily", var_9_34)

	if CONDITIONS.InGame(var_9_0) then
		local var_9_35 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 152
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 272
			}
		}

		var_9_23:RegisterAnimationSequence("HideDaily", var_9_35)
	end

	local function var_9_36()
		var_9_4:AnimateSequence("HideDaily")
		var_9_8:AnimateSequence("HideDaily")
		var_9_10:AnimateSequence("HideDaily")
		var_9_12:AnimateSequence("HideDaily")
		var_9_16:AnimateSequence("HideDaily")
		var_9_20:AnimateSequence("HideDaily")
		var_9_22:AnimateSequence("HideDaily")

		if CONDITIONS.InGame(var_9_0) then
			var_9_23:AnimateSequence("HideDaily")
		end
	end

	var_9_0._sequences.HideDaily = var_9_36

	local var_9_37
	local var_9_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 302
		}
	}

	var_9_4:RegisterAnimationSequence("DailyX1", var_9_38)

	local var_9_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("DailyX1", var_9_39)

	local var_9_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DailyX1", var_9_40)

	local var_9_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DailyX1", var_9_41)

	local var_9_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 336
		}
	}

	var_9_20:RegisterAnimationSequence("DailyX1", var_9_42)

	local var_9_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 305
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		}
	}

	var_9_22:RegisterAnimationSequence("DailyX1", var_9_43)

	if CONDITIONS.InGame(var_9_0) then
		local var_9_44 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 313
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 433
			}
		}

		var_9_23:RegisterAnimationSequence("DailyX1", var_9_44)
	end

	local function var_9_45()
		var_9_4:AnimateSequence("DailyX1")
		var_9_8:AnimateSequence("DailyX1")
		var_9_10:AnimateSequence("DailyX1")
		var_9_12:AnimateSequence("DailyX1")
		var_9_20:AnimateSequence("DailyX1")
		var_9_22:AnimateSequence("DailyX1")

		if CONDITIONS.InGame(var_9_0) then
			var_9_23:AnimateSequence("DailyX1")
		end
	end

	var_9_0._sequences.DailyX1 = var_9_45

	local var_9_46
	local var_9_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 378
		}
	}

	var_9_4:RegisterAnimationSequence("DailyX2", var_9_47)

	local var_9_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("DailyX2", var_9_48)

	local var_9_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("DailyX2", var_9_49)

	local var_9_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("DailyX2", var_9_50)

	local var_9_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 412
		}
	}

	var_9_20:RegisterAnimationSequence("DailyX2", var_9_51)

	local var_9_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 381
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 403
		}
	}

	var_9_22:RegisterAnimationSequence("DailyX2", var_9_52)

	if CONDITIONS.InGame(var_9_0) then
		local var_9_53 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 389
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 509
			}
		}

		var_9_23:RegisterAnimationSequence("DailyX2", var_9_53)
	end

	local function var_9_54()
		var_9_4:AnimateSequence("DailyX2")
		var_9_8:AnimateSequence("DailyX2")
		var_9_10:AnimateSequence("DailyX2")
		var_9_12:AnimateSequence("DailyX2")
		var_9_20:AnimateSequence("DailyX2")
		var_9_22:AnimateSequence("DailyX2")

		if CONDITIONS.InGame(var_9_0) then
			var_9_23:AnimateSequence("DailyX2")
		end
	end

	var_9_0._sequences.DailyX2 = var_9_54

	local var_9_55
	local var_9_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("PC", var_9_56)

	local var_9_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("PC", var_9_57)

	local function var_9_58()
		var_9_20:AnimateSequence("PC")
		var_9_22:AnimateSequence("PC")
	end

	var_9_0._sequences.PC = var_9_58

	local var_9_59
	local var_9_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("Console", var_9_60)

	local var_9_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("Console", var_9_61)

	local function var_9_62()
		var_9_20:AnimateSequence("Console")
		var_9_22:AnimateSequence("Console")
	end

	var_9_0._sequences.Console = var_9_62

	local var_9_63
	local var_9_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_20:RegisterAnimationSequence("HidePrompts", var_9_64)

	local var_9_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("HidePrompts", var_9_65)

	local function var_9_66()
		var_9_20:AnimateSequence("HidePrompts")
		var_9_22:AnimateSequence("HidePrompts")
	end

	var_9_0._sequences.HidePrompts = var_9_66

	local var_9_67
	local var_9_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("HideAll", var_9_68)

	local var_9_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("HideAll", var_9_69)

	local var_9_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("HideAll", var_9_70)

	local var_9_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("HideAll", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("HideAll", var_9_72)

	local var_9_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("HideAll", var_9_73)

	local var_9_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("HideAll", var_9_74)

	local var_9_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_18:RegisterAnimationSequence("HideAll", var_9_75)

	if CONDITIONS.InGame(var_9_0) then
		local var_9_76 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 120
			}
		}

		var_9_23:RegisterAnimationSequence("HideAll", var_9_76)
	end

	local function var_9_77()
		var_9_4:AnimateSequence("HideAll")
		var_9_6:AnimateSequence("HideAll")
		var_9_8:AnimateSequence("HideAll")
		var_9_10:AnimateSequence("HideAll")
		var_9_12:AnimateSequence("HideAll")
		var_9_14:AnimateSequence("HideAll")
		var_9_16:AnimateSequence("HideAll")
		var_9_18:AnimateSequence("HideAll")

		if CONDITIONS.InGame(var_9_0) then
			var_9_23:AnimateSequence("HideAll")
		end
	end

	var_9_0._sequences.HideAll = var_9_77

	local function var_9_78()
		return
	end

	var_9_0._sequences.AR = var_9_78

	local function var_9_79()
		return
	end

	var_9_0._sequences.TimerBlink = var_9_79

	local var_9_80
	local var_9_81 = {
		{
			value = -0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 333
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 411
		}
	}

	var_9_25:RegisterAnimationSequence("JP", var_9_81)

	local function var_9_82()
		var_9_25:AnimateSequence("JP")
	end

	var_9_0._sequences.JP = var_9_82

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("ChallengesSummary", ChallengesSummary)
LockTable(_M)
