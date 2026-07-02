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
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.CurrentMasterChallenges:SetupChallenges(arg_3_1)
end

local function var_0_3(arg_4_0)
	if arg_4_0._displayMission then
		arg_4_0.MissionDetails:SetData(arg_4_0._displayMission)
		ACTIONS.AnimateSequence(arg_4_0, "ShowMissions")
	else
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
end

local function var_0_7(arg_11_0)
	if arg_11_0._shouldShowDailies then
		ACTIONS.AnimateSequence(arg_11_0, "ShowDailies")
	else
		ACTIONS.AnimateSequence(arg_11_0, "HideAll")
	end
end

local function var_0_8(arg_12_0, arg_12_1)
	local var_12_0 = Challenge.GetBRDailyChallenges(arg_12_1)
	local var_12_1 = Challenge.GetDailyChallenges(arg_12_1)
	local var_12_2 = Challenge.GetCPDailyChallenges(arg_12_1)

	if not var_12_0 and not var_12_1 then
		return
	end

	arg_12_0.ChallengesDaily:Setup(arg_12_1, var_12_0, var_12_1, var_12_2)

	arg_12_0._shouldShowDailies = true
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.ShowMissions = var_0_3
	arg_13_0.ShowWeeklies = var_0_5
	arg_13_0.ShowDailies = var_0_7
	arg_13_0.ShowMasterChallenges = var_0_1

	var_0_4(arg_13_0, arg_13_1)
	var_0_6(arg_13_0, arg_13_1)
	var_0_8(arg_13_0, arg_13_1)

	if Dvar.IBEGCHEFE("MSSTOMNNMR") and (PROGRESSION.GetMaxRank() < PROGRESSION.GetPlayerRank(arg_13_1) + 1 or CONDITIONS.IsDevelopmentBuild()) then
		var_0_2(arg_13_0, arg_13_1)

		arg_13_0._shouldShowMasterChallenges = true
	end

	arg_13_0.ChallengeMenuButtons:SetupButtons(arg_13_1, arg_13_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_13_0, arg_13_1)
	ACTIONS.ScaleFullscreen(arg_13_0.Darken)

	if not Onboarding.MasterChallenges.WasCompleted(arg_13_0, arg_13_1) then
		LUI.FlowManager.RequestPopupMenu(arg_13_0, "onboardingpopup", true, arg_13_1, false, ONBOARDING_DATA.GetOnboardingMasterChallengesData())
		Onboarding.MasterChallenges.MarkCompleted(arg_13_0, arg_13_1)
	end
end

