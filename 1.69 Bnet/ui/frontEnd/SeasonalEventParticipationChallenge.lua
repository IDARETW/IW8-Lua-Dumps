module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_1 ~= nil, "Usage: SeasonalEventParticipationChallenge:SetPromptsEnabled( <isEnabled>, <controllerIndex> )")

	if arg_1_0._promptsEnabled ~= arg_1_1 then
		arg_1_0._promptsEnabled = arg_1_1

		ACTIONS.AnimateSequence(arg_1_0, arg_1_0._promptsEnabled and "PromptsEnabled" or "PromptsDisabled")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.seasonalEventID = arg_2_1.eventID
	arg_2_0.challengeOrder = arg_2_1.order
	arg_2_0.unlockIdOffset = arg_2_1.unlockIdOffset or 0

	if arg_2_1.challengeRef and arg_2_1.challengeRef ~= "" then
		local var_2_0 = Challenge.GetNameFromRef(arg_2_1.challengeRef, Challenge.Type.MISC)

		arg_2_0.ChallengeName:setText(var_2_0)

		local var_2_1 = Challenge.GetIDFromRef(arg_2_1.challengeRef, Challenge.Type.MISC)
		local var_2_2 = Challenge.GetXPReward(var_2_1, Challenge.Type.MISC)

		if var_2_2 then
			arg_2_0.XPAmountLabel:setText(var_2_2)
		end
	end

	if arg_2_1.locationString and #arg_2_1.locationString > 0 then
		arg_2_0.DescLabel:setText(Engine.CBBHFCGDIC(arg_2_1.locationString, arg_2_1.targetProgress))
	end

	if arg_2_1.maxValue and arg_2_1.currentValue and arg_2_1.maxValue > 0 then
		arg_2_0.ProgressDesc:setText(LUI.FormatLargeNumber(arg_2_1.currentValue) .. "/" .. LUI.FormatLargeNumber(arg_2_1.maxValue))
		arg_2_0.Progress:SetProgress(arg_2_1.currentValue / arg_2_1.maxValue)
	end

	if arg_2_1.lootData then
		arg_2_0._lootID = arg_2_1.lootData.ID

		arg_2_0.ChallengeReward:SetupLootData(arg_2_1.lootData)
		arg_2_0.ChallengeReward:SetComplete(arg_2_1.isComplete)
		arg_2_0.ChallengeReward.LootItemCardMiniDouble.FrontLootItemCard:SetMiniMode(true)
	end

	local var_2_3 = arg_2_1.isComplete or Dvar.IBEGCHEFE("lui_test_force_pt_ch_complete_" .. arg_2_0.challengeOrder)
	local var_2_4 = not arg_2_1.isAvailable

	if var_2_3 then
		ACTIONS.AnimateSequence(arg_2_0, "Completed")

		arg_2_0.shouldShowComplete = not SEASONAL_EVENT.GetSeenUnlockID(arg_2_0._controllerIndex, arg_2_0.challengeOrder + arg_2_0.unlockIdOffset)
	elseif var_2_4 then
		ACTIONS.AnimateSequence(arg_2_0, "InStandby")
		arg_2_0.ChallengeStandbyText:setText(Engine.CBBHFCGDIC(arg_2_1.unavailableStringRef), 0)
	else
		ACTIONS.AnimateSequence(arg_2_0, "InProgress")
	end
end

local function var_0_2(arg_3_0)
	SEASONAL_EVENT.SetSeenUnlockID(arg_3_0._controllerIndex, arg_3_0.challengeOrder + arg_3_0.unlockIdOffset)

	arg_3_0.shouldShowComplete = false
end

