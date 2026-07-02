module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.suffix

	if arg_1_1.data then
		ACTIONS.AnimateSequence(arg_1_0, "ShowPreview" .. var_1_0)
	else
		ACTIONS.AnimateSequence(arg_1_0, "HidePreview" .. var_1_0)
	end

	return arg_1_1.data ~= nil
end

local function var_0_1(arg_2_0, arg_2_1)
	STORE.PreviewReward(arg_2_0, arg_2_1.controller, {
		previewData = arg_2_1.data,
		previewIndex = arg_2_0._objIndex,
		playDefaultSound = arg_2_1.qualifier
	})
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0.BindButton then
		arg_3_0.BindButton:closeTree()

		arg_3_0.BindButton = nil
	end

	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.BindButton)

	if var_0_0(arg_3_0, {
		suffix = "MissionReward",
		data = arg_3_0.MissionRewardCard._previewData
	}) then
		arg_3_0.BindButton:registerEventHandler("button_right_stick", function(arg_4_0, arg_4_1)
			arg_4_1.data = arg_3_0.MissionRewardCard._previewData

			var_0_1(arg_3_0, arg_4_1)
		end)
		arg_3_0.MissionRewardCard:addEventHandler("button_action", function(arg_5_0, arg_5_1)
			arg_5_1.data = arg_5_0._previewData

			var_0_1(arg_3_0, arg_5_1)
		end)
	end

	if var_0_0(arg_3_0, {
		suffix = "LootReward",
		data = arg_3_0.ObjRewardCard2._previewData
	}) then
		arg_3_0.BindButton:registerEventHandler("button_left_stick", function(arg_6_0, arg_6_1)
			arg_6_1.data = arg_3_0.ObjRewardCard2._previewData

			var_0_1(arg_3_0, arg_6_1)
		end)
		arg_3_0.ObjRewardCard2:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			arg_7_1.data = arg_7_0._previewData

			var_0_1(arg_3_0, arg_7_1)
		end)
	end
end

