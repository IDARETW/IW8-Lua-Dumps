module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_1 then
		assert(false, "Seasonal event loot item requires loot data to setup")

		return
	end

	arg_1_0.LootItemCardMiniDouble.FrontLootItemCard:UpdateCardConfig(arg_1_1)

	arg_1_0._lootCards[1]._lootData = arg_1_1

	if arg_1_2 then
		arg_1_0.LootItemCardMiniDouble.BackLootItemCard:UpdateCardConfig(arg_1_2)

		if not arg_1_0._backCardShown then
			ACTIONS.AnimateSequence(arg_1_0.LootItemCardMiniDouble, "ShowBackCard")

			arg_1_0._backCardShown = true
		end

		arg_1_0._lootCards[2]._lootData = arg_1_2
	else
		ACTIONS.AnimateSequence(arg_1_0.LootItemCardMiniDouble, "HideBackCard")
	end

	if arg_1_1.disabled == true then
		arg_1_0.disabled = true

		arg_1_0:SetButtonDisabled(true)
	else
		arg_1_0.disabled = false

		arg_1_0:SetButtonDisabled(false)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._lootCards[1]._isChallengeComplete = arg_2_1
	arg_2_0._lootCards[2]._isChallengeComplete = arg_2_2

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._lootCards) do
		if iter_2_1._isChallengeComplete == true then
			ACTIONS.AnimateSequence(iter_2_1, "ShowCheckboxCompletePurchased")
		elseif iter_2_1._isChallengeComplete == false then
			ACTIONS.AnimateSequence(iter_2_1, "ShowLock")
		else
			ACTIONS.AnimateSequence(iter_2_1, "HideCheckbox")
			ACTIONS.AnimateSequence(iter_2_1, "HideLock")
		end
	end
end

local function var_0_2(arg_3_0)
	local var_3_0 = arg_3_0._lootCards[arg_3_0._curCardIndex]
	local var_3_1 = var_3_0 and var_3_0._lootData

	if not var_3_1 then
		assert(false, "active loot data is nil, loot data is required to flare rarity")

		return
	end

	if LOOT.IsItemIDEquippableByS4(var_3_1.ID) then
		arg_3_0.BattlePassFlare:PlayVanguardFlare()
	else
		local var_3_2 = var_3_1.rarity

		arg_3_0.BattlePassFlare:PlayRarityFlare(var_3_2)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0 and arg_4_0._lastState ~= arg_4_1 then
		arg_4_0._lastState = arg_4_1

		if arg_4_2 == true then
			assert(arg_4_0._sequences and arg_4_0._sequences[arg_4_1 .. "Snap"])
			ACTIONS.AnimateSequence(arg_4_0, arg_4_1 .. "Snap")
		else
			ACTIONS.AnimateSequence(arg_4_0, arg_4_1)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	ACTIONS.AnimateSequence(arg_5_0, arg_5_1 and "ButtonOverSnap" or "ButtonOver")
end

local function var_0_5(arg_6_0, arg_6_1)
	ACTIONS.AnimateSequence(arg_6_0, arg_6_1 and "ButtonUpSnap" or "ButtonUp")
end

local function var_0_6(arg_7_0)
	ACTIONS.AnimateSequence(arg_7_0, "CycleLootCards")

	local var_7_0 = arg_7_0._curCardIndex

	if arg_7_0._curCardIndex > arg_7_0._cardIndex1 then
		arg_7_0._curCardIndex = arg_7_0._cardIndex1

		arg_7_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToFrontCard")
	else
		arg_7_0._curCardIndex = arg_7_0._cardIndex2

		arg_7_0.LootItemCardMiniDouble:PlaySwapAnimation("SwitchToBackCard")
	end
end

local function var_0_7(arg_8_0)
	arg_8_0:addEventHandler("gain_focus", function(arg_9_0, arg_9_1)
		if arg_8_0.disabled == true then
			return
		end

		var_0_4(arg_9_0, false)
	end)
	arg_8_0:addEventHandler("lose_focus", function(arg_10_0, arg_10_1)
		if arg_8_0.disabled == true then
			return
		end

		var_0_5(arg_10_0, false)
	end)
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._controllerIndex = arg_11_1
	arg_11_0._cardIndex1 = 1
	arg_11_0._cardIndex2 = 2
	arg_11_0._curCardIndex = arg_11_0._cardIndex1
	arg_11_0._lootCards = {
		arg_11_0.LootItemCardMiniDouble.FrontLootItemCard,
		arg_11_0.LootItemCardMiniDouble.BackLootItemCard
	}
	arg_11_0.FlareRarity = var_0_2
	arg_11_0.SetComplete = var_0_1
	arg_11_0.SetupLootData = var_0_0
	arg_11_0.CycleLootCards = var_0_6
	arg_11_0.Expand = var_0_4
	arg_11_0.Contract = var_0_5
	arg_11_0.SetupEventHandlers = var_0_7
	arg_11_0._isExpanded = false

	arg_11_0:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_0._lootCards[arg_11_0._curCardIndex]
		local var_12_1 = var_12_0 and var_12_0._lootData

		if var_12_1 and arg_11_0._curCardIndex == arg_11_0.LootItemCardMiniDouble._cardIdInFront and LOOT.CanPreview(var_12_1.type, var_12_1.ID) then
			STORE.PreviewItem(arg_11_1, var_12_1.type, var_12_1.ID)
		end
	end)
	arg_11_0:SetGridChildDynamicSize(true, LUI.DIRECTION.horizontal)
	arg_11_0:setGainFocusAllSFX(SOUND_SETS.battlePass.bpCardHighlight, {
		clearChildrenSFX = true
	})
	ACTIONS.AnimateSequence(arg_11_0, SEASONAL_EVENT.GetCurrentInitSetupSequenceName())