local function var_0_3(arg_4_0)
	if arg_4_0.disabled or not arg_4_0._promptsEnabled or not arg_4_0._lootID then
		return
	end

	local var_4_0 = arg_4_0._lootID

	if var_4_0 and var_4_0 > 0 then
		local var_4_1 = LOOT.GetTypeForID(var_4_0)

		if LOOT.CanPreview(var_4_1, var_4_0) then
			STORE.PreviewItem(arg_4_0._controllerIndex, var_4_1, var_4_0)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	if arg_5_1 then
		arg_5_0:addEventHandler("gain_focus", function(arg_6_0, arg_6_1)
			arg_5_0:SetPromptsEnabled(true, controllerIndex)
			ACTIONS.AnimateSequence(arg_5_0.ChallengeReward, "ButtonOver")

			return true
		end)
		arg_5_0:addEventHandler("lose_focus", function(arg_7_0, arg_7_1)
			arg_5_0:SetPromptsEnabled(false, controllerIndex)
			ACTIONS.AnimateSequence(arg_5_0.ChallengeReward, "ButtonUp")

			return true
		end)
		arg_5_0:registerAndCallEventHandler("update_input_type", function(arg_8_0, arg_8_1)
			if arg_8_0._promptsEnabled then
				ACTIONS.AnimateSequence(arg_8_0, "PromptsEnabled")
			end
		end, {
			element = arg_5_0,
			controllerIndex = arg_5_0._controllerIndex
		})
	end

	arg_5_0.bindButton:addEventHandler("button_primary", function(arg_9_0, arg_9_1)
		arg_5_0:PreviewItem()
	end)
end

