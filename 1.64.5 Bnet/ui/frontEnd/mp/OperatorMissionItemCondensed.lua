module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CheckBox:SetValue(arg_1_2, true)
	ACTIONS.AnimateSequence(arg_1_0, arg_1_1 and "SetActive" or "SetInactive")
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = Challenge.GetInitialMissionID(arg_2_1.id)
	local var_2_1 = Challenge.GetMissionRarity(var_2_0)
	local var_2_2 = arg_2_1.rewards

	if var_2_2 and #var_2_2 > 0 then
		if var_2_1 == LOOT.Rarity.OPERATOR_MISSION then
			arg_2_0.RarityImage:setImage(RegisterMaterial(LOOT.GetRarityAltImage(var_2_1)))
			arg_2_0.RarityImage:SetRGBFromTable(COLORS.white)
		else
			local var_2_3 = var_2_2[#var_2_2]

			if var_2_3.rarityImage then
				arg_2_0.RarityImage:setImage(RegisterMaterial(var_2_3.rarityImage))
			end

			LOOT.ApplyRarityIconColoring(arg_2_0.RarityImage, var_2_3.rarity)
		end
	else
		arg_2_0.RarityImage:SetAlpha(0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if arg_3_2.name and #arg_3_2.name > 0 then
		arg_3_0.Title:setText(Engine.CBBHFCGDIC(arg_3_2.name))
	elseif arg_3_2.desc and #arg_3_2.desc > 0 and arg_3_2.objectives and arg_3_2.numObjectivesComplete then
		local var_3_0 = #arg_3_2.objectives
		local var_3_1 = math.min(arg_3_2.numObjectivesComplete + 1, var_3_0)

		arg_3_0.Title:setText(Engine.CBBHFCGDIC(arg_3_2.desc, arg_3_2.objectives[var_3_1].amountNeeded))
	else
		arg_3_0.Title:setText("")
	end

	var_0_0(arg_3_0, arg_3_2.isActive, arg_3_2.complete)

	if arg_3_2.objectives and arg_3_2.numObjectivesComplete then
		local var_3_2 = #arg_3_2.objectives
		local var_3_3 = math.min(arg_3_2.numObjectivesComplete + 1, var_3_2)

		if arg_3_2.isBattlePassLocked or not arg_3_2.isOwned then
			if arg_3_4 or not arg_3_2.isOwned then
				arg_3_0.ProgressDesc:setText("")
			else
				arg_3_0.ProgressDesc:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/LOCKED_BATTLEPASS_MISSION", Engine.JCBDICCAH(arg_3_2.battlePassLevelToUnlock))))
			end
		else
			arg_3_0.ProgressDesc:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N", var_3_3, var_3_2)))
		end
	end

	if not arg_3_1._menuHandlesChallengePress and (arg_3_2.isBattlePassLocked or not arg_3_2.unlocked) then
		arg_3_0:registerEventHandler("button_action", function(arg_4_0, arg_4_1)
			if arg_4_0._challenge.complete and not arg_3_0._isActive or arg_4_0._challenge.isBattlePassLocked or not arg_4_0._challenge.unlocked then
				return
			end

			if arg_4_0._menu and not arg_3_0._isActive then
				arg_4_0._menu:processEvent({
					name = "challenges_mission_activation",
					index = arg_4_0._index
				})
			end
		end)
	end

	arg_3_0:SetButtonDisabled(arg_3_2.isBattlePassLocked or not arg_3_2.unlocked)
	arg_3_0:CustomLoseFocus()
	var_0_1(arg_3_0, arg_3_2)
	arg_3_0.RestartToActivateOverlay:UpdateOverlay(arg_3_2)

	arg_3_0._challenge = arg_3_2
	arg_3_0._isActive = arg_3_2.isActive
	arg_3_0._menu = arg_3_1
	arg_3_0._index = arg_3_3
end

local function var_0_3(arg_5_0)
	arg_5_0:setFocus(false)

	if arg_5_0.disabled then
		if arg_5_0.isActive then
			arg_5_0:processEvent({
				snap = true,
				name = "button_disable_active"
			})
		else
			arg_5_0:processEvent({
				snap = true,
				name = "button_disable"
			})
		end
	elseif arg_5_0.isActive then
		arg_5_0:processEvent({
			snap = true,
			name = "button_active"
		})
	else
		arg_5_0:processEvent({
			snap = true,
			name = "button_up"
		})
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.keepFocus = true
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.Setup = var_0_2
	arg_7_0._isActive = false
	arg_7_0.CustomLoseFocus = var_0_3

	function arg_7_0.MouseLeave(arg_8_0, arg_8_1)
		return
	end

	function arg_7_0.LoseFocus(arg_9_0, arg_9_1)
		return
	end

	arg_7_0:addEventHandler("gain_focus", function(arg_10_0, arg_10_1)
		arg_7_0:getParent():processEvent({
			name = "new_mission_focused",
			newFocusedElement = arg_10_0
		})
	end)
	arg_7_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if arg_11_0._menu then
			arg_11_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_11_0._index
			})
		end

		arg_11_0._isOver = true

		WZWIP.AnimateThemeElement(arg_11_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_11_0, "ButtonOverCheckbox")
	end)
	arg_7_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		arg_12_0._isOver = false

		WZWIP.AnimateThemeElement(arg_12_0, "ButtonUp")
		ACTIONS.AnimateSequence(arg_12_0, "ButtonUpCheckbox")
	end)
	arg_7_0:addEventHandler("disable", function(arg_13_0, arg_13_1)
		WZWIP.AnimateThemeElement(arg_13_0, "ButtonUpDisabled")
	end)
	arg_7_0:addEventHandler("button_disable", function(arg_14_0, arg_14_1)
		WZWIP.AnimateThemeElement(arg_14_0, "ButtonUpDisabled")
	end)
	arg_7_0:addEventHandler("button_over_disable", function(arg_15_0, arg_15_1)
		if arg_15_0._menu then
			arg_15_0._menu:processEvent({
				name = "challenges_update_mission_details",
				index = arg_15_0._index
			})
		end

		WZWIP.AnimateThemeElement(arg_15_0, "ButtonOverDisabled")
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_7_0, "WZWipSetup")
	end