local function var_0_3(arg_8_0, arg_8_1)
	local var_8_0

	arg_8_0.Progress:UpdateObjectiveData(arg_8_1, {
		selectedIndex = arg_8_0._objIndex
	})

	if arg_8_0._mission.objectives and #arg_8_0._mission.objectives > 1 then
		var_8_0 = arg_8_0._mission.objectives[arg_8_0._objIndex]
	else
		var_8_0 = arg_8_0._mission
	end

	if var_8_0.desc and var_8_0.amount then
		local var_8_1 = 20 * _1080p

		arg_8_0.Description:setText(Engine.CBBHFCGDIC(var_8_0.desc, var_8_0.amount))

		local var_8_2, var_8_3, var_8_4, var_8_5 = arg_8_0.Description:getLocalRect()
		local var_8_6 = LAYOUT.GetTextHeightWithWrapping(arg_8_0.Description, arg_8_0.Description:getText()) + var_8_1

		arg_8_0.Progress:SetTop(var_8_3 + var_8_6)
		arg_8_0.Progress:SetBottom(var_8_3 + var_8_6 + var_8_5)
	else
		arg_8_0.Description:setText("")
	end

	if arg_8_0._objIndex <= arg_8_0._mission.numObjectivesComplete + 1 then
		ACTIONS.AnimateSequence(arg_8_0.Progress, "Unlocked")
	else
		ACTIONS.AnimateSequence(arg_8_0.Progress, "Locked")
		arg_8_0.Progress.LockLabel:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_LOCKED", arg_8_0._objIndex - 1))
	end

	if var_8_0.rewards and #var_8_0.rewards > 0 then
		local var_8_7 = 2
		local var_8_8 = math.min(#var_8_0.rewards, var_8_7)

		ACTIONS.AnimateSequence(arg_8_0, "ObjRewards" .. var_8_8)

		for iter_8_0 = 1, var_8_8 do
			local var_8_9 = var_8_0.rewards[iter_8_0]
			local var_8_10 = arg_8_0["ObjRewardCard" .. iter_8_0]

			assert(var_8_10)
			var_8_10:UpdateCardConfig(var_8_9)

			if var_8_9.lootItemID and STORE.PreviewSupported(var_8_9.type) then
				var_8_10._previewData = var_8_9

				local var_8_11 = {
					promptsData = {
						{
							button_ref = "button_right_stick",
							keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
						}
					}
				}

				var_8_10:AddTooltipData(arg_8_1, var_8_11)
			else
				var_8_10._previewData = nil
			end

			var_0_2(arg_8_0, arg_8_1)
		end
	else
		ACTIONS.AnimateSequence(arg_8_0, "ObjNoRewards")
	end
end

local function var_0_4(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.name == "button_left" or arg_9_1.name == "button_left_trigger"

	arg_9_0 = arg_9_0:getParent():getParent()

	if arg_9_0._allowNavigation then
		local var_9_1

		if var_9_0 then
			if arg_9_0._objIndex > 1 then
				var_9_1 = arg_9_0._objIndex - 1
			else
				var_9_1 = #arg_9_0._mission.objectives
			end
		elseif arg_9_0._objIndex < #arg_9_0._mission.objectives then
			var_9_1 = arg_9_0._objIndex + 1
		else
			var_9_1 = 1
		end

		arg_9_0._objIndex = var_9_1

		arg_9_0:UpdateObjectiveData()

		return true
	end

	return false
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	if not assert(arg_10_2) or type(arg_10_2) ~= "table" or not arg_10_2.mission then
		assert(false, "You must provide a table of options with a property/value for the mission challenge.")
	end

	local var_10_0 = arg_10_2.mission

	arg_10_0.Progress:SetData(arg_10_1, {
		mission = var_10_0
	})
	arg_10_0.ChallengeLabel:setText(Engine.CBBHFCGDIC(var_10_0.name))

	arg_10_0._allowNavigation = var_10_0.objectives and #var_10_0.objectives > 1

	if arg_10_2.objectiveIndex then
		arg_10_0._objIndex = arg_10_2.objectiveIndex
		arg_10_0._objIndex = math.min(arg_10_0._objIndex, #var_10_0.objectives)
	elseif var_10_0.numObjectivesComplete then
		arg_10_0._objIndex = math.min(var_10_0.numObjectivesComplete + 1, #var_10_0.objectives)
	end

	arg_10_0._mission = var_10_0

	if var_10_0.rewards and #var_10_0.rewards > 0 then
		ACTIONS.AnimateSequence(arg_10_0, "ShowMissionReward")

		local var_10_1 = var_10_0.rewards[Challenge.Reward.LOOT] or var_10_0.rewards[Challenge.Reward.XP]

		arg_10_0.MissionRewardCard:UpdateCardConfig(var_10_1)

		if var_10_1.lootItemID and STORE.PreviewSupported(var_10_1.type) then
			arg_10_0.MissionRewardCard._previewData = var_10_1
			arg_10_0.MissionRewardCard._previewIndex = arg_10_0._objIndex

			local var_10_2 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
					}
				}
			}

			arg_10_0.MissionRewardCard:AddTooltipData(arg_10_0._controllerIndex, var_10_2)
		else
			arg_10_0.MissionRewardCard._previewData = nil
		end

		var_0_0(arg_10_0, {
			suffix = "MissionReward",
			data = arg_10_0.MissionRewardCard._previewData
		})
	else
		ACTIONS.AnimateSequence(arg_10_0, "HideMissionReward")
	end

	var_0_3(arg_10_0, arg_10_1)
	var_0_2(arg_10_0, arg_10_1)
end

local function var_0_6(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetData = var_0_5
	arg_11_0.UpdateObjectiveData = var_0_3

	arg_11_0.Progress:SetEventHandler({
		callback = var_0_4
	})
end

function WZOperatorInfoMissionChallenges(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 854 * _1080p, 0, 560 * _1080p)

	var_12_0.id = "WZOperatorInfoMissionChallenges"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "ChallengeDescBacker"

	var_12_4:SetAlpha(0.5, 0)
	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -3, _1080p * -3)
	var_12_0:addElement(var_12_4)

	var_12_0.ChallengeDescBacker = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "MissionRewardCard"

	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 652, _1080p * 802, _1080p * 159, _1080p * 359)
	var_12_0:addElement(var_12_6)

	var_12_0.MissionRewardCard = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIStyledText.new()

	var_12_8.id = "MissionRewardLabel"

	var_12_8:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_12_8:setText(Engine.CBBHFCGDIC("LOOT_MP/FINAL_REWARD"), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_8:SetWordWrap(false)
	var_12_8:SetAlignment(LUI.Alignment.Center)
	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 616, _1080p * 842, _1080p * 134, _1080p * 153)
	var_12_0:addElement(var_12_8)

	var_12_0.MissionRewardLabel = var_12_8

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "ObjRewardCard1"

	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 200, _1080p * 270, _1080p * 470)
	var_12_0:addElement(var_12_10)

	var_12_0.ObjRewardCard1 = var_12_10

	local var_12_11
	local var_12_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_12_1
	})

	var_12_12.id = "ObjRewardCard2"

	var_12_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 217, _1080p * 367, _1080p * 270, _1080p * 470)
	var_12_0:addElement(var_12_12)

	var_12_0.ObjRewardCard2 = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIStyledText.new()

	var_12_14.id = "ObjRewardLabel"

	var_12_14:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_12_14:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_REWARD"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_14:SetWordWrap(false)
	var_12_14:SetAlignment(LUI.Alignment.Left)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 550, _1080p * 242, _1080p * 260)
	var_12_0:addElement(var_12_14)

	var_12_0.ObjRewardLabel = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIStyledText.new()

	var_12_16.id = "ChallengeLabel"

	var_12_16:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_16:setText("", 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_16:SetAlignment(LUI.Alignment.Left)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 550, _1080p * 20, _1080p * 50)
	var_12_0:addElement(var_12_16)

	var_12_0.ChallengeLabel = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "Divider"

	var_12_18:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_18:SetAlpha(0.4, 0)
	var_12_18:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 600, _1080p * 601, _1080p * 50, _1080p * -50)
	var_12_0:addElement(var_12_18)

	var_12_0.Divider = var_12_18

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("WZOperatorInfoMissionChallengeProgress", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "Progress"

	var_12_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 550, _1080p * 77, _1080p * 191)
	var_12_0:addElement(var_12_20)

	var_12_0.Progress = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIStyledText.new()

	var_12_22.id = "Description"

	var_12_22:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_22:setText("", 0)
	var_12_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_22:SetAlignment(LUI.Alignment.Left)
	var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 550, _1080p * 77, _1080p * 96)
	var_12_0:addElement(var_12_22)

	var_12_0.Description = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIStyledText.new()

	var_12_24.id = "PreviewRewardLabel"

	var_12_24:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_24:SetAlpha(0, 0)
	var_12_24:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_OPERATOR_MISSION_REWARD"), 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_12_24:SetWordWrap(false)
	var_12_24:SetAlignment(LUI.Alignment.Left)
	var_12_24:SetTintFontIcons(true)
	var_12_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 652, _1080p * 833, _1080p * 407, _1080p * 425)
	var_12_0:addElement(var_12_24)

	var_12_0.PreviewRewardLabel = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIStyledText.new()

	var_12_26.id = "PreviewLootLabel"

	var_12_26:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_12_26:SetAlpha(0, 0)
	var_12_26:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_OPERATOR_LOOT_REWARD"), 0)
	var_12_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_12_26:SetWordWrap(false)
	var_12_26:SetAlignment(LUI.Alignment.Left)
	var_12_26:SetTintFontIcons(true)
	var_12_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 217, _1080p * 443, _1080p * 515, _1080p * 533)
	var_12_0:addElement(var_12_26)

	var_12_0.PreviewLootLabel = var_12_26

	local function var_12_27()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_27

	local var_12_28
	local var_12_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("ShowPreviewLootReward", var_12_29)

	local function var_12_30()
		var_12_26:AnimateSequence("ShowPreviewLootReward")
	end

	var_12_0._sequences.ShowPreviewLootReward = var_12_30

	local var_12_31
	local var_12_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("HidePreviewLootReward", var_12_32)

	local function var_12_33()
		var_12_26:AnimateSequence("HidePreviewLootReward")
	end

	var_12_0._sequences.HidePreviewLootReward = var_12_33

	local var_12_34
	local var_12_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -200
		}
	}

	var_12_4:RegisterAnimationSequence("ObjNoRewards", var_12_35)

	local var_12_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 269
		}
	}

	var_12_6:RegisterAnimationSequence("ObjNoRewards", var_12_36)

	local var_12_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		}
	}

	var_12_8:RegisterAnimationSequence("ObjNoRewards", var_12_37)

	local var_12_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ObjNoRewards", var_12_38)

	local var_12_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ObjNoRewards", var_12_39)

	local var_12_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ObjNoRewards", var_12_40)

	local var_12_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -250
		}
	}

	var_12_18:RegisterAnimationSequence("ObjNoRewards", var_12_41)

	local var_12_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 317
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 335
		}
	}

	var_12_24:RegisterAnimationSequence("ObjNoRewards", var_12_42)

	local var_12_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("ObjNoRewards", var_12_43)

	local function var_12_44()
		var_12_4:AnimateSequence("ObjNoRewards")
		var_12_6:AnimateSequence("ObjNoRewards")
		var_12_8:AnimateSequence("ObjNoRewards")
		var_12_10:AnimateSequence("ObjNoRewards")
		var_12_12:AnimateSequence("ObjNoRewards")
		var_12_14:AnimateSequence("ObjNoRewards")
		var_12_18:AnimateSequence("ObjNoRewards")
		var_12_24:AnimateSequence("ObjNoRewards")
		var_12_26:AnimateSequence("ObjNoRewards")
	end

	var_12_0._sequences.ObjNoRewards = var_12_44

	local var_12_45
	local var_12_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_4:RegisterAnimationSequence("ObjRewards2", var_12_46)

	local var_12_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 159
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 359
		}
	}

	var_12_6:RegisterAnimationSequence("ObjRewards2", var_12_47)

	local var_12_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_12_8:RegisterAnimationSequence("ObjRewards2", var_12_48)

	local var_12_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ObjRewards2", var_12_49)

	local var_12_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ObjRewards2", var_12_50)

	local var_12_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		}
	}

	var_12_18:RegisterAnimationSequence("ObjRewards2", var_12_51)

	local var_12_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 407
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		}
	}

	var_12_24:RegisterAnimationSequence("ObjRewards2", var_12_52)

	local function var_12_53()
		var_12_4:AnimateSequence("ObjRewards2")
		var_12_6:AnimateSequence("ObjRewards2")
		var_12_8:AnimateSequence("ObjRewards2")
		var_12_10:AnimateSequence("ObjRewards2")
		var_12_12:AnimateSequence("ObjRewards2")
		var_12_18:AnimateSequence("ObjRewards2")
		var_12_24:AnimateSequence("ObjRewards2")
	end

	var_12_0._sequences.ObjRewards2 = var_12_53

	local var_12_54
	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_12_4:RegisterAnimationSequence("ObjRewards1", var_12_55)

	local var_12_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 359
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 159
		}
	}

	var_12_6:RegisterAnimationSequence("ObjRewards1", var_12_56)

	local var_12_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 134
		}
	}

	var_12_8:RegisterAnimationSequence("ObjRewards1", var_12_57)

	local var_12_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ObjRewards1", var_12_58)

	local var_12_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ObjRewards1", var_12_59)

	local var_12_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ObjRewards1", var_12_60)

	local var_12_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		}
	}

	var_12_18:RegisterAnimationSequence("ObjRewards1", var_12_61)

	local var_12_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 407
		}
	}

	var_12_24:RegisterAnimationSequence("ObjRewards1", var_12_62)

	local function var_12_63()
		var_12_4:AnimateSequence("ObjRewards1")
		var_12_6:AnimateSequence("ObjRewards1")
		var_12_8:AnimateSequence("ObjRewards1")
		var_12_10:AnimateSequence("ObjRewards1")
		var_12_12:AnimateSequence("ObjRewards1")
		var_12_14:AnimateSequence("ObjRewards1")
		var_12_18:AnimateSequence("ObjRewards1")
		var_12_24:AnimateSequence("ObjRewards1")
	end

	var_12_0._sequences.ObjRewards1 = var_12_63

	local var_12_64
	local var_12_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("HideMissionReward", var_12_65)

	local var_12_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("HideMissionReward", var_12_66)

	local function var_12_67()
		var_12_6:AnimateSequence("HideMissionReward")
		var_12_8:AnimateSequence("HideMissionReward")
	end

	var_12_0._sequences.HideMissionReward = var_12_67

	local var_12_68
	local var_12_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ShowMissionReward", var_12_69)

	local var_12_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ShowMissionReward", var_12_70)

	local function var_12_71()
		var_12_6:AnimateSequence("ShowMissionReward")
		var_12_8:AnimateSequence("ShowMissionReward")
	end

	var_12_0._sequences.ShowMissionReward = var_12_71

	local var_12_72
	local var_12_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("HidePreviewMissionReward", var_12_73)

	local function var_12_74()
		var_12_24:AnimateSequence("HidePreviewMissionReward")
	end

	var_12_0._sequences.HidePreviewMissionReward = var_12_74

	local var_12_75
	local var_12_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ShowPreviewMissionReward", var_12_76)

	local function var_12_77()
		var_12_24:AnimateSequence("ShowPreviewMissionReward")
	end

	var_12_0._sequences.ShowPreviewMissionReward = var_12_77

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("WZOperatorInfoMissionChallenges", WZOperatorInfoMissionChallenges)
LockTable(_M)
