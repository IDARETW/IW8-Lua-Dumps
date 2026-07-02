module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.BindButton)

	if arg_1_0.BindButton then
		if arg_1_0._isIntel then
			arg_1_0._intelPreviewEnabled = true

			arg_1_0.BindButton:registerEventHandler("button_alt2", function(arg_2_0, arg_2_1)
				if arg_1_0._intelPreviewEnabled and arg_1_0._mission and arg_1_0._objIndex and arg_1_0._mission.objectives and arg_1_0._mission.objectives[arg_1_0._objIndex] then
					local var_2_0 = arg_1_0._mission.objectives[arg_1_0._objIndex].ref
					local var_2_1 = Challenge.GetIntelImage(var_2_0)
					local var_2_2 = Challenge.GetIntelEvent(var_2_0)

					if var_2_1 and #var_2_1 > 0 and var_2_2 and #var_2_2 > 0 then
						if not Challenge.IsInGameIntel(var_2_0) then
							Challenges.DFGEFGFCFC(arg_1_0._controllerIndex, "collect_item", var_2_2)
						end

						LUI.FlowManager.RequestPopupMenu(nil, "PreviewIntelPopup", true, controllerIndex, false, {
							imageOverride = var_2_1,
							intelRef = var_2_0
						})
						Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
					end
				end
			end)
		else
			arg_1_0.BindButton:registerEventHandler("button_alt2", nil)
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._mission = arg_3_1
	arg_3_0._isIntel = arg_3_1.isIntel
	arg_3_0._objIndex = 1

	if arg_3_1.objectives and #arg_3_1.objectives > 1 then
		ACTIONS.AnimateSequence(arg_3_0, "MultiObjective")

		arg_3_0._allowNavigation = true

		if arg_3_2 then
			arg_3_0._objIndex = arg_3_2
			arg_3_0._objIndex = math.min(arg_3_0._objIndex, #arg_3_1.objectives)
		elseif arg_3_1.numObjectivesComplete then
			arg_3_0._objIndex = math.min(arg_3_1.numObjectivesComplete + 1, #arg_3_1.objectives)
		end

		local var_3_0 = arg_3_1.isActive or arg_3_1.category == Challenge.Operator

		arg_3_0.Pips:SetActive(var_3_0)

		local var_3_1 = not arg_3_1.unlocked or arg_3_1.isBattlePassLocked

		if arg_3_0._isIntel then
			var_3_1 = not arg_3_1.isIntelUnlocked
		end

		arg_3_0.Pips:Setup(#arg_3_1.objectives, arg_3_1.numObjectivesComplete, LUI.Alignment.Center, var_3_1)
		arg_3_0.LeftTrigger:SetAlpha(arg_3_0._useGamepadControls and 1 or 0)
		arg_3_0.RightTrigger:SetAlpha(arg_3_0._useGamepadControls and 1 or 0)
		arg_3_0.LeftArrow:SetAlpha(arg_3_0._useGamepadControls and 0 or 1)
		arg_3_0.RightArrow:SetAlpha(arg_3_0._useGamepadControls and 0 or 1)
	else
		ACTIONS.AnimateSequence(arg_3_0, "SingleObjective")

		arg_3_0._allowNavigation = false

		arg_3_0.LeftTrigger:SetAlpha(0)
		arg_3_0.RightTrigger:SetAlpha(0)
		arg_3_0.LeftArrow:SetAlpha(0)
		arg_3_0.RightArrow:SetAlpha(0)
	end

	if arg_3_0._isIntel then
		ACTIONS.AnimateSequence(arg_3_0, "Intel")
		var_0_0(arg_3_0)
	end

	arg_3_0:UpdateObjectiveData()

	if arg_3_1.name and #arg_3_1.name > 0 then
		arg_3_0.MissionTitle.Text:setText(Engine.CBBHFCGDIC(arg_3_1.name))
	else
		arg_3_0.MissionTitle.Text:setText("")
	end

	if arg_3_1.detailDesc and #arg_3_1.detailDesc > 0 then
		arg_3_0.Description:setText(Engine.CBBHFCGDIC(arg_3_1.detailDesc))
	else
		arg_3_0.Description:setText("")
	end

	arg_3_0.ActiveTag:SetAlpha((arg_3_1.isActive or arg_3_1.complete) and 1 or 0)
	ACTIONS.AnimateSequence(arg_3_0, "HideExclusiveText")

	if arg_3_1.isActive then
		arg_3_0.ActiveTag:SetupEventBanner(Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"))
	elseif arg_3_1.complete then
		arg_3_0.ActiveTag:SetupEventBanner(Engine.CBBHFCGDIC("CAS/CHALLENGE_COMPLETE"))
	elseif arg_3_1.isPS4Exclusive then
		arg_3_0.ActiveTag:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_3_0, "ShowExclusiveText")
	end

	if arg_3_1.rewards and #arg_3_1.rewards > 0 then
		ACTIONS.AnimateSequence(arg_3_0, "ShowMissionReward")

		local var_3_2 = arg_3_1.rewards[Challenge.Reward.LOOT] or arg_3_1.rewards[Challenge.Reward.XP]

		arg_3_0.MissionRewardCard:UpdateCardConfig(var_3_2)

		if var_3_2.typeName and #var_3_2.typeName > 0 then
			arg_3_0.MissionRewardLoot:setText(var_3_2.typeName)
		else
			arg_3_0.MissionRewardLoot:setText("")
		end
	else
		ACTIONS.AnimateSequence(arg_3_0, "HideMissionReward")
	end

	if arg_3_1.isBattlePassLocked and arg_3_1.category == Challenge.Operator then
		arg_3_0.BattlePassStage:setText(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(arg_3_1.battlePassLevelToUnlock)))

		if BATTLEPASS.IsOwned(arg_3_0._controllerIndex) then
			arg_3_0.CurrentBattlePassStage:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER", Engine.JCBDICCAH(BATTLEPASS.GetTier(arg_3_0._controllerIndex))))
		else
			arg_3_0.CurrentBattlePassStage:setText(Engine.CBBHFCGDIC("BATTLEPASS/BATTLE_PASS_INACTIVE"))
		end

		ACTIONS.AnimateSequence(arg_3_0, "ShowBattlePassDetails")
		arg_3_0.ActiveTag:SetAlpha(0)
	else
		ACTIONS.AnimateSequence(arg_3_0, "HideBattlePassDetails")
	end
end

local function var_0_2(arg_4_0)
	arg_4_0.ObjectivesDescription:setText("")
	arg_4_0.IntelPrompt:SetAlpha(0)

	arg_4_0._intelPreviewEnabled = false

	local var_4_0 = arg_4_0._mission.objectives

	if var_4_0 and #var_4_0 > 0 then
		if arg_4_0._objIndex > 1 then
			if arg_4_0._objIndex <= arg_4_0._mission.numObjectivesComplete + 1 then
				arg_4_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_4_0[arg_4_0._objIndex].desc))
				arg_4_0.IntelPrompt:SetAlpha(1)

				arg_4_0._intelPreviewEnabled = true
			end
		elseif arg_4_0._mission.isActive or arg_4_0._mission.complete then
			arg_4_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_4_0[arg_4_0._objIndex].desc))
			arg_4_0.IntelPrompt:SetAlpha(1)

			arg_4_0._intelPreviewEnabled = true
		end

		local var_4_1 = var_4_0[arg_4_0._objIndex]

		if var_4_1.image and #var_4_1.image > 0 then
			arg_4_0.KeyArt:setImage(RegisterMaterial(var_4_1.image))
		end
	end

	if arg_4_0._mission.isActive and arg_4_0._objIndex > arg_4_0._mission.numObjectivesComplete + 1 then
		arg_4_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED", arg_4_0._objIndex - 1))
		arg_4_0.UnlockDesc:SetAlpha(1)
		arg_4_0.Lock:SetAlpha(1)
	else
		arg_4_0.UnlockDesc:setText("")
		arg_4_0.UnlockDesc:SetAlpha(0)
		arg_4_0.Lock:SetAlpha(0)
	end
