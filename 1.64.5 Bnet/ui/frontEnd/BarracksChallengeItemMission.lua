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
		WZWIP.AnimateThemeElement(arg_13_0, "ButtonOver")
	end)
	arg_9_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		arg_14_0._isOver = false

		ACTIONS.AnimateSequence(arg_14_0, "ButtonUpCheckbox")
		WZWIP.AnimateThemeElement(arg_14_0, "ButtonUp")
	end)
	arg_9_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if arg_15_0._menu then
			arg_15_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_15_0._index
			})
		end

		WZWIP.AnimateThemeElement(arg_15_0, "ButtonOverDisabled")
	end)
	arg_9_0:addEventHandler("button_disable", function(arg_16_0, arg_16_1)
		WZWIP.AnimateThemeElement(arg_16_0, "ButtonUpDisabled")
	end)
	var_0_0(arg_9_0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_9_0, "WZWipSetup")
	end
end

function BarracksChallengeItemMission(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIButton.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 128 * _1080p)

	var_17_0.id = "BarracksChallengeItemMission"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)
	var_0_5(var_17_0, var_17_1, arg_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "Background"

	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.Background = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "CheckBox"

	var_17_6:SetAlpha(0.5, 0)
	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 51, _1080p * 14, _1080p * 50)
	var_17_0:addElement(var_17_6)

	var_17_0.CheckBox = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIStyledText.new()

	var_17_8.id = "Title"

	var_17_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_17_8:setText("Mission Name", 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_8:SetAlignment(LUI.Alignment.Left)
	var_17_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 62, _1080p * -133, _1080p * 20, _1080p * 44)
	var_17_0:addElement(var_17_8)

	var_17_0.Title = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIImage.new()

	var_17_10.id = "Equip"

	var_17_10:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_17_10:SetAlpha(0, 0)
	var_17_10:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 571, _1080p * 591, _1080p * 10, _1080p * 30)
	var_17_0:addElement(var_17_10)

	var_17_0.Equip = var_17_10

	local var_17_11
	local var_17_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_17_1
	})

	var_17_12.id = "MissionRewardCard"

	var_17_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 179, _1080p * 261, _1080p * 9, _1080p * 119)
	var_17_0:addElement(var_17_12)

	var_17_0.MissionRewardCard = var_17_12

	local var_17_13
	local var_17_14 = LUI.UIImage.new()

	var_17_14.id = "LockIcon"

	var_17_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_17_14:SetAlpha(0, 0)
	var_17_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_17_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 48, _1080p * 17, _1080p * 47)
	var_17_0:addElement(var_17_14)

	var_17_0.LockIcon = var_17_14

	local var_17_15
	local var_17_16 = MenuBuilder.BuildRegisteredType("BarracksChallengeMissionDetailsPips", {
		controllerIndex = var_17_1
	})

	var_17_16.id = "Pips"

	var_17_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 81, _1080p * 56, _1080p * 60)
	var_17_0:addElement(var_17_16)

	var_17_0.Pips = var_17_16

	local function var_17_17()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_17

	local var_17_18
	local var_17_19 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("SetActive", var_17_19)

	local function var_17_20()
		var_17_10:AnimateSequence("SetActive")
	end

	var_17_0._sequences.SetActive = var_17_20

	local var_17_21
	local var_17_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("SetInactive", var_17_22)

	local function var_17_23()
		var_17_10:AnimateSequence("SetInactive")
	end

	var_17_0._sequences.SetInactive = var_17_23

	local var_17_24
	local var_17_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_17_8:RegisterAnimationSequence("ButtonOver", var_17_25)

	local var_17_26 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonOver", var_17_26)

	local var_17_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonOver", var_17_27)

	local function var_17_28()
		var_17_8:AnimateSequence("ButtonOver")
		var_17_12:AnimateSequence("ButtonOver")
		var_17_14:AnimateSequence("ButtonOver")
	end

	var_17_0._sequences.ButtonOver = var_17_28

	local var_17_29
	local var_17_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_17_8:RegisterAnimationSequence("ButtonUp", var_17_30)

	local var_17_31 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_12:RegisterAnimationSequence("ButtonUp", var_17_31)

	local var_17_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonUp", var_17_32)

	local function var_17_33()
		var_17_8:AnimateSequence("ButtonUp")
		var_17_12:AnimateSequence("ButtonUp")
		var_17_14:AnimateSequence("ButtonUp")
	end

	var_17_0._sequences.ButtonUp = var_17_33

	local var_17_34
	local var_17_35 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("ButtonOverCheckbox", var_17_35)

	local function var_17_36()
		var_17_6:AnimateSequence("ButtonOverCheckbox")
	end

	var_17_0._sequences.ButtonOverCheckbox = var_17_36

	local var_17_37
	local var_17_38 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("ButtonUpCheckbox", var_17_38)

	local function var_17_39()
		var_17_6:AnimateSequence("ButtonUpCheckbox")
	end

	var_17_0._sequences.ButtonUpCheckbox = var_17_39

	local var_17_40
	local var_17_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("ButtonUpDisabled", var_17_41)

	local var_17_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_17_8:RegisterAnimationSequence("ButtonUpDisabled", var_17_42)

	local var_17_43 = {
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

	var_17_12:RegisterAnimationSequence("ButtonUpDisabled", var_17_43)

	local var_17_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonUpDisabled", var_17_44)

	local function var_17_45()
		var_17_6:AnimateSequence("ButtonUpDisabled")
		var_17_8:AnimateSequence("ButtonUpDisabled")
		var_17_12:AnimateSequence("ButtonUpDisabled")
		var_17_14:AnimateSequence("ButtonUpDisabled")
	end

	var_17_0._sequences.ButtonUpDisabled = var_17_45

	local var_17_46
	local var_17_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("ButtonOverDisabled", var_17_47)

	local var_17_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_17_8:RegisterAnimationSequence("ButtonOverDisabled", var_17_48)

	local var_17_49 = {
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

	var_17_12:RegisterAnimationSequence("ButtonOverDisabled", var_17_49)

	local var_17_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("ButtonOverDisabled", var_17_50)

	local function var_17_51()
		var_17_6:AnimateSequence("ButtonOverDisabled")
		var_17_8:AnimateSequence("ButtonOverDisabled")
		var_17_12:AnimateSequence("ButtonOverDisabled")
		var_17_14:AnimateSequence("ButtonOverDisabled")
	end

	var_17_0._sequences.ButtonOverDisabled = var_17_51

	local var_17_52
	local var_17_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("WZWipSetup", var_17_53)

	local function var_17_54()
		var_17_8:AnimateSequence("WZWipSetup")
	end

	var_17_0._sequences.WZWipSetup = var_17_54

	local var_17_55
	local var_17_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("WZWipButtonOver", var_17_56)

	local var_17_57 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_12:RegisterAnimationSequence("WZWipButtonOver", var_17_57)

	local var_17_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("WZWipButtonOver", var_17_58)

	local function var_17_59()
		var_17_8:AnimateSequence("WZWipButtonOver")
		var_17_12:AnimateSequence("WZWipButtonOver")
		var_17_14:AnimateSequence("WZWipButtonOver")
	end

	var_17_0._sequences.WZWipButtonOver = var_17_59

	local var_17_60
	local var_17_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_17_61)

	local var_17_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_17_62)

	local var_17_63 = {
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

	var_17_12:RegisterAnimationSequence("WZWipButtonOverDisabled", var_17_63)

	local var_17_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_17_64)

	local function var_17_65()
		var_17_6:AnimateSequence("WZWipButtonOverDisabled")
		var_17_8:AnimateSequence("WZWipButtonOverDisabled")
		var_17_12:AnimateSequence("WZWipButtonOverDisabled")
		var_17_14:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_17_0._sequences.WZWipButtonOverDisabled = var_17_65

	local var_17_66
	local var_17_67 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("WZWipButtonUp", var_17_67)

	local var_17_68 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_17_12:RegisterAnimationSequence("WZWipButtonUp", var_17_68)

	local var_17_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("WZWipButtonUp", var_17_69)

	local function var_17_70()
		var_17_8:AnimateSequence("WZWipButtonUp")
		var_17_12:AnimateSequence("WZWipButtonUp")
		var_17_14:AnimateSequence("WZWipButtonUp")
	end

	var_17_0._sequences.WZWipButtonUp = var_17_70

	local var_17_71
	local var_17_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_17_72)

	local var_17_73 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_17_73)

	local var_17_74 = {
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

	var_17_12:RegisterAnimationSequence("WZWipButtonUpDisabled", var_17_74)

	local var_17_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_17_75)

	local function var_17_76()
		var_17_6:AnimateSequence("WZWipButtonUpDisabled")
		var_17_8:AnimateSequence("WZWipButtonUpDisabled")
		var_17_12:AnimateSequence("WZWipButtonUpDisabled")
		var_17_14:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_17_0._sequences.WZWipButtonUpDisabled = var_17_76

	var_0_6(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("BarracksChallengeItemMission", BarracksChallengeItemMission)
LockTable(_M)
