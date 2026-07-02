module(..., package.seeall)

local var_0_0 = {
	"MPMainMenu",
	"BRMainMenu",
	"CPMainMenu"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.SeasonalEventTitle:UpdateTitleDescription(arg_1_2)

	if arg_1_1 == nil then
		arg_1_1 = SEASONAL_EVENT.GetMPTabsMenu()
	end

	if arg_1_1 then
		local var_1_0 = arg_1_0.SeasonalEventTitle:GetCrossLaunchPromptData(arg_1_2)
		local var_1_1 = {
			priority = 1,
			replaceTop = true,
			button_ref = "button_l3",
			helper_text = ToUpperCase(Engine.CBBHFCGDIC(var_1_0.kbm_text)),
			prompt_text = ToUpperCase(Engine.CBBHFCGDIC(var_1_0.controller_text))
		}

		arg_1_0.SeasonalEventTitle.SeasonalEventCrossLaunchPrompts:SetupPromptsData(arg_1_1, var_1_1)
	end

	arg_1_0._curGame = arg_1_2
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0._currentGridIndex = arg_2_0._useStackedCards and arg_2_1._column + arg_2_1._column + 1 or arg_2_1._column + 1

	if arg_2_1._curCardIndex == arg_2_1._cardIndex2 then
		arg_2_0._currentGridIndex = arg_2_0._currentGridIndex + 1
	end

	local var_2_0 = arg_2_0._gridData[arg_2_0._currentGridIndex]

	if arg_2_1._gameSource then
		var_0_1(arg_2_0, nil, arg_2_1._gameSource)

		if arg_2_1.SnipeIcon then
			arg_2_1.SnipeIcon:UpdateSnipeIcon({
				selected = true,
				gameSourceID = arg_2_1._gameSource
			})
		end
	end

	if arg_2_0.Map then
		arg_2_0.Map:SetLocation(var_2_0.location)
	end

	if arg_2_0.Challenges then
		arg_2_0.Challenges:SetActiveChallenge(var_2_0)
	end

	if var_2_0.billboardImage and var_2_0.billboardImage ~= "" then
		local var_2_1 = RegisterMaterial(var_2_0.billboardImage)

		arg_2_0.Background:setImage(var_2_1)
	end

	if arg_2_0.ChallengeCompletedImage then
		if var_2_0.challengeCompletedImage and var_2_0.challengeCompletedImage ~= "" and var_2_0.isComplete then
			local var_2_2 = RegisterMaterial(var_2_0.challengeCompletedImage)

			arg_2_0.ChallengeCompletedImage:setImage(var_2_2)
			arg_2_0.ChallengeCompletedImage:SetAlpha(1, 0)
			arg_2_0.Gradient:SetAlpha(0.5, 0)
			ACTIONS.AnimateSequence(arg_2_0.Challenges.ChallengeIndicator, "LEPCheckmark")
		else
			arg_2_0.ChallengeCompletedImage:SetAlpha(0, 0)
			arg_2_0.Gradient:SetAlpha(0, 0)
			ACTIONS.AnimateSequence(arg_2_0.Challenges.ChallengeIndicator, "LEPChallenge")
		end
	end

	if arg_2_1._modEventAnim then
		arg_2_0:processEvent({
			dispatchChildren = true,
			name = SEASONAL_EVENT.MOD_ANIM_EVENT_NAME,
			animToUse = arg_2_1._modEventAnim,
			gameSource = arg_2_1._gameSource,
			controller = arg_2_0._controllerIndex
		})
	end
end

local function var_0_3(arg_3_0, arg_3_1)
	arg_3_0._gridData = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if iter_3_1.isFinalReward ~= "1" and iter_3_1.isIntroGift ~= "1" and iter_3_1.isEarlyAccessGift ~= "1" then
			local var_3_0 = LUI.ShallowCopy(iter_3_1)

			var_3_0.lootData = LOOT.GetLootCardData(arg_3_0._controllerIndex, tonumber(var_3_0.lootID))

			table.insert(arg_3_0._gridData, var_3_0)
		end
	end

	table.sort(arg_3_0._gridData, function(arg_4_0, arg_4_1)
		if arg_4_0.order == arg_4_1.order then
			return arg_4_1.gameSource < arg_4_0.gameSource
		else
			return tonumber(arg_4_0.order) < tonumber(arg_4_1.order)
		end
	end)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._previousChildSelected = arg_5_0._curChildSelected
	arg_5_0._curChildSelected = arg_5_1

	if arg_5_0._focusItem == nil or arg_5_0._focusItem ~= arg_5_2 then
		if arg_5_0._focusItem ~= nil then
			arg_5_0._focusItem:Contract()
			arg_5_0._focusItem:processEvent({
				name = "lose_active"
			})
		end

		if arg_5_0._notActiveChallengeHoverSFX ~= nil then
			Engine.BJDBIAGIDA(arg_5_0._notActiveChallengeHoverSFX)
		end

		arg_5_0._focusItem = arg_5_2
	elseif arg_5_0._focusItem == arg_5_2 and arg_5_0._activeChallengeHoverSFX ~= nil then
		Engine.BJDBIAGIDA(arg_5_0._activeChallengeHoverSFX)
	end

	if arg_5_0._previousChildSelected ~= arg_5_0._curChildSelected then
		var_0_2(arg_5_0, arg_5_1)
		arg_5_1:Expand()
	end

	if arg_5_0._challengeCardHoverSFX ~= nil then
		Engine.BJDBIAGIDA(arg_5_0._challengeCardHoverSFX)
	end

	LAYOUT.UpdateWidgetHorizPosToGridFocusedChild(arg_5_0.TogglePromptText, arg_5_0.Grid, arg_5_2)
end

local function var_0_5(arg_6_0)
	if arg_6_0.Challenges then
		arg_6_0.Challenges:ClearActiveChallenge()
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	if not arg_7_0._swapRowsViaMouse and arg_7_1.mouse then
		arg_7_0._swapRowsViaMouse = true

		arg_7_0.Grid:RefreshContent()
		arg_7_0:SetBinkBackground()
	end
end

local function var_0_7(arg_8_0)
	arg_8_0._scaleUpBackCard = true

	arg_8_0.Grid:RefreshContent()
end

local function var_0_8(arg_9_0, arg_9_1)
	if arg_9_0._scaleUpBackCard and arg_9_0.Grid._childInFocus == arg_9_1 then
		arg_9_0._scaleUpBackCard = false

		arg_9_0.Grid:RefreshContent()
	end
end

local function var_0_9(arg_10_0)
	if CONDITIONS.SeasonalEventIsFestiveFervor() then
		arg_10_0.Grid:SetMaxVisibleColumns(6)
	end

	local var_10_0 = arg_10_0._useStackedCards and #arg_10_0._gridData / 2 or #arg_10_0._gridData

	arg_10_0.Grid:SetNumChildren(var_10_0)
	arg_10_0.Grid:SetRefreshChild(function(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = arg_10_0._useStackedCards and arg_11_1 + arg_11_1 + 1 or arg_11_1 + 1
		local var_11_1 = arg_10_0._useStackedCards and var_11_0 + 1 or 0

		if arg_10_0._swapRows or arg_10_0._swapRowsViaMouse and arg_10_0._scaleUpBackCard then
			arg_11_0:CycleLootCards()
		elseif arg_10_0._scaleUpBackCard then
			arg_11_0.LootItemCardMiniDouble:PlayScaleUpBackAnimation()
		else
			arg_11_0.LootItemCardMiniDouble:PlayScaleDownBackAnimation()
		end

		local var_11_2 = arg_10_0._gridData[var_11_0]
		local var_11_3 = var_11_2 and var_11_2.lootData
		local var_11_4
		local var_11_5

		if var_11_1 ~= 0 then
			var_11_4 = arg_10_0._gridData[var_11_1]
			var_11_5 = var_11_4 and var_11_4.lootData
		end

		local var_11_6 = arg_11_0._curCardIndex == arg_11_0._cardIndex1 and var_11_2 or var_11_4

		arg_11_0._column = arg_11_1
		arg_11_0.seasonalEventID1 = var_11_2 and var_11_2.id
		arg_11_0.seasonalEventID2 = var_11_4 and var_11_4.id

		if var_11_5 then
			arg_11_0:SetupLootData(var_11_3, var_11_5)
			arg_11_0:SetComplete(var_11_2.isComplete, var_11_4.isComplete)

			local var_11_7 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("BATTLEPASS/FLIP")
					}
				}
			}

			arg_11_0.LootItemCardMiniDouble.FlipFocusable:AddTooltipData(arg_10_0._controllerIndex, var_11_7)
		else
			arg_11_0:SetupLootData(var_11_3)
			arg_11_0:SetComplete(var_11_2.isComplete)

			local var_11_8 = {
				promptsData = {
					{
						button_ref = "button_right_stick",
						keyprompt_text = Engine.CBBHFCGDIC("KEY/MOUSE1"),
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")
					}
				}
			}

			arg_11_0.LootItemCardMiniDouble:AddTooltipData(arg_10_0._controllerIndex, var_11_8)
		end

		if var_11_6.gameSource and arg_10_0._luaEventData.gameSourceData then
			arg_11_0._gameSource = var_11_6.gameSource

			local var_11_9 = arg_10_0._luaEventData.gameSourceData[arg_11_0._gameSource]

			if var_11_9 and var_11_9.modAnim then
				if SEASONAL_EVENT.AreLootItemProgressBarColorsOverridden() then
					local var_11_10 = arg_10_0._luaEventData.lootItemProgressThemeOverrides[arg_11_0._gameSource]

					if var_11_10 then
						local var_11_11 = var_11_10.backgroundColor

						if var_11_11 then
							arg_11_0.Progress.Overlay:SetRGBFromTable(var_11_11)
						end

						local var_11_12 = var_11_10.fillColor

						if var_11_12 then
							arg_11_0.Progress.Fill:SetRGBFromTable(var_11_12)
						end
					end
				else
					arg_11_0._modEventAnim = var_11_9.modAnim

					ACTIONS.AnimateSequence(arg_11_0, arg_11_0._modEventAnim)
				end

				local var_11_13 = var_11_2.gameSource == LUI.GAME_SOURCE_ID.WARZONE
				local var_11_14

				if var_11_13 then
					var_11_14 = false
				end

				arg_11_0.LootItemCardMiniDouble.FrontLootItemCard.SnipeBanner:SetGameSource({
					itemID = var_11_3.ID,
					gameSourceID = var_11_2.gameSource,
					gameSourceExclusivityID = var_11_13 and LOOT.itemSourceExclusivity.WZ_EXCLUSIVE,
					isExclusive = var_11_14,
					condensed = arg_10_0._luaEventData.gameSourceData[var_11_2.gameSource].condensed,
					showBaseSnipeOnly = arg_10_0._luaEventData.gameSourceData[var_11_2.gameSource].showBaseSnipeOnly
				})

				if arg_10_0._useStackedCards then
					local var_11_15 = var_11_4.gameSource == LUI.GAME_SOURCE_ID.WARZONE
					local var_11_16

					if var_11_15 then
						var_11_16 = false
					end

					arg_11_0.LootItemCardMiniDouble.BackLootItemCard.SnipeBanner:SetGameSource({
						itemID = var_11_5.ID,
						gameSourceID = var_11_4.gameSource,
						gameSourceExclusivityID = var_11_15 and LOOT.itemSourceExclusivity.WZ_EXCLUSIVE,
						isExclusive = var_11_16,
						condensed = arg_10_0._luaEventData.gameSourceData[var_11_4.gameSource].condensed,
						showBaseSnipeOnly = arg_10_0._luaEventData.gameSourceData[var_11_4.gameSource].showBaseSnipeOnly
					})
				end
			end
		end

		if (arg_10_0._swapRows or arg_10_0._swapRowsViaMouse) and arg_11_0 == arg_10_0._curChildSelected then
			var_0_2(arg_10_0, arg_11_0)
		end

		local var_11_17 = var_11_6.currentValue
		local var_11_18 = var_11_6.maxValue

		if arg_11_0.Progress and var_11_17 and var_11_18 and var_11_18 > 0 then
			arg_11_0.Progress:SetProgress(var_11_17 / var_11_18)
		end

		arg_11_0:SetDirectionalInputEnabled(not arg_10_0._isAnimating)
		arg_11_0:SetHandleMouse(not arg_10_0._isAnimating)

		if not arg_11_0.buttonHandlerAdded then
			arg_11_0.buttonHandlerAdded = true

			if arg_10_0._activeChallengeHoverSFX ~= nil and arg_10_0._notActiveChallengeHoverSFX ~= nil then
				arg_11_0:setGainFocusAllSFX("", {
					clearChildrenSFX = true
				})
			end

			arg_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
				var_0_4(arg_10_0, arg_11_0, arg_12_0)
			end)
			arg_11_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
				var_0_5(arg_10_0)
			end)

			if arg_10_0._useStackedCards then
				local var_11_19 = arg_11_0.LootItemCardMiniDouble.FlipFocusable

				var_11_19:addEventHandler("gain_focus", function(arg_14_0, arg_14_1)
					var_0_7(arg_10_0)
				end)
				var_11_19:addEventHandler("lose_focus", function(arg_15_0, arg_15_1)
					var_0_8(arg_10_0, arg_11_0)
				end)
				var_11_19:addEventHandler("button_action", function(arg_16_0, arg_16_1)
					var_0_6(arg_10_0, arg_16_1)
				end)

				if arg_10_0._flipRowsActionSFX then
					var_11_19:setActionSFX(arg_10_0._flipRowsActionSFX)
				end
			end
		end

		if arg_11_0._column + 1 == #arg_10_0._gridData / 2 then
			arg_10_0._swapRowsViaMouse = false
		end
	end)