function ChallengeMenu(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "ChallengeMenu"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = {
		worldBlur = 1,
		controllerIndex = var_14_1
	}
	local var_14_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_14_4)

	var_14_5.id = "WorldBlur"

	var_14_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_14_0:addElement(var_14_5)

	var_14_0.WorldBlur = var_14_5

	local var_14_6
	local var_14_7 = LUI.UIImage.new()

	var_14_7.id = "Darken"

	var_14_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_7:SetAlpha(0.5, 0)
	var_14_0:addElement(var_14_7)

	var_14_0.Darken = var_14_7

	local var_14_8
	local var_14_9 = MenuBuilder.BuildRegisteredType("ChallengeMenuButtons", {
		controllerIndex = var_14_1
	})

	var_14_9.id = "ChallengeMenuButtons"

	var_14_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 925)
	var_14_0:addElement(var_14_9)

	var_14_0.ChallengeMenuButtons = var_14_9

	local var_14_10
	local var_14_11 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetails", {
		controllerIndex = var_14_1
	})

	var_14_11.id = "MissionDetails"

	var_14_11:SetAlpha(0, 0)
	var_14_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1767, _1080p * 216, _1080p * 991)
	var_14_0:addElement(var_14_11)

	var_14_0.MissionDetails = var_14_11

	local var_14_12
	local var_14_13 = MenuBuilder.BuildRegisteredType("CurrentWeekChallenges", {
		controllerIndex = var_14_1
	})

	var_14_13.id = "CurrentWeekChallenges"

	var_14_13:SetAlpha(0, 0)
	var_14_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1617, _1080p * 216, _1080p * 995)
	var_14_0:addElement(var_14_13)

	var_14_0.CurrentWeekChallenges = var_14_13

	local var_14_14
	local var_14_15 = MenuBuilder.BuildRegisteredType("ChallengesDaily", {
		controllerIndex = var_14_1
	})

	var_14_15.id = "ChallengesDaily"

	var_14_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 767, _1080p * 1607, _1080p * 216, _1080p * 995)
	var_14_0:addElement(var_14_15)

	var_14_0.ChallengesDaily = var_14_15

	local var_14_16
	local var_14_17 = MenuBuilder.BuildRegisteredType("CurrentMasterChallenges", {
		controllerIndex = var_14_1
	})

	var_14_17.id = "CurrentMasterChallenges"

	var_14_17:SetAlpha(0, 0)
	var_14_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1196, _1080p * -96, _1080p * 216, _1080p * 995)
	var_14_0:addElement(var_14_17)

	var_14_0.CurrentMasterChallenges = var_14_17

	local function var_14_18()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_18

	local var_14_19
	local var_14_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ShowMissions", var_14_20)

	local var_14_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("ShowMissions", var_14_21)

	local var_14_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_15:RegisterAnimationSequence("ShowMissions", var_14_22)

	local var_14_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_17:RegisterAnimationSequence("ShowMissions", var_14_23)

	local function var_14_24()
		var_14_11:AnimateSequence("ShowMissions")
		var_14_13:AnimateSequence("ShowMissions")
		var_14_15:AnimateSequence("ShowMissions")
		var_14_17:AnimateSequence("ShowMissions")
	end

	var_14_0._sequences.ShowMissions = var_14_24

	local var_14_25
	local var_14_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ShowWeeklies", var_14_26)

	local var_14_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("ShowWeeklies", var_14_27)

	local var_14_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_15:RegisterAnimationSequence("ShowWeeklies", var_14_28)

	local var_14_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_17:RegisterAnimationSequence("ShowWeeklies", var_14_29)

	local function var_14_30()
		var_14_11:AnimateSequence("ShowWeeklies")
		var_14_13:AnimateSequence("ShowWeeklies")
		var_14_15:AnimateSequence("ShowWeeklies")
		var_14_17:AnimateSequence("ShowWeeklies")
	end

	var_14_0._sequences.ShowWeeklies = var_14_30

	local var_14_31
	local var_14_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ShowDailies", var_14_32)

	local var_14_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("ShowDailies", var_14_33)

	local var_14_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_15:RegisterAnimationSequence("ShowDailies", var_14_34)

	local var_14_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_17:RegisterAnimationSequence("ShowDailies", var_14_35)

	local function var_14_36()
		var_14_11:AnimateSequence("ShowDailies")
		var_14_13:AnimateSequence("ShowDailies")
		var_14_15:AnimateSequence("ShowDailies")
		var_14_17:AnimateSequence("ShowDailies")
	end

	var_14_0._sequences.ShowDailies = var_14_36

	local var_14_37
	local var_14_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("HideAll", var_14_38)

	local var_14_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("HideAll", var_14_39)

	local var_14_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_15:RegisterAnimationSequence("HideAll", var_14_40)

	local function var_14_41()
		var_14_11:AnimateSequence("HideAll")
		var_14_13:AnimateSequence("HideAll")
		var_14_15:AnimateSequence("HideAll")
	end

	var_14_0._sequences.HideAll = var_14_41

	local var_14_42
	local var_14_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ShowMasterChallenges", var_14_43)

	local var_14_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_13:RegisterAnimationSequence("ShowMasterChallenges", var_14_44)

	local var_14_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_15:RegisterAnimationSequence("ShowMasterChallenges", var_14_45)

	local var_14_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_17:RegisterAnimationSequence("ShowMasterChallenges", var_14_46)

	local function var_14_47()
		var_14_11:AnimateSequence("ShowMasterChallenges")
		var_14_13:AnimateSequence("ShowMasterChallenges")
		var_14_15:AnimateSequence("ShowMasterChallenges")
		var_14_17:AnimateSequence("ShowMasterChallenges")
	end

	var_14_0._sequences.ShowMasterChallenges = var_14_47

	var_0_9(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("ChallengeMenu", ChallengeMenu)
LockTable(_M)
