module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0, "SeasonalEventProgressPanel -> RefreshSeasonalGameSourceData -> self is nil, but must be specified")
	assert(arg_1_1, "SeasonalEventProgressPanel -> RefreshSeasonalGameSourceData -> options is nil, but must be specified")

	if arg_1_1._finalLootID and arg_1_1._finalLootID > 0 then
		local var_1_0 = LOOT.GetLootCardData(arg_1_0._controllerIndex, arg_1_1._finalLootID)

		if arg_1_1._fakeLootCardImage ~= "" then
			var_1_0.image = arg_1_1._fakeLootCardImage
		end

		if arg_1_1._fakeRarity ~= "" then
			var_1_0.rarity = arg_1_1._fakeRarity
			var_1_0.rarityImage = LOOT.GetRarityImage(var_1_0.rarity)
			var_1_0.rarityColor = LOOT.GetRarityColor(var_1_0.rarity)
		end

		if arg_1_0._luaSeasonalEventData.useFinalRewardRarityAsBackerColor and var_1_0.rarityColor ~= nil and arg_1_0.Backer then
			arg_1_0.Backer:SetRGBFromTable(var_1_0.rarityColor)
		end

		if arg_1_0._luaSeasonalEventData.baseWeaponReward then
			arg_1_0.BaseWeaponReward:UpdateCardConfig(var_1_0, arg_1_1)
		else
			arg_1_0.FinalReward.LootItemCardMiniDouble.FrontLootItemCard:UpdateCardConfig(var_1_0)
			arg_1_0.FinalReward.LootItemCardMiniDouble.FrontLootItemCard:SetMiniMode(true)
		end

		arg_1_0._finalLootID = arg_1_1._finalLootID

		if arg_1_0.XPReward and arg_1_1._challengeRef and arg_1_1._challengeRef ~= "" then
			local var_1_1 = Challenge.GetIDFromRef(arg_1_1._challengeRef, Challenge.Type.MISC)
			local var_1_2 = Challenge.GetXPReward(var_1_1, Challenge.Type.MISC)

			arg_1_0.XPReward:setText(var_1_2)
		end
	end

	if arg_1_1._gameSource then
		arg_1_0.WZSnipeIcon:UpdateSnipeIcon({
			selected = true,
			gameSourceID = arg_1_1._gameSource,
			alignment = LUI.Alignment.Left
		})

		if not arg_1_0._shareFinalReward then
			if arg_1_1._gameSource == LUI.GAME_SOURCE_ID.WARZONE then
				arg_1_0.CompleteAllChallenges:setText(Engine.CBBHFCGDIC("CHALLENGES_T9_YANKEE/ACTION_EVENT_WZ_MASTERY_DESC", arg_1_1._numChallenges))
			else
				arg_1_0.CompleteAllChallenges:setText(Engine.CBBHFCGDIC("CHALLENGES_T9_YANKEE/ACTION_EVENT_CW_MASTERY_DESC", arg_1_1._numChallenges))
			end

			if SEASONAL_EVENT.GetCurrentSeasonalEventIsArmoredRebirth() then
				arg_1_0.CompleteAllChallenges:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT_TU_WZ325/PAR_BONUS_REWARD"))
			end
		else
			local var_1_3 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
			local var_1_4 = Engine.CBBHFCGDIC(var_1_3.tabName)

			if SEASONAL_EVENT.GetCurrentSeasonalEventIsLEP() then
				arg_1_0.CompleteAllChallenges:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.None)
			end

			arg_1_0.CompleteAllChallenges:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/COMPLETE_ALL_GAME_CHALLENGES", var_1_4))
		end

		local var_1_5 = SEASONAL_EVENT.GetSquareProgressPanelHeaderStrings(arg_1_1._gameSource)

		if var_1_5 ~= nil then
			arg_1_0.BonusReward:setText(var_1_5)
		end
	end

	arg_1_0.ChallengesCompletedLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1._numComplete, arg_1_1._numChallenges))

	if arg_1_0._unlockedBonusReward and arg_1_0._shareFinalReward or arg_1_1._numChallenges and arg_1_1._numChallenges == arg_1_1._numComplete then
		arg_1_0._unlockedBonusReward = true

		if arg_1_0._luaSeasonalEventData.baseWeaponReward then
			ACTIONS.AnimateSequence(arg_1_0.BaseWeaponReward, "Unlocked")
		else
			ACTIONS.AnimateSequence(arg_1_0.FinalReward, "Complete")
		end
	elseif arg_1_0._luaSeasonalEventData.baseWeaponReward then
		ACTIONS.AnimateSequence(arg_1_0.BaseWeaponReward, "Locked")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = SEASONAL_EVENT.SetupProgressionPanel(arg_2_0, arg_2_1)

	arg_2_0.FinalReward:SetupEventHandlers()

	if var_2_0 == nil then
		return
	end

	arg_2_0.CheckboxList:InitSetupWithData(arg_2_0._csvEntryListData[var_2_0])
	var_0_0(arg_2_0, {
		_finalLootID = arg_2_0._csvEntryListData[var_2_0]._finalLootID,
		_gameSource = var_2_0,
		_numChallenges = arg_2_0._csvEntryListData[var_2_0]._numChallenges or 0,
		_numComplete = arg_2_0._csvEntryListData[var_2_0]._numComplete or 0,
		_challengeRef = arg_2_0._csvEntryListData[var_2_0]._challengeRef or "",
		_fakeLootCardImage = arg_2_0._csvEntryListData[var_2_0]._fakeLootCardImage or "",
		_fakeRarity = arg_2_0._csvEntryListData[var_2_0]._fakeRarity or ""
	})
