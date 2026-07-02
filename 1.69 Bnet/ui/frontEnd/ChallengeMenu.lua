module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 and arg_1_0.ChallengeMenuButtons[arg_1_1] and arg_1_0.ChallengeMenuButtons:GetIndexForElement(arg_1_0.ChallengeMenuButtons[arg_1_1]) then
		arg_1_0.ChallengeMenuButtons:processEvent({
			name = "lose_focus"
		})
		arg_1_0.ChallengeMenuButtons[arg_1_1]:processEvent({
			name = "gain_focus"
		})
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0._shouldShowMasterChallenges then
		ACTIONS.AnimateSequence(arg_2_0, "ShowMasterChallenges")
	else
		ACTIONS.AnimateSequence(arg_2_0, "HideAll")
	end

	arg_2_0.MissionDetails:DisableChildEventHandler()

	arg_2_0._missionDetailsVisible = false
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.CurrentMasterChallenges:SetupChallenges(arg_3_1)
end

local function var_0_3(arg_4_0)
	if arg_4_0._displayMission then
		arg_4_0._missionDetailsVisible = true

		arg_4_0.MissionDetails:EnableChildEventHandler()
		arg_4_0.MissionDetails:SetData(arg_4_0._displayMission)
		ACTIONS.AnimateSequence(arg_4_0, "ShowMissions")
	else
		arg_4_0.MissionDetails:DisableChildEventHandler()

		arg_4_0._missionDetailsVisible = false

		ACTIONS.AnimateSequence(arg_4_0, "HideAll")
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	if not CONDITIONS.IsMagmaGameMode() then
		if CONDITIONS.IsThirdGameMode() then
			local var_5_0 = Quests.BCIHEIDCGD(arg_5_1, Challenge.ActivationCategoryCP)

			local function var_5_1(arg_6_0)
				return var_5_0 == tonumber(arg_6_0.id)
			end

			local var_5_2 = Challenge.GetQuestsForMissionChallenges(arg_5_1, {
				Challenge.CPCategory
			})
			local var_5_3 = Challenge.GetMissionsForQuests(arg_5_1, var_5_2, nil, var_5_1, nil)

			if var_5_3 then
				Challenge.SortMissionChallenges(var_5_3)

				arg_5_0._displayMission = var_5_3[1]
				arg_5_0._displayMissionString = "LUA_MENU/TAC_OPS"
			end
		else
			local var_5_4 = Quests.BCIHEIDCGD(arg_5_1, Challenge.ActivationCategoryMP)

			local function var_5_5(arg_7_0)
				return var_5_4 == tonumber(arg_7_0.id)
			end

			local var_5_6 = Challenge.GetQuestsForMissionChallenges(arg_5_1, {
				Challenge.allCategory,
				Challenge.PS4Category
			})
			local var_5_7 = Challenge.GetMissionsForQuests(arg_5_1, var_5_6, nil, var_5_5, nil)

			if var_5_7 then
				Challenge.SortMissionChallenges(var_5_7)

				arg_5_0._displayMission = var_5_7[1]
				arg_5_0._displayMissionString = "CHALLENGE/CORE"
			end
		end
	else
		local var_5_8 = Quests.BCIHEIDCGD(arg_5_1, Challenge.ActivationCategoryBR)

		local function var_5_9(arg_8_0)
			return var_5_8 == tonumber(arg_8_0.id)
		end

		local var_5_10 = Challenge.GetQuestsForMissionChallenges(arg_5_1, {
			Challenge.BRCategory
		})
		local var_5_11 = Challenge.GetMissionsForQuests(arg_5_1, var_5_10, nil, var_5_9, nil)

		if var_5_11 then
			Challenge.SortMissionChallenges(var_5_11)

			arg_5_0._displayMission = var_5_11[1]
			arg_5_0._displayMissionString = "CHALLENGE/WARZONE"
		end
	end
end

local function var_0_5(arg_9_0)
	if arg_9_0._shouldShowWeeklies then
		ACTIONS.AnimateSequence(arg_9_0, "ShowWeeklies")
	else
		ACTIONS.AnimateSequence(arg_9_0, "HideAll")
	end

	arg_9_0.MissionDetails:DisableChildEventHandler()

	arg_9_0._missionDetailsVisible = false
end