end

function SeasonalEventLootItem(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 250 * _1080p)

	var_13_0.id = "SeasonalEventLootItem"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("LootItemCardMiniDouble", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "LootItemCardMiniDouble"

	var_13_4:SetScale(-0.1, 0)
	var_13_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -75, _1080p * 75, _1080p * -214, _1080p * -14)
	var_13_0:addElement(var_13_4)

	var_13_0.LootItemCardMiniDouble = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("BattlePassFlare", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "BattlePassFlare"

	var_13_6:SetScale(-0.25, 0)
	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -169, _1080p * 24)
	var_13_0:addElement(var_13_6)

	var_13_0.BattlePassFlare = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "Progress"

	var_13_8.Overlay:SetRGBFromTable(SWATCHES.CH2.TabMenuNoFocus, 0)
	var_13_8.Overlay:SetAlpha(0.8, 0)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -60, _1080p * 60, _1080p * -72, _1080p * -65)
	var_13_0:addElement(var_13_8)

	var_13_0.Progress = var_13_8

	local function var_13_9()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_9

	local var_13_10
	local var_13_11 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -224
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOver", var_13_11)

	local var_13_12 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOver", var_13_12)

	local var_13_13 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 68
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -83
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -76
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -68
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOver", var_13_13)

	local function var_13_14()
		var_13_4:AnimateSequence("ButtonOver")
		var_13_6:AnimateSequence("ButtonOver")
		var_13_8:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_14

	local var_13_15
	local var_13_16 = {
		{
			value = -0.1,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -214
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -14
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonUp", var_13_16)

	local var_13_17 = {
		{
			value = -0.26,
			duration = 150,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -168
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_17)

	local var_13_18 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -74
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -67
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUp", var_13_18)

	local function var_13_19()
		var_13_4:AnimateSequence("ButtonUp")
		var_13_6:AnimateSequence("ButtonUp")
		var_13_8:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_19

	local var_13_20
	local var_13_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -224
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonOverSnap", var_13_21)

	local var_13_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -173
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverSnap", var_13_22)

	local var_13_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -76
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonOverSnap", var_13_23)

	local function var_13_24()
		var_13_4:AnimateSequence("ButtonOverSnap")
		var_13_6:AnimateSequence("ButtonOverSnap")
		var_13_8:AnimateSequence("ButtonOverSnap")
	end

	var_13_0._sequences.ButtonOverSnap = var_13_24

	local var_13_25
	local var_13_26 = {
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -14
		}
	}

	var_13_4:RegisterAnimationSequence("ButtonUpSnap", var_13_26)

	local var_13_27 = {
		{
			value = -0.26,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpSnap", var_13_27)

	local var_13_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -67
		}
	}

	var_13_8:RegisterAnimationSequence("ButtonUpSnap", var_13_28)

	local function var_13_29()
		var_13_4:AnimateSequence("ButtonUpSnap")
		var_13_6:AnimateSequence("ButtonUpSnap")
		var_13_8:AnimateSequence("ButtonUpSnap")
	end

	var_13_0._sequences.ButtonUpSnap = var_13_29

	local var_13_30
	local var_13_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar,
			child = var_13_0.Progress.Fill
		}
	}

	var_13_8:RegisterAnimationSequence("ModCW", var_13_31)

	local function var_13_32()
		var_13_8:AnimateSequence("ModCW")
	end

	var_13_0._sequences.ModCW = var_13_32

	local var_13_33
	local var_13_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare,
			child = var_13_0.Progress.Fill
		}
	}

	var_13_8:RegisterAnimationSequence("ModWZ", var_13_34)

	local function var_13_35()
		var_13_8:AnimateSequence("ModWZ")
	end

	var_13_0._sequences.ModWZ = var_13_35

	local var_13_36
	local var_13_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_8:RegisterAnimationSequence("Complete", var_13_37)

	local function var_13_38()
		var_13_8:AnimateSequence("Complete")
	end

	var_13_0._sequences.Complete = var_13_38

	local var_13_39
	local var_13_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.EventPromos.AtlantisYellow,
			child = var_13_0.Progress.Fill
		}
	}

	var_13_8:RegisterAnimationSequence("ModVA", var_13_40)

	local function var_13_41()
		var_13_8:AnimateSequence("ModVA")
	end

	var_13_0._sequences.ModVA = var_13_41

	local var_13_42
	local var_13_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0,
			duration = 70,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -60,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 60,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_13_8:RegisterAnimationSequence("CycleLootCards", var_13_43)

	local function var_13_44()
		var_13_8:AnimateSequence("CycleLootCards")
	end

	var_13_0._sequences.CycleLootCards = var_13_44

	var_0_8(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("SeasonalEventLootItem", SeasonalEventLootItem)
LockTable(_M)