end

local function var_0_3(arg_5_0)
	local var_5_0

	if arg_5_0._mission.objectives and #arg_5_0._mission.objectives > 1 then
		var_5_0 = arg_5_0._mission.objectives[arg_5_0._objIndex]

		arg_5_0.Pips:SetSelected(arg_5_0._objIndex)
		arg_5_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", arg_5_0._objIndex, #arg_5_0._mission.objectives))
	else
		var_5_0 = arg_5_0._mission

		arg_5_0.ObjectivesTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", 1, 1))
	end

	if var_5_0.image and #var_5_0.image > 0 then
		arg_5_0.KeyArt:setImage(RegisterMaterial(var_5_0.image))
	end

	if arg_5_0._isIntel then
		var_0_2(arg_5_0)
	else
		if var_5_0.desc and var_5_0.amount then
			arg_5_0.ObjectivesDescription:setText(Engine.CBBHFCGDIC(var_5_0.desc, var_5_0.amount))
		else
			arg_5_0.ObjectivesDescription:setText("")
		end

		if arg_5_0._objIndex <= arg_5_0._mission.numObjectivesComplete + 1 then
			ACTIONS.AnimateSequence(arg_5_0, "UnlockedObjective")

			if not var_5_0.progress then
				arg_5_0.ObjectivesProgressBar:SetAlpha(0)
			else
				local var_5_1 = var_5_0.amountEarned / var_5_0.amountNeeded

				arg_5_0.ObjectivesProgressBar:SetProgress(var_5_1)
				arg_5_0.Checkbox:SetValue(var_5_1 == 1, true)
				ACTIONS.AnimateSequence(arg_5_0, var_5_1 == 1 and "Complete" or "Incomplete")
			end
		else
			ACTIONS.AnimateSequence(arg_5_0, "LockedObjective")
			arg_5_0.UnlockDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED", arg_5_0._objIndex - 1))
		end

		if var_5_0.amountEarned and var_5_0.amountNeeded then
			arg_5_0.ObjectivesProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_5_0.amountEarned, var_5_0.amountNeeded))
		else
			arg_5_0.ObjectivesProgressDesc:setText("")
		end
	end

	if var_5_0.rewards and #var_5_0.rewards > 0 then
		local var_5_2 = math.min(#var_5_0.rewards, #arg_5_0._rewardWidgets)

		ACTIONS.AnimateSequence(arg_5_0, "ObjRewards" .. var_5_2)

		for iter_5_0 = 1, var_5_2 do
			local var_5_3 = var_5_0.rewards[iter_5_0]
			local var_5_4 = arg_5_0._rewardWidgets[iter_5_0]

			if var_5_3.typeName and #var_5_3.typeName > 0 then
				var_5_4.nameLabel:setText(var_5_3.typeName)
			else
				var_5_4.nameLabel:setText("")
			end

			var_5_4.lootCard:UpdateCardConfig(var_5_3)

			if var_5_3.lootItemID then
				arg_5_0._previewData = var_5_3

				arg_5_0.WeaponDetails:SetAlpha(1)
			else
				arg_5_0._previewData = nil

				arg_5_0.WeaponDetails:SetAlpha(0)
			end
		end
	else
		ACTIONS.AnimateSequence(arg_5_0, "ObjNoRewards")
	end

	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.challengePipTab)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.MissionRewardCard)
	assert(arg_6_0.MissionRewardLoot)
	assert(arg_6_0.RewardName1)
	assert(arg_6_0.ObjRewardCard1)
	assert(arg_6_0.RewardName2)
	assert(arg_6_0.ObjRewardCard2)

	arg_6_0.SetData = var_0_1
	arg_6_0.UpdateObjectiveData = var_0_3
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._rewardWidgets = {
		{
			nameLabel = arg_6_0.RewardName1,
			lootCard = arg_6_0.ObjRewardCard1
		},
		{
			nameLabel = arg_6_0.RewardName2,
			lootCard = arg_6_0.ObjRewardCard2
		}
	}
	arg_6_0.BindButton = LUI.UIBindButton.new()
	arg_6_0.BindButton.id = "BindButton"

	arg_6_0:addElement(arg_6_0.BindButton)
	arg_6_0.BindButton:registerEventHandler("button_right_stick", function(arg_7_0, arg_7_1)
		if arg_6_0._previewData then
			local var_7_0 = arg_6_0:GetCurrentMenu()

			if var_7_0 then
				local var_7_1 = LUI.FlowManager.GetScopedData(var_7_0)

				if var_7_1 then
					var_7_1.focussedMissionIndex = arg_6_0._objIndex
				end
			end

			STORE.PreviewItem(arg_6_1, arg_6_0._previewData.type, arg_6_0._previewData.itemID)

			if arg_7_1.qualifier then
				Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
			end
		end
	end)

	local function var_6_0(arg_8_0)
		arg_8_0 = arg_8_0:getParent()

		if arg_8_0._allowNavigation then
			if arg_8_0._objIndex > 1 then
				arg_8_0._objIndex = arg_8_0._objIndex - 1
			else
				arg_8_0._objIndex = #arg_8_0._mission.objectives
			end

			arg_8_0:UpdateObjectiveData()
		end
	end

	local function var_6_1(arg_9_0)
		arg_9_0 = arg_9_0:getParent()

		if arg_9_0._allowNavigation then
			if arg_9_0._objIndex < #arg_9_0._mission.objectives then
				arg_9_0._objIndex = arg_9_0._objIndex + 1
			else
				arg_9_0._objIndex = 1
			end

			arg_9_0:UpdateObjectiveData()
		end
	end

	local function var_6_2(arg_10_0, arg_10_1)
		if arg_10_1.down and arg_10_1.qualifier == "mousewheel" then
			if arg_10_1.button == "up" then
				var_6_0(arg_10_0)
			else
				var_6_1(arg_10_0)
			end
		end
	end

	local function var_6_3(arg_11_0, arg_11_1)
		local var_11_0 = LUI.IsLastInputGamepad(arg_11_1.controllerIndex)

		arg_11_0._useGamepadControls = var_11_0

		local var_11_1 = var_11_0 and arg_11_0._allowNavigation
		local var_11_2 = not var_11_0 and arg_11_0._allowNavigation

		arg_11_0.LeftTrigger:SetAlpha(var_11_1 and 1 or 0)
		arg_11_0.RightTrigger:SetAlpha(var_11_1 and 1 or 0)
		arg_11_0.LeftArrow:SetAlpha(var_11_2 and 1 or 0)
		arg_11_0.RightArrow:SetAlpha(var_11_2 and 1 or 0)
		arg_11_0.BindButton:registerEventHandler("button_left_trigger", var_11_0 and var_6_0 or nil)
		arg_11_0.BindButton:registerEventHandler("button_right_trigger", var_11_0 and var_6_1 or nil)
		arg_11_0.BindButton:registerEventHandler("button_left", not var_11_0 and var_6_0 or nil)
		arg_11_0.BindButton:registerEventHandler("button_right", not var_11_0 and var_6_1 or nil)
	end

	arg_6_0:registerAndCallEventHandler("update_input_type", var_6_3, {
		controllerIndex = arg_6_1
	})
	arg_6_0.LeftArrow:addEventHandler("leftmouseup", var_6_0)
	arg_6_0.RightArrow:addEventHandler("leftmouseup", var_6_1)
	arg_6_0.ObjectiveBackground:SetHandleMouse(true)
	arg_6_0.ObjectiveBackground:registerEventHandler("gamepad_button", var_6_2)
	arg_6_0:registerEventHandler("mission_details_mouse_navigate", function(arg_12_0, arg_12_1)
		if arg_12_0._allowNavigation then
			arg_12_0._objIndex = arg_12_1.index

			arg_12_0:UpdateObjectiveData()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "AR")
	end
