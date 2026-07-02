module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Star = LUI.UIImage.new()
	arg_1_0.Star.id = "Star"

	arg_1_0.Star:setImage(RegisterMaterial("ui_streak_warning"))
	arg_1_0.Star:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 27, _1080p * 7, _1080p * 27)
	arg_1_0:addElement(arg_1_0.Star)
	arg_1_0:SetStarVisible(false)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.Star then
		arg_2_0.Star:SetAlpha(arg_2_1 and 1 or 0)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0._isAvailable then
		ACTIONS.AnimateSequence(arg_3_0, arg_3_1 and "UnavailableOver" or "UnavailableUp")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground, arg_3_1 and "ButtonOverDisabled" or "UnavailableUp")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground.HighlightTop, "Disabled")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground.HighlightBottom, "Disabled")
	elseif arg_3_0.data and arg_3_0.data.isUnlocked then
		ACTIONS.AnimateSequence(arg_3_0, arg_3_1 and "ButtonOver" or "ButtonUp")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground, arg_3_1 and "ButtonOver" or "ButtonUp")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground.HighlightTop, "Enabled")
		ACTIONS.AnimateSequence(arg_3_0.LoadoutItemButtonBackground.HighlightBottom, "Enabled")
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_1 then
		ACTIONS.AnimateSequence(arg_4_0.Selected, not arg_4_0.selected and "On" or "Off")
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_4_0, "Expand")
		var_0_2(arg_4_0, true)
	else
		ACTIONS.AnimateSequence(arg_4_0.Selected, arg_4_0.selected and "On" or "Off")

		if not arg_4_0._buttonOver then
			ACTIONS.AnimateSequence(arg_4_0.LoadoutItemButtonBackground, "ButtonUp")
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")
			ACTIONS.AnimateSequence(arg_4_0, "Contract")
		end
	end

	if arg_4_2 then
		ACTIONS.AnimateSequence(arg_4_0, arg_4_1 and "SwapOn" or "SwapOff")
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.selected = arg_5_1

	ACTIONS.AnimateSequence(arg_5_0.Selected, arg_5_1 and "On" or "Off")

	if arg_5_1 then
		arg_5_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	STREAK.Unlock(arg_6_1, arg_6_0.data.ref)

	arg_6_0.data.isUnlocked = true

	ACTIONS.AnimateSequence(arg_6_0, "Unlocked")
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0 = not arg_7_0.selected and not arg_7_0.data.isUnlocked or arg_7_1

	arg_7_0:SetButtonDisabled(var_7_0)
	arg_7_0:SetMouseFocusBlocker(arg_7_1)
end

local function var_0_7(arg_8_0, arg_8_1)
	arg_8_0.Image:setImage(RegisterMaterial(arg_8_1.icon))
	arg_8_0.Kills:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", arg_8_1.kills))

	arg_8_0.data = arg_8_1

	if arg_8_1.isNew then
		local var_8_0 = CONDITIONS.IsThirdGameMode() and arg_8_1.lootType and arg_8_1.lootType or LOOT.itemTypes.STREAK
		local var_8_1 = LOOT.GetItemID(var_8_0, arg_8_1.ref)

		arg_8_0.NewItemNotification:UpdateBreadcrumbByID(arg_8_0._controllerIndex, var_8_1, true)
	end

	if CONDITIONS.IsWaveGameType() then
		arg_8_0.CPWaveSurvivalCost:setText(Engine.CBBHFCGDIC("COOP_GAME_PLAY/CURRENCY", tostring(arg_8_1.survivalCost)))
	end

	if not arg_8_1.isUnlocked then
		ACTIONS.AnimateSequence(arg_8_0, "Locked")
	end

	arg_8_0:ToggleDisabled()

	if CONDITIONS.IsCoreMultiplayer() and MatchRules.DAAABIJDJI(arg_8_0.data.ref) then
		ACTIONS.AnimateSequence(arg_8_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_8_0, "HideRestriction")
	end

	if arg_8_0.data.ref == "pac_sentry" and not CONDITIONS.AreRestrictionsActive(arg_8_0._controllerIndex) then
		var_0_0(arg_8_0)
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	assert(arg_9_0.Selected)

	arg_9_0.SetSelected = var_0_4
	arg_9_0.Setup = var_0_7
	arg_9_0.ToggleDisabled = var_0_6
	arg_9_0.Unlock = var_0_5
	arg_9_0.UpdateHighlightStatus = var_0_3
	arg_9_0.SetStarVisible = var_0_1
	arg_9_0.FakeDisabled = var_0_2
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0._buttonOver = false
	arg_9_0._isAvailable = true

	arg_9_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		arg_9_0._buttonOver = true

		if arg_9_0._isAvailable then
			ACTIONS.AnimateSequence(arg_9_0, "ButtonOver")
		else
			arg_9_0:FakeDisabled(true)
			ACTIONS.AnimateSequence(arg_9_0, "UnavailableOver")

			return true
		end
	end)
	arg_9_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if arg_11_0 ~= nil and arg_11_0.data ~= nil then
			if arg_11_0.data.isNew then
				local var_11_0 = LOOT.GetItemID(LOOT.itemTypes.STREAK, arg_11_0.data.ref)

				arg_11_0.NewItemNotification:ClearBreadcrumbByID(arg_11_0._controllerIndex, var_11_0, true)
			end

			arg_9_0._buttonOver = false
		end

		if arg_9_0._isAvailable then
			ACTIONS.AnimateSequence(arg_9_0, "ButtonUp")
		else
			arg_9_0:FakeDisabled(false)
			ACTIONS.AnimateSequence(arg_9_0, "UnavailableUp")

			return true
		end
	end)
	arg_9_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		arg_9_0._buttonOver = false
	end)
	arg_9_0:addEventHandler("button_over_disable", function(arg_13_0, arg_13_1)
		arg_9_0._buttonOver = true
	end)
