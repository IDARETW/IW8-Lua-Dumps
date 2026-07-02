module(..., package.seeall)

local var_0_0 = 86400

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	LUI.FlowManager.RequestAddMenu(arg_1_2.screenName, true, arg_1_1, false, arg_1_2, false)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0 and arg_2_1 and arg_2_2, "Usage: GetWeaponTableFromChallengeId( <controllerIndex>, <challengeId>, <challengeType> )")

	local var_2_0 = Challenge.GetLootID(arg_2_1, arg_2_2)

	if var_2_0 ~= "" then
		return WEAPON.GenerateWeaponTableFromID(arg_2_0, var_2_0)
	end

	return nil
end

local function var_0_3(arg_3_0)
	if Dvar.IBEGCHEFE("lui_test_force_show_completion_bink") then
		Dvar.DHEGHJJJHI("lui_test_force_show_completion_bink", false)
		SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_3_0._controllerIndex, false)
	end

	if SEASONAL_EVENT.IsSeasonalEventCompleteBinkSeen(arg_3_0._controllerIndex) then
		return
	end

	local var_3_0 = {
		isComplete = true,
		isSeasonalEvent = true,
		completionBink = arg_3_0._eventData.completionBink
	}

	LUI.FlowManager.RequestAddMenu("StoreFullScreenCinematic", true, arg_3_0._controllerIndex, false, var_3_0, false)
	SEASONAL_EVENT.MarkSeasonalEventCompleteBink(arg_3_0._controllerIndex, true)
end

local function var_0_4(arg_4_0)
	local var_4_0 = Dvar.CFHDGABACF("test_community_hero_points") or arg_4_0._leftChallengeData.challengeInfo.globalProgress
	local var_4_1 = Dvar.CFHDGABACF("test_community_villain_points") or arg_4_0._rightChallengeData.challengeInfo.globalProgress

	arg_4_0.ToWBar:SetValues(var_4_0, var_4_1, 1500)
end