local function var_0_6(arg_10_0, arg_10_1)
	local var_10_0, var_10_1 = Challenge.GetWeeklyChallenges(arg_10_1, Challenge.Type.WEEKLY)
	local var_10_2, var_10_3 = Challenge.GetWeeklyChallenges(arg_10_1, Challenge.Type.BR_WEEKLY)

	if not var_10_1 or not var_10_3 or var_10_1 ~= var_10_3 then
		return
	end

	local var_10_4 = var_10_0[var_10_1]
	local var_10_5 = var_10_2[var_10_3]
	local var_10_6 = Challenge.GetCurrentWeekChallengesData(arg_10_1, var_10_4, var_10_5)

	arg_10_0.CurrentWeekChallenges:PopulateWeeklyChallenges(arg_10_1, var_10_1, var_10_6)

	arg_10_0._shouldShowWeeklies = true
	arg_10_0._missionDetailsVisible = false
end

local function var_0_7(arg_11_0)
	if arg_11_0._shouldShowDailies then
		ACTIONS.AnimateSequence(arg_11_0, CONDITIONS.IsWZWipFlowEnabled() and "WZWipShowDailies" or "ShowDailies")
	else
		ACTIONS.AnimateSequence(arg_11_0, "HideAll")
	end

	arg_11_0.MissionDetails:DisableChildEventHandler()

	arg_11_0._missionDetailsVisible = false
end

local function var_0_8(arg_12_0, arg_12_1)
	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_12_0._shouldShowDailies = true

		return
	end

	local var_12_0 = Challenge.GetBRDailyChallenges(arg_12_1)
	local var_12_1 = Challenge.GetDailyChallenges(arg_12_1)
	local var_12_2 = Challenge.GetCPDailyChallenges(arg_12_1)

	if not var_12_0 and not var_12_1 then
		return
	end

	arg_12_0.ChallengesDaily:Setup(arg_12_1, var_12_0, var_12_1, var_12_2)

	arg_12_0._shouldShowDailies = true
end

local function var_0_9(arg_13_0)
	if arg_13_0._shouldShowSeasonal then
		ACTIONS.AnimateSequence(arg_13_0, "ShowSeasonal")
	else
		ACTIONS.AnimateSequence(arg_13_0, "HideAll")
	end

	arg_13_0.MissionDetails:DisableChildEventHandler()

	arg_13_0._seasonalDetailsVisible = false
end

local function var_0_10(arg_14_0, arg_14_1)
	if CONDITIONS.IsPostSeason() then
		arg_14_0._shouldShowSeasonal = false

		return
	end

	local var_14_0 = SEASON.GetCurrentSeasonDisplayNum()

	arg_14_0.PrestigeProgressBar:UpdateContentForSeason(arg_14_1, var_14_0)
	arg_14_0.ProgressionChallengeContainerPreview:processEvent({
		name = "lose_focus",
		controller = arg_14_0._controllerIndex
	})

	arg_14_0.ProgressionChallengeContainerPreview._blockMouseMove = true

	arg_14_0.ProgressionChallengeContainerPreview:SetMouseFocusBlocker(true)
	arg_14_0.ProgressionChallengeContainerPreview:UpdateContentForSeason(arg_14_1, var_14_0)
	ACTIONS.AnimateSequence(arg_14_0.ProgressionChallengeContainerPreview, "Preview")

	arg_14_0._shouldShowSeasonal = true
end