end

function OperatorMissionItemCondensed(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIButton.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 68 * _1080p)

	var_16_0.id = "OperatorMissionItemCondensed"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)
	var_0_4(var_16_0, var_16_1, arg_16_1)

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
	var_16_6.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
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
	var_16_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_8:SetStartupDelay(2000)
	var_16_8:SetLineHoldTime(400)
	var_16_8:SetAnimMoveTime(2000)
	var_16_8:SetAnimMoveSpeed(150)
	var_16_8:SetEndDelay(2000)
	var_16_8:SetCrossfadeTime(250)
	var_16_8:SetFadeInTime(300)
	var_16_8:SetFadeOutTime(300)
	var_16_8:SetMaxVisibleLines(1)
	var_16_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 62, _1080p * -76, _1080p * 10, _1080p * 34)
	var_16_0:addElement(var_16_8)

	var_16_0.Title = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIStyledText.new()

	var_16_10.id = "ProgressDesc"

	var_16_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_16_10:SetAlpha(0.5, 0)
	var_16_10:setText(Engine.CBBHFCGDIC("CHALLENGE/OBJECTIVE_N_N"), 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_16_10:SetAlignment(LUI.Alignment.Left)
	var_16_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_10:SetStartupDelay(2000)
	var_16_10:SetLineHoldTime(400)
	var_16_10:SetAnimMoveTime(2000)
	var_16_10:SetAnimMoveSpeed(150)
	var_16_10:SetEndDelay(2000)
	var_16_10:SetCrossfadeTime(250)
	var_16_10:SetFadeInTime(300)
	var_16_10:SetFadeOutTime(300)
	var_16_10:SetMaxVisibleLines(1)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 62, _1080p * 524, _1080p * 36, _1080p * 58)
	var_16_0:addElement(var_16_10)

	var_16_0.ProgressDesc = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "NewItemSmallIcon"

	var_16_12:SetAlpha(0, 0)
	var_16_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -16, _1080p * -8, _1080p * 9, _1080p * 17)
	var_16_0:addElement(var_16_12)

	var_16_0.NewItemSmallIcon = var_16_12

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
	local var_16_16 = LUI.UIImage.new()

	var_16_16.id = "RarityImage"

	var_16_16:SetRGBFromTable(SWATCHES.itemRarity.quality3, 0)
	var_16_16:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_16_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 243, _1080p * 277, _1080p * -17, _1080p * 17)
	var_16_0:addElement(var_16_16)

	var_16_0.RarityImage = var_16_16

	local var_16_17
	local var_16_18 = MenuBuilder.BuildRegisteredType("RestartToActivateOverlay", {
		controllerIndex = var_16_1
	})

	var_16_18.id = "RestartToActivateOverlay"

	var_16_18:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_16_0:addElement(var_16_18)

	var_16_0.RestartToActivateOverlay = var_16_18

	local function var_16_19()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_19

	local function var_16_20()
		return
	end

	var_16_0._sequences.SetActive = var_16_20

	local function var_16_21()
		return
	end

	var_16_0._sequences.SetInactive = var_16_21

	local var_16_22
	local var_16_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonOver", var_16_23)

	local var_16_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOver", var_16_24)

	local var_16_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOver", var_16_25)

	local function var_16_26()
		var_16_8:AnimateSequence("ButtonOver")
		var_16_10:AnimateSequence("ButtonOver")
		var_16_14:AnimateSequence("ButtonOver")
	end

	var_16_0._sequences.ButtonOver = var_16_26

	local var_16_27
	local var_16_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUp", var_16_28)

	local var_16_29 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonUp", var_16_29)

	local var_16_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonUp", var_16_30)

	local function var_16_31()
		var_16_8:AnimateSequence("ButtonUp")
		var_16_10:AnimateSequence("ButtonUp")
		var_16_14:AnimateSequence("ButtonUp")
	end

	var_16_0._sequences.ButtonUp = var_16_31

	local var_16_32
	local var_16_33 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverCheckbox", var_16_33)

	local function var_16_34()
		var_16_6:AnimateSequence("ButtonOverCheckbox")
	end

	var_16_0._sequences.ButtonOverCheckbox = var_16_34

	local var_16_35
	local var_16_36 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpCheckbox", var_16_36)

	local function var_16_37()
		var_16_6:AnimateSequence("ButtonUpCheckbox")
	end

	var_16_0._sequences.ButtonUpCheckbox = var_16_37

	local var_16_38
	local var_16_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonUpDisabled", var_16_39)

	local var_16_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_16_8:RegisterAnimationSequence("ButtonUpDisabled", var_16_40)

	local var_16_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonUpDisabled", var_16_41)

	local function var_16_42()
		var_16_6:AnimateSequence("ButtonUpDisabled")
		var_16_8:AnimateSequence("ButtonUpDisabled")
		var_16_14:AnimateSequence("ButtonUpDisabled")
	end

	var_16_0._sequences.ButtonUpDisabled = var_16_42

	local var_16_43
	local var_16_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("ButtonOverDisabled", var_16_44)

	local var_16_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_16_10:RegisterAnimationSequence("ButtonOverDisabled", var_16_45)

	local var_16_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("ButtonOverDisabled", var_16_46)

	local function var_16_47()
		var_16_6:AnimateSequence("ButtonOverDisabled")
		var_16_10:AnimateSequence("ButtonOverDisabled")
		var_16_14:AnimateSequence("ButtonOverDisabled")
	end

	var_16_0._sequences.ButtonOverDisabled = var_16_47

	local var_16_48
	local var_16_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipSetup", var_16_49)

	local var_16_50 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZWipSetup", var_16_50)

	local function var_16_51()
		var_16_8:AnimateSequence("WZWipSetup")
		var_16_10:AnimateSequence("WZWipSetup")
	end

	var_16_0._sequences.WZWipSetup = var_16_51

	local var_16_52
	local var_16_53 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonOver", var_16_53)

	local var_16_54 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZWipButtonOver", var_16_54)

	local var_16_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonOver", var_16_55)

	local function var_16_56()
		var_16_8:AnimateSequence("WZWipButtonOver")
		var_16_10:AnimateSequence("WZWipButtonOver")
		var_16_14:AnimateSequence("WZWipButtonOver")
	end

	var_16_0._sequences.WZWipButtonOver = var_16_56

	local var_16_57
	local var_16_58 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonUp", var_16_58)

	local var_16_59 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZWipButtonUp", var_16_59)

	local var_16_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonUp", var_16_60)

	local function var_16_61()
		var_16_8:AnimateSequence("WZWipButtonUp")
		var_16_10:AnimateSequence("WZWipButtonUp")
		var_16_14:AnimateSequence("WZWipButtonUp")
	end

	var_16_0._sequences.WZWipButtonUp = var_16_61

	local var_16_62
	local var_16_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_63)

	local var_16_64 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_64)

	local var_16_65 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_65)

	local var_16_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonOverDisabled", var_16_66)

	local function var_16_67()
		var_16_6:AnimateSequence("WZWipButtonOverDisabled")
		var_16_8:AnimateSequence("WZWipButtonOverDisabled")
		var_16_10:AnimateSequence("WZWipButtonOverDisabled")
		var_16_14:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_16_0._sequences.WZWipButtonOverDisabled = var_16_67

	local var_16_68
	local var_16_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_6:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_69)

	local var_16_70 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_70)

	local var_16_71 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_71)

	local var_16_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_14:RegisterAnimationSequence("WZWipButtonUpDisabled", var_16_72)

	local function var_16_73()
		var_16_6:AnimateSequence("WZWipButtonUpDisabled")
		var_16_8:AnimateSequence("WZWipButtonUpDisabled")
		var_16_10:AnimateSequence("WZWipButtonUpDisabled")
		var_16_14:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_16_0._sequences.WZWipButtonUpDisabled = var_16_73

	var_0_5(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("OperatorMissionItemCondensed", OperatorMissionItemCondensed)
LockTable(_M)