local function var_0_5(arg_5_0)
	local var_5_0 = tonumber(arg_5_0._leftChallengeData.challengeId)
	local var_5_1 = tonumber(arg_5_0._rightChallengeData.challengeId)

	arg_5_0:addEventHandler("updated_community_challenge_progress", function(arg_6_0, arg_6_1)
		if tonumber(arg_6_1.id) == var_5_0 and arg_6_1.globalProgress > arg_5_0._leftChallengeData.challengeInfo.globalProgress then
			arg_5_0._leftChallengeData.challengeInfo.globalProgress = arg_6_1.globalProgress

			var_0_4(arg_5_0)
		end

		if tonumber(arg_6_1.id) == var_5_1 and arg_6_1.globalProgress > arg_5_0._rightChallengeData.challengeInfo.globalProgress then
			arg_5_0._rightChallengeData.challengeInfo.globalProgress = arg_6_1.globalProgress

			var_0_4(arg_5_0)
		end
	end)
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_1)

	arg_7_0._eventData = arg_7_1
	arg_7_0._tiersData = SEASONAL_EVENT.ParseTiersFromChallengeData(arg_7_0._controllerIndex, arg_7_2.miscChallengesData)
	arg_7_0._leftChallengeData = arg_7_2.commChallengesData[1]
	arg_7_0._rightChallengeData = arg_7_2.commChallengesData[2]

	arg_7_0.EventDesc:setText(Engine.CBBHFCGDIC(arg_7_1.titleDescription))
	var_0_4(arg_7_0)

	local var_7_0 = Dvar.CFHDGABACF("test_seasonal_hero_points") or arg_7_0._leftChallengeData.challengeInfo.playerProgress
	local var_7_1 = Dvar.CFHDGABACF("test_seasonal_villain_points") or arg_7_0._rightChallengeData.challengeInfo.playerProgress
	local var_7_2 = var_7_0 == var_7_1
	local var_7_3 = var_7_1 < var_7_0

	if not var_7_2 then
		ACTIONS.AnimateSequence(arg_7_0, var_7_3 and "Hero" or "Villain")
	end

	local var_7_4 = Dvar.CFHDGABACF("NKRNRKQPSQ") or 0
	local var_7_5 = Dvar.IBEGCHEFE("test_community_complete") or var_7_4 <= Engine.DEIDGHDBHD()

	arg_7_0.EventHowToPrompts:SetPromptsEnabled(not var_7_5, arg_7_0._controllerIndex)
	arg_7_0.EventRewardTiersGridContainer:SetMouseFocusBlocker(var_7_5)
	arg_7_0.EventRewardTiersGridContainer:SetHandleMouse(not var_7_5)

	local var_7_6 = arg_7_0._tiersData[#arg_7_0._tiersData]

	if var_7_5 then
		local var_7_7 = Dvar.CFHDGABACF("test_community_hero_points") or arg_7_0._leftChallengeData.challengeInfo.globalProgress
		local var_7_8 = Dvar.CFHDGABACF("test_community_villain_points") or arg_7_0._rightChallengeData.challengeInfo.globalProgress
		local var_7_9 = var_7_8 < var_7_7

		ACTIONS.AnimateSequence(arg_7_0, "EventComplete")
		ACTIONS.AnimateSequence(arg_7_0, var_7_9 and "LeftVictory" or "RightVictory")
		arg_7_0.WinnerPoints:setText(Engine.JCBDICCAH(FormatLargeNumberForCurrentLanguage(math.max(var_7_7, var_7_8))))
		arg_7_0.LoserPoints:setText(Engine.JCBDICCAH(FormatLargeNumberForCurrentLanguage(math.min(var_7_7, var_7_8))))
		arg_7_0.FinalHeroContribution:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/FINAL_HP", Engine.JCBDICCAH(FormatLargeNumberForCurrentLanguage(var_7_0)))))
		arg_7_0.FinalVillainContribution:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/FINAL_VP", Engine.JCBDICCAH(FormatLargeNumberForCurrentLanguage(var_7_1)))))

		local var_7_10 = var_7_9 and var_7_6.lootTable[2] or var_7_6.lootTable[1]
		local var_7_11 = WEAPON.GenerateWeaponTableFromID(arg_7_0._controllerIndex, var_7_10.lootID)
		local var_7_12 = var_7_11 and true or false

		if var_7_11 then
			arg_7_0.FinalWeaponReward:Setup(var_7_11, false, true, false, true)

			local var_7_13 = {
				screenName = "WeaponPreview",
				weaponTable = var_7_11
			}

			arg_7_0.FinalWeaponReward:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
				var_0_1(arg_8_0:getParent(), arg_8_1.controller, var_7_13)
			end)
			arg_7_0.bindButton:addEventHandler("button_right_stick", function(arg_9_0, arg_9_1)
				var_0_1(arg_7_0, arg_9_1.controller, var_7_13)

				if arg_9_1.qualifier then
					Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
				end
			end)
			arg_7_0:registerAndCallEventHandler("update_input_type", function(arg_10_0, arg_10_1)
				if LUI.IsLastInputGamepad(arg_10_1.controllerIndex) then
					arg_10_0.FinalRewardPreviewLabel:SetAlpha(1)
				else
					arg_10_0.FinalRewardPreviewLabel:SetAlpha(0)
				end
			end, {
				element = arg_7_0,
				controllerIndex = arg_7_0._controllerIndex
			})
		end

		arg_7_0.FinalWeaponReward:SetAlpha(var_7_12 and 1 or 0)
		arg_7_0.FinalWeaponReward:SetFocusable(var_7_12)
		arg_7_0.FinalWeaponReward:SetMouseFocusBlocker(not var_7_12)
	else
		arg_7_0.isLastDay = Dvar.IBEGCHEFE("test_challenge_last_day") or var_7_4 - Engine.DEIDGHDBHD() <= var_0_0

		if arg_7_0.isLastDay then
			ACTIONS.AnimateSequence(arg_7_0, "LastDay")
		end

		arg_7_0.EventLeftPointsIndicator:SetValue(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PROGRESS_H", Engine.JCBDICCAH(LUI.FormatLargeNumber(var_7_0))))
		arg_7_0.EventLeftPointsIndicator:SetHint(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PROGRESS_DESC_H"))
		arg_7_0.EventLeftPointsIndicator:ShowHint(var_7_2 or not var_7_3)
		arg_7_0.EventRightPointsIndicator:SetValue(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PROGRESS_V", Engine.JCBDICCAH(LUI.FormatLargeNumber(var_7_1))))
		arg_7_0.EventRightPointsIndicator:SetHint(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PROGRESS_DESC_V"))
		arg_7_0.EventRightPointsIndicator:ShowHint(var_7_2 or var_7_3)
		arg_7_0.EventRewardTiersGridContainer:SetupData({
			rewardsData = arg_7_0._tiersData,
			totalPoints = {
				var_7_1,
				var_7_0
			}
		})

		local var_7_14 = var_7_0 >= var_7_6.cost
		local var_7_15 = var_7_1 >= var_7_6.cost

		if Dvar.IBEGCHEFE("lui_test_force_show_completion_bink") or var_7_14 and var_7_15 then
			var_0_3(arg_7_0)
		end

		var_0_5(arg_7_0)
	end
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._controllerIndex = arg_11_1
	arg_11_0.SetupData = var_0_6

	local var_11_0 = LUI.UIBindButton.new()

	var_11_0.id = "bindButton"

	arg_11_0:addElement(var_11_0)

	arg_11_0.bindButton = var_11_0
end

function SeasonalEventTugOfWarView(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "SeasonalEventTugOfWarView"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "RightHighlight"

	var_12_4:SetRGBFromTable(SWATCHES.EventPromos.HvVRed, 0)
	var_12_4:SetAlpha(0, 0)
	var_12_4:SetYRotation(180, 0)
	var_12_4:setImage(RegisterMaterial("ui_seasonal_event_hvv_sideeffect"), 0)
	var_12_4:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -960, 0, _1080p * -384, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.RightHighlight = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "LeftHighlight"

	var_12_6:SetRGBFromTable(SWATCHES.EventPromos.HvVBlue, 0)
	var_12_6:SetAlpha(0, 0)
	var_12_6:setImage(RegisterMaterial("ui_seasonal_event_hvv_sideeffect"), 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 960, _1080p * -384, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.LeftHighlight = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("WeaponLockerButton", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "FinalWeaponReward"

	var_12_8:SetAlpha(0, 0)
	var_12_8.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 805, _1080p * 1115, _1080p * 786, _1080p * 886)
	var_12_0:addElement(var_12_8)

	var_12_0.FinalWeaponReward = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIText.new()

	var_12_10.id = "LoserPoints"

	var_12_10:SetAlpha(0, 0)
	var_12_10:setText("7655", 0)
	var_12_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_10:SetWordWrap(false)
	var_12_10:SetAlignment(LUI.Alignment.Center)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 341, _1080p * 555, _1080p * 854, _1080p * 904)
	var_12_0:addElement(var_12_10)

	var_12_0.LoserPoints = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIText.new()

	var_12_12.id = "LoserLabel"

	var_12_12:SetAlpha(0, 0)
	var_12_12:setText(ToUpperCase("loser"), 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_12:SetWordWrap(false)
	var_12_12:SetAlignment(LUI.Alignment.Center)
	var_12_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 341, _1080p * 555, _1080p * 818, _1080p * 854)
	var_12_0:addElement(var_12_12)

	var_12_0.LoserLabel = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIImage.new()

	var_12_14.id = "LoserImage"

	var_12_14:SetAlpha(0, 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 403, _1080p * 503, _1080p * 701, _1080p * 801)
	var_12_0:addElement(var_12_14)

	var_12_0.LoserImage = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIImage.new()

	var_12_16.id = "WinnerGlow"

	var_12_16:SetAlpha(0, 0)
	var_12_16:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 574, _1080p * 1346, _1080p * 10, _1080p * 854)
	var_12_0:addElement(var_12_16)

	var_12_0.WinnerGlow = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIText.new()

	var_12_18.id = "WinnerPoints"

	var_12_18:SetAlpha(0, 0)
	var_12_18:setText("4536", 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_18:SetWordWrap(false)
	var_12_18:SetAlignment(LUI.Alignment.Center)
	var_12_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 548, _1080p * 618)
	var_12_0:addElement(var_12_18)

	var_12_0.WinnerPoints = var_12_18

	local var_12_19
	local var_12_20 = LUI.UIImage.new()

	var_12_20.id = "WinnerImage"

	var_12_20:SetAlpha(0, 0)
	var_12_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 401, _1080p * 501, _1080p * 673, _1080p * 773)
	var_12_0:addElement(var_12_20)

	var_12_0.WinnerImage = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIText.new()

	var_12_22.id = "WinnerLabel"

	var_12_22:SetAlpha(0, 0)
	var_12_22:setText(ToUpperCase("Winner"), 0)
	var_12_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_22:SetWordWrap(false)
	var_12_22:SetAlignment(LUI.Alignment.Center)
	var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 428, _1080p * 548)
	var_12_0:addElement(var_12_22)

	var_12_0.WinnerLabel = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIStyledText.new()

	var_12_24.id = "FinalHeroContribution"

	var_12_24:SetAlpha(0, 0)
	var_12_24:setText("5647", 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_24:SetWordWrap(false)
	var_12_24:SetLeading(4 * _1080p, 0)
	var_12_24:SetAlignment(LUI.Alignment.Center)
	var_12_24:SetShadowRGBFromTable(SWATCHES.text.offwhite, 0)
	var_12_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1267, _1080p * 1667, _1080p * 861, _1080p * 897)
	var_12_0:addElement(var_12_24)

	var_12_0.FinalHeroContribution = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIStyledText.new()

	var_12_26.id = "FinalVillainContribution"

	var_12_26:SetAlpha(0, 0)
	var_12_26:setText("7546", 0)
	var_12_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_26:SetWordWrap(false)
	var_12_26:SetLeading(4 * _1080p, 0)
	var_12_26:SetAlignment(LUI.Alignment.Center)
	var_12_26:SetShadowRGBFromTable(SWATCHES.text.offwhite, 0)
	var_12_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1267, _1080p * 1667, _1080p * 818, _1080p * 854)
	var_12_0:addElement(var_12_26)

	var_12_0.FinalVillainContribution = var_12_26

	local var_12_27
	local var_12_28 = LUI.UIText.new()

	var_12_28.id = "TotalContributionLabel"

	var_12_28:SetAlpha(0, 0)
	var_12_28:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/TOTAL_CONTRIBUTION")), 0)
	var_12_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_28:SetWordWrap(false)
	var_12_28:SetAlignment(LUI.Alignment.Center)
	var_12_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1217, _1080p * 1717, _1080p * 783, _1080p * 801)
	var_12_0:addElement(var_12_28)

	var_12_0.TotalContributionLabel = var_12_28

	local var_12_29
	local var_12_30 = LUI.UIText.new()

	var_12_30.id = "TotalContributionLabel2"

	var_12_30:SetAlpha(0, 0)
	var_12_30:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/TOTAL_CONTRIBUTION")), 0)
	var_12_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_30:SetWordWrap(false)
	var_12_30:SetAlignment(LUI.Alignment.Center)
	var_12_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1217, _1080p * 1717, _1080p * 783, _1080p * 801)
	var_12_0:addElement(var_12_30)

	var_12_0.TotalContributionLabel2 = var_12_30

	local var_12_31
	local var_12_32 = MenuBuilder.BuildRegisteredType("SeasonalEventRewardTiersGridContainer", {
		controllerIndex = var_12_1
	})

	var_12_32.id = "EventRewardTiersGridContainer"

	var_12_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 560, _1080p * 1360, _1080p * -354, _1080p * -54)
	var_12_0:addElement(var_12_32)

	var_12_0.EventRewardTiersGridContainer = var_12_32

	local var_12_33
	local var_12_34 = MenuBuilder.BuildRegisteredType("SeasonalEventTugOfWarBar", {
		controllerIndex = var_12_1
	})

	var_12_34.id = "ToWBar"

	var_12_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 360, _1080p * 1560, _1080p * 398, _1080p * 714)
	var_12_0:addElement(var_12_34)

	var_12_0.ToWBar = var_12_34

	local var_12_35
	local var_12_36 = LUI.UIText.new()

	var_12_36.id = "EventDesc"

	var_12_36:setText("", 0)
	var_12_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_36:SetWordWrap(false)
	var_12_36:SetAlignment(LUI.Alignment.Center)
	var_12_36:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 619, _1080p * 643)
	var_12_0:addElement(var_12_36)

	var_12_0.EventDesc = var_12_36

	local var_12_37
	local var_12_38 = LUI.UIImage.new()

	var_12_38.id = "EventImage"

	var_12_38:setImage(RegisterMaterial("ui_seasonal_event_hvv_title"), 0)
	var_12_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 644, _1080p * 1276, _1080p * 174, _1080p * 490)
	var_12_0:addElement(var_12_38)

	var_12_0.EventImage = var_12_38

	local var_12_39
	local var_12_40 = LUI.UIStyledText.new()

	var_12_40.id = "EventCountdown"

	var_12_40:SetAlpha(0.45, 0)
	var_12_40:setText("", 0)
	var_12_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_40:SetWordWrap(false)
	var_12_40:SetAlignment(LUI.Alignment.Center)
	var_12_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 233, _1080p * 263)
	var_12_0:addElement(var_12_40)

	var_12_0.EventCountdown = var_12_40

	local var_12_41
	local var_12_42 = MenuBuilder.BuildRegisteredType("SeasonalEventPromptsGroup", {
		controllerIndex = var_12_1
	})

	var_12_42.id = "EventHowToPrompts"

	var_12_42.PromptLabel:SetAlignment(LUI.Alignment.Center)
	var_12_42:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -84, _1080p * 84, _1080p * 423, _1080p * 467)
	var_12_0:addElement(var_12_42)

	var_12_0.EventHowToPrompts = var_12_42

	local var_12_43
	local var_12_44 = MenuBuilder.BuildRegisteredType("SeasonalEventContributionIndicator", {
		controllerIndex = var_12_1
	})

	var_12_44.id = "EventRightPointsIndicator"

	var_12_44.HintBG:SetRGBFromTable(SWATCHES.EventPromos.HvVRed, 0)
	var_12_44.ContributionBacker:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_12_44.ContributionBacker:setImage(RegisterMaterial("ui_seasonal_event_hvv_frame_v"), 0)
	var_12_44:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 461, _1080p * 661, _1080p * -268, _1080p * -100)
	var_12_0:addElement(var_12_44)

	var_12_0.EventRightPointsIndicator = var_12_44

	local var_12_45
	local var_12_46 = LUI.UIText.new()

	var_12_46.id = "EventRightFactionText"

	var_12_46:SetAlpha(0, 0)
	var_12_46:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PLAYER_V")), 0)
	var_12_46:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_46:SetWordWrap(false)
	var_12_46:SetAlignment(LUI.Alignment.Left)
	var_12_46:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_46:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 438, _1080p * 638, _1080p * -337, _1080p * -297)
	var_12_0:addElement(var_12_46)

	var_12_0.EventRightFactionText = var_12_46

	local var_12_47
	local var_12_48 = MenuBuilder.BuildRegisteredType("SeasonalEventContributionIndicator", {
		controllerIndex = var_12_1
	})

	var_12_48.id = "EventLeftPointsIndicator"

	var_12_48.HintBG:SetRGBFromTable(SWATCHES.EventPromos.HvVBlue, 0)
	var_12_48.ContributionBacker:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_12_48.ContributionBacker:setImage(RegisterMaterial("ui_seasonal_event_hvv_frame_h"), 0)
	var_12_48:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -659, _1080p * -459, _1080p * -268, _1080p * -100)
	var_12_0:addElement(var_12_48)

	var_12_0.EventLeftPointsIndicator = var_12_48

	local var_12_49
	local var_12_50 = LUI.UIText.new()

	var_12_50.id = "EventLeftFactionText"

	var_12_50:SetAlpha(0, 0)
	var_12_50:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/PLAYER_H")), 0)
	var_12_50:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_50:SetWordWrap(false)
	var_12_50:SetAlignment(LUI.Alignment.Right)
	var_12_50:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_50:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -635, _1080p * -435, _1080p * -337, _1080p * -297)
	var_12_0:addElement(var_12_50)

	var_12_0.EventLeftFactionText = var_12_50

	local var_12_51
	local var_12_52 = LUI.UIText.new()

	var_12_52.id = "FinalRewardPreviewLabel"

	var_12_52:SetAlpha(0, 0)
	var_12_52:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_REWARD"), 0)
	var_12_52:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_52:SetAlignment(LUI.Alignment.Center)
	var_12_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 805, _1080p * 1115, _1080p * 917, _1080p * 935)
	var_12_0:addElement(var_12_52)

	var_12_0.FinalRewardPreviewLabel = var_12_52

	local function var_12_53()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_53

	local var_12_54
	local var_12_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 846
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 946
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 805
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1115
		}
	}

	var_12_8:RegisterAnimationSequence("EventComplete", var_12_55)

	local var_12_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 826
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 553
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 876
		}
	}

	var_12_10:RegisterAnimationSequence("EventComplete", var_12_56)

	local var_12_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 339
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 790
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 553
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 826
		}
	}

	var_12_12:RegisterAnimationSequence("EventComplete", var_12_57)

	local var_12_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 673
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 773
		}
	}

	var_12_14:RegisterAnimationSequence("EventComplete", var_12_58)

	local var_12_59 = {
		{
			value = 0.55,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("EventComplete", var_12_59)

	local var_12_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 644
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1210
		}
	}

	var_12_18:RegisterAnimationSequence("EventComplete", var_12_60)

	local var_12_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 805
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 307
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1115
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 611
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_20:RegisterAnimationSequence("EventComplete", var_12_61)

	local var_12_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 633
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 753
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1210
		}
	}

	var_12_22:RegisterAnimationSequence("EventComplete", var_12_62)

	local var_12_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("EventComplete", var_12_63)

	local var_12_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("EventComplete", var_12_64)

	local var_12_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1217
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 794
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1717
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 812
		}
	}

	var_12_28:RegisterAnimationSequence("EventComplete", var_12_65)

	local var_12_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 710
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 759
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 777
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_30:RegisterAnimationSequence("EventComplete", var_12_66)

	local var_12_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_32:RegisterAnimationSequence("EventComplete", var_12_67)

	local var_12_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_34:RegisterAnimationSequence("EventComplete", var_12_68)

	local var_12_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_36:RegisterAnimationSequence("EventComplete", var_12_69)

	local var_12_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1087
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 833
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200
		}
	}

	var_12_38:RegisterAnimationSequence("EventComplete", var_12_70)

	local var_12_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_40:RegisterAnimationSequence("EventComplete", var_12_71)

	local var_12_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_42:RegisterAnimationSequence("EventComplete", var_12_72)

	local var_12_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_44:RegisterAnimationSequence("EventComplete", var_12_73)

	local var_12_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_46:RegisterAnimationSequence("EventComplete", var_12_74)

	local var_12_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_48:RegisterAnimationSequence("EventComplete", var_12_75)

	local var_12_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_50:RegisterAnimationSequence("EventComplete", var_12_76)

	local function var_12_77()
		var_12_8:AnimateSequence("EventComplete")
		var_12_10:AnimateSequence("EventComplete")
		var_12_12:AnimateSequence("EventComplete")
		var_12_14:AnimateSequence("EventComplete")
		var_12_16:AnimateSequence("EventComplete")
		var_12_18:AnimateSequence("EventComplete")
		var_12_20:AnimateSequence("EventComplete")
		var_12_22:AnimateSequence("EventComplete")
		var_12_24:AnimateSequence("EventComplete")
		var_12_26:AnimateSequence("EventComplete")
		var_12_28:AnimateSequence("EventComplete")
		var_12_30:AnimateSequence("EventComplete")
		var_12_32:AnimateSequence("EventComplete")
		var_12_34:AnimateSequence("EventComplete")
		var_12_36:AnimateSequence("EventComplete")
		var_12_38:AnimateSequence("EventComplete")
		var_12_40:AnimateSequence("EventComplete")
		var_12_42:AnimateSequence("EventComplete")
		var_12_44:AnimateSequence("EventComplete")
		var_12_46:AnimateSequence("EventComplete")
		var_12_48:AnimateSequence("EventComplete")
		var_12_50:AnimateSequence("EventComplete")
	end

	var_12_0._sequences.EventComplete = var_12_77

	local var_12_78
	local var_12_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Hero", var_12_79)

	local var_12_80 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Hero", var_12_80)

	local var_12_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVBlue
		}
	}

	var_12_16:RegisterAnimationSequence("Hero", var_12_81)

	local var_12_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVBlue
		}
	}

	var_12_22:RegisterAnimationSequence("Hero", var_12_82)

	local var_12_83 = {
		{
			value = -1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_24:RegisterAnimationSequence("Hero", var_12_83)

	local var_12_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_26:RegisterAnimationSequence("Hero", var_12_84)

	local var_12_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background,
			child = var_12_0.EventRightPointsIndicator.ContributionBacker
		}
	}

	var_12_44:RegisterAnimationSequence("Hero", var_12_85)

	local var_12_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_46:RegisterAnimationSequence("Hero", var_12_86)

	local var_12_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVBlue,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventLeftPointsIndicator.DarkBG
		}
	}

	var_12_48:RegisterAnimationSequence("Hero", var_12_87)

	local var_12_88 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_50:RegisterAnimationSequence("Hero", var_12_88)

	local function var_12_89()
		var_12_4:AnimateSequence("Hero")
		var_12_6:AnimateSequence("Hero")
		var_12_16:AnimateSequence("Hero")
		var_12_22:AnimateSequence("Hero")
		var_12_24:AnimateSequence("Hero")
		var_12_26:AnimateSequence("Hero")
		var_12_44:AnimateSequence("Hero")
		var_12_46:AnimateSequence("Hero")
		var_12_48:AnimateSequence("Hero")
		var_12_50:AnimateSequence("Hero")
	end

	var_12_0._sequences.Hero = var_12_89

	local var_12_90
	local var_12_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("LeftVictory", var_12_91)

	local var_12_92 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("LeftVictory", var_12_92)

	local var_12_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1574
		}
	}

	var_12_10:RegisterAnimationSequence("LeftVictory", var_12_93)

	local var_12_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1360
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/FACTION_V"))
		}
	}

	var_12_12:RegisterAnimationSequence("LeftVictory", var_12_94)

	local var_12_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1418
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1516
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_hvv_v")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 801
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 703
		}
	}

	var_12_14:RegisterAnimationSequence("LeftVictory", var_12_95)

	local var_12_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVBlue
		}
	}

	var_12_16:RegisterAnimationSequence("LeftVictory", var_12_96)

	local var_12_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_hvv_h_cac")
		}
	}

	var_12_20:RegisterAnimationSequence("LeftVictory", var_12_97)

	local var_12_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/VICTORY_H"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVBlue
		}
	}

	var_12_22:RegisterAnimationSequence("LeftVictory", var_12_98)

	local var_12_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 767
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 783
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 819
		}
	}

	var_12_24:RegisterAnimationSequence("LeftVictory", var_12_99)

	local var_12_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1267
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1667
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 909
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 945
		}
	}

	var_12_26:RegisterAnimationSequence("LeftVictory", var_12_100)

	local var_12_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 1217
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1717
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 888
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 906
		}
	}

	var_12_28:RegisterAnimationSequence("LeftVictory", var_12_101)

	local function var_12_102()
		var_12_4:AnimateSequence("LeftVictory")
		var_12_6:AnimateSequence("LeftVictory")
		var_12_10:AnimateSequence("LeftVictory")
		var_12_12:AnimateSequence("LeftVictory")
		var_12_14:AnimateSequence("LeftVictory")
		var_12_16:AnimateSequence("LeftVictory")
		var_12_20:AnimateSequence("LeftVictory")
		var_12_22:AnimateSequence("LeftVictory")
		var_12_24:AnimateSequence("LeftVictory")
		var_12_26:AnimateSequence("LeftVictory")
		var_12_28:AnimateSequence("LeftVictory")
	end

	var_12_0._sequences.LeftVictory = var_12_102

	local var_12_103
	local var_12_104 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Villain", var_12_104)

	local var_12_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Villain", var_12_105)

	local var_12_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVRed
		}
	}

	var_12_16:RegisterAnimationSequence("Villain", var_12_106)

	local var_12_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_24:RegisterAnimationSequence("Villain", var_12_107)

	local var_12_108 = {
		{
			value = -1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		}
	}

	var_12_26:RegisterAnimationSequence("Villain", var_12_108)

	local var_12_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVRed,
			child = var_12_0.EventRightPointsIndicator.ContributionBacker
		},
		{
			value = 0.29,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventRightPointsIndicator.DarkBG
		},
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_12_0.EventRightPointsIndicator.ContributionBacker
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventRightPointsIndicator.ContributionBacker
		}
	}

	var_12_44:RegisterAnimationSequence("Villain", var_12_109)

	local var_12_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_46:RegisterAnimationSequence("Villain", var_12_110)

	local var_12_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventLeftPointsIndicator.DarkBG
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale,
			child = var_12_0.EventLeftPointsIndicator.ContributionBacker
		}
	}

	var_12_48:RegisterAnimationSequence("Villain", var_12_111)

	local var_12_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_50:RegisterAnimationSequence("Villain", var_12_112)

	local function var_12_113()
		var_12_4:AnimateSequence("Villain")
		var_12_6:AnimateSequence("Villain")
		var_12_16:AnimateSequence("Villain")
		var_12_24:AnimateSequence("Villain")
		var_12_26:AnimateSequence("Villain")
		var_12_44:AnimateSequence("Villain")
		var_12_46:AnimateSequence("Villain")
		var_12_48:AnimateSequence("Villain")
		var_12_50:AnimateSequence("Villain")
	end

	var_12_0._sequences.Villain = var_12_113

	local var_12_114
	local var_12_115 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("RightVictory", var_12_115)

	local var_12_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("RightVictory", var_12_116)

	local var_12_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		}
	}

	var_12_10:RegisterAnimationSequence("RightVictory", var_12_117)

	local var_12_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/FACTION_H"))
		}
	}

	var_12_12:RegisterAnimationSequence("RightVictory", var_12_118)

	local var_12_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 501
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_hvv_h")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 797
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 698
		}
	}

	var_12_14:RegisterAnimationSequence("RightVictory", var_12_119)

	local var_12_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVRed
		}
	}

	var_12_16:RegisterAnimationSequence("RightVictory", var_12_120)

	local var_12_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_hvv_v_cac")
		}
	}

	var_12_20:RegisterAnimationSequence("RightVictory", var_12_121)

	local var_12_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ350/VICTORY_V"))
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.HvVRed
		}
	}

	var_12_22:RegisterAnimationSequence("RightVictory", var_12_122)

	local var_12_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 653
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 910
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 946
		}
	}

	var_12_24:RegisterAnimationSequence("RightVictory", var_12_123)

	local var_12_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 767
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 782
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 818
		}
	}

	var_12_26:RegisterAnimationSequence("RightVictory", var_12_124)

	local var_12_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 203
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 703
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 891
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 909
		}
	}

	var_12_28:RegisterAnimationSequence("RightVictory", var_12_125)

	local function var_12_126()
		var_12_4:AnimateSequence("RightVictory")
		var_12_6:AnimateSequence("RightVictory")
		var_12_10:AnimateSequence("RightVictory")
		var_12_12:AnimateSequence("RightVictory")
		var_12_14:AnimateSequence("RightVictory")
		var_12_16:AnimateSequence("RightVictory")
		var_12_20:AnimateSequence("RightVictory")
		var_12_22:AnimateSequence("RightVictory")
		var_12_24:AnimateSequence("RightVictory")
		var_12_26:AnimateSequence("RightVictory")
		var_12_28:AnimateSequence("RightVictory")
	end

	var_12_0._sequences.RightVictory = var_12_126

	local var_12_127
	local var_12_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.itemCard.highlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.Scoreboard.highlight
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = 4 * _1080p
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			value = 0.9,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_12_40:RegisterAnimationSequence("LastDay", var_12_128)

	local function var_12_129()
		var_12_40:AnimateLoop("LastDay")
	end

	var_12_0._sequences.LastDay = var_12_129

	var_0_7(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("SeasonalEventTugOfWarView", SeasonalEventTugOfWarView)
LockTable(_M)