end

function BarracksChallengeMissionDetails(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 775 * _1080p)

	var_13_0.id = "BarracksChallengeMissionDetails"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "ChallengeDescBacker"

	var_13_4:SetAlpha(0.5, 0)
	var_13_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 345)
	var_13_0:addElement(var_13_4)

	var_13_0.ChallengeDescBacker = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIStyledText.new()

	var_13_6.id = "Reward"

	var_13_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_6:setText(Engine.CBBHFCGDIC("LOOT_MP/FINAL_REWARD"), 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 610, _1080p * 957, _1080p * 23, _1080p * 43)
	var_13_0:addElement(var_13_6)

	var_13_0.Reward = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIStyledText.new()

	var_13_8.id = "Description"

	var_13_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_8:setText("", 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 554, _1080p * 53, _1080p * 75)
	var_13_0:addElement(var_13_8)

	var_13_0.Description = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIStyledText.new()

	var_13_10.id = "IncentiveText"

	var_13_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_10:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE_OBJECTIVES_EARN_REWARD"), 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_10:SetAlignment(LUI.Alignment.Center)
	var_13_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 795, _1080p * 957, _1080p * 165, _1080p * 187)
	var_13_0:addElement(var_13_10)

	var_13_0.IncentiveText = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "KeyArt"

	var_13_12:setImage(RegisterMaterial("mission_bestofthebest"), 0)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 554, _1080p * 162, _1080p * 292)
	var_13_0:addElement(var_13_12)

	var_13_0.KeyArt = var_13_12

	local var_13_13
	local var_13_14 = LUI.UIImage.new()

	var_13_14.id = "Playstation"

	var_13_14:SetAlpha(0, 0)
	var_13_14:setImage(RegisterMaterial("icon_platform_playstation"), 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 21, _1080p * 53, _1080p * 304, _1080p * 336)
	var_13_0:addElement(var_13_14)

	var_13_0.Playstation = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIText.new()

	var_13_16.id = "PlaystationExclusiveText"

	var_13_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_16:SetAlpha(0, 0)
	var_13_16:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYSTATION_EXCLUSIVE_MISSION"), 0)
	var_13_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_16:SetAlignment(LUI.Alignment.Left)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 364, _1080p * 312, _1080p * 330)
	var_13_0:addElement(var_13_16)

	var_13_0.PlaystationExclusiveText = var_13_16

	local var_13_17
	local var_13_18 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_13_1
	})

	var_13_18.id = "ActiveTag"

	var_13_18.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_13_18.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_13_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 180, _1080p * 306, _1080p * 336)
	var_13_0:addElement(var_13_18)

	var_13_0.ActiveTag = var_13_18

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "MissionTitle"

	var_13_20.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSION_REWARD"), 0)
	var_13_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1000, _1080p * -642, 0, _1080p * 46)
	var_13_0:addElement(var_13_20)

	var_13_0.MissionTitle = var_13_20

	local var_13_21
	local var_13_22 = LUI.UIStyledText.new()

	var_13_22.id = "MissionRewardLoot"

	var_13_22:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_22:setText("", 0)
	var_13_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_22:SetAlignment(LUI.Alignment.Left)
	var_13_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_13_22:SetStartupDelay(1000)
	var_13_22:SetLineHoldTime(400)
	var_13_22:SetAnimMoveTime(150)
	var_13_22:SetAnimMoveSpeed(50)
	var_13_22:SetEndDelay(1000)
	var_13_22:SetCrossfadeTime(400)
	var_13_22:SetFadeInTime(300)
	var_13_22:SetFadeOutTime(300)
	var_13_22:SetMaxVisibleLines(1)
	var_13_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 110, _1080p * 260, _1080p * 51, _1080p * 73)
	var_13_0:addElement(var_13_22)

	var_13_0.MissionRewardLoot = var_13_22

	local var_13_23
	local var_13_24 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_13_1
	})

	var_13_24.id = "ObjectiveBackground"

	var_13_24:SetAlpha(0.5, 0)
	var_13_24:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -387, _1080p * -55)
	var_13_0:addElement(var_13_24)

	var_13_0.ObjectiveBackground = var_13_24

	local var_13_25
	local var_13_26 = LUI.UIStyledText.new()

	var_13_26.id = "ObjectivesTitle"

	var_13_26:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_26:setText("", 0)
	var_13_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_26:SetAlignment(LUI.Alignment.Center)
	var_13_26:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 21, _1080p * 553, _1080p * -310, _1080p * -282)
	var_13_0:addElement(var_13_26)

	var_13_0.ObjectivesTitle = var_13_26

	local var_13_27
	local var_13_28 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_13_1
	}
	local var_13_29 = MenuBuilder.BuildRegisteredType("IconImage", var_13_28)

	var_13_29.id = "LeftTrigger"

	var_13_29:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_29:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 32, _1080p * 60, _1080p * -284, _1080p * -256)
	var_13_0:addElement(var_13_29)

	var_13_0.LeftTrigger = var_13_29

	local var_13_30
	local var_13_31 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_13_1
	}
	local var_13_32 = MenuBuilder.BuildRegisteredType("IconImage", var_13_31)

	var_13_32.id = "RightTrigger"

	var_13_32:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 515, _1080p * 543, _1080p * -284, _1080p * -256)
	var_13_0:addElement(var_13_32)

	var_13_0.RightTrigger = var_13_32

	local var_13_33
	local var_13_34 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_13_1
	})

	var_13_34.id = "Pips"

	var_13_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 276, _1080p * 290, _1080p * -272, _1080p * -268)
	var_13_0:addElement(var_13_34)

	var_13_0.Pips = var_13_34

	local var_13_35
	local var_13_36 = LUI.UIStyledText.new()

	var_13_36.id = "ObjectivesDescription"

	var_13_36:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_36:setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.", 0)
	var_13_36:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_36:SetAlignment(LUI.Alignment.Left)
	var_13_36:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_13_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_13_36:SetStartupDelay(1000)
	var_13_36:SetLineHoldTime(400)
	var_13_36:SetAnimMoveTime(1000)
	var_13_36:SetAnimMoveSpeed(150)
	var_13_36:SetEndDelay(1000)
	var_13_36:SetCrossfadeTime(1000)
	var_13_36:SetFadeInTime(300)
	var_13_36:SetFadeOutTime(300)
	var_13_36:SetMaxVisibleLines(2)
	var_13_36:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 52, _1080p * 553, _1080p * -227, _1080p * -205)
	var_13_0:addElement(var_13_36)

	var_13_0.ObjectivesDescription = var_13_36

	local var_13_37
	local var_13_38 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_13_1
	})

	var_13_38.id = "ObjectiveRewardTitle"

	var_13_38.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/OBJECTIVES_OPERATION_MENU"), 0)
	var_13_38:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -1000, _1080p * -642, _1080p * -387, _1080p * -341)
	var_13_0:addElement(var_13_38)

	var_13_0.ObjectiveRewardTitle = var_13_38

	local var_13_39
	local var_13_40 = LUI.UIStyledText.new()

	var_13_40.id = "RewardName1"

	var_13_40:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_40:setText("", 0)
	var_13_40:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_40:SetAlignment(LUI.Alignment.Left)
	var_13_40:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_13_40:SetStartupDelay(1000)
	var_13_40:SetLineHoldTime(400)
	var_13_40:SetAnimMoveTime(150)
	var_13_40:SetAnimMoveSpeed(50)
	var_13_40:SetEndDelay(1000)
	var_13_40:SetCrossfadeTime(400)
	var_13_40:SetFadeInTime(300)
	var_13_40:SetFadeOutTime(300)
	var_13_40:SetMaxVisibleLines(1)
	var_13_40:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -390, _1080p * -241, _1080p * -332, _1080p * -310)
	var_13_0:addElement(var_13_40)

	var_13_0.RewardName1 = var_13_40

	local var_13_41
	local var_13_42 = LUI.UIStyledText.new()

	var_13_42.id = "RewardName2"

	var_13_42:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_42:setText("", 0)
	var_13_42:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_42:SetAlignment(LUI.Alignment.Left)
	var_13_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_13_42:SetStartupDelay(1000)
	var_13_42:SetLineHoldTime(400)
	var_13_42:SetAnimMoveTime(150)
	var_13_42:SetAnimMoveSpeed(50)
	var_13_42:SetEndDelay(1000)
	var_13_42:SetCrossfadeTime(400)
	var_13_42:SetFadeInTime(300)
	var_13_42:SetFadeOutTime(300)
	var_13_42:SetMaxVisibleLines(1)
	var_13_42:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -193, _1080p * -43, _1080p * -332, _1080p * -310)
	var_13_0:addElement(var_13_42)

	var_13_0.RewardName2 = var_13_42

	local var_13_43
	local var_13_44 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_13_1
	})

	var_13_44.id = "MissionRewardCard"

	var_13_44:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 109, _1080p * 259, _1080p * 76, _1080p * 276)
	var_13_0:addElement(var_13_44)

	var_13_0.MissionRewardCard = var_13_44

	local var_13_45
	local var_13_46 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_13_1
	})

	var_13_46.id = "ObjRewardCard1"

	var_13_46:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 109, _1080p * 259, _1080p * 470, _1080p * 670)
	var_13_0:addElement(var_13_46)

	var_13_0.ObjRewardCard1 = var_13_46

	local var_13_47
	local var_13_48 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_13_1
	})

	var_13_48.id = "ObjRewardCard2"

	var_13_48:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 307, _1080p * 457, _1080p * 470, _1080p * 670)
	var_13_0:addElement(var_13_48)

	var_13_0.ObjRewardCard2 = var_13_48

	local var_13_49
	local var_13_50 = LUI.UIStyledText.new()

	var_13_50.id = "ObjectiveReward"

	var_13_50:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_50:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_REWARD"), 0)
	var_13_50:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_50:SetAlignment(LUI.Alignment.Left)
	var_13_50:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 610, _1080p * 957, _1080p * 411, _1080p * 431)
	var_13_0:addElement(var_13_50)

	var_13_0.ObjectiveReward = var_13_50

	local var_13_51
	local var_13_52 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_13_1
	})

	var_13_52.id = "RightArrow"

	var_13_52:SetZRotation(-90, 0)
	var_13_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 513, _1080p * 545, _1080p * 489, _1080p * 521)
	var_13_0:addElement(var_13_52)

	var_13_0.RightArrow = var_13_52

	local var_13_53
	local var_13_54 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_13_1
	})

	var_13_54.id = "LeftArrow"

	var_13_54:SetZRotation(90, 0)
	var_13_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 489, _1080p * 521)
	var_13_0:addElement(var_13_54)

	var_13_0.LeftArrow = var_13_54

	local var_13_55
	local var_13_56 = LUI.UIImage.new()

	var_13_56.id = "Line"

	var_13_56:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_56:SetAlpha(0.4, 0)
	var_13_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 580, _1080p * 581, _1080p * 43, _1080p * 310)
	var_13_0:addElement(var_13_56)

	var_13_0.Line = var_13_56

	local var_13_57
	local var_13_58 = LUI.UIText.new()

	var_13_58.id = "UnlockDesc"

	var_13_58:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_58:SetAlpha(0, 0)
	var_13_58:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED"), 0)
	var_13_58:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_58:SetAlignment(LUI.Alignment.Left)
	var_13_58:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_58:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 52, _1080p * 554, _1080p * 191.5, _1080p * 213.5)
	var_13_0:addElement(var_13_58)

	var_13_0.UnlockDesc = var_13_58

	local var_13_59
	local var_13_60 = LUI.UIImage.new()

	var_13_60.id = "Lock"

	var_13_60:SetAlpha(0, 0)
	var_13_60:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_13_60:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 52, _1080p * 186.5, _1080p * 218.5)
	var_13_0:addElement(var_13_60)

	var_13_0.Lock = var_13_60

	local var_13_61
	local var_13_62 = LUI.UIStyledText.new()

	var_13_62.id = "WeaponDetails"

	var_13_62:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_62:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_LOOT_ITEM"), 0)
	var_13_62:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_62:SetWordWrap(false)
	var_13_62:SetAlignment(LUI.Alignment.Left)
	var_13_62:SetTintFontIcons(true)
	var_13_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 53, _1080p * 215, _1080p * 627, _1080p * 651)
	var_13_0:addElement(var_13_62)

	var_13_0.WeaponDetails = var_13_62

	local var_13_63
	local var_13_64 = LUI.UIStyledText.new()

	var_13_64.id = "IntelPrompt"

	var_13_64:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_64:SetAlpha(0, 0)
	var_13_64:setText(Engine.CBBHFCGDIC("CHALLENGE/VIEW_INTEL_PROMPT"), 0)
	var_13_64:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_64:SetWordWrap(false)
	var_13_64:SetAlignment(LUI.Alignment.Left)
	var_13_64:SetTintFontIcons(true)
	var_13_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 52, _1080p * 302, _1080p * 658, _1080p * 682)
	var_13_0:addElement(var_13_64)

	var_13_0.IntelPrompt = var_13_64

	local var_13_65
	local var_13_66 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_13_1
	})

	var_13_66.id = "ObjectivesProgressBar"

	var_13_66.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_66.Overlay:SetAlpha(0.2, 0)
	var_13_66.Fill:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_66:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 53, _1080p * -446, _1080p * 581, _1080p * 599)
	var_13_0:addElement(var_13_66)

	var_13_0.ObjectivesProgressBar = var_13_66

	local var_13_67
	local var_13_68 = LUI.UIText.new()

	var_13_68.id = "ObjectivesProgressDesc"

	var_13_68:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_13_68:setText("99/99", 0)
	var_13_68:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_68:SetAlignment(LUI.Alignment.Left)
	var_13_68:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 57, _1080p * 388, _1080p * 581, _1080p * 599)
	var_13_0:addElement(var_13_68)

	var_13_0.ObjectivesProgressDesc = var_13_68

	local var_13_69
	local var_13_70 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_13_1
	})

	var_13_70.id = "Checkbox"

	var_13_70.Backer:SetAlpha(0.2, 0)
	var_13_70.Frame:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_13_70:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 27, _1080p * 45, _1080p * 193.5, _1080p * 211.5)
	var_13_0:addElement(var_13_70)

	var_13_0.Checkbox = var_13_70

	local var_13_71
	local var_13_72 = LUI.UIStyledText.new()

	var_13_72.id = "BattlePassStage"

	var_13_72:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_72:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_13_72:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_72:SetAlignment(LUI.Alignment.Left)
	var_13_72:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_72:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 566, _1080p * 298, _1080p * 320)
	var_13_0:addElement(var_13_72)

	var_13_0.BattlePassStage = var_13_72

	local var_13_73
	local var_13_74 = LUI.UIText.new()

	var_13_74.id = "CurrentBattlePassStage"

	var_13_74:setText(Engine.CBBHFCGDIC("BATTLEPASS/CURRENT_TIER"), 0)
	var_13_74:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_74:SetAlignment(LUI.Alignment.Left)
	var_13_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 566, _1080p * 322, _1080p * 342)
	var_13_0:addElement(var_13_74)

	var_13_0.CurrentBattlePassStage = var_13_74

	local function var_13_75()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_75

	local var_13_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("ShowExclusiveText", var_13_76)

	local var_13_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("ShowExclusiveText", var_13_77)

	local function var_13_78()
		var_13_14:AnimateSequence("ShowExclusiveText")
		var_13_16:AnimateSequence("ShowExclusiveText")
	end

	var_13_0._sequences.ShowExclusiveText = var_13_78

	local var_13_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_14:RegisterAnimationSequence("HideExclusiveText", var_13_79)

	local var_13_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("HideExclusiveText", var_13_80)

	local function var_13_81()
		var_13_14:AnimateSequence("HideExclusiveText")
		var_13_16:AnimateSequence("HideExclusiveText")
	end

	var_13_0._sequences.HideExclusiveText = var_13_81

	local var_13_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_29:RegisterAnimationSequence("SingleObjective", var_13_82)

	local var_13_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_32:RegisterAnimationSequence("SingleObjective", var_13_83)

	local var_13_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_34:RegisterAnimationSequence("SingleObjective", var_13_84)

	local var_13_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_52:RegisterAnimationSequence("SingleObjective", var_13_85)

	local var_13_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_54:RegisterAnimationSequence("SingleObjective", var_13_86)

	local function var_13_87()
		var_13_29:AnimateSequence("SingleObjective")
		var_13_32:AnimateSequence("SingleObjective")
		var_13_34:AnimateSequence("SingleObjective")
		var_13_52:AnimateSequence("SingleObjective")
		var_13_54:AnimateSequence("SingleObjective")
	end

	var_13_0._sequences.SingleObjective = var_13_87

	local var_13_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("MultiObjective", var_13_88)

	local var_13_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("MultiObjective", var_13_89)

	local var_13_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_29:RegisterAnimationSequence("MultiObjective", var_13_90)

	local var_13_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_32:RegisterAnimationSequence("MultiObjective", var_13_91)

	local var_13_92 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_34:RegisterAnimationSequence("MultiObjective", var_13_92)

	local var_13_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_44:RegisterAnimationSequence("MultiObjective", var_13_93)

	local var_13_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 609
		}
	}

	var_13_50:RegisterAnimationSequence("MultiObjective", var_13_94)

	local var_13_95 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_52:RegisterAnimationSequence("MultiObjective", var_13_95)

	local var_13_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_54:RegisterAnimationSequence("MultiObjective", var_13_96)

	local function var_13_97()
		var_13_6:AnimateSequence("MultiObjective")
		var_13_20:AnimateSequence("MultiObjective")
		var_13_29:AnimateSequence("MultiObjective")
		var_13_32:AnimateSequence("MultiObjective")
		var_13_34:AnimateSequence("MultiObjective")
		var_13_44:AnimateSequence("MultiObjective")
		var_13_50:AnimateSequence("MultiObjective")
		var_13_52:AnimateSequence("MultiObjective")
		var_13_54:AnimateSequence("MultiObjective")
	end

	var_13_0._sequences.MultiObjective = var_13_97

	local var_13_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_13_24:RegisterAnimationSequence("ObjRewards1", var_13_98)

	local var_13_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_40:RegisterAnimationSequence("ObjRewards1", var_13_99)

	local var_13_100 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_42:RegisterAnimationSequence("ObjRewards1", var_13_100)

	local var_13_101 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_46:RegisterAnimationSequence("ObjRewards1", var_13_101)

	local var_13_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_48:RegisterAnimationSequence("ObjRewards1", var_13_102)

	local function var_13_103()
		var_13_24:AnimateSequence("ObjRewards1")
		var_13_40:AnimateSequence("ObjRewards1")
		var_13_42:AnimateSequence("ObjRewards1")
		var_13_46:AnimateSequence("ObjRewards1")
		var_13_48:AnimateSequence("ObjRewards1")
	end

	var_13_0._sequences.ObjRewards1 = var_13_103

	local var_13_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_13_24:RegisterAnimationSequence("ObjRewards2", var_13_104)

	local var_13_105 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_40:RegisterAnimationSequence("ObjRewards2", var_13_105)

	local var_13_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_42:RegisterAnimationSequence("ObjRewards2", var_13_106)

	local var_13_107 = {
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

	var_13_46:RegisterAnimationSequence("ObjRewards2", var_13_107)

	local var_13_108 = {
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

	var_13_48:RegisterAnimationSequence("ObjRewards2", var_13_108)

	local function var_13_109()
		var_13_24:AnimateSequence("ObjRewards2")
		var_13_40:AnimateSequence("ObjRewards2")
		var_13_42:AnimateSequence("ObjRewards2")
		var_13_46:AnimateSequence("ObjRewards2")
		var_13_48:AnimateSequence("ObjRewards2")
	end

	var_13_0._sequences.ObjRewards2 = var_13_109

	local var_13_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -434
		}
	}

	var_13_4:RegisterAnimationSequence("HideMissionReward", var_13_110)

	local var_13_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("HideMissionReward", var_13_111)

	local var_13_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("HideMissionReward", var_13_112)

	local var_13_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("HideMissionReward", var_13_113)

	local var_13_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_22:RegisterAnimationSequence("HideMissionReward", var_13_114)

	local var_13_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_44:RegisterAnimationSequence("HideMissionReward", var_13_115)

	local function var_13_116()
		var_13_4:AnimateSequence("HideMissionReward")
		var_13_6:AnimateSequence("HideMissionReward")
		var_13_10:AnimateSequence("HideMissionReward")
		var_13_20:AnimateSequence("HideMissionReward")
		var_13_22:AnimateSequence("HideMissionReward")
		var_13_44:AnimateSequence("HideMissionReward")
	end

	var_13_0._sequences.HideMissionReward = var_13_116

	local var_13_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_13_4:RegisterAnimationSequence("ShowMissionReward", var_13_117)

	local var_13_118 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ShowMissionReward", var_13_118)

	local var_13_119 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("ShowMissionReward", var_13_119)

	local var_13_120 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("ShowMissionReward", var_13_120)

	local var_13_121 = {
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

	var_13_22:RegisterAnimationSequence("ShowMissionReward", var_13_121)

	local var_13_122 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_44:RegisterAnimationSequence("ShowMissionReward", var_13_122)

	local function var_13_123()
		var_13_4:AnimateSequence("ShowMissionReward")
		var_13_6:AnimateSequence("ShowMissionReward")
		var_13_10:AnimateSequence("ShowMissionReward")
		var_13_20:AnimateSequence("ShowMissionReward")
		var_13_22:AnimateSequence("ShowMissionReward")
		var_13_44:AnimateSequence("ShowMissionReward")
	end

	var_13_0._sequences.ShowMissionReward = var_13_123

	local var_13_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -420
		}
	}

	var_13_24:RegisterAnimationSequence("ObjNoRewards", var_13_124)

	local var_13_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_40:RegisterAnimationSequence("ObjNoRewards", var_13_125)

	local var_13_126 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_42:RegisterAnimationSequence("ObjNoRewards", var_13_126)

	local var_13_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_46:RegisterAnimationSequence("ObjNoRewards", var_13_127)

	local var_13_128 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_48:RegisterAnimationSequence("ObjNoRewards", var_13_128)

	local var_13_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_50:RegisterAnimationSequence("ObjNoRewards", var_13_129)

	local function var_13_130()
		var_13_24:AnimateSequence("ObjNoRewards")
		var_13_40:AnimateSequence("ObjNoRewards")
		var_13_42:AnimateSequence("ObjNoRewards")
		var_13_46:AnimateSequence("ObjNoRewards")
		var_13_48:AnimateSequence("ObjNoRewards")
		var_13_50:AnimateSequence("ObjNoRewards")
	end

	var_13_0._sequences.ObjNoRewards = var_13_130

	local var_13_131 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_58:RegisterAnimationSequence("LockedObjective", var_13_131)

	local var_13_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_60:RegisterAnimationSequence("LockedObjective", var_13_132)

	local var_13_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_66:RegisterAnimationSequence("LockedObjective", var_13_133)

	local var_13_134 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_68:RegisterAnimationSequence("LockedObjective", var_13_134)

	local var_13_135 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_70:RegisterAnimationSequence("LockedObjective", var_13_135)

	local function var_13_136()
		var_13_58:AnimateSequence("LockedObjective")
		var_13_60:AnimateSequence("LockedObjective")
		var_13_66:AnimateSequence("LockedObjective")
		var_13_68:AnimateSequence("LockedObjective")
		var_13_70:AnimateSequence("LockedObjective")
	end

	var_13_0._sequences.LockedObjective = var_13_136

	local var_13_137 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_58:RegisterAnimationSequence("UnlockedObjective", var_13_137)

	local var_13_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_60:RegisterAnimationSequence("UnlockedObjective", var_13_138)

	local var_13_139 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_66:RegisterAnimationSequence("UnlockedObjective", var_13_139)

	local var_13_140 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_68:RegisterAnimationSequence("UnlockedObjective", var_13_140)

	local var_13_141 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_70:RegisterAnimationSequence("UnlockedObjective", var_13_141)

	local function var_13_142()
		var_13_58:AnimateSequence("UnlockedObjective")
		var_13_60:AnimateSequence("UnlockedObjective")
		var_13_66:AnimateSequence("UnlockedObjective")
		var_13_68:AnimateSequence("UnlockedObjective")
		var_13_70:AnimateSequence("UnlockedObjective")
	end

	var_13_0._sequences.UnlockedObjective = var_13_142

	local var_13_143 = {
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

	var_13_6:RegisterAnimationSequence("AR", var_13_143)

	local var_13_144 = {
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

	var_13_8:RegisterAnimationSequence("AR", var_13_144)

	local var_13_145 = {
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

	var_13_10:RegisterAnimationSequence("AR", var_13_145)

	local var_13_146 = {
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

	var_13_22:RegisterAnimationSequence("AR", var_13_146)

	local var_13_147 = {
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

	var_13_26:RegisterAnimationSequence("AR", var_13_147)

	local var_13_148 = {
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

	var_13_36:RegisterAnimationSequence("AR", var_13_148)

	local var_13_149 = {
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

	var_13_40:RegisterAnimationSequence("AR", var_13_149)

	local var_13_150 = {
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

	var_13_42:RegisterAnimationSequence("AR", var_13_150)

	local var_13_151 = {
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

	var_13_50:RegisterAnimationSequence("AR", var_13_151)

	local var_13_152 = {
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

	var_13_62:RegisterAnimationSequence("AR", var_13_152)

	local var_13_153 = {
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

	var_13_68:RegisterAnimationSequence("AR", var_13_153)

	local function var_13_154()
		var_13_6:AnimateSequence("AR")
		var_13_8:AnimateSequence("AR")
		var_13_10:AnimateSequence("AR")
		var_13_22:AnimateSequence("AR")
		var_13_26:AnimateSequence("AR")
		var_13_36:AnimateSequence("AR")
		var_13_40:AnimateSequence("AR")
		var_13_42:AnimateSequence("AR")
		var_13_50:AnimateSequence("AR")
		var_13_62:AnimateSequence("AR")
		var_13_68:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_154

	local var_13_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_13_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_13_0.ObjectivesProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_13_0.ObjectivesProgressBar.Fill
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_13_0.ObjectivesProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_66:RegisterAnimationSequence("Complete", var_13_155)

	local var_13_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MPArmory.disabledLootCrate
		}
	}

	var_13_68:RegisterAnimationSequence("Complete", var_13_156)

	local var_13_157 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_13_0.Checkbox.Frame
		}
	}

	var_13_70:RegisterAnimationSequence("Complete", var_13_157)

	local function var_13_158()
		var_13_66:AnimateSequence("Complete")
		var_13_68:AnimateSequence("Complete")
		var_13_70:AnimateSequence("Complete")
	end

	var_13_0._sequences.Complete = var_13_158

	local var_13_159 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle,
			child = var_13_0.ObjectivesProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_13_0.ObjectivesProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_13_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_13_0.ObjectivesProgressBar.Overlay
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_66:RegisterAnimationSequence("Incomplete", var_13_159)

	local var_13_160 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_13_68:RegisterAnimationSequence("Incomplete", var_13_160)

	local var_13_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription,
			child = var_13_0.Checkbox.Frame
		}
	}

	var_13_70:RegisterAnimationSequence("Incomplete", var_13_161)

	local function var_13_162()
		var_13_66:AnimateSequence("Incomplete")
		var_13_68:AnimateSequence("Incomplete")
		var_13_70:AnimateSequence("Incomplete")
	end

	var_13_0._sequences.Incomplete = var_13_162

	local var_13_163 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_72:RegisterAnimationSequence("ShowBattlePassDetails", var_13_163)

	local var_13_164 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_74:RegisterAnimationSequence("ShowBattlePassDetails", var_13_164)

	local function var_13_165()
		var_13_72:AnimateSequence("ShowBattlePassDetails")
		var_13_74:AnimateSequence("ShowBattlePassDetails")
	end

	var_13_0._sequences.ShowBattlePassDetails = var_13_165

	local var_13_166 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_72:RegisterAnimationSequence("HideBattlePassDetails", var_13_166)

	local var_13_167 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_74:RegisterAnimationSequence("HideBattlePassDetails", var_13_167)

	local function var_13_168()
		var_13_72:AnimateSequence("HideBattlePassDetails")
		var_13_74:AnimateSequence("HideBattlePassDetails")
	end

	var_13_0._sequences.HideBattlePassDetails = var_13_168

	local var_13_169 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_64:RegisterAnimationSequence("Intel", var_13_169)

	local var_13_170 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_66:RegisterAnimationSequence("Intel", var_13_170)

	local var_13_171 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_68:RegisterAnimationSequence("Intel", var_13_171)

	local var_13_172 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_70:RegisterAnimationSequence("Intel", var_13_172)

	local function var_13_173()
		var_13_64:AnimateSequence("Intel")
		var_13_66:AnimateSequence("Intel")
		var_13_68:AnimateSequence("Intel")
		var_13_70:AnimateSequence("Intel")
	end

	var_13_0._sequences.Intel = var_13_173

	var_0_4(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("BarracksChallengeMissionDetails", BarracksChallengeMissionDetails)
LockTable(_M)
