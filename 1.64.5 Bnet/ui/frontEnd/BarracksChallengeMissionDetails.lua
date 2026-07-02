module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.MissionUnlockDescription then
		local var_1_0 = Challenge.GetInitialMissionID(arg_1_1.id)
		local var_1_1 = Challenge.GetMissionRarity(var_1_0)
		local var_1_2 = arg_1_1.isRestartRequiredToActivate or false
		local var_1_3 = var_1_1 == LOOT.Rarity.OPERATOR_MISSION and not arg_1_1.isOwned and not var_1_2

		arg_1_0.MissionUnlockDescription:SetAlpha(var_1_3 and 1 or 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = (arg_2_1.isRestartRequiredToActivate or false) and 0.65 or 0

	arg_2_0.RestartOverlayTop:SetAlpha(var_2_0)
	arg_2_0.RestartOverlayBottom:SetAlpha(var_2_0)
end

local function var_0_2(arg_3_0)
	assert(arg_3_0.BindButton)

	if arg_3_0.BindButton then
		if arg_3_0._isIntel then
			arg_3_0._intelPreviewEnabled = true

			arg_3_0.BindButton:registerEventHandler("button_alt2", function(arg_4_0, arg_4_1)
				if arg_3_0._intelPreviewEnabled and arg_3_0._mission and arg_3_0._objIndex and arg_3_0._mission.objectives and arg_3_0._mission.objectives[arg_3_0._objIndex] then
					local var_4_0 = arg_3_0._mission.objectives[arg_3_0._objIndex].ref
					local var_4_1 = Challenge.GetIntelImage(var_4_0)
					local var_4_2 = Challenge.GetIntelEvent(var_4_0)

					if var_4_1 and #var_4_1 > 0 and var_4_2 and #var_4_2 > 0 then
						if not Challenge.IsInGameIntel(var_4_0) then
							Challenges.DFGEFGFCFC(arg_3_0._controllerIndex, "collect_item", var_4_2)
						end

						LUI.FlowManager.RequestPopupMenu(nil, "PreviewIntelPopup", true, arg_3_0._controllerIndex, false, {
							imageOverride = var_4_1,
							intelRef = var_4_0
						})
						Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
					end
				end
			end)
		else
			arg_3_0.BindButton:registerEventHandler("button_alt2", nil)
		end
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0._mission = arg_5_1
	arg_5_0._isIntel = arg_5_1.isIntel
	arg_5_0._objIndex = 1

	if arg_5_1.objectives and #arg_5_1.objectives > 1 then
		ACTIONS.AnimateSequence(arg_5_0, "MultiObjective")

		arg_5_0._allowNavigation = true

		if arg_5_2 then
			arg_5_0._objIndex = arg_5_2
			arg_5_0._objIndex = math.min(arg_5_0._objIndex, #arg_5_1.objectives)
		elseif arg_5_1.numObjectivesComplete then
			arg_5_0._objIndex = math.min(arg_5_1.numObjectivesComplete + 1, #arg_5_1.objectives)
		end

		local var_5_0 = arg_5_1.isActive or arg_5_1.category == Challenge.Operator

		arg_5_0.Pips:SetActive(var_5_0)

		local var_5_1 = not arg_5_1.unlocked or arg_5_1.isBattlePassLocked

		if arg_5_0._isIntel then
			var_5_1 = not arg_5_1.isIntelUnlocked
		end

		arg_5_0.Pips:Setup(#arg_5_1.objectives, arg_5_1.numObjectivesComplete, LUI.Alignment.Center, var_5_1)
		arg_5_0.LeftTrigger:SetAlpha(arg_5_0._useGamepadControls and 1 or 0)
		arg_5_0.RightTrigger:SetAlpha(arg_5_0._useGamepadControls and 1 or 0)
		arg_5_0.LeftArrow:SetAlpha(arg_5_0._useGamepadControls and 0 or 1)
		arg_5_0.RightArrow:SetAlpha(arg_5_0._useGamepadControls and 0 or 1)
	else
		ACTIONS.AnimateSequence(arg_5_0, "SingleObjective")

		arg_5_0._allowNavigation = false

		arg_5_0.LeftTrigger:SetAlpha(0)
		arg_5_0.RightTrigger:SetAlpha(0)
		arg_5_0.LeftArrow:SetAlpha(0)
		arg_5_0.RightArrow:SetAlpha(0)
	end

	if arg_5_0._isIntel then
		ACTIONS.AnimateSequence(arg_5_0, "Intel")
		var_0_2(arg_5_0)
	end

	arg_5_0:UpdateObjectiveData()

	if arg_5_1.name and #arg_5_1.name > 0 then
		arg_5_0.MissionTitle.Text:setText(Engine.CBBHFCGDIC(arg_5_1.name))
	else
		arg_5_0.MissionTitle.Text:setText("")
	end

	if arg_5_1.detailDesc and #arg_5_1.detailDesc > 0 then
		arg_5_0.Description:setText(Engine.CBBHFCGDIC(arg_5_1.detailDesc))
	else
		arg_5_0.Description:setText("")
		ACTIONS.AnimateSequence(arg_5_0, "NoDescription")
	end

	arg_5_0.ActiveTag:SetAlpha((arg_5_1.isActive or arg_5_1.complete) and 1 or 0)
	ACTIONS.AnimateSequence(arg_5_0, "HideExclusiveText")

	if arg_5_1.isActive then
		arg_5_0.ActiveTag:SetupEventBanner(Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"))
	elseif arg_5_1.complete then
		arg_5_0.ActiveTag:SetupEventBanner(Engine.CBBHFCGDIC("CAS/CHALLENGE_COMPLETE"))
	elseif arg_5_1.isPS4Exclusive then
		arg_5_0.ActiveTag:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0, "ShowExclusiveText")
	end

	if arg_5_1.rewards and #arg_5_1.rewards > 0 then
		ACTIONS.AnimateSequence(arg_5_0, "ShowMissionReward")

		local var_5_2 = arg_5_1.rewards[Challenge.Reward.LOOT] or arg_5_1.rewards[Challenge.Reward.XP]

		arg_5_0.MissionRewardCard:UpdateCardConfig(var_5_2)

		if var_5_2.lootItemID and STORE.PreviewSupported(var_5_2.type) then
			arg_5_0._previewMissionData = var_5_2

			local var_5_3 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
					}
				}
			}

			arg_5_0.MissionRewardCard:AddTooltipData(arg_5_0._controllerIndex, var_5_3)
		else
			arg_5_0._previewMissionData = nil
		end

		if var_5_2.typeName and #var_5_2.typeName > 0 then
			arg_5_0.MissionRewardLoot:setText(var_5_2.typeName)
		else
			arg_5_0.MissionRewardLoot:setText("")
		end
	else
		ACTIONS.AnimateSequence(arg_5_0, "HideMissionReward")
	end

	if not arg_5_3 and arg_5_1.isBattlePassLocked and arg_5_1.category == Challenge.Operator then
		arg_5_0.BattlePassStage:setText(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(arg_5_1.battlePassLevelToUnlock)))

		if BATTLEPASS.IsOwned(arg_5_0._controllerIndex) then
			arg_5_0.CurrentBattlePassStage:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER", Engine.JCBDICCAH(BATTLEPASS.GetTier(arg_5_0._controllerIndex))))
		else
			arg_5_0.CurrentBattlePassStage:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_INACTIVE"))
		end

		ACTIONS.AnimateSequence(arg_5_0, "ShowBattlePassDetails")
		arg_5_0.ActiveTag:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_5_0, "HideBattlePassDetails")
	end

	var_0_0(arg_5_0, arg_5_1)
	var_0_1(arg_5_0, arg_5_1)