end

local function var_0_10(arg_17_0, arg_17_1)
	assert(arg_17_1, "Seasonal event data is required to setup grid")

	if not arg_17_1 then
		if arg_17_0.Grid then
			arg_17_0.Grid:SetNumChildren(0)
		end

		return
	end

	if arg_17_0._useHorizontalLootList then
		var_0_3(arg_17_0, arg_17_1)
		var_0_9(arg_17_0)
		GRID.SetUpArrowScrolling(arg_17_0, arg_17_0._controllerIndex, {
			kbmArrowUI = {
				leftArrow = arg_17_0.LeftArrow,
				rightArrow = arg_17_0.RightArrow
			},
			gamePadArrowUI = {
				leftPrompt = arg_17_0.LeftPrompt,
				rightPrompt = arg_17_0.RightPrompt
			}
		})
	elseif arg_17_0._gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.PARTICIPATION_CHALLENGES then
		local var_17_0 = {
			_participationChallengesData = arg_17_1,
			_activeChallengeHoverSFX = arg_17_0._activeChallengeHoverSFX,
			_notActiveChallengeHoverSFX = arg_17_0._notActiveChallengeHoverSFX,
			_challengeCardHoverSFX = arg_17_0._challengeCardHoverSFX,
			_parent = arg_17_0
		}

		var_0_3(arg_17_0, arg_17_1)
		arg_17_0.SeasonalEventParticipationChallengesContainer:SetupData(var_17_0)
	end
end