end

local function var_0_2(arg_3_0)
	return LUI.IsLastInputKeyboardMouse(arg_3_0) and "PromptsEnabledKBM" or "PromptsEnabled"
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_1 ~= nil, "Usage: SeasonalEventProgressPanel:SetPromptsEnabled( <isEnabled>, <controllerIndex> )")

	if arg_4_0._promptsEnabled ~= arg_4_1 then
		arg_4_0._promptsEnabled = arg_4_1

		ACTIONS.AnimateSequence(arg_4_0, arg_4_0._promptsEnabled and var_0_2(arg_4_2) or "PromptsDisabled")
	end
end

local function var_0_4(arg_5_0)
	if arg_5_0.disabled == true then
		return
	end

	if arg_5_0._promptsEnabled and arg_5_0._finalLootID and arg_5_0._finalLootID > 0 then
		if arg_5_0._luaSeasonalEventData.baseWeaponReward == true then
			local var_5_0 = LOOT.GetBaseRefFromWeaponID(arg_5_0._finalLootID)
			local var_5_1 = options or {}

			var_5_1.weaponTable = WEAPON.GenerateWeaponTableFromRef(var_5_0)

			LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_5_0._controllerIndex, nil, var_5_1, true)
		else
			local var_5_2 = LOOT.GetTypeForID(arg_5_0._finalLootID)

			if LOOT.CanPreview(var_5_2, arg_5_0._finalLootID) then
				STORE.PreviewItem(arg_5_0._controllerIndex, var_5_2, arg_5_0._finalLootID)
			end
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0.bindButton:addEventHandler(arg_6_1, function(arg_7_0, arg_7_1)
		if arg_6_0.disabled == true then
			return
		end

		arg_6_0:PreviewReward()
	end)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0._promptsEnabled = true
	arg_8_0._csvEntryListData = {}
	arg_8_0._luaSeasonalEventData = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	arg_8_0.PreviewReward = var_0_4
	arg_8_0.CheckboxList._hideNumCompleted = true

	assert(arg_8_0._luaSeasonalEventData, "Invalid seasonal event data provided for SeasonalEventProgressPanel ( expected to be non-nil )")

	arg_8_0._shareFinalReward = arg_8_0._luaSeasonalEventData.shareFinalReward
	arg_8_0.Setup = var_0_1
	arg_8_0.SetPromptsEnabled = var_0_3

	ACTIONS.AnimateSequence(arg_8_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

	arg_8_0.bindButton = LUI.UIBindButton.new()

	arg_8_0:addElement(arg_8_0.bindButton)
	arg_8_0:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		arg_8_0:PreviewReward()
	end)
	arg_8_0:addEventHandler(SEASONAL_EVENT.MOD_ANIM_EVENT_NAME, function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_10_0, arg_10_1.animToUse)

		local var_10_0 = arg_10_0._csvEntryListData[arg_10_1.gameSource]

		if not var_10_0 then
			return
		end

		arg_10_0.CheckboxList:RefreshContentWithData(var_10_0)
		var_0_0(arg_8_0, {
			_finalLootID = var_10_0._finalLootID,
			_gameSource = arg_10_1.gameSource,
			_numChallenges = var_10_0._numChallenges or 0,
			_numComplete = var_10_0._numComplete or 0,
			_fakeLootCardImage = var_10_0._fakeLootCardImage or "",
			_fakeRarity = var_10_0._fakeRarity or ""
		})
	end)

	if SEASONAL_EVENT.GetCurrentSeasonalEventIsArmoredRebirth() then
		arg_8_0.Preview:setText(Engine.CBBHFCGDIC(LUI.IsLastInputKeyboardMouse(arg_8_0._controllerIndex) and "SEASONAL_EVENT/PREVIEW" or "SEASONAL_EVENT/PREVIEW_GAMEPAD_PROMPT"))
		var_0_5(arg_8_0, "button_alt1")
	else
		var_0_5(arg_8_0, "button_right_stick")
	end

	arg_8_0:registerAndCallEventHandler("update_input_type", function(arg_11_0, arg_11_1)
		if arg_11_0._promptsEnabled then
			ACTIONS.AnimateSequence(arg_11_0, var_0_2(arg_11_1.controllerIndex))

			if SEASONAL_EVENT.GetCurrentSeasonalEventIsArmoredRebirth() then
				arg_11_0.Preview:setText(Engine.CBBHFCGDIC(LUI.IsLastInputKeyboardMouse(arg_11_1.controllerIndex) and "SEASONAL_EVENT/PREVIEW" or "SEASONAL_EVENT/PREVIEW_GAMEPAD_PROMPT"))
			end
		end
	end, {
		element = arg_8_0,
		controllerIndex = arg_8_1
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	elseif CONDITIONS.IsLanguageAsian() then
		ACTIONS.AnimateSequence(arg_8_0, "Asian")
	end
end

function SeasonalEventSquareProgressPanel(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 265 * _1080p)

	var_12_0.id = "SeasonalEventSquareProgressPanel"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
		var_12_3 = LUI.UIImage.new()
		var_12_3.id = "Backer"

		var_12_3:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
		var_12_3:SetAlpha(0, 0)
		var_12_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 512, _1080p * 58, _1080p * 264)
		var_12_0:addElement(var_12_3)

		var_12_0.Backer = var_12_3
	end

	local var_12_4
	local var_12_5 = MenuBuilder.BuildRegisteredType("GenericCheckBoxHorizList", {
		controllerIndex = var_12_1
	})

	var_12_5.id = "CheckboxList"

	var_12_5:SetScale(0.1, 0)
	var_12_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 236, _1080p * 566, _1080p * 195, _1080p * 217)
	var_12_0:addElement(var_12_5)

	var_12_0.CheckboxList = var_12_5

	local var_12_6
	local var_12_7 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_12_1
	})

	var_12_7.id = "WZSnipeIcon"

	var_12_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 112, _1080p * 243, _1080p * 189, _1080p * 222)
	var_12_0:addElement(var_12_7)

	var_12_0.WZSnipeIcon = var_12_7

	local var_12_8
	local var_12_9 = MenuBuilder.BuildRegisteredType("SeasonalEventLootItem", {
		controllerIndex = var_12_1
	})

	var_12_9.id = "FinalReward"

	var_12_9:SetScale(-0.25, 0)
	var_12_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -19, _1080p * 131, _1080p * 58, _1080p * 278)
	var_12_0:addElement(var_12_9)

	var_12_0.FinalReward = var_12_9

	local var_12_10
	local var_12_11 = LUI.UIText.new()

	var_12_11.id = "BonusReward"

	var_12_11:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/HALLOWEEN_ONBOARDING_HEADER_3"), 0)
	var_12_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_11:SetWordWrap(false)
	var_12_11:SetAlignment(LUI.Alignment.Left)
	var_12_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 481, _1080p * 88, _1080p * 118)
	var_12_0:addElement(var_12_11)

	var_12_0.BonusReward = var_12_11

	local var_12_12
	local var_12_13 = LUI.UIText.new()

	var_12_13.id = "CompleteAllChallenges"

	var_12_13:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_12_13:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/COMPLETE_ALL_GAME_CHALLENGES"), 0)
	var_12_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_13:SetAlignment(LUI.Alignment.Left)
	var_12_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 481, _1080p * 118, _1080p * 138)
	var_12_0:addElement(var_12_13)

	var_12_0.CompleteAllChallenges = var_12_13

	local var_12_14

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_15 = {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 1,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		}

		var_12_14 = LUI.UIBorder.new(var_12_15)
		var_12_14.id = "Divider"

		var_12_14:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
		var_12_14:SetAlpha(0.3, 0)
		var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 418, _1080p * 182, _1080p * 183)
		var_12_0:addElement(var_12_14)

		var_12_0.Divider = var_12_14
	end

	local var_12_16
	local var_12_17 = LUI.UIText.new()

	var_12_17.id = "ChallengesCompletedLabel"

	var_12_17:setText("#/#", 0)
	var_12_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_17:SetAlignment(LUI.Alignment.Left)
	var_12_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 236, _1080p * 736, _1080p * 222, _1080p * 252)
	var_12_0:addElement(var_12_17)

	var_12_0.ChallengesCompletedLabel = var_12_17

	local var_12_18

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPBG") then
		var_12_18 = LUI.UIImage.new()
		var_12_18.id = "XPBG"

		var_12_18:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
		var_12_18:SetAlpha(0.8, 0)
		var_12_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 112, _1080p * 229, _1080p * 265)
		var_12_0:addElement(var_12_18)

		var_12_0.XPBG = var_12_18
	end

	local var_12_19

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPIcon") then
		var_12_19 = LUI.UIImage.new()
		var_12_19.id = "XPIcon"

		var_12_19:setImage(RegisterMaterial("icon_xp_token"), 0)
		var_12_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 40, _1080p * 226, _1080p * 268)
		var_12_0:addElement(var_12_19)

		var_12_0.XPIcon = var_12_19
	end

	local var_12_20

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPReward") then
		var_12_20 = LUI.UIText.new()
		var_12_20.id = "XPReward"

		var_12_20:setText("", 0)
		var_12_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_12_20:SetAlignment(LUI.Alignment.Left)
		var_12_20:SetVerticalAlignment(LUI.Alignment.Center)
		var_12_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 112, _1080p * 236, _1080p * 260)
		var_12_0:addElement(var_12_20)

		var_12_0.XPReward = var_12_20
	end

	local var_12_21
	local var_12_22 = MenuBuilder.BuildRegisteredType("SeasonalEventBaseWeaponReward", {
		controllerIndex = var_12_1
	})

	var_12_22.id = "BaseWeaponReward"

	var_12_22:SetAlpha(0, 0)
	var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 550, 0, _1080p * 150)
	var_12_0:addElement(var_12_22)

	var_12_0.BaseWeaponReward = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIStyledText.new()

	var_12_24.id = "Preview"

	var_12_24:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_12_24:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/PREVIEW"), 0)
	var_12_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_24:SetWordWrap(false)
	var_12_24:SetAlignment(LUI.Alignment.Left)
	var_12_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_12_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_12_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_24:SetStartupDelay(1000)
	var_12_24:SetLineHoldTime(400)
	var_12_24:SetAnimMoveTime(1500)
	var_12_24:SetAnimMoveSpeed(50)
	var_12_24:SetEndDelay(1000)
	var_12_24:SetCrossfadeTime(400)
	var_12_24:SetFadeInTime(300)
	var_12_24:SetFadeOutTime(300)
	var_12_24:SetMaxVisibleLines(1)
	var_12_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 141, _1080p * 252, _1080p * 276)
	var_12_0:addElement(var_12_24)

	var_12_0.Preview = var_12_24

	local function var_12_25()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_25

	local function var_12_26()
		return
	end

	var_12_0._sequences.PromptsEnabledKBM = var_12_26

	local function var_12_27()
		return
	end

	var_12_0._sequences.PromptsEnabled = var_12_27

	local function var_12_28()
		return
	end

	var_12_0._sequences.PromptsDisabled = var_12_28

	local function var_12_29()
		return
	end

	var_12_0._sequences.AR = var_12_29

	local var_12_30
	local var_12_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 243
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 222
		}
	}

	var_12_7:RegisterAnimationSequence("SetupAdlerEvent", var_12_31)

	local var_12_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 278
		}
	}

	var_12_9:RegisterAnimationSequence("SetupAdlerEvent", var_12_32)

	local var_12_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 388
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 118
		}
	}

	var_12_11:RegisterAnimationSequence("SetupAdlerEvent", var_12_33)

	local var_12_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 447
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 138
		}
	}

	var_12_13:RegisterAnimationSequence("SetupAdlerEvent", var_12_34)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_35 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 130
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 418
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 182
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 183
			}
		}

		var_12_14:RegisterAnimationSequence("SetupAdlerEvent", var_12_35)
	end

	local var_12_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_17:RegisterAnimationSequence("SetupAdlerEvent", var_12_36)

	local function var_12_37()
		var_12_7:AnimateSequence("SetupAdlerEvent")
		var_12_9:AnimateSequence("SetupAdlerEvent")
		var_12_11:AnimateSequence("SetupAdlerEvent")
		var_12_13:AnimateSequence("SetupAdlerEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
			var_12_14:AnimateSequence("SetupAdlerEvent")
		end

		var_12_17:AnimateSequence("SetupAdlerEvent")
	end

	var_12_0._sequences.SetupAdlerEvent = var_12_37

	local var_12_38

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
		local var_12_39 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 169
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 511
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 56
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 236
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("widg_gradient_left_to_right")
			},
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Blend_Mode,
				value = BLEND_MODE.blend
			}
		}

		var_12_3:RegisterAnimationSequence("SetupSeasonalEvent", var_12_39)
	end

	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 208
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 522
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 133
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		}
	}

	var_12_5:RegisterAnimationSequence("SetupSeasonalEvent", var_12_40)

	local var_12_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 236
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 158
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 190
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_7:RegisterAnimationSequence("SetupSeasonalEvent", var_12_41)

	local var_12_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 260
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_12_0.FinalReward.Progress.Overlay
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_12_0.FinalReward.Progress.Fill
		}
	}

	var_12_9:RegisterAnimationSequence("SetupSeasonalEvent", var_12_42)

	local var_12_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 450
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 100
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 125
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/COMPLETION_BONUS")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_12_11:RegisterAnimationSequence("SetupSeasonalEvent", var_12_43)

	local var_12_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 132
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 470
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 125
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_13:RegisterAnimationSequence("SetupSeasonalEvent", var_12_44)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_45 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 210
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 90
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 11
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 11
			}
		}

		var_12_14:RegisterAnimationSequence("SetupSeasonalEvent", var_12_45)
	end

	local var_12_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 364
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 424
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		}
	}

	var_12_17:RegisterAnimationSequence("SetupSeasonalEvent", var_12_46)

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPBG") then
		local var_12_47 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 300
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 420
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 241
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 277
			}
		}

		var_12_18:RegisterAnimationSequence("SetupSeasonalEvent", var_12_47)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPIcon") then
		local var_12_48 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 312
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 350
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 239
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 281
			}
		}

		var_12_19:RegisterAnimationSequence("SetupSeasonalEvent", var_12_48)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPReward") then
		local var_12_49 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 355
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 427
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 246
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 270
			}
		}

		var_12_20:RegisterAnimationSequence("SetupSeasonalEvent", var_12_49)
	end

	local var_12_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 322
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 222
		}
	}

	var_12_24:RegisterAnimationSequence("SetupSeasonalEvent", var_12_50)

	local function var_12_51()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
			var_12_3:AnimateSequence("SetupSeasonalEvent")
		end

		var_12_5:AnimateSequence("SetupSeasonalEvent")
		var_12_7:AnimateSequence("SetupSeasonalEvent")
		var_12_9:AnimateSequence("SetupSeasonalEvent")
		var_12_11:AnimateSequence("SetupSeasonalEvent")
		var_12_13:AnimateSequence("SetupSeasonalEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
			var_12_14:AnimateSequence("SetupSeasonalEvent")
		end

		var_12_17:AnimateSequence("SetupSeasonalEvent")

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPBG") then
			var_12_18:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPIcon") then
			var_12_19:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "XPReward") then
			var_12_20:AnimateSequence("SetupSeasonalEvent")
		end

		var_12_24:AnimateSequence("SetupSeasonalEvent")
	end

	var_12_0._sequences.SetupSeasonalEvent = var_12_51

	local function var_12_52()
		return
	end

	var_12_0._sequences.Asian = var_12_52

	local var_12_53

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
		local var_12_54 = {
			{
				value = 0.53,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 78
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 251
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 480
			}
		}

		var_12_3:RegisterAnimationSequence("SetupLEPEvent", var_12_54)
	end

	local var_12_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 251
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 581
		}
	}

	var_12_5:RegisterAnimationSequence("SetupLEPEvent", var_12_55)

	local var_12_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_12_9:RegisterAnimationSequence("SetupLEPEvent", var_12_56)

	local var_12_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisLight
		}
	}

	var_12_11:RegisterAnimationSequence("SetupLEPEvent", var_12_57)

	local var_12_58 = {
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 135
		}
	}

	var_12_13:RegisterAnimationSequence("SetupLEPEvent", var_12_58)

	local var_12_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 418
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 918
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 222
		}
	}

	var_12_17:RegisterAnimationSequence("SetupLEPEvent", var_12_59)

	local function var_12_60()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
			var_12_3:AnimateSequence("SetupLEPEvent")
		end

		var_12_5:AnimateSequence("SetupLEPEvent")
		var_12_9:AnimateSequence("SetupLEPEvent")
		var_12_11:AnimateSequence("SetupLEPEvent")
		var_12_13:AnimateSequence("SetupLEPEvent")
		var_12_17:AnimateSequence("SetupLEPEvent")
	end

	var_12_0._sequences.SetupLEPEvent = var_12_60

	local var_12_61
	local var_12_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 195
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 217
		}
	}

	var_12_5:RegisterAnimationSequence("SetupNumbersEvent", var_12_62)

	local var_12_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 219
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 252
		}
	}

	var_12_7:RegisterAnimationSequence("SetupNumbersEvent", var_12_63)

	local var_12_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("SetupNumbersEvent", var_12_64)

	local var_12_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/NEW_BASE_WEAPON")
		}
	}

	var_12_11:RegisterAnimationSequence("SetupNumbersEvent", var_12_65)

	local var_12_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 169
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 189
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 512
		}
	}

	var_12_13:RegisterAnimationSequence("SetupNumbersEvent", var_12_66)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_67 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_14:RegisterAnimationSequence("SetupNumbersEvent", var_12_67)
	end

	local var_12_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 276
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 486
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_12_17:RegisterAnimationSequence("SetupNumbersEvent", var_12_68)

	local var_12_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 175
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_22:RegisterAnimationSequence("SetupNumbersEvent", var_12_69)

	local function var_12_70()
		var_12_5:AnimateSequence("SetupNumbersEvent")
		var_12_7:AnimateSequence("SetupNumbersEvent")
		var_12_9:AnimateSequence("SetupNumbersEvent")
		var_12_11:AnimateSequence("SetupNumbersEvent")
		var_12_13:AnimateSequence("SetupNumbersEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
			var_12_14:AnimateSequence("SetupNumbersEvent")
		end

		var_12_17:AnimateSequence("SetupNumbersEvent")
		var_12_22:AnimateSequence("SetupNumbersEvent")
	end

	var_12_0._sequences.SetupNumbersEvent = var_12_70

	local var_12_71
	local var_12_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 346
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_12_5:RegisterAnimationSequence("SetupHauntEvent", var_12_72)

	local var_12_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 257
		}
	}

	var_12_7:RegisterAnimationSequence("SetupHauntEvent", var_12_73)

	local var_12_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("SetupHauntEvent", var_12_74)

	local var_12_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("SEASONAL_EVENT/NEW_BASE_WEAPON")
		}
	}

	var_12_11:RegisterAnimationSequence("SetupHauntEvent", var_12_75)

	local var_12_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 170
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 190
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 434
		}
	}

	var_12_13:RegisterAnimationSequence("SetupHauntEvent", var_12_76)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_14:RegisterAnimationSequence("SetupHauntEvent", var_12_77)
	end

	local var_12_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 277
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 193
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 487
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 223
		}
	}

	var_12_17:RegisterAnimationSequence("SetupHauntEvent", var_12_78)

	local var_12_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 524
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 176
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_12_22:RegisterAnimationSequence("SetupHauntEvent", var_12_79)

	local function var_12_80()
		var_12_5:AnimateSequence("SetupHauntEvent")
		var_12_7:AnimateSequence("SetupHauntEvent")
		var_12_9:AnimateSequence("SetupHauntEvent")
		var_12_11:AnimateSequence("SetupHauntEvent")
		var_12_13:AnimateSequence("SetupHauntEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
			var_12_14:AnimateSequence("SetupHauntEvent")
		end

		var_12_17:AnimateSequence("SetupHauntEvent")
		var_12_22:AnimateSequence("SetupHauntEvent")
	end

	var_12_0._sequences.SetupHauntEvent = var_12_80

	local var_12_81

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
		local var_12_82 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 540
			}
		}

		var_12_3:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_82)
	end

	local var_12_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 280
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 610
		}
	}

	var_12_5:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_83)

	local var_12_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 189
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 262
		}
	}

	var_12_7:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_84)

	local var_12_85 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 141
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 260
		}
	}

	var_12_9:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_85)

	local var_12_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 108
		}
	}

	var_12_11:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_86)

	local var_12_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 128
		}
	}

	var_12_13:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_87)

	if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
		local var_12_88 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_14:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_88)
	end

	local var_12_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 187
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 447
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 508
		}
	}

	var_12_17:RegisterAnimationSequence("SetupFestiveFervorEvent", var_12_89)

	local function var_12_90()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
			var_12_3:AnimateSequence("SetupFestiveFervorEvent")
		end

		var_12_5:AnimateSequence("SetupFestiveFervorEvent")
		var_12_7:AnimateSequence("SetupFestiveFervorEvent")
		var_12_9:AnimateSequence("SetupFestiveFervorEvent")
		var_12_11:AnimateSequence("SetupFestiveFervorEvent")
		var_12_13:AnimateSequence("SetupFestiveFervorEvent")

		if CONDITIONS.SeasonalEventIsWidgetNotExcludedFromEvent(var_12_0, "Divider") then
			var_12_14:AnimateSequence("SetupFestiveFervorEvent")
		end

		var_12_17:AnimateSequence("SetupFestiveFervorEvent")
	end

	var_12_0._sequences.SetupFestiveFervorEvent = var_12_90

	local var_12_91

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
		local var_12_92 = {
			{
				value = 0.53,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 78
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 251
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 480
			}
		}

		var_12_3:RegisterAnimationSequence("SetupArmoredEvent", var_12_92)
	end

	local var_12_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 574
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 193
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_12_5:RegisterAnimationSequence("SetupArmoredEvent", var_12_93)

	local var_12_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 261
		}
	}

	var_12_7:RegisterAnimationSequence("SetupArmoredEvent", var_12_94)

	local var_12_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 136
		}
	}

	var_12_9:RegisterAnimationSequence("SetupArmoredEvent", var_12_95)

	local var_12_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle
		}
	}

	var_12_11:RegisterAnimationSequence("SetupArmoredEvent", var_12_96)

	local var_12_97 = {
		{
			value = true,
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Word_Wrap
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 135
		}
	}

	var_12_13:RegisterAnimationSequence("SetupArmoredEvent", var_12_97)

	local var_12_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 382
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 882
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_12_17:RegisterAnimationSequence("SetupArmoredEvent", var_12_98)

	local function var_12_99()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_12_0, "Backer") then
			var_12_3:AnimateSequence("SetupArmoredEvent")
		end

		var_12_5:AnimateSequence("SetupArmoredEvent")
		var_12_7:AnimateSequence("SetupArmoredEvent")
		var_12_9:AnimateSequence("SetupArmoredEvent")
		var_12_11:AnimateSequence("SetupArmoredEvent")
		var_12_13:AnimateSequence("SetupArmoredEvent")
		var_12_17:AnimateSequence("SetupArmoredEvent")
	end

	var_12_0._sequences.SetupArmoredEvent = var_12_99

	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("SeasonalEventSquareProgressPanel", SeasonalEventSquareProgressPanel)
LockTable(_M)