end

function StreakButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 84 * _1080p, 0, 116 * _1080p)

	var_14_0.id = "StreakButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "LoadoutItemButtonBackground"

	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.LoadoutItemButtonBackground = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "Image"

	var_14_6:SetAlpha(0.6, 0)
	var_14_6:setImage(RegisterMaterial("hud_icon_killstreak_apache"), 0)
	var_14_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -35, _1080p * 35)
	var_14_0:addElement(var_14_6)

	var_14_0.Image = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIText.new()

	var_14_8.id = "Kills"

	var_14_8:SetAlpha(0, 0)
	var_14_8:setText("", 0)
	var_14_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_8:SetAlignment(LUI.Alignment.Left)
	var_14_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 7, _1080p * 123, _1080p * -25, _1080p * -3)
	var_14_0:addElement(var_14_8)

	var_14_0.Kills = var_14_8

	local var_14_9
	local var_14_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_14_1
	})

	var_14_10.id = "Selected"

	var_14_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_14_0:addElement(var_14_10)

	var_14_0.Selected = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "Lock"

	var_14_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_14_12:SetAlpha(0, 0)
	var_14_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_14_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_14_0:addElement(var_14_12)

	var_14_0.Lock = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "SwapIcon"

	var_14_14:SetAlpha(0, 0)
	var_14_14:setImage(RegisterMaterial("icon_swap"), 0)
	var_14_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_14_0:addElement(var_14_14)

	var_14_0.SwapIcon = var_14_14

	local var_14_15
	local var_14_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_14_1
	})

	var_14_16.id = "NewItemNotification"

	var_14_16:SetAlpha(0, 0)
	var_14_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_14_0:addElement(var_14_16)

	var_14_0.NewItemNotification = var_14_16

	local var_14_17

	if CONDITIONS.IsWaveGameType(var_14_0) then
		local var_14_18 = LUI.UIStyledText.new()

		var_14_18.id = "CPWaveSurvivalCost"

		var_14_18:SetRGBFromInt(8421504, 0)
		var_14_18:SetAlpha(0.6, 0)
		var_14_18:setText("", 0)
		var_14_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_18:SetAlignment(LUI.Alignment.Center)
		var_14_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_14_18:SetStartupDelay(2000)
		var_14_18:SetLineHoldTime(400)
		var_14_18:SetAnimMoveTime(300)
		var_14_18:SetAnimMoveSpeed(50)
		var_14_18:SetEndDelay(1500)
		var_14_18:SetCrossfadeTime(750)
		var_14_18:SetFadeInTime(300)
		var_14_18:SetFadeOutTime(300)
		var_14_18:SetMaxVisibleLines(1)
		var_14_18:SetOutlineRGBFromInt(0, 0)
		var_14_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -22, _1080p * 106, _1080p * 92, _1080p * 116)
		var_14_0:addElement(var_14_18)

		var_14_0.CPWaveSurvivalCost = var_14_18
	end

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "RestrictionWarning"

	var_14_20:SetAlpha(0, 0)
	var_14_20:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_14_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 31, 0, _1080p * 30)
	var_14_0:addElement(var_14_20)

	var_14_0.RestrictionWarning = var_14_20

	local function var_14_21()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_21

	local var_14_22
	local var_14_23 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_23)

	local var_14_24 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_24)

	local var_14_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUp", var_14_25)

	local var_14_26 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonUp", var_14_26)

	local var_14_27 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUp", var_14_27)

	local function var_14_28()
		var_14_6:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_14:AnimateSequence("ButtonUp")
		var_14_16:AnimateSequence("ButtonUp")
		var_14_20:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_28

	local var_14_29
	local var_14_30 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_30)

	local var_14_31 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 17
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_31)

	local var_14_32 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonOver", var_14_32)

	local var_14_33 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonOver", var_14_33)

	local var_14_34 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -5
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOver", var_14_34)

	local function var_14_35()
		var_14_6:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_14:AnimateSequence("ButtonOver")
		var_14_16:AnimateSequence("ButtonOver")
		var_14_20:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_35

	local var_14_36
	local var_14_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("Disable", var_14_37)

	local function var_14_38()
		var_14_6:AnimateSequence("Disable")
	end

	var_14_0._sequences.Disable = var_14_38

	local var_14_39
	local var_14_40 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("Enable", var_14_40)

	local function var_14_41()
		var_14_6:AnimateSequence("Enable")
	end

	var_14_0._sequences.Enable = var_14_41

	local var_14_42
	local var_14_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("Locked", var_14_43)

	local function var_14_44()
		var_14_12:AnimateSequence("Locked")
	end

	var_14_0._sequences.Locked = var_14_44

	local var_14_45
	local var_14_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("Unlocked", var_14_46)

	local function var_14_47()
		var_14_12:AnimateSequence("Unlocked")
	end

	var_14_0._sequences.Unlocked = var_14_47

	local var_14_48
	local var_14_49 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("SwapOn", var_14_49)

	local function var_14_50()
		var_14_14:AnimateSequence("SwapOn")
	end

	var_14_0._sequences.SwapOn = var_14_50

	local var_14_51
	local var_14_52 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("SwapOff", var_14_52)

	local function var_14_53()
		var_14_14:AnimateSequence("SwapOff")
	end

	var_14_0._sequences.SwapOff = var_14_53

	local var_14_54
	local var_14_55 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		}
	}

	var_14_4:RegisterAnimationSequence("Expand", var_14_55)

	local function var_14_56()
		var_14_4:AnimateSequence("Expand")
	end

	var_14_0._sequences.Expand = var_14_56

	local var_14_57
	local var_14_58 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_14_4:RegisterAnimationSequence("Contract", var_14_58)

	local function var_14_59()
		var_14_4:AnimateSequence("Contract")
	end

	var_14_0._sequences.Contract = var_14_59

	local var_14_60
	local var_14_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredLine
		},
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("UnavailableUp", var_14_61)

	local function var_14_62()
		var_14_6:AnimateSequence("UnavailableUp")
	end

	var_14_0._sequences.UnavailableUp = var_14_62

	local var_14_63
	local var_14_64 = {
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

	var_14_6:RegisterAnimationSequence("UnavailableOver", var_14_64)

	local function var_14_65()
		var_14_6:AnimateSequence("UnavailableOver")
	end

	var_14_0._sequences.UnavailableOver = var_14_65

	local var_14_66
	local var_14_67 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("ShowRestriction", var_14_67)

	local function var_14_68()
		var_14_20:AnimateSequence("ShowRestriction")
	end

	var_14_0._sequences.ShowRestriction = var_14_68

	local var_14_69
	local var_14_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_20:RegisterAnimationSequence("HideRestriction", var_14_70)

	local function var_14_71()
		var_14_20:AnimateSequence("HideRestriction")
	end

	var_14_0._sequences.HideRestriction = var_14_71

	var_14_0:addEventHandler("button_up", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "SwapOff")
		ACTIONS.AnimateSequence(var_14_0, "Contract")
	end)
	var_14_0:addEventHandler("disable", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "Disable")
	end)
	var_14_0:addEventHandler("enable", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "Enable")
	end)
	var_14_0:addEventHandler("button_over", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "Expand")
	end)
	var_0_8(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("StreakButton", StreakButton)
LockTable(_M)