local function var_0_11(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_2 then
		Engine.BIFAAAECJJ(arg_18_1, VideoPlaybackFlags.LOOP)
	else
		Engine.DFCGFCGBFD(arg_18_1, VideoPlaybackFlags.LOOP)
	end
end

local function var_0_12(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = Dvar.CFHDGABACF("lui_seasonal_bink_background_index") or 1
	local var_19_1 = arg_19_1.maxBinks

	assert(var_19_0 <= var_19_1, "'lui_seasonal_bink_background_index' dvar should be lower than max number of background binks: " .. var_19_1)

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("lui_seasonal_content_autocycle_binks") then
		local var_19_2 = tonumber(Engine.DCJHCAFIIA())
		local var_19_3 = 1800

		var_19_0 = math.floor(var_19_2 / var_19_3) % var_19_1 + 1
	end

	local var_19_4 = arg_19_1.dvarBink .. tostring(var_19_0)

	var_0_11(arg_19_0, var_19_4, arg_19_2)
end

local function var_0_13(arg_20_0)
	if arg_20_0.SeasonalEventParticipationChallengesContainer then
		arg_20_0._curGame = arg_20_0._curgame or arg_20_0.SeasonalEventParticipationChallengesContainer._curGame
	end

	local var_20_0 = arg_20_0._luaEventData.binkBackground
	local var_20_1 = arg_20_0._currentBink ~= arg_20_0._curGame or var_20_0.dvarBink

	if var_20_0 and var_20_1 then
		ACTIONS.AnimateSequence(arg_20_0, "BinkTransition")

		arg_20_0:Wait(100).onComplete = function()
			arg_20_0._currentBink = arg_20_0._curGame

			local var_21_0 = var_20_0.isEncrypted

			if var_20_0.dvarBink then
				var_0_12(arg_20_0, var_20_0, var_21_0)
			elseif arg_20_0._curGame == LUI.GAME_SOURCE_ID.WARZONE then
				LUI.UIMouseCursor.ForceCursorVisibility(true)
				var_0_11(arg_20_0, var_20_0.wzBink, var_21_0)
			elseif arg_20_0._curGame == LUI.GAME_SOURCE_ID.COLD_WAR then
				var_0_11(arg_20_0, var_20_0.t9Bink, var_21_0)
			elseif arg_20_0._curGame == LUI.GAME_SOURCE_ID.VANGUARD then
				var_0_11(arg_20_0, var_20_0.s4Bink, var_21_0)
			end
		end
	end
end

local function var_0_14(arg_22_0, arg_22_1, arg_22_2)
	if not SEASONAL_EVENT.IsSeasonalEventTabSoundLooped(arg_22_1) then
		Engine.BJDBIAGIDA(arg_22_2)
	else
		SOUNDS.PlayLoopedSound(arg_22_2)
	end

	arg_22_0._currentSoundAlias = arg_22_2
end

local function var_0_15(arg_23_0, arg_23_1, arg_23_2)
	if not SEASONAL_EVENT.IsSeasonalEventTabSoundLooped(arg_23_1) then
		Engine.EAGBECEBGA(arg_23_2)
	elseif SOUNDS.IsLoopedSoundPlaying(arg_23_2) then
		SOUNDS.StopLoopedSound(arg_23_2)
	end

	arg_23_0._currentSoundAlias = nil
end

local function var_0_16(arg_24_0, arg_24_1)
	if arg_24_0._luaEventData.eventTabAmbientSoundSets then
		local var_24_0 = arg_24_0._luaEventData.eventTabAmbientSoundSets[arg_24_1]

		if not var_24_0 and arg_24_0._currentSoundAlias ~= nil or var_24_0.name ~= arg_24_0._currentSoundAlias and arg_24_0._currentSoundAlias ~= nil then
			var_0_15(arg_24_0, arg_24_1, arg_24_0._currentSoundAlias)
		end

		if var_24_0 and var_24_0.name ~= arg_24_0._currentSoundAlias then
			var_0_14(arg_24_0, arg_24_1, var_24_0.name)
		end
	end
end

local function var_0_17(arg_25_0, arg_25_1, arg_25_2)
	assert(arg_25_1 and #arg_25_1 > 0, "Unlock positions required to animate unlocks")

	if not arg_25_1 or #arg_25_1 <= 0 then
		return
	end

	if arg_25_0._isAnimating then
		return
	end

	local var_25_0 = {
		CLEAN_UP = 4,
		FLARE = 2,
		SCROLL = 1,
		INIT = 0,
		DELAY = 3
	}
	local var_25_1 = {
		[var_25_0.INIT] = 1000,
		[var_25_0.SCROLL] = 200,
		[var_25_0.FLARE] = 600,
		[var_25_0.DELAY] = 200,
		[var_25_0.CLEAN_UP] = 100
	}
	local var_25_2 = #arg_25_1
	local var_25_3 = 1
	local var_25_4 = var_25_0.INIT
	local var_25_5
	local var_25_6

	local function var_25_7(arg_26_0)
		arg_25_0._isAnimating = arg_26_0
		arg_25_0._skipAnimationEnabled = arg_26_0

		arg_25_0.Grid:SetDirectionalInputEnabled(not arg_26_0)
		arg_25_0.Grid:SetMouseFocusBlocker(arg_26_0)
		arg_25_0.Grid:RefreshContent()
		arg_25_0.HorizontalScrollbar.sliderArea:SetButtonDisabled(arg_26_0)
		arg_25_0.HorizontalScrollbar:SetAlpha(arg_26_0 and 0 or 1, arg_26_0 and 0 or 150)
		arg_25_0.ContentPanel:SetPromptEnabled(not arg_26_0, arg_25_0._controllerIndex)

		if arg_25_0.SquareProgressPanel then
			arg_25_0.SquareProgressPanel:SetPromptsEnabled(not arg_26_0, arg_25_0._controllerIndex)
		end

		ACTIONS.AnimateSequence(arg_25_0, arg_26_0 and "UnlocksActive" or "UnlocksInactive")
	end

	local function var_25_8()
		for iter_27_0 = var_25_3, var_25_2 do
			local var_27_0 = arg_25_1[iter_27_0] + 1

			if arg_25_0._gridData[var_27_0] then
				local var_27_1 = arg_25_0._gridData[var_27_0].id

				SEASONAL_EVENT.SetSeenUnlockID(arg_25_0._controllerIndex, var_27_1)
			end
		end
	end

	local var_25_9

	local function var_25_10()
		if arg_25_0:GetCurrentMenu() and arg_25_0:GetCurrentMenu().id ~= LUI.FlowManager.GetVisibleMenu().id then
			arg_25_0._skipAnimation = true
		end

		if arg_25_0._skipAnimation then
			arg_25_0._skipAnimation = false
			arg_25_0._skipAnimationEnabled = false

			if var_25_6 then
				var_25_6.BattlePassFlare:ClearFlare()
			end

			var_25_8()

			var_25_4 = var_25_0.CLEAN_UP
			var_25_5 = arg_25_1[var_25_2]

			arg_25_0.Grid:SetFocusedPosition({
				y = 0,
				x = var_25_5
			}, false, true, false)
		end

		if var_25_4 == var_25_0.INIT then
			var_25_7(true)
		elseif var_25_4 == var_25_0.SCROLL then
			var_25_5 = arg_25_1[var_25_3]

			arg_25_0.Grid:SetFocusedPosition({
				y = 0,
				x = var_25_5
			}, false, true, false)
		elseif var_25_4 == var_25_0.FLARE then
			var_25_6 = arg_25_0.Grid:GetElementAtPosition(var_25_5, 0)

			if var_25_6 then
				var_25_6:SetComplete(true, true)
				var_25_6:FlareRarity()
			else
				arg_25_0._skipAnimation = true

				DebugPrint("SeasonalEventMenu: Did not find grid child at position '" .. var_25_5 .. "', skipping unlock animation")
			end
		elseif var_25_4 == var_25_0.DELAY then
			if var_25_6 then
				SEASONAL_EVENT.SetSeenUnlockID(arg_25_0._controllerIndex, var_25_6.seasonalEventID1)
				SEASONAL_EVENT.SetSeenUnlockID(arg_25_0._controllerIndex, var_25_6.seasonalEventID2)
			end

			if var_25_3 < var_25_2 then
				var_25_4 = var_25_0.INIT
				var_25_3 = var_25_3 + 1
			end
		elseif var_25_4 == var_25_0.CLEAN_UP then
			var_25_7(false)
		else
			assert(false, "Unknown animation state " .. (var_25_4 or "nil"))
		end

		if arg_25_0._isAnimating then
			local var_28_0 = var_25_1[var_25_4]

			arg_25_0:Wait(var_28_0).onComplete = function()
				var_25_4 = var_25_4 + 1

				var_25_10()
			end
		elseif arg_25_2 then
			arg_25_2()
		end
	end

	var_25_10()
end

local function var_0_18(arg_30_0)
	local var_30_0 = {}

	if not arg_30_0._controllerIndex then
		DebugPrint("SeasonalEventMenu: Controller index is required to get new unlock positions")

		return var_30_0
	end

	if not arg_30_0._gridData then
		DebugPrint("SeasonalEventMenu: Grid data must be initialized to get new unlock positions")

		return var_30_0
	end

	for iter_30_0, iter_30_1 in ipairs(arg_30_0._gridData) do
		if iter_30_1.isComplete and SEASONAL_EVENT.GetSeenUnlockID(arg_30_0._controllerIndex, iter_30_1.id) == false then
			table.insert(var_30_0, iter_30_0 - 1)
		end
	end

	return var_30_0
end

local function var_0_19(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.controller

	if arg_31_0._skipAnimationEnabled then
		arg_31_0._skipAnimation = true

		return
	end

	local var_31_1 = arg_31_0:GetCurrentMenu(arg_31_0)

	if var_31_1 and var_31_1.MPTabsMenu and var_31_1.MPTabsMenu.Tabs then
		local var_31_2 = var_31_1.MPTabsMenu
		local var_31_3 = var_31_2:GetTabIndexByWidgetName("MPStoreMenu")

		LUI.FlowManager.GetScopedData(var_31_1).returnToEventTabFromStore = true

		var_31_2.Tabs:FocusTab(var_31_0, var_31_3 - 1)
		METRICS.BundleUpsellClickDLogEvent(var_31_0)
	end
end

local function var_0_20(arg_32_0, arg_32_1)
	local var_32_0 = LUI.FlowManager.GetScopedData(arg_32_0)

	assert(var_32_0._storeBundleData, "SeasonalEventMenu.lua -> OpenBundleMenu() -> Error: attempt to open a bundle menu without bundle data being provided")
	LUI.FlowManager.RequestAddMenu("StoreBundlePreview", true, arg_32_1.controller, false, var_32_0._storeBundleData)
	METRICS.BundleUpsellClickDLogEvent(arg_32_1.controller)
end

local function var_0_21(arg_33_0)
	if Dvar.IBEGCHEFE("lui_test_force_show_completion_bink") or SEASONAL_EVENT.AreAllSeasonalEventsCompleted(arg_33_0._controllerIndex) and not SEASONAL_EVENT.IsSeasonalEventCompleteBinkSeen(arg_33_0._controllerIndex) then
		SEASONAL_EVENT.TryAwardSeasonalEventsComplete(arg_33_0, arg_33_0._controllerIndex)
	end
end

local function var_0_22(arg_34_0, arg_34_1)
	local var_34_0

	if arg_34_0._curGame == LUI.GAME_SOURCE_ID.COLD_WAR then
		var_34_0 = LUI.DEEP_LINK_GAME.COLD_WAR
	elseif arg_34_0._curGame == LUI.GAME_SOURCE_ID.VANGUARD then
		var_34_0 = LUI.DEEP_LINK_GAME.VANGUARD
	end

	if var_34_0 then
		local var_34_1 = LUI.FlowManager.GetScopedData(arg_34_0)

		assert(var_34_1._crossLaunchDeepLinkMode, "SeasonalEventMenu.lua -> StartCrossLaunch() -> Error: attempt to crosslaunch without a deep link mode specified")
		CrossLaunchUtils.CrossLaunchWithDeepLink(arg_34_0, arg_34_1.controller, {
			_useUpsellPopupIfNotOwned = true,
			_deepLinkGameMode = var_34_1._crossLaunchDeepLinkMode,
			_deepLinkGame = var_34_0
		})
	else
		local var_34_2 = arg_34_0:GetCurrentMenu(arg_34_0)

		if var_34_2 and var_34_2.MPTabsMenu and var_34_2.MPTabsMenu.Tabs then
			Engine.EBCGADABJ()
			SOUNDS.StopAllLoopedSounds({
				immediate = true
			})

			local var_34_3 = LUI.IsLastInputGamepad(arg_34_1.controller) and FocusType.Gamepad or FocusType.MouseOver

			var_34_2.MPTabsMenu.Tabs:FocusTab(arg_34_1.controller, 0, var_34_3)
		end
	end
end

local function var_0_23(arg_35_0)
	if arg_35_0._isUIHidden then
		ACTIONS.AnimateSequence(arg_35_0, arg_35_0._luaEventData.uiToggleSequences.show)

		arg_35_0._isUIHidden = false
	else
		ACTIONS.AnimateSequence(arg_35_0, arg_35_0._luaEventData.uiToggleSequences.hide)

		arg_35_0._isUIHidden = true
	end
end

local function var_0_24(arg_36_0)
	if arg_36_0._luaEventData.uiToggleSequences then
		arg_36_0:addEventHandler("gamepad_button", function(arg_37_0, arg_37_1)
			if arg_37_1.down and CONDITIONS.ButtonRightTrigger(arg_36_0, arg_37_1) then
				var_0_23(arg_36_0)
			end
		end)
	end
end

local function var_0_25(arg_38_0)
	local var_38_0 = LUI.FlowManager.GetScopedData(arg_38_0)
	local var_38_1 = arg_38_0._luaEventData.crossLaunchButtonData

	if var_38_1 then
		var_38_0._crossLaunchDeepLinkMode = var_38_1.deepLinkMode

		arg_38_0.bindButton:addEventHandler("button_left_stick", var_0_22)
	end
end

local function var_0_26(arg_39_0, arg_39_1)
	if LUI.IsLastInputGamepad(arg_39_0._controllerIndex) and arg_39_0._useStackedCards then
		arg_39_0.TogglePromptText:SetAlpha(1)
	else
		arg_39_0.TogglePromptText:SetAlpha(0)
	end
end

local function var_0_27(arg_40_0)
	local var_40_0 = {
		controllerIndex = arg_40_0._controllerIndex
	}

	LUI.FlowManager.RequestPopupMenu(nil, "SeasonalEventMenuOverlay", true, arg_40_0._controllerIndex, false, var_40_0, nil, false, false)
end

local function var_0_28(arg_41_0)
	local var_41_0 = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	local var_41_1 = var_41_0 and var_41_0.onboardingData or nil
	local var_41_2 = var_41_1 and var_41_1.WasCompleted(arg_41_0, arg_41_0._controllerIndex) or false

	return var_41_1 and var_41_0.hasOverlay and not var_41_2 or false
end

local function var_0_29(arg_42_0)
	if arg_42_0._gridData and #arg_42_0._gridData >= 1 and arg_42_0._gridData[1].gameSource then
		return arg_42_0._gridData[1].gameSource
	else
		return nil
	end
end

local function var_0_30(arg_43_0)
	local var_43_0 = var_0_18(arg_43_0)

	if var_43_0 and #var_43_0 > 0 then
		var_0_17(arg_43_0, var_43_0, var_0_21)
	else
		var_0_21(arg_43_0)
	end
end

local function var_0_31(arg_44_0)
	arg_44_0.Grid:processEvent({
		name = "gain_focus"
	})

	return true
end

local function var_0_32(arg_45_0, arg_45_1)
	if arg_45_1.down and (arg_45_1.button == "up" or arg_45_1.button == "down") then
		local var_45_0 = arg_45_0._flipRowsActionSFX and arg_45_0._flipRowsActionSFX or "ui_select_confirm"

		Engine.BJDBIAGIDA(var_45_0)

		arg_45_0._swapRows = true

		arg_45_0.Grid:RefreshContent()
		arg_45_0:SetBinkBackground()
		var_0_16(arg_45_0, arg_45_0._curGame)
	elseif not arg_45_1.down then
		arg_45_0._swapRows = false
	end
end

local function var_0_33(arg_46_0)
	arg_46_0._currentPopupIndex = 0

	local var_46_0 = {
		{
			menuName = "SeasonalEventMenuOverlayTest",
			condition = function()
				return var_0_28(arg_46_0)
			end,
			doShow = function()
				var_0_27(arg_46_0)
			end
		},
		{
			menuName = "SeasonalIntroGiftPopup",
			condition = function()
				return SEASONAL_EVENT.DisplayGiftPopups() and not SEASONAL_EVENT.IsIntroGiftRecieved(arg_46_0._controllerIndex) and not Engine.DBAEJAHFGJ(arg_46_0._controllerIndex)
			end,
			doShow = function()
				LUI.FlowManager.RequestPopupMenu(arg_46_0, "SeasonalIntroGiftPopup", true, arg_46_0._controllerIndex, false, {
					bypassDuplicateMenuCheck = true
				})
			end
		}
	}

	function arg_46_0.showNextPopup()
		arg_46_0._selectedIndex = 0

		while arg_46_0._currentPopupIndex < #var_46_0 do
			arg_46_0._currentPopupIndex = arg_46_0._currentPopupIndex + 1

			if var_46_0[arg_46_0._currentPopupIndex].condition() then
				arg_46_0._selectedIndex = arg_46_0._currentPopupIndex

				break
			end
		end

		if arg_46_0._selectedIndex > 0 then
			local var_51_0 = var_46_0[arg_46_0._selectedIndex]

			var_51_0.doShow()

			local var_51_1 = Engine.DBFFAEEFGJ().flowManager:GetStackTop(false)

			if var_51_0.menuName and var_51_1 and var_51_1.name == var_51_0.menuName and var_51_1.menu then
				var_51_1.menu:addEventHandler("on_close", function()
					arg_46_0.showNextPopup()
				end)

				return true
			end
		end
	end

	arg_46_0.showNextPopup()
end

local function var_0_34(arg_53_0)
	if not arg_53_0.bindButton then
		arg_53_0.bindButton = LUI.UIBindButton.new()
		arg_53_0.bindButton.id = "BindButton"

		arg_53_0:addElement(arg_53_0.bindButton)
	end
end

local function var_0_35(arg_54_0)
	if arg_54_0._luaEventData.useAllChallengesTab then
		arg_54_0.bindButton:addEventHandler("button_up", function(arg_55_0, arg_55_1)
			if LUI.IsLastInputGamepad(arg_54_0._controllerIndex) and arg_55_1.qualifier == "dpad" or LUI.IsLastInputKeyboardMouse(arg_54_0._controllerIndex) then
				if not arg_54_0.SeasonalEventTitle.SeasonalEventAllChallengesPrompts.promptsEnabled then
					return
				end

				ACTIONS.OpenMenu("SeasonalEventChallengeTabsMenu", true, arg_54_0._controllerIndex)
			end
		end)
	end

	arg_54_0.howToPrompt = arg_54_0._luaEventData.useTugOfWarView and arg_54_0.SeasonalEventTugOfWarView.EventHowToPrompts or arg_54_0.SeasonalEventTitle.SeasonalEventHowToPrompts

	if arg_54_0._luaEventData.useTitleHowTo then
		local function var_54_0(arg_56_0, arg_56_1)
			if not arg_54_0.howToPrompt.promptsEnabled then
				return
			end

			Engine.BJDBIAGIDA(SOUND_SETS.default.selectAlt)

			local var_56_0 = arg_56_1.controller or arg_54_0._controllerIndex

			LUI.FlowManager.RequestPopupMenu(arg_54_0, "SeasonalEventDetailsPopup", true, var_56_0, false, {
				openedFromMenu = true
			})
		end

		arg_54_0.bindButton:addEventHandler("button_alt1", function(arg_57_0, arg_57_1)
			var_54_0(arg_57_0, arg_57_1)
		end)
	end

	if arg_54_0._luaEventData.useAllChallengesTab then
		arg_54_0.SeasonalEventTitle.SeasonalEventAllChallengesPrompts:SetPromptsEnabled(arg_54_0._luaEventData.hasCommunityChallenges or false, arg_54_0._controllerIndex)
	end

	arg_54_0.howToPrompt:SetPromptsEnabled(arg_54_0._luaEventData.useTitleHowTo or false, arg_54_0._controllerIndex)
end

local function var_0_36(arg_58_0)
	var_0_34(arg_58_0)

	if arg_58_0._useHorizontalLootList then
		arg_58_0.Grid:SetNotifyOnLayoutInit(true)
		arg_58_0.Grid:addEventHandler("layout_initialized", function()
			var_0_30(arg_58_0)
		end)
		arg_58_0:addEventHandler("restore_focus", function()
			var_0_31(arg_58_0)
		end)
		GRID.SetUpArrowScrolling(arg_58_0, arg_58_0._controllerIndex, {
			kbmArrowUI = {
				leftArrow = arg_58_0.LeftArrow,
				rightArrow = arg_58_0.RightArrow
			},
			gamePadArrowUI = {
				leftPrompt = arg_58_0.LeftPrompt,
				rightPrompt = arg_58_0.RightPrompt
			}
		})
	elseif arg_58_0._gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.PARTICIPATION_CHALLENGES then
		arg_58_0.SeasonalEventParticipationChallengesContainer.Grid:SetNotifyOnLayoutInit(true)
		arg_58_0.SeasonalEventParticipationChallengesContainer.Grid:addEventHandler("layout_initialized", function()
			var_0_21(arg_58_0)
		end)
	end

	local var_58_0 = arg_58_0._luaEventData.storeBundleButtonData and arg_58_0._luaEventData.storeBundleButtonData.MouseActionHandlerCallback

	if var_58_0 then
		arg_58_0.bindButton:addEventHandler("button_alt1", var_58_0)
	end

	var_0_25(arg_58_0)
	var_0_35(arg_58_0)
	arg_58_0:addEventHandler(LUI.TabManager.TAB_SWITCH_EVENT, function(arg_62_0, arg_62_1)
		Engine.EBCGADABJ()
		SOUNDS.StopAllLoopedSounds({
			immediate = true
		})
	end)

	if arg_58_0._useStackedCards then
		arg_58_0:addEventHandler("gamepad_button", function(arg_63_0, arg_63_1)
			var_0_32(arg_58_0, arg_63_1)
		end)
		arg_58_0:registerAndCallEventHandler("update_input_type", var_0_26)
	end

	if arg_58_0.SeasonalEventParticipationChallengesContainer then
		arg_58_0.MouseScrollCatcher:SetHandleMouse(true)
		arg_58_0.MouseScrollCatcher:OverrideMouseCursorType(MouseCursorType.CURSOR_TYPE_ARROW_NORMAL)
		arg_58_0.MouseScrollCatcher:addEventHandler("gamepad_button", function(arg_64_0, arg_64_1)
			if arg_64_1.qualifier == "mousewheel" then
				if arg_64_1.button == "down" then
					arg_58_0.SeasonalEventParticipationChallengesContainer:SelectNextChallenge()
				elseif arg_64_1.button == "up" then
					arg_58_0.SeasonalEventParticipationChallengesContainer:SelectPreviousChallenge()
				end
			end
		end)
		arg_58_0.bindButton:addEventHandler("button_primary", function(arg_65_0, arg_65_1)
			arg_58_0.SeasonalEventParticipationChallengesContainer.Grid._childInFocus:PreviewItem()
		end)
	end

	var_0_24(arg_58_0)
	arg_58_0.bindButton:addEventHandler("button_secondary", function(arg_66_0, arg_66_1)
		if arg_58_0._luaEventData.binkBackground then
			Engine.EBCGADABJ()
		end
	end)
end

local function var_0_37(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0._controllerIndex = arg_67_1
	arg_67_0._currentGridIndex = 0
	arg_67_0._gridData = nil
	arg_67_0._skipAnimationEnabled = false
	arg_67_0._luaEventData = SEASONAL_EVENT.GetCurrentSeasonalEventData()
	arg_67_0._activeChallengeHoverSFX = arg_67_0._luaEventData.activeChallengeHoverSFX
	arg_67_0._notActiveChallengeHoverSFX = arg_67_0._luaEventData.notActiveChallengeHoverSFX
	arg_67_0._flipRowsActionSFX = arg_67_0._luaEventData.flipRowsActionSFX
	arg_67_0._challengeCardHoverSFX = arg_67_0._luaEventData.challengeCardHoverSound
	arg_67_0._useStackedCards = arg_67_0._luaEventData.gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS
	arg_67_0._gridType = arg_67_0._luaEventData.gridType or SEASONAL_EVENT.LOOT_GRID_TYPE.SCROLLING_LIST
	arg_67_0._useHorizontalLootList = arg_67_0._gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.SCROLLING_LIST or arg_67_0._gridType == SEASONAL_EVENT.LOOT_GRID_TYPE.STACKED_CARDS
	arg_67_0._currentBink = nil
	arg_67_0.UpdateCurrentChildData = var_0_2
	arg_67_0.SetBinkBackground = var_0_13
	arg_67_0.GetFrontDataGameSource = var_0_29
	arg_67_0.UpdateTitleDescAndCrossLaunchPrompt = var_0_1

	local var_67_0 = arg_67_0._luaEventData.storeBundleButtonData

	if arg_67_0.StoreBundlePrompt and var_67_0 and arg_67_0._luaEventData.showStoreBundle and CONDITIONS.IsStoreBundleUpsellActive() then
		local var_67_1 = LUI.FlowManager.GetScopedData(arg_67_0)
		local var_67_2 = STORE.ParseEventTabPromotedBundles()
		local var_67_3 = var_67_2 and next(var_67_2) ~= nil
		local var_67_4

		if var_67_3 then
			for iter_67_0, iter_67_1 in ipairs(var_67_2) do
				local var_67_5 = tonumber(iter_67_1)

				if var_67_5 and not STORE.IsBundleOwned(arg_67_0._controllerIndex, var_67_5) then
					var_67_4 = var_67_5

					break
				end
			end
		end

		if var_67_4 then
			local var_67_6 = StringTable.BJJBBCJGEJ(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_67_4)

			if var_67_6 ~= -1 then
				local var_67_7 = CSV.ReadRow(CSV.bundleIDs, var_67_6)

				if next(var_67_7) ~= nil then
					var_67_1._storeBundleData = {
						displayUpsellPopup = true,
						bundleID = tonumber(var_67_7.id),
						rarity = tonumber(var_67_7.rarity),
						description = var_67_7.description,
						bundleType = var_67_7.bundleType,
						titleImage = var_67_7.titleImage,
						currencyID = tonumber(var_67_7.currencyID),
						currencyAmount = tonumber(var_67_7.currencyAmount)
					}
				end
			end
		end

		if var_67_1._storeBundleData and var_67_4 then
			var_67_0.MouseActionHandlerCallback = var_0_20
		elseif var_67_0.hidePromptWhenCompleted then
			var_67_0.MouseActionHandlerCallback = nil
		else
			var_67_0.MouseActionHandlerCallback = var_0_19
		end

		arg_67_0.StoreBundlePrompt:SetupButton(var_67_0)
		arg_67_0.StoreBundlePrompt:SetAlpha(1)

		local var_67_8 = STORE.ParseEventTabHasSeenPromotedBundles()

		if var_67_8 and next(var_67_8) ~= nil then
			for iter_67_2, iter_67_3 in ipairs(var_67_8) do
				local var_67_9 = tonumber(iter_67_3)
				local var_67_10 = var_67_9 and not STORE.HasSeenItem(arg_67_0._controllerIndex, var_67_9)

				ACTIONS.AnimateSequence(arg_67_0.StoreBundlePrompt, var_67_10 and "ModNewShow" or "ModNewHide")
			end
		end
	elseif arg_67_0.StoreBundlePrompt then
		arg_67_0.StoreBundlePrompt:SetAlpha(0)
	end

	var_0_33(arg_67_0)

	local var_67_11 = SEASONAL_EVENT.GetChallengesData(arg_67_1)

	var_0_10(arg_67_0, var_67_11.miscChallengesData)
	var_0_36(arg_67_0)

	if arg_67_0._luaEventData.hasCommunityChallenges then
		SEASONAL_EVENT.TryUpdatingCommunityChallengesProgress(arg_67_1)

		if arg_67_0._luaEventData.useTugOfWarView then
			arg_67_0.SeasonalEventTugOfWarView:SetupData(arg_67_0._luaEventData, var_67_11)
		else
			local var_67_12 = SEASONAL_EVENT.GetOngoingCommunityChallengeData(var_67_11.commChallengesData)

			arg_67_0.CommunityChallengePanel:SetData(var_67_12)
			arg_67_0.CommunityChallengePanel:SetupPreviewsGrid(var_67_11.commChallengesData)
		end
	end

	if arg_67_0._luaEventData.displaySpanType then
		local var_67_13 = #var_67_11.commChallengesData > 0 and var_67_11.commChallengesData or var_67_11.miscChallengesData
		local var_67_14 = SEASONAL_EVENT.GetChallengesSpansTable(var_67_13)
		local var_67_15 = SEASONAL_EVENT.GetEventCurrentSpan(var_67_14)
		local var_67_16 = arg_67_0._luaEventData.useTugOfWarView and arg_67_0.SeasonalEventTugOfWarView.EventCountdown or arg_67_0.EventTime

		if arg_67_0._luaEventData.displaySpanType == SEASONAL_EVENT.SPAN_DISPLAY_TYPE.WEEKS then
			local var_67_17 = #var_67_14 - 1

			var_67_16:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_WEEK_TIME", var_67_15, var_67_17), 0)
		elseif arg_67_0._luaEventData.displaySpanType == SEASONAL_EVENT.SPAN_DISPLAY_TYPE.COUNTDOWN then
			SEASONAL_EVENT.SetupCountdown(var_67_16, {
				event = "update_seasonal_event_span_timer",
				overrideEndTime = Dvar.CFHDGABACF("test_challenge_end_time") or var_67_14[math.min(var_67_15 + 1, #var_67_14)],
				displaySeconds = arg_67_0.SeasonalEventTugOfWarView and arg_67_0.SeasonalEventTugOfWarView.isLastDay
			})
		end
	end

	if arg_67_0._luaEventData.useSquareProgressPanel then
		arg_67_0.SquareProgressPanel:Setup(var_67_11.miscChallengesData)
	end

	if arg_67_0._luaEventData.id == SEASONAL_EVENT.IDS.LEP then
		arg_67_0.LeftArrow:setGainFocusAllSFX("", {
			clearChildrenSFX = true
		})
		arg_67_0.RightArrow:setGainFocusAllSFX("", {
			clearChildrenSFX = true
		})
		arg_67_0.SquareProgressPanel.BaseWeaponReward:setGainFocusAllSFX("", {
			clearChildrenSFX = true
		})
	end

	if arg_67_0.Map then
		arg_67_0.Map:Setup(arg_67_0._gridData)
	end

	ACTIONS.AnimateSequence(arg_67_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())

	if arg_67_0._luaEventData.eventTabAmbientSoundSets then
		var_0_16(arg_67_0, arg_67_0._curGame)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	ACTIONS.ScaleStretchAnchorFullscreen(arg_67_0.Gradient)

	if not CONDITIONS.SeasonalEventIsLEP() then
		ACTIONS.ScaleFullscreen(arg_67_0.Background)
	end

	local var_67_18 = SEASONAL_EVENT.GetCurrentInitSetupSequenceName()

	if arg_67_0._luaEventData.useTugOfWarView then
		ACTIONS.AnimateSequence(arg_67_0.SeasonalEventTugOfWarView, var_67_18)
	else
		ACTIONS.AnimateSequence(arg_67_0.SeasonalEventTitle, var_67_18)
	end

	if arg_67_0.Challenges then
		ACTIONS.AnimateSequence(arg_67_0.Challenges, var_67_18)
	end

	if arg_67_0._useHorizontalLootList then
		LAYOUT.UpdateWidgetHorizPosToGridFocusedChild(arg_67_0.TogglePromptText, arg_67_0.Grid, arg_67_0.Grid:GetVisibleChildInFocus())
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(arg_67_0, "UpgradingReward") then
		arg_67_0.UpgradingReward.InitializeRewardWidget(arg_67_0.UpgradingReward, 0)
	end

	if arg_67_0._luaEventData.binkBackground then
		arg_67_0:SetBinkBackground()
	end
end

function SeasonalEventMenu(arg_68_0, arg_68_1)
	local var_68_0 = LUI.UIElement.new()

	var_68_0.id = "SeasonalEventMenu"
	var_68_0._animationSets = var_68_0._animationSets or {}
	var_68_0._sequences = var_68_0._sequences or {}

	local var_68_1 = arg_68_1 and arg_68_1.controllerIndex

	if not var_68_1 and not Engine.DDJFBBJAIG() then
		var_68_1 = var_68_0:getRootController()
	end

	assert(var_68_1)

	local var_68_2 = var_68_0
	local var_68_3

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "SafeBacker") then
		var_68_3 = LUI.UIImage.new()
		var_68_3.id = "SafeBacker"

		var_68_3:SetRGBFromInt(0, 0)
		var_68_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		var_68_0:addElement(var_68_3)

		var_68_0.SafeBacker = var_68_3
	end

	local var_68_4
	local var_68_5 = LUI.UIImage.new()

	var_68_5.id = "Background"

	var_68_5:SetRGBFromInt(0, 0)
	var_68_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_68_0:addElement(var_68_5)

	var_68_0.Background = var_68_5

	local var_68_6

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteLeft") then
		var_68_6 = LUI.UIImage.new()
		var_68_6.id = "VignetteLeft"

		var_68_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_68_6:SetAlpha(0, 0)
		var_68_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -248, 0, 0, 0)
		var_68_0:addElement(var_68_6)

		var_68_0.VignetteLeft = var_68_6
	end

	local var_68_7

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteRight") then
		var_68_7 = LUI.UIImage.new()
		var_68_7.id = "VignetteRight"

		var_68_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_68_7:SetAlpha(0, 0)
		var_68_7:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * 248, 0, 0)
		var_68_0:addElement(var_68_7)

		var_68_0.VignetteRight = var_68_7
	end

	local var_68_8
	local var_68_9 = LUI.UIImage.new()

	var_68_9.id = "Gradient"

	var_68_9:SetRGBFromTable(SWATCHES.EventPromos.halloweenOrange, 0)
	var_68_9:SetAlpha(0.15, 0)
	var_68_9:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_68_9:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -276, _1080p * -76)
	var_68_0:addElement(var_68_9)

	var_68_0.Gradient = var_68_9

	local var_68_10
	local var_68_11 = LUI.UIImage.new()

	var_68_11.id = "Darkener"

	var_68_11:SetRGBFromTable(SWATCHES.masterChallenges.darkBackground, 0)
	var_68_11:SetAlpha(0, 0)
	var_68_11:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 80, _1080p * 600, _1080p * 154, _1080p * -72)
	var_68_0:addElement(var_68_11)

	var_68_0.Darkener = var_68_11

	local var_68_12
	local var_68_13 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
		controllerIndex = var_68_1
	})

	var_68_13.id = "MouseScrollCatcher"

	var_68_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_68_0:addElement(var_68_13)

	var_68_0.MouseScrollCatcher = var_68_13

	local var_68_14

	if CONDITIONS.SeasonalEventHasMap() then
		var_68_14 = MenuBuilder.BuildRegisteredType("SeasonalEventMap", {
			controllerIndex = var_68_1
		})
		var_68_14.id = "Map"

		var_68_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -336, _1080p * 864, _1080p * -325, _1080p * 235)
		var_68_0:addElement(var_68_14)

		var_68_0.Map = var_68_14
	end

	local var_68_15

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "ChallengeCompletedImage") then
		local var_68_16 = LUI.UIImage.new()

		var_68_16.id = "ChallengeCompletedImage"

		var_68_16:SetAlpha(0, 0)
		var_68_16:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 747, _1080p * -219, _1080p * 216, _1080p * -228)
		var_68_0:addElement(var_68_16)

		var_68_0.ChallengeCompletedImage = var_68_16
	end

	local var_68_17
	local var_68_18 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_68_1
	})

	var_68_18.id = "Cinematic"

	var_68_18:SetAlpha(0, 0)
	var_68_18:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_68_0:addElement(var_68_18)

	var_68_0.Cinematic = var_68_18

	local var_68_19
	local var_68_20 = LUI.UIImage.new()

	var_68_20.id = "BinkCover"

	var_68_20:SetRGBFromInt(0, 0)
	var_68_20:SetAlpha(0, 0)
	var_68_0:addElement(var_68_20)

	var_68_0.BinkCover = var_68_20

	local var_68_21

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		var_68_21 = MenuBuilder.BuildRegisteredType("SeasonalEventChallenges", {
			controllerIndex = var_68_1
		})
		var_68_21.id = "Challenges"

		var_68_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -336, _1080p * 864, _1080p * -325, _1080p * 235)
		var_68_0:addElement(var_68_21)

		var_68_0.Challenges = var_68_21
	end

	local var_68_22

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_23 = {
			scrollingThresholdX = 1,
			buildArrowsLabel = false,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 1,
			wrapX = true,
			maxVisibleColumns = 9,
			maxVisibleRows = 1,
			wrapY = true,
			arrowsVerticalOffset = 0,
			springCoefficient = 400,
			controllerIndex = var_68_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("SeasonalEventLootItem", {
					controllerIndex = var_68_1
				})
			end,
			refreshChild = function(arg_70_0, arg_70_1, arg_70_2)
				return
			end,
			spacingX = _1080p * 0,
			spacingY = _1080p * 0,
			columnWidth = _1080p * 150,
			rowHeight = _1080p * 250,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Top
		}

		var_68_22 = LUI.UIGrid.new(var_68_23)
		var_68_22.id = "Grid"

		var_68_22:setUseStencil(false)
		var_68_22:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1446, _1080p * -346, _1080p * -96)
		var_68_0:addElement(var_68_22)

		var_68_0.Grid = var_68_22
	end

	local var_68_24

	if CONDITIONS.SeasonalEventHasParticipationChallenges() then
		var_68_24 = MenuBuilder.BuildRegisteredType("SeasonalEventParticipationChallengesContainer", {
			controllerIndex = var_68_1
		})
		var_68_24.id = "SeasonalEventParticipationChallengesContainer"

		var_68_24:SetAlpha(0, 0)
		var_68_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 626, _1080p * 1026)
		var_68_0:addElement(var_68_24)

		var_68_0.SeasonalEventParticipationChallengesContainer = var_68_24
	end

	local var_68_25

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		var_68_25 = MenuBuilder.BuildRegisteredType("HorizontalMinimalScrollbar", {
			controllerIndex = var_68_1
		})
		var_68_25.id = "HorizontalScrollbar"

		var_68_25:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -288, _1080p * 765, _1080p * -108, _1080p * -96)
		var_68_0:addElement(var_68_25)

		var_68_0.HorizontalScrollbar = var_68_25
	end

	local var_68_26

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_27 = {
			iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
			controllerIndex = var_68_1
		}

		var_68_26 = MenuBuilder.BuildRegisteredType("IconImage", var_68_27)
		var_68_26.id = "LeftPrompt"

		var_68_26:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
		var_68_26:SetAlpha(0, 0)
		var_68_26:setImage(RegisterMaterial("button_trigger_left"), 0)
		var_68_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -194, _1080p * -150, _1080p * -250, _1080p * -206)
		var_68_0:addElement(var_68_26)

		var_68_0.LeftPrompt = var_68_26
	end

	local var_68_28

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_29 = {
			iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
			controllerIndex = var_68_1
		}

		var_68_28 = MenuBuilder.BuildRegisteredType("IconImage", var_68_29)
		var_68_28.id = "RightPrompt"

		var_68_28:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
		var_68_28:SetAlpha(0, 0)
		var_68_28:setImage(RegisterMaterial("button_trigger_right"), 0)
		var_68_28:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 820, _1080p * 864, _1080p * -250, _1080p * -206)
		var_68_0:addElement(var_68_28)

		var_68_0.RightPrompt = var_68_28
	end

	local var_68_30

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		var_68_30 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
			controllerIndex = var_68_1
		})
		var_68_30.id = "RightArrow"

		var_68_30:SetAlpha(0, 0)
		var_68_30.Arrow:SetZRotation(271, 0)
		var_68_30:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 765, _1080p * 905, _1080p * -353, _1080p * -103)
		var_68_0:addElement(var_68_30)

		var_68_0.RightArrow = var_68_30
	end

	local var_68_31

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		var_68_31 = MenuBuilder.BuildRegisteredType("GenericArrowButtonLarge", {
			controllerIndex = var_68_1
		})
		var_68_31.id = "LeftArrow"

		var_68_31:SetAlpha(0, 0)
		var_68_31:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -235, _1080p * -95, _1080p * -353, _1080p * -103)
		var_68_0:addElement(var_68_31)

		var_68_0.LeftArrow = var_68_31
	end

	local var_68_32
	local var_68_33 = LUI.UIText.new()

	var_68_33.id = "SkipPrompt"

	var_68_33:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_68_33:SetAlpha(0, 0)
	var_68_33:setText(Engine.CBBHFCGDIC("BATTLEPASS/SKIP_CELEBRATION_PROMPT"), 0)
	var_68_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_68_33:SetWordWrap(false)
	var_68_33:SetAlignment(LUI.Alignment.Left)
	var_68_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_68_33:SetTintFontIcons(true)
	var_68_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -334, _1080p * -22, _1080p * 420, _1080p * 444)
	var_68_0:addElement(var_68_33)

	var_68_0.SkipPrompt = var_68_33

	local var_68_34

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		var_68_34 = MenuBuilder.BuildRegisteredType("SeasonalEventButtonPrompt", {
			controllerIndex = var_68_1
		})
		var_68_34.id = "StoreBundlePrompt"

		var_68_34:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1790, _1080p * -1370, _1080p * 518, _1080p * 708)
		var_68_0:addElement(var_68_34)

		var_68_0.StoreBundlePrompt = var_68_34
	end

	local var_68_35

	if not CONDITIONS.IsCommunityChallengeEvent() then
		var_68_35 = MenuBuilder.BuildRegisteredType("SeasonalEventSquareProgressPanel", {
			controllerIndex = var_68_1
		})
		var_68_35.id = "SquareProgressPanel"

		var_68_35:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1372, _1080p * 1792, _1080p * -361, _1080p * -97)
		var_68_0:addElement(var_68_35)

		var_68_0.SquareProgressPanel = var_68_35
	end

	local var_68_36

	if CONDITIONS.SeasonalEventHasCommunityChallengePanel() then
		var_68_36 = MenuBuilder.BuildRegisteredType("SeasonalEventCommunityChallengePanel", {
			controllerIndex = var_68_1
		})
		var_68_36.id = "CommunityChallengePanel"

		var_68_36:SetAlpha(0, 0)
		var_68_36:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1296, _1080p * -96, _1080p * 215, _1080p * 565)
		var_68_0:addElement(var_68_36)

		var_68_0.CommunityChallengePanel = var_68_36
	end

	local var_68_37

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		var_68_37 = MenuBuilder.BuildRegisteredType("SeasonalEventTitle", {
			controllerIndex = var_68_1
		})
		var_68_37.id = "SeasonalEventTitle"

		var_68_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 110, _1080p * 570, _1080p * 243, _1080p * 643)
		var_68_0:addElement(var_68_37)

		var_68_0.SeasonalEventTitle = var_68_37
	end

	local var_68_38
	local var_68_39 = LUI.UIText.new()

	var_68_39.id = "TogglePromptText"

	var_68_39:SetAlpha(0, 0)
	var_68_39:setText(Engine.CBBHFCGDIC("BATTLEPASS/TOGGLE_ITEM"), 0)
	var_68_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_68_39:SetAlignment(LUI.Alignment.Center)
	var_68_39:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 244, _1080p * -108, _1080p * -80)
	var_68_0:addElement(var_68_39)

	var_68_0.TogglePromptText = var_68_39

	local var_68_40

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
		var_68_40 = MenuBuilder.BuildRegisteredType("UpgradingRewardTracker", {
			controllerIndex = var_68_1
		})
		var_68_40.id = "UpgradingReward"

		var_68_40:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -563, _1080p * -113, _1080p * -522, _1080p * -382)
		var_68_0:addElement(var_68_40)

		var_68_0.UpgradingReward = var_68_40
	end

	local var_68_41

	if CONDITIONS.SeasonalEventDisplaysCurrentSpan() then
		var_68_41 = LUI.UIText.new()
		var_68_41.id = "EventTime"

		var_68_41:SetRGBFromTable(SWATCHES.EventPromos.ArmoredRebirthGray, 0)
		var_68_41:SetAlpha(0, 0)
		var_68_41:setText(Engine.CBBHFCGDIC("SEASONAL_EVENT/EVENT_WEEK_TIME"), 0)
		var_68_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_68_41:SetAlignment(LUI.Alignment.Left)
		var_68_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 936, _1080p * 960)
		var_68_0:addElement(var_68_41)

		var_68_0.EventTime = var_68_41
	end

	local var_68_42

	if CONDITIONS.SeasonalEventUseTugOfWarView() then
		var_68_42 = MenuBuilder.BuildRegisteredType("SeasonalEventTugOfWarView", {
			controllerIndex = var_68_1
		})
		var_68_42.id = "SeasonalEventTugOfWarView"

		var_68_42:SetAlpha(0, 0)
		var_68_42:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		var_68_0:addElement(var_68_42)

		var_68_0.SeasonalEventTugOfWarView = var_68_42
	end

	local function var_68_43()
		return
	end

	var_68_0._sequences.DefaultSequence = var_68_43

	local var_68_44

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_45 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_26:RegisterAnimationSequence("UnlocksActive", var_68_45)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_46 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_28:RegisterAnimationSequence("UnlocksActive", var_68_46)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_47 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_30:RegisterAnimationSequence("UnlocksActive", var_68_47)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_48 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_31:RegisterAnimationSequence("UnlocksActive", var_68_48)
	end

	local var_68_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_33:RegisterAnimationSequence("UnlocksActive", var_68_49)

	local function var_68_50()
		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_26:AnimateSequence("UnlocksActive")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_28:AnimateSequence("UnlocksActive")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("UnlocksActive")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("UnlocksActive")
		end

		var_68_33:AnimateSequence("UnlocksActive")
	end

	var_68_0._sequences.UnlocksActive = var_68_50

	local var_68_51
	local var_68_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_33:RegisterAnimationSequence("UnlocksInactive", var_68_52)

	local function var_68_53()
		var_68_33:AnimateSequence("UnlocksInactive")
	end

	var_68_0._sequences.UnlocksInactive = var_68_53

	local var_68_54
	local var_68_55 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_68_5:RegisterAnimationSequence("AtlantisEvent", var_68_55)

	local var_68_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_68_9:RegisterAnimationSequence("AtlantisEvent", var_68_56)

	local function var_68_57()
		var_68_5:AnimateSequence("AtlantisEvent")
		var_68_9:AnimateSequence("AtlantisEvent")
	end

	var_68_0._sequences.AtlantisEvent = var_68_57

	local var_68_58
	local var_68_59 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_68_5:RegisterAnimationSequence("SetupZombiesEvent", var_68_59)

	local var_68_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -70
		}
	}

	var_68_9:RegisterAnimationSequence("SetupZombiesEvent", var_68_60)

	local function var_68_61()
		var_68_5:AnimateSequence("SetupZombiesEvent")
		var_68_9:AnimateSequence("SetupZombiesEvent")
	end

	var_68_0._sequences.SetupZombiesEvent = var_68_61

	local var_68_62
	local var_68_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_68_5:RegisterAnimationSequence("SetupAdlerEvent", var_68_63)

	if CONDITIONS.SeasonalEventHasMap() then
		local var_68_64 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_14:RegisterAnimationSequence("SetupAdlerEvent", var_68_64)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_65 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_25:RegisterAnimationSequence("SetupAdlerEvent", var_68_65)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_66 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_26:RegisterAnimationSequence("SetupAdlerEvent", var_68_66)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_67 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_28:RegisterAnimationSequence("SetupAdlerEvent", var_68_67)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_68 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 890
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1030
			}
		}

		var_68_30:RegisterAnimationSequence("SetupAdlerEvent", var_68_68)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_69 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1024
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -884
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_31:RegisterAnimationSequence("SetupAdlerEvent", var_68_69)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_70 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 113
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 550
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -366
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -101
			}
		}

		var_68_35:RegisterAnimationSequence("SetupAdlerEvent", var_68_70)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 113
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 573
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 243
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 643
			}
		}

		var_68_37:RegisterAnimationSequence("SetupAdlerEvent", var_68_71)
	end

	local function var_68_72()
		var_68_5:AnimateSequence("SetupAdlerEvent")

		if CONDITIONS.SeasonalEventHasMap() then
			var_68_14:AnimateSequence("SetupAdlerEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_25:AnimateSequence("SetupAdlerEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_26:AnimateSequence("SetupAdlerEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_28:AnimateSequence("SetupAdlerEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("SetupAdlerEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("SetupAdlerEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupAdlerEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupAdlerEvent")
		end
	end

	var_68_0._sequences.SetupAdlerEvent = var_68_72

	local var_68_73
	local var_68_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_68_5:RegisterAnimationSequence("SetupSeasonalEvent", var_68_74)

	local var_68_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_vignette")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_68_9:RegisterAnimationSequence("SetupSeasonalEvent", var_68_75)

	local var_68_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -69
		}
	}

	var_68_11:RegisterAnimationSequence("SetupSeasonalEvent", var_68_76)

	if CONDITIONS.SeasonalEventHasMap() then
		local var_68_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_14:RegisterAnimationSequence("SetupSeasonalEvent", var_68_77)
	end

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_78 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -884
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -123
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 316
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 437
			}
		}

		var_68_21:RegisterAnimationSequence("SetupSeasonalEvent", var_68_78)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_79 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -324
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -74
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 96
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1446
			}
		}

		var_68_22:RegisterAnimationSequence("SetupSeasonalEvent", var_68_79)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_80 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_25:RegisterAnimationSequence("SetupSeasonalEvent", var_68_80)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_81 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_26:RegisterAnimationSequence("SetupSeasonalEvent", var_68_81)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_28:RegisterAnimationSequence("SetupSeasonalEvent", var_68_82)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_83 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 890
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1030
			}
		}

		var_68_30:RegisterAnimationSequence("SetupSeasonalEvent", var_68_83)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_84 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1024
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -884
			}
		}

		var_68_31:RegisterAnimationSequence("SetupSeasonalEvent", var_68_84)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_85 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -585
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 330
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -165
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 520
			}
		}

		var_68_34:RegisterAnimationSequence("SetupSeasonalEvent", var_68_85)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_86 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 1301
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1721
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -334
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -70
			}
		}

		var_68_35:RegisterAnimationSequence("SetupSeasonalEvent", var_68_86)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_87 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 99
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 559
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 282
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 682
			}
		}

		var_68_37:RegisterAnimationSequence("SetupSeasonalEvent", var_68_87)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
		local var_68_88 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_40:RegisterAnimationSequence("SetupSeasonalEvent", var_68_88)
	end

	local function var_68_89()
		var_68_5:AnimateSequence("SetupSeasonalEvent")
		var_68_9:AnimateSequence("SetupSeasonalEvent")
		var_68_11:AnimateSequence("SetupSeasonalEvent")

		if CONDITIONS.SeasonalEventHasMap() then
			var_68_14:AnimateSequence("SetupSeasonalEvent")
		end

		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_25:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_26:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_28:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("SetupSeasonalEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupSeasonalEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupSeasonalEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
			var_68_40:AnimateSequence("SetupSeasonalEvent")
		end
	end

	var_68_0._sequences.SetupSeasonalEvent = var_68_89

	local var_68_90
	local var_68_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_18:RegisterAnimationSequence("SetupNumbersEvent", var_68_91)

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_92 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -954
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -254
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 246
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 306
			},
			{
				value = -0.15,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_68_21:RegisterAnimationSequence("SetupNumbersEvent", var_68_92)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_93 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_26:RegisterAnimationSequence("SetupNumbersEvent", var_68_93)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_94 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_28:RegisterAnimationSequence("SetupNumbersEvent", var_68_94)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_95 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 890
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1030
			}
		}

		var_68_30:RegisterAnimationSequence("SetupNumbersEvent", var_68_95)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_96 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1024
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -884
			}
		}

		var_68_31:RegisterAnimationSequence("SetupNumbersEvent", var_68_96)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_97 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -516
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 299
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -96
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 489
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_34:RegisterAnimationSequence("SetupNumbersEvent", var_68_97)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_98 = {
			{
				value = -0.15,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			}
		}

		var_68_35:RegisterAnimationSequence("SetupNumbersEvent", var_68_98)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_99 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 119
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 579
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 218
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 618
			}
		}

		var_68_37:RegisterAnimationSequence("SetupNumbersEvent", var_68_99)
	end

	local function var_68_100()
		var_68_18:AnimateSequence("SetupNumbersEvent")

		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("SetupNumbersEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_26:AnimateSequence("SetupNumbersEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_28:AnimateSequence("SetupNumbersEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("SetupNumbersEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("SetupNumbersEvent")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("SetupNumbersEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupNumbersEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupNumbersEvent")
		end
	end

	var_68_0._sequences.SetupNumbersEvent = var_68_100

	local var_68_101
	local var_68_102 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_18:RegisterAnimationSequence("BinkTransition", var_68_102)

	local var_68_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_20:RegisterAnimationSequence("BinkTransition", var_68_103)

	local function var_68_104()
		var_68_18:AnimateSequence("BinkTransition")
		var_68_20:AnimateSequence("BinkTransition")
	end

	var_68_0._sequences.BinkTransition = var_68_104

	local var_68_105
	local var_68_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -960
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 960
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("logo_cod_wz_s4_event")
		}
	}

	var_68_5:RegisterAnimationSequence("SetupArmoredEvent", var_68_106)

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteLeft") then
		local var_68_107 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_6:RegisterAnimationSequence("SetupArmoredEvent", var_68_107)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteRight") then
		local var_68_108 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_7:RegisterAnimationSequence("SetupArmoredEvent", var_68_108)
	end

	local var_68_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mm_map_background_plate")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_68_9:RegisterAnimationSequence("SetupArmoredEvent", var_68_109)

	local var_68_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_68_11:RegisterAnimationSequence("SetupArmoredEvent", var_68_110)

	if CONDITIONS.SeasonalEventHasMap() then
		local var_68_111 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_14:RegisterAnimationSequence("SetupArmoredEvent", var_68_111)
	end

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_112 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -864
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -311
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 336
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 249
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_21:RegisterAnimationSequence("SetupArmoredEvent", var_68_112)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_113 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -346
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -96
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 894
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1802
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_22:RegisterAnimationSequence("SetupArmoredEvent", var_68_113)
	end

	if CONDITIONS.SeasonalEventHasParticipationChallenges() then
		local var_68_114 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 624
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 589
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 989
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_24:RegisterAnimationSequence("SetupArmoredEvent", var_68_114)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_115 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_25:RegisterAnimationSequence("SetupArmoredEvent", var_68_115)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_116 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_26:RegisterAnimationSequence("SetupArmoredEvent", var_68_116)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_117 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_28:RegisterAnimationSequence("SetupArmoredEvent", var_68_117)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_118 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 890
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1030
			}
		}

		var_68_30:RegisterAnimationSequence("SetupArmoredEvent", var_68_118)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_119 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1024
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -884
			}
		}

		var_68_31:RegisterAnimationSequence("SetupArmoredEvent", var_68_119)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_120 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 519
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 709
			}
		}

		var_68_34:RegisterAnimationSequence("SetupArmoredEvent", var_68_120)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_121 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1824
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -1312
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -371
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -102
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_35:RegisterAnimationSequence("SetupArmoredEvent", var_68_121)
	end

	if CONDITIONS.SeasonalEventHasCommunityChallengePanel() then
		local var_68_122 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1294
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 236
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -94
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 586
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_36:RegisterAnimationSequence("SetupArmoredEvent", var_68_122)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_123 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 96
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 556
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 233
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 633
			}
		}

		var_68_37:RegisterAnimationSequence("SetupArmoredEvent", var_68_123)
	end

	if CONDITIONS.SeasonalEventDisplaysCurrentSpan() then
		local var_68_124 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Text_Style_Font,
				value = FONTS.MainBold.File
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.EventPromos.ArmoredEvent
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 934
			}
		}

		var_68_41:RegisterAnimationSequence("SetupArmoredEvent", var_68_124)
	end

	local function var_68_125()
		var_68_5:AnimateSequence("SetupArmoredEvent")

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteLeft") then
			var_68_6:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "VignetteRight") then
			var_68_7:AnimateSequence("SetupArmoredEvent")
		end

		var_68_9:AnimateSequence("SetupArmoredEvent")
		var_68_11:AnimateSequence("SetupArmoredEvent")

		if CONDITIONS.SeasonalEventHasMap() then
			var_68_14:AnimateSequence("SetupArmoredEvent")
		end

		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventHasParticipationChallenges() then
			var_68_24:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_25:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_26:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_28:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("SetupArmoredEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventHasCommunityChallengePanel() then
			var_68_36:AnimateSequence("SetupArmoredEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupArmoredEvent")
		end

		if CONDITIONS.SeasonalEventDisplaysCurrentSpan() then
			var_68_41:AnimateSequence("SetupArmoredEvent")
		end
	end

	var_68_0._sequences.SetupArmoredEvent = var_68_125

	local var_68_126

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "SafeBacker") then
		local var_68_127 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_3:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_127)
	end

	local var_68_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_seasonal_event_bg")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_68_5:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_128)

	local var_68_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3SeasonalEventColor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_68_9:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_129)

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_130 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -864
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 336
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -225
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 335
			}
		}

		var_68_21:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_130)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_131 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 924
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1824
			}
		}

		var_68_22:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_131)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_132 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_25:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_132)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_133 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 890
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1030
			}
		}

		var_68_30:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_133)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_134 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -1024
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -884
			}
		}

		var_68_31:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_134)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_135 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -525
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 264
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -105
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 454
			}
		}

		var_68_34:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_135)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_136 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 110
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 530
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -385
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -121
			}
		}

		var_68_35:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_136)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_137 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 217
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 617
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 125
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 585
			}
		}

		var_68_37:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_137)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
		local var_68_138 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -540
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -400
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -555
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -105
			}
		}

		var_68_40:RegisterAnimationSequence("SetupFestiveFervorEvent", var_68_138)
	end

	local function var_68_139()
		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "SafeBacker") then
			var_68_3:AnimateSequence("SetupFestiveFervorEvent")
		end

		var_68_5:AnimateSequence("SetupFestiveFervorEvent")
		var_68_9:AnimateSequence("SetupFestiveFervorEvent")

		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_25:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_30:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_31:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("SetupFestiveFervorEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupFestiveFervorEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupFestiveFervorEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
			var_68_40:AnimateSequence("SetupFestiveFervorEvent")
		end
	end

	var_68_0._sequences.SetupFestiveFervorEvent = var_68_139

	local var_68_140

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_141 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_21:RegisterAnimationSequence("HideSeasonalEventUI", var_68_141)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_142 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_22:RegisterAnimationSequence("HideSeasonalEventUI", var_68_142)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_143 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_34:RegisterAnimationSequence("HideSeasonalEventUI", var_68_143)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_144 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_35:RegisterAnimationSequence("HideSeasonalEventUI", var_68_144)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_145 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_37:RegisterAnimationSequence("HideSeasonalEventUI", var_68_145)
	end

	local function var_68_146()
		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("HideSeasonalEventUI")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("HideSeasonalEventUI")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("HideSeasonalEventUI")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("HideSeasonalEventUI")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("HideSeasonalEventUI")
		end
	end

	var_68_0._sequences.HideSeasonalEventUI = var_68_146

	local var_68_147

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_148 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_21:RegisterAnimationSequence("ShowSeasonalEventUI", var_68_148)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_149 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_22:RegisterAnimationSequence("ShowSeasonalEventUI", var_68_149)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_150 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_34:RegisterAnimationSequence("ShowSeasonalEventUI", var_68_150)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_151 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_35:RegisterAnimationSequence("ShowSeasonalEventUI", var_68_151)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_152 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 300,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 96
			},
			{
				duration = 300,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 556
			}
		}

		var_68_37:RegisterAnimationSequence("ShowSeasonalEventUI", var_68_152)
	end

	local function var_68_153()
		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("ShowSeasonalEventUI")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("ShowSeasonalEventUI")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("ShowSeasonalEventUI")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("ShowSeasonalEventUI")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("ShowSeasonalEventUI")
		end
	end

	var_68_0._sequences.ShowSeasonalEventUI = var_68_153

	local var_68_154

	if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
		local var_68_155 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_21:RegisterAnimationSequence("SetupHvVEvent", var_68_155)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_156 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_22:RegisterAnimationSequence("SetupHvVEvent", var_68_156)
	end

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_157 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_25:RegisterAnimationSequence("SetupHvVEvent", var_68_157)
	end

	if CONDITIONS.SeasonalEventShowsStoreBundle() then
		local var_68_158 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_34:RegisterAnimationSequence("SetupHvVEvent", var_68_158)
	end

	if not CONDITIONS.IsCommunityChallengeEvent() then
		local var_68_159 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_35:RegisterAnimationSequence("SetupHvVEvent", var_68_159)
	end

	if not CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_160 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_37:RegisterAnimationSequence("SetupHvVEvent", var_68_160)
	end

	if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
		local var_68_161 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_40:RegisterAnimationSequence("SetupHvVEvent", var_68_161)
	end

	if CONDITIONS.SeasonalEventUseTugOfWarView() then
		local var_68_162 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_68_42:RegisterAnimationSequence("SetupHvVEvent", var_68_162)
	end

	local function var_68_163()
		if not CONDITIONS.SeasonalEventHasMapOrCommunityChallenge() then
			var_68_21:AnimateSequence("SetupHvVEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_22:AnimateSequence("SetupHvVEvent")
		end

		if CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
			var_68_25:AnimateSequence("SetupHvVEvent")
		end

		if CONDITIONS.SeasonalEventShowsStoreBundle() then
			var_68_34:AnimateSequence("SetupHvVEvent")
		end

		if not CONDITIONS.IsCommunityChallengeEvent() then
			var_68_35:AnimateSequence("SetupHvVEvent")
		end

		if not CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_37:AnimateSequence("SetupHvVEvent")
		end

		if CONDITIONS.SeasonalEventIsWidgetIncludedInEvent(var_68_0, "UpgradingReward") then
			var_68_40:AnimateSequence("SetupHvVEvent")
		end

		if CONDITIONS.SeasonalEventUseTugOfWarView() then
			var_68_42:AnimateSequence("SetupHvVEvent")
		end
	end

	var_68_0._sequences.SetupHvVEvent = var_68_163

	if CONDITIONS.SeasonalEventUseHorizontalLootGrid() and CONDITIONS.SeasonalEventUseHorizontalLootGrid() then
		local var_68_164 = LUI.UIScrollbar.new({
			direction = LUI.DIRECTION.horizontal,
			eventListener = var_68_25,
			startCap = var_68_25.startCap,
			endCap = var_68_25.endCap,
			sliderArea = var_68_25.sliderArea,
			slider = var_68_25.sliderArea and var_68_25.sliderArea.slider,
			fixedSizeSlider = var_68_25.sliderArea and var_68_25.sliderArea.fixedSizeSlider
		})

		var_68_22:AddScrollbar(var_68_164)
	end

	var_0_37(var_68_0, var_68_1, arg_68_1)

	return var_68_0
end

MenuBuilder.registerType("SeasonalEventMenu", SeasonalEventMenu)
LockTable(_M)