local function var_0_11(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._controllerIndex = arg_15_1
	arg_15_0.ShowMissions = var_0_3
	arg_15_0.ShowWeeklies = var_0_5
	arg_15_0.ShowDailies = var_0_7
	arg_15_0.ShowMasterChallenges = var_0_1
	arg_15_0.ShowSeasonal = var_0_9

	var_0_4(arg_15_0, arg_15_1)
	var_0_6(arg_15_0, arg_15_1)
	var_0_8(arg_15_0, arg_15_1)
	var_0_10(arg_15_0, arg_15_1)
	arg_15_0.MissionDetails:DisableChildEventHandler()

	if Dvar.IBEGCHEFE("MSSTOMNNMR") then
		var_0_2(arg_15_0, arg_15_1)

		arg_15_0._shouldShowMasterChallenges = true
	end

	ACTIONS.AnimateSequence(arg_15_0, "HideAll")
	arg_15_0.ChallengeMenuButtons:SetupButtons(arg_15_1, arg_15_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_15_0, arg_15_1)
	ACTIONS.ScaleFullscreen(arg_15_0.Darken)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_15_0)

		if not Onboarding.MasteryChallengesCH2WZDaily.WasCompleted(arg_15_0, arg_15_1) then
			LUI.FlowManager.RequestPopupMenu(arg_15_0, "onboardingpopup", true, arg_15_1, false, ONBOARDING_DATA.GetOnboardingCH2WZMasteryChallengesDailyData())
			Onboarding.MasteryChallengesCH2WZDaily.MarkCompleted(arg_15_0, arg_15_1)
		end
	elseif not Onboarding.MasterChallenges.WasCompleted(arg_15_0, arg_15_1) then
		LUI.FlowManager.RequestPopupMenu(arg_15_0, "onboardingpopup", true, arg_15_1, false, ONBOARDING_DATA.GetOnboardingMasterChallengesData())
		Onboarding.MasterChallenges.MarkCompleted(arg_15_0, arg_15_1)
	end

	arg_15_0._missionDetailsVisible = false
	arg_15_0.BindButton = LUI.UIBindButton.new()
	arg_15_0.BindButton.id = "BindButton"

	arg_15_0.BindButton:addElementBefore(arg_15_0.MissionDetails)
	arg_15_0.BindButton:registerEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		return not arg_15_0._missionDetailsVisible
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		arg_15_0.WZWipChallengesDaily:SetHeaderText("CHALLENGE/SELECT_A_DAILY_CHALLENGE_X_RESERVES_PARTIAL_CAPS")
		arg_15_0.WZWipChallengesDaily:processEvent({
			name = "lose_focus",
			controller = arg_15_0._controllerIndex
		})

		arg_15_0.WZWipChallengesDaily._blockMouseMove = true

		arg_15_0.WZWipChallengesDaily:SetMouseFocusBlocker(true)
	end
end

function ChallengeMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "ChallengeMenu"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = {
		worldBlur = 1,
		controllerIndex = var_17_1
	}
	local var_17_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_17_4)

	var_17_5.id = "WorldBlur"

	var_17_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_17_0:addElement(var_17_5)

	var_17_0.WorldBlur = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIImage.new()

	var_17_7.id = "Darken"

	var_17_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_7:SetAlpha(0.8, 0)
	var_17_0:addElement(var_17_7)

	var_17_0.Darken = var_17_7

	local var_17_8

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_17_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
			controllerIndex = var_17_1
		})

		var_17_9.id = "Vignette"

		var_17_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		var_17_0:addElement(var_17_9)

		var_17_0.Vignette = var_17_9
	end

	local var_17_10
	local var_17_11 = MenuBuilder.BuildRegisteredType("ChallengeMenuButtons", {
		controllerIndex = var_17_1
	})

	var_17_11.id = "ChallengeMenuButtons"

	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 925)
	var_17_0:addElement(var_17_11)

	var_17_0.ChallengeMenuButtons = var_17_11

	local var_17_12
	local var_17_13 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetails", {
		controllerIndex = var_17_1
	})

	var_17_13.id = "MissionDetails"

	var_17_13:SetAlpha(0, 0)
	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1767, _1080p * 216, _1080p * 991)
	var_17_0:addElement(var_17_13)

	var_17_0.MissionDetails = var_17_13

	local var_17_14
	local var_17_15 = MenuBuilder.BuildRegisteredType("CurrentWeekChallenges", {
		controllerIndex = var_17_1
	})

	var_17_15.id = "CurrentWeekChallenges"

	var_17_15:SetAlpha(0, 0)
	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1617, _1080p * 216, _1080p * 995)
	var_17_0:addElement(var_17_15)

	var_17_0.CurrentWeekChallenges = var_17_15

	local var_17_16

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_17_16 = MenuBuilder.BuildRegisteredType("ChallengesDaily", {
			controllerIndex = var_17_1
		})
		var_17_16.id = "ChallengesDaily"

		var_17_16:SetAlpha(0, 0)
		var_17_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1607, _1080p * 216, _1080p * 995)
		var_17_0:addElement(var_17_16)

		var_17_0.ChallengesDaily = var_17_16
	end

	local var_17_17
	local var_17_18 = MenuBuilder.BuildRegisteredType("CurrentMasterChallenges", {
		controllerIndex = var_17_1
	})

	var_17_18.id = "CurrentMasterChallenges"

	var_17_18:SetAlpha(0, 0)
	var_17_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 601, _1080p * 1661, _1080p * 182, _1080p * 961)
	var_17_0:addElement(var_17_18)

	var_17_0.CurrentMasterChallenges = var_17_18

	local var_17_19

	if CONDITIONS.IsWZWipFlowEnabled() then
		var_17_19 = MenuBuilder.BuildRegisteredType("WZChallengesDaily", {
			controllerIndex = var_17_1
		})
		var_17_19.id = "WZWipChallengesDaily"

		var_17_19:SetAlpha(0, 0)
		var_17_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1752, _1080p * 216, _1080p * 934)
		var_17_0:addElement(var_17_19)

		var_17_0.WZWipChallengesDaily = var_17_19
	end

	local var_17_20
	local var_17_21 = MenuBuilder.BuildRegisteredType("ProgressionChallengeContainer", {
		controllerIndex = var_17_1
	})

	var_17_21.id = "ProgressionChallengeContainerPreview"

	var_17_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 625, _1080p * 1715, _1080p * 368, _1080p * 1020)
	var_17_0:addElement(var_17_21)

	var_17_0.ProgressionChallengeContainerPreview = var_17_21

	local var_17_22
	local var_17_23 = MenuBuilder.BuildRegisteredType("PrestigeProgressBar", {
		controllerIndex = var_17_1
	})

	var_17_23.id = "PrestigeProgressBar"

	var_17_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 625, _1080p * 1715, _1080p * 226, _1080p * 351)
	var_17_0:addElement(var_17_23)

	var_17_0.PrestigeProgressBar = var_17_23

	local function var_17_24()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_24

	local var_17_25
	local var_17_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("ShowMissions", var_17_26)

	local var_17_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowMissions", var_17_27)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_28 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("ShowMissions", var_17_28)
	end

	local var_17_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowMissions", var_17_29)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_30 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("ShowMissions", var_17_30)
	end

	local var_17_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("ShowMissions", var_17_31)

	local var_17_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("ShowMissions", var_17_32)

	local function var_17_33()
		var_17_13:AnimateSequence("ShowMissions")
		var_17_15:AnimateSequence("ShowMissions")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("ShowMissions")
		end

		var_17_18:AnimateSequence("ShowMissions")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("ShowMissions")
		end

		var_17_21:AnimateSequence("ShowMissions")
		var_17_23:AnimateSequence("ShowMissions")
	end

	var_17_0._sequences.ShowMissions = var_17_33

	local var_17_34
	local var_17_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("ShowWeeklies", var_17_35)

	local var_17_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowWeeklies", var_17_36)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("ShowWeeklies", var_17_37)
	end

	local var_17_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowWeeklies", var_17_38)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_39 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("ShowWeeklies", var_17_39)
	end

	local var_17_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("ShowWeeklies", var_17_40)

	local var_17_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("ShowWeeklies", var_17_41)

	local function var_17_42()
		var_17_13:AnimateSequence("ShowWeeklies")
		var_17_15:AnimateSequence("ShowWeeklies")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("ShowWeeklies")
		end

		var_17_18:AnimateSequence("ShowWeeklies")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("ShowWeeklies")
		end

		var_17_21:AnimateSequence("ShowWeeklies")
		var_17_23:AnimateSequence("ShowWeeklies")
	end

	var_17_0._sequences.ShowWeeklies = var_17_42

	local var_17_43
	local var_17_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("ShowDailies", var_17_44)

	local var_17_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowDailies", var_17_45)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_46 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("ShowDailies", var_17_46)
	end

	local var_17_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowDailies", var_17_47)

	local var_17_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("ShowDailies", var_17_48)

	local var_17_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("ShowDailies", var_17_49)

	local function var_17_50()
		var_17_13:AnimateSequence("ShowDailies")
		var_17_15:AnimateSequence("ShowDailies")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("ShowDailies")
		end

		var_17_18:AnimateSequence("ShowDailies")
		var_17_21:AnimateSequence("ShowDailies")
		var_17_23:AnimateSequence("ShowDailies")
	end

	var_17_0._sequences.ShowDailies = var_17_50

	local var_17_51
	local var_17_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("HideAll", var_17_52)

	local var_17_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("HideAll", var_17_53)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("HideAll", var_17_54)
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_55 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("HideAll", var_17_55)
	end

	local var_17_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("HideAll", var_17_56)

	local var_17_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("HideAll", var_17_57)

	local function var_17_58()
		var_17_13:AnimateSequence("HideAll")
		var_17_15:AnimateSequence("HideAll")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("HideAll")
		end

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("HideAll")
		end

		var_17_21:AnimateSequence("HideAll")
		var_17_23:AnimateSequence("HideAll")
	end

	var_17_0._sequences.HideAll = var_17_58

	local var_17_59
	local var_17_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("ShowMasterChallenges", var_17_60)

	local var_17_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowMasterChallenges", var_17_61)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_62 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("ShowMasterChallenges", var_17_62)
	end

	local var_17_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowMasterChallenges", var_17_63)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_64 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("ShowMasterChallenges", var_17_64)
	end

	local var_17_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("ShowMasterChallenges", var_17_65)

	local var_17_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("ShowMasterChallenges", var_17_66)

	local function var_17_67()
		var_17_13:AnimateSequence("ShowMasterChallenges")
		var_17_15:AnimateSequence("ShowMasterChallenges")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("ShowMasterChallenges")
		end

		var_17_18:AnimateSequence("ShowMasterChallenges")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("ShowMasterChallenges")
		end

		var_17_21:AnimateSequence("ShowMasterChallenges")
		var_17_23:AnimateSequence("ShowMasterChallenges")
	end

	var_17_0._sequences.ShowMasterChallenges = var_17_67

	local var_17_68
	local var_17_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("WZWipShowDailies", var_17_69)

	local var_17_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("WZWipShowDailies", var_17_70)

	local var_17_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("WZWipShowDailies", var_17_71)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_72 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("WZWipShowDailies", var_17_72)
	end

	local var_17_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("WZWipShowDailies", var_17_73)

	local var_17_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("WZWipShowDailies", var_17_74)

	local function var_17_75()
		var_17_13:AnimateSequence("WZWipShowDailies")
		var_17_15:AnimateSequence("WZWipShowDailies")
		var_17_18:AnimateSequence("WZWipShowDailies")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("WZWipShowDailies")
		end

		var_17_21:AnimateSequence("WZWipShowDailies")
		var_17_23:AnimateSequence("WZWipShowDailies")
	end

	var_17_0._sequences.WZWipShowDailies = var_17_75

	local var_17_76
	local var_17_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_13:RegisterAnimationSequence("ShowSeasonal", var_17_77)

	local var_17_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowSeasonal", var_17_78)

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_79 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_16:RegisterAnimationSequence("ShowSeasonal", var_17_79)
	end

	local var_17_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_18:RegisterAnimationSequence("ShowSeasonal", var_17_80)

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_17_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_17_19:RegisterAnimationSequence("ShowSeasonal", var_17_81)
	end

	local var_17_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_21:RegisterAnimationSequence("ShowSeasonal", var_17_82)

	local var_17_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_23:RegisterAnimationSequence("ShowSeasonal", var_17_83)

	local function var_17_84()
		var_17_13:AnimateSequence("ShowSeasonal")
		var_17_15:AnimateSequence("ShowSeasonal")

		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_17_16:AnimateSequence("ShowSeasonal")
		end

		var_17_18:AnimateSequence("ShowSeasonal")

		if CONDITIONS.IsWZWipFlowEnabled() then
			var_17_19:AnimateSequence("ShowSeasonal")
		end

		var_17_21:AnimateSequence("ShowSeasonal")
		var_17_23:AnimateSequence("ShowSeasonal")
	end

	var_17_0._sequences.ShowSeasonal = var_17_84

	local var_17_85
	local var_17_86 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_7:RegisterAnimationSequence("WZWipSetup", var_17_86)

	local function var_17_87()
		var_17_7:AnimateSequence("WZWipSetup")
	end

	var_17_0._sequences.WZWipSetup = var_17_87

	var_0_11(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("ChallengeMenu", ChallengeMenu)
LockTable(_M)