end

local function var_0_4(arg_6_0)
	arg_6_0.ObjectivesDescription:setText("")
	arg_6_0.IntelPrompt:SetAlpha(0)

	arg_6_0._intelPreviewEnabled = false

	local var_6_0 = arg_6_0._mission.objectives

	if var_6_0 and #var_6_0 > 0 then
		if arg_6_0._objIndex > 1 then
			if arg_6_0._objIndex <= arg_6_0._mission.numObjectivesComplete + 1 then
				arg_6_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_6_0[arg_6_0._objIndex].desc))
				arg_6_0.IntelPrompt:SetAlpha(1)

				arg_6_0._intelPreviewEnabled = true
			end
		elseif arg_6_0._mission.isActive or arg_6_0._mission.complete then
			arg_6_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_6_0[arg_6_0._objIndex].desc))
			arg_6_0.IntelPrompt:SetAlpha(1)

			arg_6_0._intelPreviewEnabled = true
		end

		local var_6_1 = var_6_0[arg_6_0._objIndex]

		if var_6_1.image and #var_6_1.image > 0 then
			arg_6_0.KeyArt:setImage(RegisterMaterial(var_6_1.image))
		end
	end

	if arg_6_0._mission.isActive and arg_6_0._objIndex > arg_6_0._mission.numObjectivesComplete + 1 then
		arg_6_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED", arg_6_0._objIndex - 1))
		arg_6_0.UnlockDesc:SetAlpha(1)
		arg_6_0.Lock:SetAlpha(1)
	else
		arg_6_0.UnlockDesc:setText("")
		arg_6_0.UnlockDesc:SetAlpha(0)
		arg_6_0.Lock:SetAlpha(0)
	end
end

local function var_0_5(arg_7_0)
	local var_7_0

	if arg_7_0._mission.objectives and #arg_7_0._mission.objectives > 1 then
		var_7_0 = arg_7_0._mission.objectives[arg_7_0._objIndex]

		arg_7_0.Pips:SetSelected(arg_7_0._objIndex)
		arg_7_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", arg_7_0._objIndex, #arg_7_0._mission.objectives))
	else
		var_7_0 = arg_7_0._mission

		arg_7_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", 1, 1))
	end

	if var_7_0.image and #var_7_0.image > 0 then
		arg_7_0.KeyArt:setImage(RegisterMaterial(var_7_0.image))
	end

	if arg_7_0._isIntel then
		var_0_4(arg_7_0)
	else
		if var_7_0.desc and var_7_0.amount then
			arg_7_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_7_0.desc, var_7_0.amount))
		else
			arg_7_0.ObjectivesDescription:setText("")
		end

		if arg_7_0._objIndex <= arg_7_0._mission.numObjectivesComplete + 1 then
			ACTIONS.AnimateSequence(arg_7_0, "UnlockedObjective")

			if not var_7_0.progress then
				arg_7_0.ObjectivesProgressBar:SetAlpha(0)
			else
				local var_7_1 = var_7_0.amountEarned / var_7_0.amountNeeded

				arg_7_0.ObjectivesProgressBar:SetProgress(var_7_1)
				arg_7_0.Checkbox:SetValue(var_7_1 == 1, true)
				ACTIONS.AnimateSequence(arg_7_0, var_7_1 == 1 and "Complete" or "Incomplete")
			end
		else
			ACTIONS.AnimateSequence(arg_7_0, "LockedObjective")
			arg_7_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED", arg_7_0._objIndex - 1))
		end

		if var_7_0.amountEarned and var_7_0.amountNeeded then
			arg_7_0.ObjectivesProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_7_0.amountEarned, var_7_0.amountNeeded))
		else
			arg_7_0.ObjectivesProgressDesc:setText("")
		end
	end

	if var_7_0.rewards and #var_7_0.rewards > 0 then
		local var_7_2 = math.min(#var_7_0.rewards, #arg_7_0._rewardWidgets)

		ACTIONS.AnimateSequence(arg_7_0, "ObjRewards" .. var_7_2)

		for iter_7_0 = 1, var_7_2 do
			local var_7_3 = var_7_0.rewards[iter_7_0]
			local var_7_4 = arg_7_0._rewardWidgets[iter_7_0]

			if var_7_3.typeName and #var_7_3.typeName > 0 then
				var_7_4.nameLabel:setText(var_7_3.typeName)
			else
				var_7_4.nameLabel:setText("")
			end

			var_7_4.lootCard:UpdateCardConfig(var_7_3)

			if var_7_3.lootItemID and STORE.PreviewSupported(var_7_3.type) then
				arg_7_0._previewData = var_7_3

				local var_7_5 = {
					promptsData = {
						{
							button_ref = "button_right_stick",
							keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
						}
					}
				}

				var_7_4.lootCard:AddTooltipData(arg_7_0._controllerIndex, var_7_5)
				arg_7_0.WeaponDetails:SetAlpha(1)
			else
				arg_7_0._previewData = nil

				arg_7_0.WeaponDetails:SetAlpha(0)
			end
		end
	else
		ACTIONS.AnimateSequence(arg_7_0, "ObjNoRewards")
	end

	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.challengePipTab)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0._previewData

	if arg_8_2 then
		var_8_0 = arg_8_0._previewMissionData
	end

	if var_8_0 and STORE.PreviewSupported(var_8_0.type) then
		local var_8_1 = arg_8_0:GetCurrentMenu()

		if var_8_1 then
			local var_8_2 = LUI.FlowManager.GetScopedData(var_8_1)

			if var_8_2 then
				var_8_2.focussedMissionIndex = arg_8_0._objIndex
			end
		end

		STORE.PreviewItem(arg_8_0._controllerIndex, var_8_0.type, var_8_0.itemID)

		if arg_8_1.qualifier then
			Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
		end
	end
end

