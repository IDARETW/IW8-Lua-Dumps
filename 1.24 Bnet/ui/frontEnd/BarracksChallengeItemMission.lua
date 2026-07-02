module(..., package.seeall)

local function var_0_0(arg_1_0)
	if IsLanguageArabic() then
		local var_1_0 = -7
		local var_1_1 = 7

		arg_1_0.Title:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 62, _1080p * -133, _1080p * (20 + var_1_0), _1080p * (44 + var_1_1))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.CheckBox:SetValue(arg_2_2, true)
	ACTIONS.AnimateSequence(arg_2_0, arg_2_1 and "SetActive" or "SetInactive")
end

local function var_0_2(arg_3_0)
	if arg_3_0.currentObjectiveReward then
		STORE.PreviewItem(arg_3_0.controllerIndex, arg_3_0.currentObjectiveReward.type, arg_3_0.currentObjectiveReward.itemID)
		Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = arg_4_2.isBattlePassLocked or not arg_4_2.unlocked

	if arg_4_2.isIntel then
		var_4_0 = not arg_4_2.isIntelUnlocked
	end

	if arg_4_2.name and #arg_4_2.name > 0 then
		arg_4_0.Title:setText(Engine.CBBHFCGDIC(arg_4_2.name))
	else
		arg_4_0.Title:setText("")
	end

	var_0_1(arg_4_0, arg_4_2.isActive, arg_4_2.complete)

	if arg_4_2.objectives and arg_4_2.numObjectivesComplete then
		local var_4_1 = #arg_4_2.objectives
		local var_4_2 = math.min(arg_4_2.numObjectivesComplete + 1, var_4_1)
		local var_4_3 = arg_4_2.objectives[var_4_2].rewards

		arg_4_0.currentObjectiveReward = var_4_3[Challenge.Reward.LOOT] or var_4_3[Challenge.Reward.XP]

		arg_4_0.Pips:SetActive(arg_4_2.isActive)
		arg_4_0.Pips:Setup(#arg_4_2.objectives, arg_4_2.numObjectivesComplete, LUI.Alignment.Left, var_4_0)
	else
		arg_4_0.Pips:SetAlpha(0)
	end

	if not arg_4_1._menuHandlesChallengePress and not arg_4_2.isBattlePassLocked then
		arg_4_0:registerEventHandler("button_action", function(arg_5_0, arg_5_1)
			if arg_5_0._challenge.complete and not arg_4_0._isActive or arg_5_0._challenge.isBattlePassLocked or not arg_5_0._challenge.unlocked then
				return
			end

			if arg_5_0._menu and not arg_4_0._isActive then
				arg_5_0._menu:processEvent({
					name = "challenges_mission_activation",
					index = arg_5_0._index
				})
			end
		end)
	end

	arg_4_0:SetButtonDisabled(var_4_0)
	arg_4_0:CustomLoseFocus()

	if arg_4_2.rewards and #arg_4_2.rewards > 0 then
		local var_4_4 = arg_4_2.rewards[Challenge.Reward.LOOT] or arg_4_2.rewards[Challenge.Reward.XP]

		arg_4_0.MissionRewardCard:SetMiniMode(true)
		arg_4_0.MissionRewardCard:UpdateCardConfig(var_4_4)

		if arg_4_2.rewards[Challenge.Reward.LOOT] then
			local var_4_5 = ToUpperCase(Engine.CBBHFCGDIC(arg_4_2.name))

			arg_4_0:SetupContextualMenu({
				title = var_4_5
			})

			local var_4_6 = {
				id = "ItemMissionContextualSeeReward",
				actionName = Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_NEXT_LOOT_ITEM"),
				actionFunction = function(arg_6_0)
					var_0_2(arg_4_0)
				end
			}

			arg_4_0:AddContextualMenuAction(var_4_6)
		end
	else
		arg_4_0.MissionRewardCard:SetAlpha(0)
	end

	arg_4_0._challenge = arg_4_2
	arg_4_0._isActive = arg_4_2.isActive
	arg_4_0._menu = arg_4_1
	arg_4_0._index = arg_4_3
end

local function var_0_4(arg_7_0)
	arg_7_0:setFocus(false)

	if arg_7_0.disabled then
		if arg_7_0.isActive then
			arg_7_0:processEvent({
				snap = true,
				name = "button_disable_active"
			})
		else
			arg_7_0:processEvent({
				snap = true,
				name = "button_disable"
			})
		end
	elseif arg_7_0.isActive then
		arg_7_0:processEvent({
			snap = true,
			name = "button_active"
		})
	else
		arg_7_0:processEvent({
			snap = true,
			name = "button_up"
		})
	end
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.keepFocus = true
end

local function var_0_6(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.Setup = var_0_3
	arg_9_0.controllerIndex = arg_9_1
	arg_9_0._isActive = false
	arg_9_0.CustomLoseFocus = var_0_4

	function arg_9_0.MouseLeave(arg_10_0, arg_10_1)
		return
	end

	function arg_9_0.LoseFocus(arg_11_0, arg_11_1)
		return
	end

	arg_9_0:addEventHandler("gain_focus", function(arg_12_0, arg_12_1)
		arg_9_0:getParent():processEvent({
			name = "new_mission_focused",
			newFocusedElement = arg_12_0
		})
	end)
	arg_9_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if arg_13_0._menu then
			arg_13_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_13_0._index
			})
		end

		arg_13_0._isOver = true

		ACTIONS.AnimateSequence(arg_13_0, "ButtonOverCheckbox")
	end)
	arg_9_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		arg_14_0._isOver = false

		ACTIONS.AnimateSequence(arg_14_0, "ButtonUpCheckbox")
	end)
	arg_9_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if arg_15_0._menu then
			arg_15_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_15_0._index
			})
		end
	end)
	var_0_0(arg_9_0)
