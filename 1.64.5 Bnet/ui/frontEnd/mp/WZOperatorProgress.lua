module(..., package.seeall)

local var_0_0 = "weapon_xp"
local var_0_1 = "xp"

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = OPERATOR.GetRank(arg_1_0._controllerIndex, arg_1_1)
	local var_1_1 = OPERATOR.GetRankDisplay(var_1_0)
	local var_1_2 = OPERATOR.GetOperatorProgress(arg_1_0._controllerIndex, arg_1_1).xp
	local var_1_3 = OPERATOR.GetRankMaxXP(arg_1_1, var_1_0)
	local var_1_4 = var_1_2 / var_1_3

	arg_1_0.ProgressBar:SetProgress(var_1_4, 0)
	arg_1_0.OperatorLevel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL", var_1_1)))
	arg_1_0.XPAmount:setText(Engine.CBBHFCGDIC("MENU_SP/X_SLASH_Y_XP", var_1_2, var_1_3))
	arg_1_0.PreviewUnlock:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_FISHER/PREVIEW_UNLOCK_WITH_KEYBINDING")))

	if OPERATOR.GetMaxRank(arg_1_1) == var_1_0 then
		ACTIONS.AnimateSequence(arg_1_0, "MaxLevel")
		arg_1_0.OperatorLevel:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL_MAX", var_1_1)))

		return
	end

	if not OPERATOR.IsUnlocked(arg_1_0._controllerIndex, arg_1_1) then
		ACTIONS.AnimateSequence(arg_1_0, "ShowOperatorLocked")

		return
	end

	local var_1_5 = OPERATOR.GetCurrentOperatorUnlocks(arg_1_1, var_1_1)

	arg_1_0._currentUnlock = var_1_5[1] and var_1_5[1][1] and var_1_5[1][1] or nil

	ACTIONS.AnimateSequence(arg_1_0, "HideUnlocks")
	ACTIONS.AnimateSequence(arg_1_0.LootItemCard, "ConfigDefault")

	if not (arg_1_0._currentUnlock ~= nil) then
		return
	end

	local var_1_6 = #var_1_5 - 1

	ACTIONS.AnimateSequence(arg_1_0, var_1_6 <= 0 and "HideAdditionalUnlocks" or "ShowAdditionalUnlocks")

	if arg_1_0._currentUnlock.type and arg_1_0._currentUnlock.type == var_0_0 then
		arg_1_0.WeaponIconBkg:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_FISHER/WEAPON_XP", arg_1_0._currentUnlock.amount), {
			useUppercase = true,
			useRegularFont = true
		})
		arg_1_0.WeaponIcon:setImage(RegisterMaterial(WEAPON.GetImage(arg_1_0._currentUnlock.lootRef)))
		ACTIONS.AnimateSequence(arg_1_0, "ShowWeaponXPUnlock")

		return
	end

	local var_1_7 = false
	local var_1_8 = arg_1_0._currentUnlock.type and arg_1_0._currentUnlock.type == var_0_1 and arg_1_0._currentUnlock or nil

	if arg_1_0._currentUnlock.lootID then
		var_1_7 = LOOT.CanPreview(arg_1_0._currentUnlock.type, arg_1_0._currentUnlock.lootID)
		var_1_8 = LOOT.GetLootCardData(arg_1_0._controllerIndex, arg_1_0._currentUnlock.lootID)

		assert(var_1_8, "No loot data with an id of " .. arg_1_0._currentUnlock.lootID .. "could be found for the operator ref " .. arg_1_1)
	end

	if var_1_8 then
		var_1_8.type = arg_1_0._currentUnlock.type

		if var_1_8.type == var_0_1 then
			var_1_8.setDisplayForOperatorXP = true
		end

		arg_1_0.LootItemCard:SetMiniMode(true)
		arg_1_0.LootItemCard:UpdateCardConfig(var_1_8)
		ACTIONS.AnimateSequence(arg_1_0, var_1_7 and "ShowUnlocks" or "ShowUnlocksNoPreview")

		return
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupProgression = var_0_2
	arg_2_0._controllerIndex = arg_2_1

	local var_2_0 = LUI.UIBindButton.new()

	var_2_0.id = "bindButton"

	arg_2_0:addElement(var_2_0)

	arg_2_0.bindButton = var_2_0

	arg_2_0.bindButton:addEventHandler("button_right_trigger", function(arg_3_0, arg_3_1)
		if arg_2_0._currentUnlock ~= nil then
			local var_3_0 = arg_2_0._currentUnlock.type ~= var_0_0
			local var_3_1 = LOOT.CanPreview(arg_2_0._currentUnlock.type, arg_2_0._currentUnlock.lootID) and not arg_2_0._cannotPreview

			if var_3_0 and var_3_1 then
				STORE.PreviewItem(arg_2_1, arg_2_0._currentUnlock.type, arg_2_0._currentUnlock.lootID)
			end
		end
	end)