local function var_0_7(arg_9_0)
	arg_9_0.ObjRewardCard1:registerEventHandler("gain_focus", function(arg_10_0, arg_10_1)
		return arg_10_0:GainFocus(arg_10_1)
	end)
	arg_9_0.ObjRewardCard2:registerEventHandler("button_action", function(arg_11_0, arg_11_1)
		var_0_6(arg_9_0, arg_11_1, false)
	end)
	arg_9_0.ObjRewardCard2:registerEventHandler("gain_focus", function(arg_12_0, arg_12_1)
		return arg_12_0:GainFocus(arg_12_1)
	end)
	arg_9_0.MissionRewardCard:registerEventHandler("button_action", function(arg_13_0, arg_13_1)
		var_0_6(arg_9_0, arg_13_1, true)
	end)
	arg_9_0.MissionRewardCard:registerEventHandler("gain_focus", function(arg_14_0, arg_14_1)
		return arg_14_0:GainFocus(arg_14_1)
	end)
end

local function var_0_8(arg_15_0)
	arg_15_0.ObjRewardCard1:registerEventHandler("gain_focus", nil)
	arg_15_0.ObjRewardCard2:registerEventHandler("button_action", nil)
	arg_15_0.ObjRewardCard2:registerEventHandler("gain_focus", nil)
	arg_15_0.MissionRewardCard:registerEventHandler("button_action", nil)
	arg_15_0.MissionRewardCard:registerEventHandler("gain_focus", nil)
end

local function var_0_9(arg_16_0, arg_16_1, arg_16_2)
	assert(arg_16_0.MissionRewardCard)
	assert(arg_16_0.MissionRewardLoot)
	assert(arg_16_0.RewardName1)
	assert(arg_16_0.ObjRewardCard1)
	assert(arg_16_0.RewardName2)
	assert(arg_16_0.ObjRewardCard2)

	arg_16_0.SetData = var_0_3
	arg_16_0.UpdateObjectiveData = var_0_5
	arg_16_0.EnableChildEventHandler = var_0_7
	arg_16_0.DisableChildEventHandler = var_0_8
	arg_16_0._controllerIndex = arg_16_1
	arg_16_0._rewardWidgets = {
		{
			nameLabel = arg_16_0.RewardName1,
			lootCard = arg_16_0.ObjRewardCard1
		},
		{
			nameLabel = arg_16_0.RewardName2,
			lootCard = arg_16_0.ObjRewardCard2
		}
	}
	arg_16_0.BindButton = LUI.UIBindButton.new()
	arg_16_0.BindButton.id = "BindButton"

	arg_16_0:addElement(arg_16_0.BindButton)
	arg_16_0.BindButton:registerEventHandler("button_right_stick", function(arg_17_0, arg_17_1)
		var_0_6(arg_16_0, arg_17_1, false)
	end)
	arg_16_0.ObjRewardCard2:addEventHandler("button_action", function(arg_18_0, arg_18_1)
		var_0_6(arg_16_0, arg_18_1, false)
	end)
	arg_16_0.MissionRewardCard:addEventHandler("button_action", function(arg_19_0, arg_19_1)
		var_0_6(arg_16_0, arg_19_1, true)
	end)

	local function var_16_0(arg_20_0)
		arg_20_0 = arg_20_0:getParent()

		if arg_20_0._allowNavigation then
			if arg_20_0._objIndex > 1 then
				arg_20_0._objIndex = arg_20_0._objIndex - 1
			else
				arg_20_0._objIndex = #arg_20_0._mission.objectives
			end

			arg_20_0:UpdateObjectiveData()
		end
	end

	local function var_16_1(arg_21_0)
		arg_21_0 = arg_21_0:getParent()

		if arg_21_0._allowNavigation then
			if arg_21_0._objIndex < #arg_21_0._mission.objectives then
				arg_21_0._objIndex = arg_21_0._objIndex + 1
			else
				arg_21_0._objIndex = 1
			end

			arg_21_0:UpdateObjectiveData()
		end
	end

	local function var_16_2(arg_22_0, arg_22_1)
		if arg_22_1.down and arg_22_1.qualifier == "mousewheel" then
			if arg_22_1.button == "up" then
				var_16_0(arg_22_0)
			else
				var_16_1(arg_22_0)
			end
		end
	end

	local function var_16_3(arg_23_0, arg_23_1)
		local var_23_0 = LUI.IsLastInputGamepad(arg_23_1.controllerIndex)

		arg_23_0._useGamepadControls = var_23_0

		local var_23_1 = var_23_0 and arg_23_0._allowNavigation
		local var_23_2 = not var_23_0 and arg_23_0._allowNavigation

		arg_23_0.LeftTrigger:SetAlpha(var_23_1 and 1 or 0)
		arg_23_0.RightTrigger:SetAlpha(var_23_1 and 1 or 0)
		arg_23_0.LeftArrow:SetAlpha(var_23_2 and 1 or 0)
		arg_23_0.RightArrow:SetAlpha(var_23_2 and 1 or 0)
		arg_23_0.BindButton:registerEventHandler("button_left_trigger", var_23_0 and var_16_0 or nil)
		arg_23_0.BindButton:registerEventHandler("button_right_trigger", var_23_0 and var_16_1 or nil)
		arg_23_0.BindButton:registerEventHandler("button_left", not var_23_0 and var_16_0 or nil)
		arg_23_0.BindButton:registerEventHandler("button_right", not var_23_0 and var_16_1 or nil)
	end

	arg_16_0:registerAndCallEventHandler("update_input_type", var_16_3, {
		controllerIndex = arg_16_1
	})
	arg_16_0.LeftArrow:addEventHandler("leftmouseup", var_16_0)
	arg_16_0.RightArrow:addEventHandler("leftmouseup", var_16_1)
	arg_16_0.ObjectiveBackground:SetHandleMouse(true)
	arg_16_0.ObjectiveBackground:registerEventHandler("gamepad_button", var_16_2)
	arg_16_0:registerEventHandler("mission_details_mouse_navigate", function(arg_24_0, arg_24_1)
		if arg_24_0._allowNavigation then
			arg_24_0._objIndex = arg_24_1.index

			arg_24_0:UpdateObjectiveData()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_16_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_16_0, "WZWipSetup")
	end
end