end

function BarracksChallengeItemMission(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 128 * _1080p)

	var_16_0.id = "BarracksChallengeItemMission"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)
	var_0_5(var_16_0, var_16_1, arg_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "Background"

	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.Background = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "CheckBox"

	var_16_6:SetAlpha(0.5, 0)
	var_16_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_16_0:addElement(var_16_6)

	var_16_0.CheckBox = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "Title"

	var_16_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_16_8:setText("Mission Name", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_8:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 62, _1080p * -133, _1080p * 20, _1080p * 44)
	var_16_0:addElement(var_16_8)

	var_16_0.Title = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIImage.new()

	var_16_10.id = "Equip"

	var_16_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_16_10:SetAlpha(0, 0)
	var_16_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 571, _1080p * 591, _1080p * 10, _1080p * 30)
	var_16_0:addElement(var_16_10)

	var_16_0.Equip = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "MissionRewardCard"

	var_16_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 179, _1080p * 261, _1080p * 9, _1080p * 119)
	var_16_0:addElement(var_16_12)

	var_16_0.MissionRewardCard = var_16_12

	local var_16_13
	local var_16_14 = LUI.UIImage.new()

	var_16_14.id = "LockIcon"

	var_16_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_16_14:SetAlpha(0, 0)
	var_16_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_16_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 48, _1080p * 17, _1080p * 47)
	var_16_0:addElement(var_16_14)

	var_16_0.LockIcon = var_16_14

	local var_16_15
	local var_16_16 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_16_1
	})

	var_16_16.id = "Pips"

	var_16_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 81, _1080p * 56, _1080p * 60)
	var_16_0:addElement(var_16_16)

	var_16_0.Pips = var_16_16

	local function var_16_17()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_17

	local var_16_18 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("SetActive", var_16_18)

	local function var_16_19()
		var_16_10:AnimateSequence("SetActive")
	end

	var_16_0._sequences.SetActive = var_16_19

	local var_16_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("SetInactive", var_16_20)

	local function var_16_21()
		var_16_10:AnimateSequence("SetInactive")
	end

	var_16_0._sequences.SetInactive = var_16_21

	local var_16_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_22)

	local var_16_23 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOver", var_16_23)

	local var_16_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOver", var_16_24)

	local function var_16_25()
		var_16_8:AnimateSequence("ButtonOver")
		var_16_12:AnimateSequence("ButtonOver")
		var_16_14:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_25

	local var_16_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_26)

	local var_16_27 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUp", var_16_27)

	local var_16_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonUp", var_16_28)

	local function var_16_29()
		var_16_8:AnimateSequence("ButtonUp")
		var_16_12:AnimateSequence("ButtonUp")
		var_16_14:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_29

	local var_16_30 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverCheckbox", var_16_30)

	local function var_16_31()
		var_16_6:AnimateSequence("ButtonOverCheckbox")
	end

	var_16_0._sequences.ButtonOverCheckbox = var_16_31

	local var_16_32 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpCheckbox", var_16_32)

	local function var_16_33()
		var_16_6:AnimateSequence("ButtonUpCheckbox")
	end

	var_16_0._sequences.ButtonUpCheckbox = var_16_33

	local var_16_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabled", var_16_34)

	local var_16_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabled", var_16_35)

	local var_16_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonUpDisabled", var_16_36)

	local var_16_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonUpDisabled", var_16_37)

	local function var_16_38()
		var_16_6:AnimateSequence("ButtonUpDisabled")
		var_16_8:AnimateSequence("ButtonUpDisabled")
		var_16_12:AnimateSequence("ButtonUpDisabled")
		var_16_14:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_38

	local var_16_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverDisabled", var_16_39)

	local var_16_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOverDisabled", var_16_40)

	local var_16_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_12:RegisterAnimationSequence("ButtonOverDisabled", var_16_41)

	local var_16_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOverDisabled", var_16_42)

	local function var_16_43()
		var_16_6:AnimateSequence("ButtonOverDisabled")
		var_16_8:AnimateSequence("ButtonOverDisabled")
		var_16_12:AnimateSequence("ButtonOverDisabled")
		var_16_14:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_43

	var_16_0:addEventHandler("button_over", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonOver")
	end)
	var_16_0:addEventHandler("button_up", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonUp")
	end)
	var_16_0:addEventHandler("disable", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonUpDisabled")
	end)
	var_16_0:addEventHandler("button_over_disable", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonOverDisabled")
	end)
	var_16_0:addEventHandler("button_disable", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_16_1
		end

		ACTIONS.AnimateSequence(var_16_0, "ButtonUpDisabled")
	end)
	var_0_6(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("BarracksChallengeItemMission", BarracksChallengeItemMission)
LockTable(_M)