end

function WZOperatorProgress(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 124 * _1080p)

	var_4_0.id = "WZOperatorProgress"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "ProgressBar"

	var_4_4.DialogueBackground:SetAlpha(0.5, 0)
	var_4_4.Fill:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_4_4.Frame:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_4.Frame:SetAlpha(0.5, 0)
	var_4_4.Cap:SetAlpha(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 410, _1080p * 42, _1080p * 52)
	var_4_0:addElement(var_4_4)

	var_4_0.ProgressBar = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "OperatorLevel"

	var_4_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/OPERATOR_LEVEL"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 315, _1080p * 11, _1080p * 31)
	var_4_0:addElement(var_4_6)

	var_4_0.OperatorLevel = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "XPAmount"

	var_4_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("MENU_SP/X_SLASH_Y_XP"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Right)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 297, _1080p * 410, _1080p * 12, _1080p * 30)
	var_4_0:addElement(var_4_8)

	var_4_0.XPAmount = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "LootItemCard"

	var_4_10:SetScale(-0.5, 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -113, _1080p * 37, _1080p * -46, _1080p * 150)
	var_4_0:addElement(var_4_10)

	var_4_0.LootItemCard = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "PreviewUnlock"

	var_4_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_4_12:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/PREVIEW_UNLOCK_WITH_KEYBINDING"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetWordWrap(false)
	var_4_12:SetAlignment(LUI.Alignment.Right)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 398, _1080p * 75, _1080p * 92)
	var_4_0:addElement(var_4_12)

	var_4_0.PreviewUnlock = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "AdditionalUnlocks"

	var_4_14:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/ADDITIONAL_UNLOCKS"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Right)
	var_4_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -51, _1080p * -16, _1080p * 5, _1080p * 23)
	var_4_0:addElement(var_4_14)

	var_4_0.AdditionalUnlocks = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "WeaponIconBkg"

	var_4_16.Background:SetRGBFromInt(16777215, 0)
	var_4_16.Background:SetAlpha(1, 0)
	var_4_16.Background:setImage(RegisterMaterial("ui_mp_wz_progression_weapon_background"), 0)
	var_4_16.TitleBackground:SetLeft(0, 0)
	var_4_16.TitleBackground:SetRight(0, 0)
	var_4_16.TitleBackground:SetTop(_1080p * 64, 0)
	var_4_16.TitleBackground:SetBottom(_1080p * 94, 0)
	var_4_16.Title:SetLeft(_1080p * 5, 0)
	var_4_16.Title:SetRight(_1080p * -5, 0)
	var_4_16.Title:SetTop(_1080p * 71, 0)
	var_4_16.Title:SetBottom(_1080p * 87, 0)
	var_4_16.Title:setText("", 0)
	var_4_16.Title:SetAlignment(LUI.Alignment.Center)
	var_4_16.BorderBacker:SetLeft(0, 0)
	var_4_16.BorderBacker:SetRight(0, 0)
	var_4_16.BorderBacker:SetTop(0, 0)
	var_4_16.BorderBacker:SetBottom(0, 0)
	var_4_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -87, _1080p * 41, _1080p * 5, _1080p * 70)
	var_4_0:addElement(var_4_16)

	var_4_0.WeaponIconBkg = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "WeaponIcon"

	var_4_18:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_18:SetScale(-0.1, 0)
	var_4_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -87, _1080p * 41, _1080p * 5, _1080p * 69)
	var_4_0:addElement(var_4_18)

	var_4_0.WeaponIcon = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "LockIcon"

	var_4_20:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_4_20:setImage(RegisterMaterial("blade_lock"), 0)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -32, 0, _1080p * 20, _1080p * 52)
	var_4_0:addElement(var_4_20)

	var_4_0.LockIcon = var_4_20

	local function var_4_21()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		}
	}

	var_4_4:RegisterAnimationSequence("ShowUnlocks", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_4_6:RegisterAnimationSequence("ShowUnlocks", var_4_24)

	local var_4_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		}
	}

	var_4_8:RegisterAnimationSequence("ShowUnlocks", var_4_25)

	local var_4_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowUnlocks", var_4_26)

	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 398
		}
	}

	var_4_12:RegisterAnimationSequence("ShowUnlocks", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowUnlocks", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowUnlocks", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ShowUnlocks", var_4_30)

	local function var_4_31()
		var_4_4:AnimateSequence("ShowUnlocks")
		var_4_6:AnimateSequence("ShowUnlocks")
		var_4_8:AnimateSequence("ShowUnlocks")
		var_4_10:AnimateSequence("ShowUnlocks")
		var_4_12:AnimateSequence("ShowUnlocks")
		var_4_16:AnimateSequence("ShowUnlocks")
		var_4_18:AnimateSequence("ShowUnlocks")
		var_4_20:AnimateSequence("ShowUnlocks")
	end

	var_4_0._sequences.ShowUnlocks = var_4_31

	local var_4_32
	local var_4_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("HideUnlocks", var_4_33)

	local var_4_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideUnlocks", var_4_34)

	local var_4_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideUnlocks", var_4_35)

	local var_4_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("HideUnlocks", var_4_36)

	local var_4_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("HideUnlocks", var_4_37)

	local var_4_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("HideUnlocks", var_4_38)

	local var_4_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("HideUnlocks", var_4_39)

	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("HideUnlocks", var_4_40)

	local var_4_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("HideUnlocks", var_4_41)

	local function var_4_42()
		var_4_4:AnimateSequence("HideUnlocks")
		var_4_6:AnimateSequence("HideUnlocks")
		var_4_8:AnimateSequence("HideUnlocks")
		var_4_10:AnimateSequence("HideUnlocks")
		var_4_12:AnimateSequence("HideUnlocks")
		var_4_14:AnimateSequence("HideUnlocks")
		var_4_16:AnimateSequence("HideUnlocks")
		var_4_18:AnimateSequence("HideUnlocks")
		var_4_20:AnimateSequence("HideUnlocks")
	end

	var_4_0._sequences.HideUnlocks = var_4_42

	local var_4_43
	local var_4_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowAdditionalUnlocks", var_4_44)

	local function var_4_45()
		var_4_14:AnimateSequence("ShowAdditionalUnlocks")
	end

	var_4_0._sequences.ShowAdditionalUnlocks = var_4_45

	local var_4_46
	local var_4_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("HideAdditionalUnlocks", var_4_47)

	local function var_4_48()
		var_4_14:AnimateSequence("HideAdditionalUnlocks")
	end

	var_4_0._sequences.HideAdditionalUnlocks = var_4_48

	local var_4_49
	local var_4_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("MaxLevel", var_4_50)

	local var_4_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.99,
			duration = 490,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("MaxLevel", var_4_51)

	local var_4_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("MaxLevel", var_4_52)

	local var_4_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("MaxLevel", var_4_53)

	local var_4_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("MaxLevel", var_4_54)

	local var_4_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("MaxLevel", var_4_55)

	local var_4_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("MaxLevel", var_4_56)

	local var_4_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_4_18:RegisterAnimationSequence("MaxLevel", var_4_57)

	local var_4_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("MaxLevel", var_4_58)

	local function var_4_59()
		var_4_4:AnimateLoop("MaxLevel")
		var_4_6:AnimateLoop("MaxLevel")
		var_4_8:AnimateLoop("MaxLevel")
		var_4_10:AnimateLoop("MaxLevel")
		var_4_12:AnimateLoop("MaxLevel")
		var_4_14:AnimateLoop("MaxLevel")
		var_4_16:AnimateLoop("MaxLevel")
		var_4_18:AnimateLoop("MaxLevel")
		var_4_20:AnimateLoop("MaxLevel")
	end

	var_4_0._sequences.MaxLevel = var_4_59

	local var_4_60
	local var_4_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		}
	}

	var_4_4:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_61)

	local var_4_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_4_6:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_62)

	local var_4_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 297
		}
	}

	var_4_8:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_63)

	local var_4_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_64)

	local var_4_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 398
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 23
		}
	}

	var_4_12:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_65)

	local var_4_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_67)

	local var_4_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ShowUnlocksNoPreview", var_4_68)

	local function var_4_69()
		var_4_4:AnimateSequence("ShowUnlocksNoPreview")
		var_4_6:AnimateSequence("ShowUnlocksNoPreview")
		var_4_8:AnimateSequence("ShowUnlocksNoPreview")
		var_4_10:AnimateSequence("ShowUnlocksNoPreview")
		var_4_12:AnimateSequence("ShowUnlocksNoPreview")
		var_4_16:AnimateSequence("ShowUnlocksNoPreview")
		var_4_18:AnimateSequence("ShowUnlocksNoPreview")
		var_4_20:AnimateSequence("ShowUnlocksNoPreview")
	end

	var_4_0._sequences.ShowUnlocksNoPreview = var_4_69

	local var_4_70
	local var_4_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_71)

	local var_4_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 262
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_4_6:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_72)

	local var_4_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 357
		}
	}

	var_4_8:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_73)

	local var_4_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_74)

	local var_4_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 345
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_75)

	local var_4_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_16:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_76)

	local var_4_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_18:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_77)

	local var_4_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ShowWeaponXPUnlock", var_4_78)

	local function var_4_79()
		var_4_4:AnimateSequence("ShowWeaponXPUnlock")
		var_4_6:AnimateSequence("ShowWeaponXPUnlock")
		var_4_8:AnimateSequence("ShowWeaponXPUnlock")
		var_4_10:AnimateSequence("ShowWeaponXPUnlock")
		var_4_12:AnimateSequence("ShowWeaponXPUnlock")
		var_4_16:AnimateSequence("ShowWeaponXPUnlock")
		var_4_18:AnimateSequence("ShowWeaponXPUnlock")
		var_4_20:AnimateSequence("ShowWeaponXPUnlock")
	end

	var_4_0._sequences.ShowWeaponXPUnlock = var_4_79

	local var_4_80
	local var_4_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 410
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ShowOperatorLocked", var_4_81)

	local var_4_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 315
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_WZ311/UNLOCK_TO_PROGRESS")
		}
	}

	var_4_6:RegisterAnimationSequence("ShowOperatorLocked", var_4_82)

	local var_4_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowOperatorLocked", var_4_83)

	local var_4_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("ShowOperatorLocked", var_4_84)

	local var_4_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ShowOperatorLocked", var_4_85)

	local var_4_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowOperatorLocked", var_4_86)

	local var_4_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ShowOperatorLocked", var_4_87)

	local var_4_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("ShowOperatorLocked", var_4_88)

	local var_4_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("ShowOperatorLocked", var_4_89)

	local function var_4_90()
		var_4_4:AnimateSequence("ShowOperatorLocked")
		var_4_6:AnimateSequence("ShowOperatorLocked")
		var_4_8:AnimateSequence("ShowOperatorLocked")
		var_4_10:AnimateSequence("ShowOperatorLocked")
		var_4_12:AnimateSequence("ShowOperatorLocked")
		var_4_14:AnimateSequence("ShowOperatorLocked")
		var_4_16:AnimateSequence("ShowOperatorLocked")
		var_4_18:AnimateSequence("ShowOperatorLocked")
		var_4_20:AnimateSequence("ShowOperatorLocked")
	end

	var_4_0._sequences.ShowOperatorLocked = var_4_90

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WZOperatorProgress", WZOperatorProgress)
LockTable(_M)