function BarracksChallengeMissionDetails(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIElement.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 775 * _1080p)

	var_25_0.id = "BarracksChallengeMissionDetails"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_25_1
	})

	var_25_4.id = "ChallengeDescBacker"

	var_25_4:SetAlpha(0.5, 0)
	var_25_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 345)
	var_25_0:addElement(var_25_4)

	var_25_0.ChallengeDescBacker = var_25_4

	local var_25_5
	local var_25_6 = LUI.UIStyledText.new()

	var_25_6.id = "Reward"

	var_25_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_6:setText(Engine.CBBHFCGDIC("LOOT_MP/FINAL_REWARD"), 0)
	var_25_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_6:SetAlignment(LUI.Alignment.Left)
	var_25_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 610, _1080p * 957, _1080p * 23, _1080p * 43)
	var_25_0:addElement(var_25_6)

	var_25_0.Reward = var_25_6

	local var_25_7
	local var_25_8 = LUI.UIStyledText.new()

	var_25_8.id = "Description"

	var_25_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_8:setText("", 0)
	var_25_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_8:SetAlignment(LUI.Alignment.Left)
	var_25_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 554, _1080p * 53, _1080p * 75)
	var_25_0:addElement(var_25_8)

	var_25_0.Description = var_25_8

	local var_25_9
	local var_25_10 = LUI.UIStyledText.new()

	var_25_10.id = "IncentiveText"

	var_25_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_10:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE_OBJECTIVES_EARN_REWARD"), 0)
	var_25_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_10:SetAlignment(LUI.Alignment.Center)
	var_25_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 795, _1080p * 957, _1080p * 165, _1080p * 187)
	var_25_0:addElement(var_25_10)

	var_25_0.IncentiveText = var_25_10

	local var_25_11
	local var_25_12 = LUI.UIImage.new()

	var_25_12.id = "KeyArt"

	var_25_12:setImage(RegisterMaterial("mission_bestofthebest"), 0)
	var_25_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 554, _1080p * 162, _1080p * 292)
	var_25_0:addElement(var_25_12)

	var_25_0.KeyArt = var_25_12

	local var_25_13
	local var_25_14 = LUI.UIImage.new()

	var_25_14.id = "Playstation"

	var_25_14:SetAlpha(0, 0)
	var_25_14:setImage(RegisterMaterial("icon_platform_playstation"), 0)
	var_25_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 53, _1080p * 304, _1080p * 336)
	var_25_0:addElement(var_25_14)

	var_25_0.Playstation = var_25_14

	local var_25_15
	local var_25_16 = LUI.UIText.new()

	var_25_16.id = "PlaystationExclusiveText"

	var_25_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_16:SetAlpha(0, 0)
	var_25_16:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_EXCLUSIVE_MISSION"), 0)
	var_25_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_16:SetAlignment(LUI.Alignment.Left)
	var_25_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 364, _1080p * 312, _1080p * 330)
	var_25_0:addElement(var_25_16)

	var_25_0.PlaystationExclusiveText = var_25_16

	local var_25_17
	local var_25_18 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_25_1
	})

	var_25_18.id = "ActiveTag"

	var_25_18.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_25_18.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_25_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 180, _1080p * 306, _1080p * 336)
	var_25_0:addElement(var_25_18)

	var_25_0.ActiveTag = var_25_18

	local var_25_19
	local var_25_20 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_25_1
	})

	var_25_20.id = "MissionTitle"

	var_25_20.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSION_REWARD"), 0)
	var_25_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1000, _1080p * -642, 0, _1080p * 46)
	var_25_0:addElement(var_25_20)

	var_25_0.MissionTitle = var_25_20

	local var_25_21
	local var_25_22 = LUI.UIStyledText.new()

	var_25_22.id = "MissionRewardLoot"

	var_25_22:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_22:setText("", 0)
	var_25_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_22:SetAlignment(LUI.Alignment.Left)
	var_25_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_25_22:SetStartupDelay(1000)
	var_25_22:SetLineHoldTime(400)
	var_25_22:SetAnimMoveTime(150)
	var_25_22:SetAnimMoveSpeed(50)
	var_25_22:SetEndDelay(1000)
	var_25_22:SetCrossfadeTime(400)
	var_25_22:SetFadeInTime(300)
	var_25_22:SetFadeOutTime(300)
	var_25_22:SetMaxVisibleLines(1)
	var_25_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 110, _1080p * 260, _1080p * 51, _1080p * 73)
	var_25_0:addElement(var_25_22)

	var_25_0.MissionRewardLoot = var_25_22

	local var_25_23
	local var_25_24 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_25_1
	})

	var_25_24.id = "ObjectiveBackground"

	var_25_24:SetAlpha(0.5, 0)
	var_25_24:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -387, _1080p * -55)
	var_25_0:addElement(var_25_24)

	var_25_0.ObjectiveBackground = var_25_24

	local var_25_25
	local var_25_26 = LUI.UIStyledText.new()

	var_25_26.id = "ObjectivesTitle"

	var_25_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_26:setText("", 0)
	var_25_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_26:SetAlignment(LUI.Alignment.Center)
	var_25_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 21, _1080p * 553, _1080p * -310, _1080p * -282)
	var_25_0:addElement(var_25_26)

	var_25_0.ObjectivesTitle = var_25_26

	local var_25_27
	local var_25_28 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_25_1
	}
	local var_25_29 = MenuBuilder.BuildRegisteredType("IconImage", var_25_28)

	var_25_29.id = "LeftTrigger"

	var_25_29:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_25_29:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 32, _1080p * 60, _1080p * -284, _1080p * -256)
	var_25_0:addElement(var_25_29)

	var_25_0.LeftTrigger = var_25_29

	local var_25_30
	local var_25_31 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_25_1
	}
	local var_25_32 = MenuBuilder.BuildRegisteredType("IconImage", var_25_31)

	var_25_32.id = "RightTrigger"

	var_25_32:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_25_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 515, _1080p * 543, _1080p * -284, _1080p * -256)
	var_25_0:addElement(var_25_32)

	var_25_0.RightTrigger = var_25_32

	local var_25_33
	local var_25_34 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_25_1
	})

	var_25_34.id = "Pips"

	var_25_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 276, _1080p * 290, _1080p * -272, _1080p * -268)
	var_25_0:addElement(var_25_34)

	var_25_0.Pips = var_25_34

	local var_25_35
	local var_25_36 = LUI.UIStyledText.new()

	var_25_36.id = "ObjectivesDescription"

	var_25_36:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_36:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.", 0)
	var_25_36:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_36:SetAlignment(LUI.Alignment.Left)
	var_25_36:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_25_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_25_36:SetStartupDelay(1000)
	var_25_36:SetLineHoldTime(400)
	var_25_36:SetAnimMoveTime(1000)
	var_25_36:SetAnimMoveSpeed(150)
	var_25_36:SetEndDelay(1000)
	var_25_36:SetCrossfadeTime(1000)
	var_25_36:SetFadeInTime(300)
	var_25_36:SetFadeOutTime(300)
	var_25_36:SetMaxVisibleLines(2)
	var_25_36:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 52, _1080p * 553, _1080p * -227, _1080p * -205)
	var_25_0:addElement(var_25_36)

	var_25_0.ObjectivesDescription = var_25_36

	local var_25_37
	local var_25_38 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_25_1
	})

	var_25_38.id = "ObjectiveRewardTitle"

	var_25_38.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OBJECTIVES_OPERATION_MENU"), 0)
	var_25_38:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -1000, _1080p * -642, _1080p * -387, _1080p * -341)
	var_25_0:addElement(var_25_38)

	var_25_0.ObjectiveRewardTitle = var_25_38

	local var_25_39
	local var_25_40 = LUI.UIStyledText.new()

	var_25_40.id = "RewardName1"

	var_25_40:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_40:setText("", 0)
	var_25_40:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_40:SetAlignment(LUI.Alignment.Left)
	var_25_40:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_25_40:SetStartupDelay(1000)
	var_25_40:SetLineHoldTime(400)
	var_25_40:SetAnimMoveTime(150)
	var_25_40:SetAnimMoveSpeed(50)
	var_25_40:SetEndDelay(1000)
	var_25_40:SetCrossfadeTime(400)
	var_25_40:SetFadeInTime(300)
	var_25_40:SetFadeOutTime(300)
	var_25_40:SetMaxVisibleLines(1)
	var_25_40:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -390, _1080p * -241, _1080p * -332, _1080p * -310)
	var_25_0:addElement(var_25_40)

	var_25_0.RewardName1 = var_25_40

	local var_25_41
	local var_25_42 = LUI.UIStyledText.new()

	var_25_42.id = "RewardName2"

	var_25_42:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_42:setText("", 0)
	var_25_42:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_42:SetAlignment(LUI.Alignment.Left)
	var_25_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_25_42:SetStartupDelay(1000)
	var_25_42:SetLineHoldTime(400)
	var_25_42:SetAnimMoveTime(150)
	var_25_42:SetAnimMoveSpeed(50)
	var_25_42:SetEndDelay(1000)
	var_25_42:SetCrossfadeTime(400)
	var_25_42:SetFadeInTime(300)
	var_25_42:SetFadeOutTime(300)
	var_25_42:SetMaxVisibleLines(1)
	var_25_42:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -193, _1080p * -43, _1080p * -332, _1080p * -310)
	var_25_0:addElement(var_25_42)

	var_25_0.RewardName2 = var_25_42

	local var_25_43
	local var_25_44 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_25_1
	})

	var_25_44.id = "MissionRewardCard"

	var_25_44:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 109, _1080p * 259, _1080p * 76, _1080p * 276)
	var_25_0:addElement(var_25_44)

	var_25_0.MissionRewardCard = var_25_44

	local var_25_45
	local var_25_46 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_25_1
	})

	var_25_46.id = "ObjRewardCard1"

	var_25_46:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 109, _1080p * 259, _1080p * 470, _1080p * 670)
	var_25_0:addElement(var_25_46)

	var_25_0.ObjRewardCard1 = var_25_46

	local var_25_47
	local var_25_48 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_25_1
	})

	var_25_48.id = "ObjRewardCard2"

	var_25_48:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 307, _1080p * 457, _1080p * 470, _1080p * 670)
	var_25_0:addElement(var_25_48)

	var_25_0.ObjRewardCard2 = var_25_48

	local var_25_49
	local var_25_50 = LUI.UIStyledText.new()

	var_25_50.id = "ObjectiveReward"

	var_25_50:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_50:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_REWARD"), 0)
	var_25_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_50:SetAlignment(LUI.Alignment.Left)
	var_25_50:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 610, _1080p * 957, _1080p * 411, _1080p * 431)
	var_25_0:addElement(var_25_50)

	var_25_0.ObjectiveReward = var_25_50

	local var_25_51
	local var_25_52 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_25_1
	})

	var_25_52.id = "RightArrow"

	var_25_52:SetZRotation(-90, 0)
	var_25_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 513, _1080p * 545, _1080p * 489, _1080p * 521)
	var_25_0:addElement(var_25_52)

	var_25_0.RightArrow = var_25_52

	local var_25_53
	local var_25_54 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_25_1
	})

	var_25_54.id = "LeftArrow"

	var_25_54:SetZRotation(90, 0)
	var_25_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 489, _1080p * 521)
	var_25_0:addElement(var_25_54)

	var_25_0.LeftArrow = var_25_54

	local var_25_55
	local var_25_56 = LUI.UIImage.new()

	var_25_56.id = "Line"

	var_25_56:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_56:SetAlpha(0.4, 0)
	var_25_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 580, _1080p * 581, _1080p * 43, _1080p * 310)
	var_25_0:addElement(var_25_56)

	var_25_0.Line = var_25_56

	local var_25_57
	local var_25_58 = LUI.UIText.new()

	var_25_58.id = "UnlockDesc"

	var_25_58:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_58:SetAlpha(0, 0)
	var_25_58:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED"), 0)
	var_25_58:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_58:SetAlignment(LUI.Alignment.Left)
	var_25_58:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_58:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 52, _1080p * 554, _1080p * 191.5, _1080p * 213.5)
	var_25_0:addElement(var_25_58)

	var_25_0.UnlockDesc = var_25_58

	local var_25_59
	local var_25_60 = LUI.UIImage.new()

	var_25_60.id = "Lock"

	var_25_60:SetAlpha(0, 0)
	var_25_60:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_25_60:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 52, _1080p * 186.5, _1080p * 218.5)
	var_25_0:addElement(var_25_60)

	var_25_0.Lock = var_25_60

	local var_25_61
	local var_25_62 = LUI.UIStyledText.new()

	var_25_62.id = "WeaponDetails"

	var_25_62:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_62:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_LOOT_ITEM"), 0)
	var_25_62:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_62:SetWordWrap(false)
	var_25_62:SetAlignment(LUI.Alignment.Left)
	var_25_62:SetTintFontIcons(true)
	var_25_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 53, _1080p * 215, _1080p * 627, _1080p * 651)
	var_25_0:addElement(var_25_62)

	var_25_0.WeaponDetails = var_25_62

	local var_25_63
	local var_25_64 = LUI.UIStyledText.new()

	var_25_64.id = "IntelPrompt"

	var_25_64:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_64:SetAlpha(0, 0)
	var_25_64:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_INTEL_PROMPT"), 0)
	var_25_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_64:SetWordWrap(false)
	var_25_64:SetAlignment(LUI.Alignment.Left)
	var_25_64:SetTintFontIcons(true)
	var_25_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 52, _1080p * 302, _1080p * 658, _1080p * 682)
	var_25_0:addElement(var_25_64)

	var_25_0.IntelPrompt = var_25_64

	local var_25_65
	local var_25_66 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_25_1
	})

	var_25_66.id = "ObjectivesProgressBar"

	var_25_66.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_25_66.Overlay:SetAlpha(0.2, 0)
	var_25_66.Fill:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_25_66:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 53, _1080p * -446, _1080p * 581, _1080p * 599)
	var_25_0:addElement(var_25_66)

	var_25_0.ObjectivesProgressBar = var_25_66

	local var_25_67
	local var_25_68 = LUI.UIText.new()

	var_25_68.id = "ObjectivesProgressDesc"

	var_25_68:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_25_68:setText("99/99", 0)
	var_25_68:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_68:SetAlignment(LUI.Alignment.Left)
	var_25_68:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 57, _1080p * 388, _1080p * 581, _1080p * 599)
	var_25_0:addElement(var_25_68)

	var_25_0.ObjectivesProgressDesc = var_25_68

	local var_25_69
	local var_25_70 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_25_1
	})

	var_25_70.id = "Checkbox"

	var_25_70.Backer:SetAlpha(0.2, 0)
	var_25_70.Frame:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_25_70.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_25_70:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 27, _1080p * 45, _1080p * 193.5, _1080p * 211.5)
	var_25_0:addElement(var_25_70)

	var_25_0.Checkbox = var_25_70

	local var_25_71
	local var_25_72 = LUI.UIStyledText.new()

	var_25_72.id = "BattlePassStage"

	var_25_72:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_72:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_25_72:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_25_72:SetAlignment(LUI.Alignment.Left)
	var_25_72:SetOptOutRightToLeftAlignmentFlip(true)
	var_25_72:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 566, _1080p * 298, _1080p * 320)
	var_25_0:addElement(var_25_72)

	var_25_0.BattlePassStage = var_25_72

	local var_25_73
	local var_25_74 = LUI.UIText.new()

	var_25_74.id = "CurrentBattlePassStage"

	var_25_74:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_25_74:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_74:SetAlignment(LUI.Alignment.Left)
	var_25_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 566, _1080p * 322, _1080p * 342)
	var_25_0:addElement(var_25_74)

	var_25_0.CurrentBattlePassStage = var_25_74

	local var_25_75
	local var_25_76 = LUI.UIStyledText.new()

	var_25_76.id = "MissionUnlockDescription"

	var_25_76:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_25_76:setText(Engine.CBBHFCGDIC("CHALLENGE/OPERATOR_MISSION_UNLOCK_DESCRIPTION"), 0)
	var_25_76:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_76:SetAlignment(LUI.Alignment.Left)
	var_25_76:SetVerticalAlignment(LUI.Alignment.Center)
	var_25_76:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 530, _1080p * 309, _1080p * 327)
	var_25_0:addElement(var_25_76)

	var_25_0.MissionUnlockDescription = var_25_76

	local var_25_77
	local var_25_78 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_25_1
	})

	var_25_78.id = "RestartOverlayBottom"

	var_25_78:SetAlpha(0.65, 0)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_25_78.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	end

	var_25_78:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -387, _1080p * -55)
	var_25_0:addElement(var_25_78)

	var_25_0.RestartOverlayBottom = var_25_78

	local var_25_79
	local var_25_80 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_25_1
	})

	var_25_80.id = "RestartOverlayTop"

	var_25_80:SetAlpha(0.65, 0)

	if not CONDITIONS.IsWZWipDvarEnabled() then
		var_25_80.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	end

	var_25_80:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -775, _1080p * -430)
	var_25_0:addElement(var_25_80)

	var_25_0.RestartOverlayTop = var_25_80

	local function var_25_81()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_81

	local var_25_82
	local var_25_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("ShowExclusiveText", var_25_83)

	local var_25_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("ShowExclusiveText", var_25_84)

	local function var_25_85()
		var_25_14:AnimateSequence("ShowExclusiveText")
		var_25_16:AnimateSequence("ShowExclusiveText")
	end

	var_25_0._sequences.ShowExclusiveText = var_25_85

	local var_25_86
	local var_25_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_14:RegisterAnimationSequence("HideExclusiveText", var_25_87)

	local var_25_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_16:RegisterAnimationSequence("HideExclusiveText", var_25_88)

	local function var_25_89()
		var_25_14:AnimateSequence("HideExclusiveText")
		var_25_16:AnimateSequence("HideExclusiveText")
	end

	var_25_0._sequences.HideExclusiveText = var_25_89

	local var_25_90
	local var_25_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_29:RegisterAnimationSequence("SingleObjective", var_25_91)

	local var_25_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_32:RegisterAnimationSequence("SingleObjective", var_25_92)

	local var_25_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_34:RegisterAnimationSequence("SingleObjective", var_25_93)

	local var_25_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_52:RegisterAnimationSequence("SingleObjective", var_25_94)

	local var_25_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_54:RegisterAnimationSequence("SingleObjective", var_25_95)

	local function var_25_96()
		var_25_29:AnimateSequence("SingleObjective")
		var_25_32:AnimateSequence("SingleObjective")
		var_25_34:AnimateSequence("SingleObjective")
		var_25_52:AnimateSequence("SingleObjective")
		var_25_54:AnimateSequence("SingleObjective")
	end

	var_25_0._sequences.SingleObjective = var_25_96

	local var_25_97
	local var_25_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("MultiObjective", var_25_98)

	local var_25_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_20:RegisterAnimationSequence("MultiObjective", var_25_99)

	local var_25_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_29:RegisterAnimationSequence("MultiObjective", var_25_100)

	local var_25_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_32:RegisterAnimationSequence("MultiObjective", var_25_101)

	local var_25_102 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_34:RegisterAnimationSequence("MultiObjective", var_25_102)

	local var_25_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_44:RegisterAnimationSequence("MultiObjective", var_25_103)

	local var_25_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 609
		}
	}

	var_25_50:RegisterAnimationSequence("MultiObjective", var_25_104)

	local var_25_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_52:RegisterAnimationSequence("MultiObjective", var_25_105)

	local var_25_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_54:RegisterAnimationSequence("MultiObjective", var_25_106)

	local function var_25_107()
		var_25_6:AnimateSequence("MultiObjective")
		var_25_20:AnimateSequence("MultiObjective")
		var_25_29:AnimateSequence("MultiObjective")
		var_25_32:AnimateSequence("MultiObjective")
		var_25_34:AnimateSequence("MultiObjective")
		var_25_44:AnimateSequence("MultiObjective")
		var_25_50:AnimateSequence("MultiObjective")
		var_25_52:AnimateSequence("MultiObjective")
		var_25_54:AnimateSequence("MultiObjective")
	end

	var_25_0._sequences.MultiObjective = var_25_107

	local var_25_108
	local var_25_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_25_24:RegisterAnimationSequence("ObjRewards1", var_25_109)

	local var_25_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_40:RegisterAnimationSequence("ObjRewards1", var_25_110)

	local var_25_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_42:RegisterAnimationSequence("ObjRewards1", var_25_111)

	local var_25_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_46:RegisterAnimationSequence("ObjRewards1", var_25_112)

	local var_25_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_48:RegisterAnimationSequence("ObjRewards1", var_25_113)

	local function var_25_114()
		var_25_24:AnimateSequence("ObjRewards1")
		var_25_40:AnimateSequence("ObjRewards1")
		var_25_42:AnimateSequence("ObjRewards1")
		var_25_46:AnimateSequence("ObjRewards1")
		var_25_48:AnimateSequence("ObjRewards1")
	end

	var_25_0._sequences.ObjRewards1 = var_25_114

	local var_25_115
	local var_25_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_25_24:RegisterAnimationSequence("ObjRewards2", var_25_116)

	local var_25_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_40:RegisterAnimationSequence("ObjRewards2", var_25_117)

	local var_25_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_42:RegisterAnimationSequence("ObjRewards2", var_25_118)

	local var_25_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 109
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 259
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_46:RegisterAnimationSequence("ObjRewards2", var_25_119)

	local var_25_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 307
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 457
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_48:RegisterAnimationSequence("ObjRewards2", var_25_120)

	local function var_25_121()
		var_25_24:AnimateSequence("ObjRewards2")
		var_25_40:AnimateSequence("ObjRewards2")
		var_25_42:AnimateSequence("ObjRewards2")
		var_25_46:AnimateSequence("ObjRewards2")
		var_25_48:AnimateSequence("ObjRewards2")
	end

	var_25_0._sequences.ObjRewards2 = var_25_121

	local var_25_122
	local var_25_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -434
		}
	}

	var_25_4:RegisterAnimationSequence("HideMissionReward", var_25_123)

	local var_25_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("HideMissionReward", var_25_124)

	local var_25_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("HideMissionReward", var_25_125)

	local var_25_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_20:RegisterAnimationSequence("HideMissionReward", var_25_126)

	local var_25_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_22:RegisterAnimationSequence("HideMissionReward", var_25_127)

	local var_25_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_44:RegisterAnimationSequence("HideMissionReward", var_25_128)

	local function var_25_129()
		var_25_4:AnimateSequence("HideMissionReward")
		var_25_6:AnimateSequence("HideMissionReward")
		var_25_10:AnimateSequence("HideMissionReward")
		var_25_20:AnimateSequence("HideMissionReward")
		var_25_22:AnimateSequence("HideMissionReward")
		var_25_44:AnimateSequence("HideMissionReward")
	end

	var_25_0._sequences.HideMissionReward = var_25_129

	local var_25_130
	local var_25_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_25_4:RegisterAnimationSequence("ShowMissionReward", var_25_131)

	local var_25_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_6:RegisterAnimationSequence("ShowMissionReward", var_25_132)

	local var_25_133 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_10:RegisterAnimationSequence("ShowMissionReward", var_25_133)

	local var_25_134 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_20:RegisterAnimationSequence("ShowMissionReward", var_25_134)

	local var_25_135 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_25_22:RegisterAnimationSequence("ShowMissionReward", var_25_135)

	local var_25_136 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_44:RegisterAnimationSequence("ShowMissionReward", var_25_136)

	local function var_25_137()
		var_25_4:AnimateSequence("ShowMissionReward")
		var_25_6:AnimateSequence("ShowMissionReward")
		var_25_10:AnimateSequence("ShowMissionReward")
		var_25_20:AnimateSequence("ShowMissionReward")
		var_25_22:AnimateSequence("ShowMissionReward")
		var_25_44:AnimateSequence("ShowMissionReward")
	end

	var_25_0._sequences.ShowMissionReward = var_25_137

	local var_25_138
	local var_25_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -420
		}
	}

	var_25_24:RegisterAnimationSequence("ObjNoRewards", var_25_139)

	local var_25_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_40:RegisterAnimationSequence("ObjNoRewards", var_25_140)

	local var_25_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_42:RegisterAnimationSequence("ObjNoRewards", var_25_141)

	local var_25_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_46:RegisterAnimationSequence("ObjNoRewards", var_25_142)

	local var_25_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_48:RegisterAnimationSequence("ObjNoRewards", var_25_143)

	local var_25_144 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_50:RegisterAnimationSequence("ObjNoRewards", var_25_144)

	local function var_25_145()
		var_25_24:AnimateSequence("ObjNoRewards")
		var_25_40:AnimateSequence("ObjNoRewards")
		var_25_42:AnimateSequence("ObjNoRewards")
		var_25_46:AnimateSequence("ObjNoRewards")
		var_25_48:AnimateSequence("ObjNoRewards")
		var_25_50:AnimateSequence("ObjNoRewards")
	end

	var_25_0._sequences.ObjNoRewards = var_25_145

	local var_25_146
	local var_25_147 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_58:RegisterAnimationSequence("LockedObjective", var_25_147)

	local var_25_148 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_60:RegisterAnimationSequence("LockedObjective", var_25_148)

	local var_25_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_66:RegisterAnimationSequence("LockedObjective", var_25_149)

	local var_25_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_68:RegisterAnimationSequence("LockedObjective", var_25_150)

	local var_25_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_70:RegisterAnimationSequence("LockedObjective", var_25_151)

	local function var_25_152()
		var_25_58:AnimateSequence("LockedObjective")
		var_25_60:AnimateSequence("LockedObjective")
		var_25_66:AnimateSequence("LockedObjective")
		var_25_68:AnimateSequence("LockedObjective")
		var_25_70:AnimateSequence("LockedObjective")
	end

	var_25_0._sequences.LockedObjective = var_25_152

	local var_25_153
	local var_25_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_58:RegisterAnimationSequence("UnlockedObjective", var_25_154)

	local var_25_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_60:RegisterAnimationSequence("UnlockedObjective", var_25_155)

	local var_25_156 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_66:RegisterAnimationSequence("UnlockedObjective", var_25_156)

	local var_25_157 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_68:RegisterAnimationSequence("UnlockedObjective", var_25_157)

	local var_25_158 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_70:RegisterAnimationSequence("UnlockedObjective", var_25_158)

	local function var_25_159()
		var_25_58:AnimateSequence("UnlockedObjective")
		var_25_60:AnimateSequence("UnlockedObjective")
		var_25_66:AnimateSequence("UnlockedObjective")
		var_25_68:AnimateSequence("UnlockedObjective")
		var_25_70:AnimateSequence("UnlockedObjective")
	end

	var_25_0._sequences.UnlockedObjective = var_25_159

	local var_25_160
	local var_25_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		}
	}

	var_25_6:RegisterAnimationSequence("AR", var_25_161)

	local var_25_162 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 48
		}
	}

	var_25_8:RegisterAnimationSequence("AR", var_25_162)

	local var_25_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 89
		}
	}

	var_25_10:RegisterAnimationSequence("AR", var_25_163)

	local var_25_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		}
	}

	var_25_22:RegisterAnimationSequence("AR", var_25_164)

	local var_25_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -323
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -295
		}
	}

	var_25_26:RegisterAnimationSequence("AR", var_25_165)

	local var_25_166 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -201
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -231
		}
	}

	var_25_36:RegisterAnimationSequence("AR", var_25_166)

	local var_25_167 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -338
		}
	}

	var_25_40:RegisterAnimationSequence("AR", var_25_167)

	local var_25_168 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -338
		}
	}

	var_25_42:RegisterAnimationSequence("AR", var_25_168)

	local var_25_169 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 434
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 406
		}
	}

	var_25_50:RegisterAnimationSequence("AR", var_25_169)

	local var_25_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 670
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 640
		}
	}

	var_25_62:RegisterAnimationSequence("AR", var_25_170)

	local var_25_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 605
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 575
		}
	}

	var_25_68:RegisterAnimationSequence("AR", var_25_171)

	local function var_25_172()
		var_25_6:AnimateSequence("AR")
		var_25_8:AnimateSequence("AR")
		var_25_10:AnimateSequence("AR")
		var_25_22:AnimateSequence("AR")
		var_25_26:AnimateSequence("AR")
		var_25_36:AnimateSequence("AR")
		var_25_40:AnimateSequence("AR")
		var_25_42:AnimateSequence("AR")
		var_25_50:AnimateSequence("AR")
		var_25_62:AnimateSequence("AR")
		var_25_68:AnimateSequence("AR")
	end

	var_25_0._sequences.AR = var_25_172

	local var_25_173
	local var_25_174 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_25_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.ObjectivesProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_25_0.ObjectivesProgressBar.Fill
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.ObjectivesProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_66:RegisterAnimationSequence("Complete", var_25_174)

	local var_25_175 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.disabledLootCrate
		}
	}

	var_25_68:RegisterAnimationSequence("Complete", var_25_175)

	local var_25_176 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_25_0.Checkbox.Frame
		}
	}

	var_25_70:RegisterAnimationSequence("Complete", var_25_176)

	local function var_25_177()
		var_25_66:AnimateSequence("Complete")
		var_25_68:AnimateSequence("Complete")
		var_25_70:AnimateSequence("Complete")
	end

	var_25_0._sequences.Complete = var_25_177

	local var_25_178
	local var_25_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle,
			child = var_25_0.ObjectivesProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.ObjectivesProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_25_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_25_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_66:RegisterAnimationSequence("Incomplete", var_25_179)

	local var_25_180 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_25_68:RegisterAnimationSequence("Incomplete", var_25_180)

	local var_25_181 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription,
			child = var_25_0.Checkbox.Frame
		}
	}

	var_25_70:RegisterAnimationSequence("Incomplete", var_25_181)

	local function var_25_182()
		var_25_66:AnimateSequence("Incomplete")
		var_25_68:AnimateSequence("Incomplete")
		var_25_70:AnimateSequence("Incomplete")
	end

	var_25_0._sequences.Incomplete = var_25_182

	local var_25_183
	local var_25_184 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_72:RegisterAnimationSequence("ShowBattlePassDetails", var_25_184)

	local var_25_185 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_74:RegisterAnimationSequence("ShowBattlePassDetails", var_25_185)

	local function var_25_186()
		var_25_72:AnimateSequence("ShowBattlePassDetails")
		var_25_74:AnimateSequence("ShowBattlePassDetails")
	end

	var_25_0._sequences.ShowBattlePassDetails = var_25_186

	local var_25_187
	local var_25_188 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_72:RegisterAnimationSequence("HideBattlePassDetails", var_25_188)

	local var_25_189 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_74:RegisterAnimationSequence("HideBattlePassDetails", var_25_189)

	local function var_25_190()
		var_25_72:AnimateSequence("HideBattlePassDetails")
		var_25_74:AnimateSequence("HideBattlePassDetails")
	end

	var_25_0._sequences.HideBattlePassDetails = var_25_190

	local var_25_191
	local var_25_192 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_64:RegisterAnimationSequence("Intel", var_25_192)

	local var_25_193 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_66:RegisterAnimationSequence("Intel", var_25_193)

	local var_25_194 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_68:RegisterAnimationSequence("Intel", var_25_194)

	local var_25_195 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_70:RegisterAnimationSequence("Intel", var_25_195)

	local function var_25_196()
		var_25_64:AnimateSequence("Intel")
		var_25_66:AnimateSequence("Intel")
		var_25_68:AnimateSequence("Intel")
		var_25_70:AnimateSequence("Intel")
	end

	var_25_0._sequences.Intel = var_25_196

	local var_25_197
	local var_25_198 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine,
			child = var_25_0.MissionTitle.Divider
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_25_0.MissionTitle.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_25_20:RegisterAnimationSequence("WZWipSetup", var_25_198)

	local var_25_199 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_25_26:RegisterAnimationSequence("WZWipSetup", var_25_199)

	local var_25_200 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_25_0.ObjectiveRewardTitle.Text
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine,
			child = var_25_0.ObjectiveRewardTitle.Divider
		}
	}

	var_25_38:RegisterAnimationSequence("WZWipSetup", var_25_200)

	local function var_25_201()
		var_25_20:AnimateSequence("WZWipSetup")
		var_25_26:AnimateSequence("WZWipSetup")
		var_25_38:AnimateSequence("WZWipSetup")
	end

	var_25_0._sequences.WZWipSetup = var_25_201

	local var_25_202
	local var_25_203 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		}
	}

	var_25_8:RegisterAnimationSequence("NoDescription", var_25_203)

	local var_25_204 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 216
		}
	}

	var_25_12:RegisterAnimationSequence("NoDescription", var_25_204)

	local var_25_205 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 283
		}
	}

	var_25_14:RegisterAnimationSequence("NoDescription", var_25_205)

	local var_25_206 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 259
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 277
		}
	}

	var_25_16:RegisterAnimationSequence("NoDescription", var_25_206)

	local var_25_207 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 283
		}
	}

	var_25_18:RegisterAnimationSequence("NoDescription", var_25_207)

	local var_25_208 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 245
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 267
		}
	}

	var_25_72:RegisterAnimationSequence("NoDescription", var_25_208)

	local var_25_209 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 289
		}
	}

	var_25_74:RegisterAnimationSequence("NoDescription", var_25_209)

	local function var_25_210()
		var_25_8:AnimateSequence("NoDescription")
		var_25_12:AnimateSequence("NoDescription")
		var_25_14:AnimateSequence("NoDescription")
		var_25_16:AnimateSequence("NoDescription")
		var_25_18:AnimateSequence("NoDescription")
		var_25_72:AnimateSequence("NoDescription")
		var_25_74:AnimateSequence("NoDescription")
	end

	var_25_0._sequences.NoDescription = var_25_210

	var_0_9(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("BarracksChallengeMissionDetails", BarracksChallengeMissionDetails)
LockTable(_M)