local function var_0_5(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._controllerIndex = arg_10_1
	arg_10_0.SetChallengeData = var_0_1
	arg_10_0.ShowCompleteAnim = var_0_2
	arg_10_0.SetPromptsEnabled = var_0_0
	arg_10_0.PreviewItem = var_0_3
	arg_10_0.SetupEventHandlers = var_0_4
	arg_10_0.bindButton = LUI.UIBindButton.new()

	arg_10_0:addElement(arg_10_0.bindButton)
end

function SeasonalEventParticipationChallenge(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 585 * _1080p, 0, 250 * _1080p)

	var_11_0.id = "SeasonalEventParticipationChallenge"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Backer"

	var_11_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_4:SetAlpha(0.5, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 585, 0, _1080p * 251)
	var_11_0:addElement(var_11_4)

	var_11_0.Backer = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Icon"

	var_11_6:SetAlpha(0.05, 0)
	var_11_6:setImage(RegisterMaterial("logo_cod_wz_s4_event"), 0)
	var_11_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 457, _1080p * 543, _1080p * 154, _1080p * 241)
	var_11_0:addElement(var_11_6)

	var_11_0.Icon = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIText.new()

	var_11_8.id = "DescLabel"

	var_11_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_11_8:setText("", 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_8:SetAlignment(LUI.Alignment.Left)
	var_11_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 449, _1080p * 62, _1080p * 80)
	var_11_0:addElement(var_11_8)

	var_11_0.DescLabel = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "ProgressDesc"

	var_11_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_11_10:setText("1/10", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_10:SetWordWrap(false)
	var_11_10:SetAlignment(LUI.Alignment.Right)
	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 497, _1080p * 545, _1080p * 132, _1080p * 153)
	var_11_0:addElement(var_11_10)

	var_11_0.ProgressDesc = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "Progress"

	var_11_12.Overlay:SetRGBFromTable(SWATCHES.BattlePass.BRVIPDarkGray, 0)
	var_11_12.Fill:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 545, _1080p * 114, _1080p * 129)
	var_11_0:addElement(var_11_12)

	var_11_0.Progress = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "XPIcon"

	var_11_14:setImage(RegisterMaterial("icon_xp"), 0)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 161, _1080p * 209, _1080p * 148, _1080p * 195)
	var_11_0:addElement(var_11_14)

	var_11_0.XPIcon = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIText.new()

	var_11_16.id = "XPAmountLabel"

	var_11_16:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_11_16:setText("", 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_16:SetAlignment(LUI.Alignment.Left)
	var_11_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 210, _1080p * 314, _1080p * 161, _1080p * 180)
	var_11_0:addElement(var_11_16)

	var_11_0.XPAmountLabel = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "Checkmark"

	var_11_18:SetAlpha(0, 0)
	var_11_18:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 501, _1080p * 549, _1080p * 95, _1080p * 143)
	var_11_0:addElement(var_11_18)

	var_11_0.Checkmark = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIText.new()

	var_11_20.id = "Status"

	var_11_20:SetAlpha(0, 0)
	var_11_20:setText("", 0)
	var_11_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_20:SetAlignment(LUI.Alignment.Left)
	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 545, _1080p * 110, _1080p * 130)
	var_11_0:addElement(var_11_20)

	var_11_0.Status = var_11_20

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("SeasonalEventLootItem", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "ChallengeReward"

	var_11_22:SetScale(-0.25, 0)
	var_11_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 168, _1080p * 21, _1080p * 241)
	var_11_0:addElement(var_11_22)

	var_11_0.ChallengeReward = var_11_22

	local var_11_23
	local var_11_24 = LUI.UIStyledText.new()

	var_11_24.id = "ChallengeStandbyText"

	var_11_24:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_11_24:SetAlpha(0, 0)
	var_11_24:setText(Engine.CBBHFCGDIC("MENU/PLACEHOLDER"), 0)
	var_11_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_24:SetAlignment(LUI.Alignment.Right)
	var_11_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_24:SetStartupDelay(1000)
	var_11_24:SetLineHoldTime(400)
	var_11_24:SetAnimMoveTime(1500)
	var_11_24:SetAnimMoveSpeed(50)
	var_11_24:SetEndDelay(1000)
	var_11_24:SetCrossfadeTime(400)
	var_11_24:SetFadeInTime(300)
	var_11_24:SetFadeOutTime(300)
	var_11_24:SetMaxVisibleLines(1)
	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 280, _1080p * 556, _1080p * 21, _1080p * 37)
	var_11_0:addElement(var_11_24)

	var_11_0.ChallengeStandbyText = var_11_24

	local var_11_25
	local var_11_26 = LUI.UIStyledText.new()

	var_11_26.id = "ChallengeName"

	var_11_26:setText(Engine.CBBHFCGDIC("MENU/PLACEHOLDER"), 0)
	var_11_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_26:SetWordWrap(false)
	var_11_26:SetAlignment(LUI.Alignment.Left)
	var_11_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_26:SetStartupDelay(1600)
	var_11_26:SetLineHoldTime(1000)
	var_11_26:SetAnimMoveTime(1500)
	var_11_26:SetAnimMoveSpeed(50)
	var_11_26:SetEndDelay(2000)
	var_11_26:SetCrossfadeTime(250)
	var_11_26:SetFadeInTime(300)
	var_11_26:SetFadeOutTime(300)
	var_11_26:SetMaxVisibleLines(1)
	var_11_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 270, _1080p * 18, _1080p * 39)
	var_11_0:addElement(var_11_26)

	var_11_0.ChallengeName = var_11_26

	local var_11_27
	local var_11_28 = LUI.UIStyledText.new()

	var_11_28.id = "Preview"

	var_11_28:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_11_28:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW_ALT"), 0)
	var_11_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_28:SetWordWrap(false)
	var_11_28:SetAlignment(LUI.Alignment.Left)
	var_11_28:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_28:SetOptOutRightToLeftAlignmentFlip(true)
	var_11_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_11_28:SetStartupDelay(1000)
	var_11_28:SetLineHoldTime(400)
	var_11_28:SetAnimMoveTime(1500)
	var_11_28:SetAnimMoveSpeed(50)
	var_11_28:SetEndDelay(1000)
	var_11_28:SetCrossfadeTime(400)
	var_11_28:SetFadeInTime(300)
	var_11_28:SetFadeOutTime(300)
	var_11_28:SetMaxVisibleLines(1)
	var_11_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 43, _1080p * 307, _1080p * 208, _1080p * 232)
	var_11_0:addElement(var_11_28)

	var_11_0.Preview = var_11_28

	local var_11_29
	local var_11_30 = LUI.UIImage.new()

	var_11_30.id = "LineTop"

	var_11_30:SetRGBFromTable(SWATCHES.EventPromos.ArmoredRebirthGray, 0)
	var_11_30:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_11_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, 0, 0, _1080p * 2)
	var_11_0:addElement(var_11_30)

	var_11_0.LineTop = var_11_30

	local var_11_31
	local var_11_32 = LUI.UIImage.new()

	var_11_32.id = "LineBottom"

	var_11_32:SetRGBFromTable(SWATCHES.EventPromos.ArmoredRebirthGray, 0)
	var_11_32:setImage(RegisterMaterial("ui_mp_wz_tab_highlight"), 0)
	var_11_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, 0, _1080p * 249, _1080p * 251)
	var_11_0:addElement(var_11_32)

	var_11_0.LineBottom = var_11_32

	local var_11_33
	local var_11_34 = LUI.UIImage.new()

	var_11_34.id = "UnlockEffect"

	var_11_34:SetRGBFromTable(SWATCHES.EventPromos.ArmoredEvent, 0)
	var_11_34:SetAlpha(0, 0)
	var_11_34:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_11_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 585, _1080p * 241, _1080p * 251)
	var_11_0:addElement(var_11_34)

	var_11_0.UnlockEffect = var_11_34

	local function var_11_35()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_35

	local var_11_36
	local var_11_37 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("Completed", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("Completed", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("Completed", var_11_39)

	local var_11_40 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("Completed", var_11_40)

	local var_11_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("Completed", var_11_41)

	local var_11_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("Completed", var_11_42)

	local var_11_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.ArmoredEvent
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/CM_CH_COMPLETED")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 106
		}
	}

	var_11_20:RegisterAnimationSequence("Completed", var_11_43)

	local function var_11_44()
		var_11_8:AnimateSequence("Completed")
		var_11_10:AnimateSequence("Completed")
		var_11_12:AnimateSequence("Completed")
		var_11_14:AnimateSequence("Completed")
		var_11_16:AnimateSequence("Completed")
		var_11_18:AnimateSequence("Completed")
		var_11_20:AnimateSequence("Completed")
	end

	var_11_0._sequences.Completed = var_11_44

	local var_11_45
	local var_11_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("InProgress", var_11_46)

	local var_11_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("InProgress", var_11_47)

	local var_11_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("InProgress", var_11_48)

	local var_11_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("InProgress", var_11_49)

	local var_11_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("InProgress", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("InProgress", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("InProgress", var_11_52)

	local function var_11_53()
		var_11_8:AnimateSequence("InProgress")
		var_11_10:AnimateSequence("InProgress")
		var_11_12:AnimateSequence("InProgress")
		var_11_14:AnimateSequence("InProgress")
		var_11_16:AnimateSequence("InProgress")
		var_11_18:AnimateSequence("InProgress")
		var_11_20:AnimateSequence("InProgress")
	end

	var_11_0._sequences.InProgress = var_11_53

	local var_11_54
	local var_11_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("PromptsDisabled", var_11_55)

	local function var_11_56()
		var_11_28:AnimateSequence("PromptsDisabled")
	end

	var_11_0._sequences.PromptsDisabled = var_11_56

	local var_11_57
	local var_11_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_28:RegisterAnimationSequence("PromptsEnabled", var_11_58)

	local function var_11_59()
		var_11_28:AnimateSequence("PromptsEnabled")
	end

	var_11_0._sequences.PromptsEnabled = var_11_59

	local var_11_60
	local var_11_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 260
		},
		{
			value = 1,
			duration = 320,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 320,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 73
		},
		{
			value = 0,
			duration = 560,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 560,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -48
		}
	}

	var_11_34:RegisterAnimationSequence("CompleteAnim", var_11_61)

	local function var_11_62()
		var_11_34:AnimateSequence("CompleteAnim")
	end

	var_11_0._sequences.CompleteAnim = var_11_62

	local var_11_63
	local var_11_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("InStandby", var_11_64)

	local var_11_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("InStandby", var_11_65)

	local var_11_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("InStandby", var_11_66)

	local var_11_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("InStandby", var_11_67)

	local var_11_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("InStandby", var_11_68)

	local var_11_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("InStandby", var_11_69)

	local var_11_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("InStandby", var_11_70)

	local var_11_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("InStandby", var_11_71)

	local function var_11_72()
		var_11_8:AnimateSequence("InStandby")
		var_11_10:AnimateSequence("InStandby")
		var_11_12:AnimateSequence("InStandby")
		var_11_14:AnimateSequence("InStandby")
		var_11_16:AnimateSequence("InStandby")
		var_11_18:AnimateSequence("InStandby")
		var_11_20:AnimateSequence("InStandby")
		var_11_24:AnimateSequence("InStandby")
	end

	var_11_0._sequences.InStandby = var_11_72

	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("SeasonalEventParticipationChallenge", SeasonalEventParticipationChallenge)
LockTable(_M)
