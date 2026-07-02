module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
local var_0_1 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".backgroundIndex")
local var_0_2 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".emblemIndex")

local function var_0_3(arg_1_0)
	local var_1_0
	local var_1_1
	local var_1_2 = LOOT.GetTypeForID(arg_1_0._rewardLootID)
	local var_1_3 = LOOT.GetItemRef(var_1_2, arg_1_0._rewardLootID)
	local var_1_4 = LOOT.GetItemImage(var_1_2, var_1_3, arg_1_0._rewardLootID)
	local var_1_5 = LOOT.GetItemName(var_1_2, var_1_3, arg_1_0._rewardLootID)

	if var_1_2 == LOOT.itemTypes.PLAYERCARD then
		var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED")

		local var_1_6 = tonumber(StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, var_1_3, CSV.callingCards.cols.index))

		if var_1_6 ~= arg_1_0._equippedPlayerCardIndex then
			Playercard.CGGBAHFGAF(arg_1_0._controllerIndex, var_1_6)
			var_0_1:SetValue(arg_1_0._controllerIndex, arg_1_0._equippedPlayerCardIndex)

			var_1_1 = LUI.ToastManager.NotificationType.PlayerCardEquipped
			arg_1_0._equippedPlayerCardIndex = var_1_6
		end
	elseif var_1_2 == LOOT.itemTypes.EMBLEM then
		var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/EMBLEM_EQUIPPED")

		local var_1_7 = tonumber(StringTable.DIFCHIGDFB(CSV.emblems.file, CSV.emblems.cols.ref, var_1_3, CSV.emblems.cols.index))

		if var_1_7 ~= arg_1_0._equippedEmblemIndex then
			Playercard.DBBICFEAGH(arg_1_0._controllerIndex, var_1_7)
			var_0_2:SetValue(arg_1_0._controllerIndex, arg_1_0._equippedEmblemIndex)

			var_1_1 = LUI.ToastManager.NotificationType.EmblemEquipped
			arg_1_0._equippedEmblemIndex = var_1_7
		end
	else
		assert(false, "Attempt to equip unsupported loot type: " .. var_1_2 .. ", for ID: " .. arg_1_0._rewardLootID)
	end

	if var_1_1 then
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)

		local var_1_8 = "hud_cmd_active_backer"

		if var_1_4 and #var_1_4 > 0 then
			var_1_8 = var_1_4
		end

		local var_1_9 = {
			displayTime = 2000,
			icon = var_1_8,
			header = var_1_0,
			description = var_1_5,
			type = var_1_1,
			controllerIndex = arg_1_0._controllerIndex
		}

		arg_1_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_1_9
		})
	end
end

local function var_0_4(arg_2_0)
	local var_2_0 = {
		lootID = arg_2_0._rewardLootID,
		lootType = LOOT.GetTypeForID(arg_2_0._rewardLootID)
	}

	LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, arg_2_0._controllerIndex, false, var_2_0, nil, false, false)
	Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
end

local function var_0_5(arg_3_0, arg_3_1)
	if arg_3_1.icon and #arg_3_1.icon > 0 then
		arg_3_0.Icon:setImage(RegisterMaterial(arg_3_1.icon))
	else
		arg_3_0.Icon:SetAlpha(0)
	end

	if arg_3_1.name and #arg_3_1.name > 0 then
		arg_3_0.Title:setText(arg_3_1.name)
	else
		arg_3_0.Title:SetAlpha(0)
	end

	if arg_3_1.desc and #arg_3_1.desc > 0 then
		arg_3_0.ChallengeText:setText(arg_3_1.desc)
	else
		arg_3_0.ChallengeText:SetAlpha(0)
	end

	if not arg_3_1.isUnlocked then
		ACTIONS.AnimateSequence(arg_3_0, "Locked")

		if arg_3_1.name and #arg_3_1.name > 0 and arg_3_1.prevChallengeName and #arg_3_1.prevChallengeName > 0 then
			arg_3_0.LockText:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE_X_TO_UNLOCK_Y", arg_3_1.prevChallengeName, arg_3_1.name))
		else
			arg_3_0.LockText:SetAlpha(0)
		end

		if arg_3_1.amountEarned and arg_3_1.amountNeeded and arg_3_1.amountNeeded > 0 then
			arg_3_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_3_1.amountEarned, arg_3_1.amountNeeded))
			arg_3_0.ProgressBar:SetProgress(arg_3_1.amountEarned / arg_3_1.amountNeeded, 0)
		end
	else
		ACTIONS.AnimateSequence(arg_3_0, "Unlocked")
		arg_3_0.Checkbox:SetValue(arg_3_1.isComplete)

		local var_3_0 = false

		if arg_3_1.amountEarned and arg_3_1.amountNeeded and arg_3_1.amountNeeded > 0 then
			arg_3_0.ProgressBar:SetProgress(arg_3_1.amountEarned / arg_3_1.amountNeeded, 0)
			arg_3_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_3_1.amountEarned, arg_3_1.amountNeeded))

			var_3_0 = true
		end

		arg_3_0.ProgressBar:SetAlpha(var_3_0 and 1 or 0)
		arg_3_0.ProgressDesc:SetAlpha(var_3_0 and 1 or 0)
	end

	local var_3_1 = false

	if arg_3_1.rewardLoot then
		local var_3_2 = true
		local var_3_3 = LOOT.GetTypeForID(arg_3_1.rewardLoot)

		if var_3_3 == LOOT.itemTypes.PLAYERCARD then
			ACTIONS.AnimateSequence(arg_3_0, "ConfigPlayercard")
		elseif var_3_3 == LOOT.itemTypes.EMBLEM then
			ACTIONS.AnimateSequence(arg_3_0, "ConfigEmblem")
		else
			DebugPrint("WeaponMasterDetailsPanel: reward loot type not supported ( " .. var_3_3 .. " )")

			var_3_2 = false
		end

		if var_3_2 then
			local var_3_4 = LOOT.GetLootProperties(var_3_3, arg_3_1.rewardLoot)

			arg_3_0.RewardName:setText(Engine.CBBHFCGDIC("CHALLENGE/X_DASH_Y", var_3_4.name, var_3_4.class))
			arg_3_0.RewardImage:setImage(RegisterMaterial(var_3_4.image))
			arg_3_0.QualityWithText:UpdateQualityText(var_3_4.rarity)

			var_3_1 = true
		end
	end

	arg_3_0.RewardTitle:SetAlpha(var_3_1 and 1 or 0)
	arg_3_0.RewardName:SetAlpha(var_3_1 and 1 or 0)
	arg_3_0.RewardImage:SetAlpha(var_3_1 and 1 or 0)
	arg_3_0.QualityWithText:SetAlpha(var_3_1 and 1 or 0)

	arg_3_0._rewardLootID = arg_3_1.rewardLoot
	arg_3_0._isChallengeComplete = arg_3_1.isComplete

	local var_3_5
	local var_3_6

	if arg_3_0._isChallengeComplete then
		arg_3_0.ButtonPrompt:setText(Engine.CBBHFCGDIC("CHALLENGE/EQUIP"))

		function var_3_5(arg_4_0, arg_4_1)
			if arg_3_0._rewardLootID and arg_3_0._rewardLootID > 0 then
				var_0_3(arg_3_0)
			end
		end
	else
		arg_3_0.ButtonPrompt:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_LOOT_ITEM"))

		function var_3_6(arg_5_0, arg_5_1)
			if arg_3_0._rewardLootID and arg_3_0._rewardLootID > 0 then
				var_0_4(arg_3_0)
			end
		end
	end

	arg_3_0.bindButton:registerEventHandler("button_primary", var_3_5)
	arg_3_0.bindButton:registerEventHandler("button_right_stick", var_3_6)
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.Setup = var_0_5
	arg_6_0._rewardLootID = 0
	arg_6_0._isChallengeComplete = false
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._equippedPlayerCardIndex = var_0_1:GetValue(arg_6_1)
	arg_6_0._equippedEmblemIndex = var_0_2:GetValue(arg_6_1)
	arg_6_0.bindButton = LUI.UIBindButton.new()
	arg_6_0.bindButton.id = "BindButton"

	arg_6_0:addElement(arg_6_0.bindButton)
	Playercard.DAHDCGCDEC(arg_6_1)
	arg_6_0:registerEventHandler("menu_close", function(arg_7_0, arg_7_1)
		Playercard.FCBJJBFBJ(arg_6_1)
	end)
end

function WeaponMasterDetailsPanel(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 576 * _1080p, 0, 615 * _1080p)

	var_8_0.id = "WeaponMasterDetailsPanel"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "DoubleNotchedBacker"

	var_8_4:SetAlpha(0.5, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.DoubleNotchedBacker = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "Title"

	var_8_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_6:SetWordWrap(false)
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(2000)
	var_8_6:SetLineHoldTime(400)
	var_8_6:SetAnimMoveTime(2000)
	var_8_6:SetAnimMoveSpeed(150)
	var_8_6:SetEndDelay(2000)
	var_8_6:SetCrossfadeTime(250)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 82, _1080p * -23, _1080p * 21, _1080p * 57)
	var_8_0:addElement(var_8_6)

	var_8_0.Title = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Icon"

	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 66, _1080p * 15, _1080p * 63)
	var_8_0:addElement(var_8_8)

	var_8_0.Icon = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "ChallengeText"

	var_8_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 436, _1080p * 107, _1080p * 129)
	var_8_0:addElement(var_8_10)

	var_8_0.ChallengeText = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "LockText"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_8_12:SetAlpha(0, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -23, _1080p * 170, _1080p * 194)
	var_8_0:addElement(var_8_12)

	var_8_0.LockText = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIStyledText.new()

	var_8_14.id = "RewardName"

	var_8_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetWordWrap(false)
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_14:SetStartupDelay(2000)
	var_8_14:SetLineHoldTime(400)
	var_8_14:SetAnimMoveTime(2000)
	var_8_14:SetAnimMoveSpeed(150)
	var_8_14:SetEndDelay(2000)
	var_8_14:SetCrossfadeTime(250)
	var_8_14:SetFadeInTime(300)
	var_8_14:SetFadeOutTime(300)
	var_8_14:SetMaxVisibleLines(1)
	var_8_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 23, _1080p * -23, _1080p * 331, _1080p * 361)
	var_8_0:addElement(var_8_14)

	var_8_0.RewardName = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "Checkbox"

	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 58, _1080p * 109, _1080p * 151)
	var_8_0:addElement(var_8_16)

	var_8_0.Checkbox = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "ProgressBar"

	var_8_18.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_18.Overlay:SetAlpha(0.2, 0)
	var_8_18.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 66, _1080p * -23, _1080p * 133, _1080p * 151)
	var_8_0:addElement(var_8_18)

	var_8_0.ProgressBar = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIText.new()

	var_8_20.id = "ProgressDesc"

	var_8_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_20:setText("", 0)
	var_8_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_20:SetAlignment(LUI.Alignment.Right)
	var_8_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -129, _1080p * -23, _1080p * 107, _1080p * 129)
	var_8_0:addElement(var_8_20)

	var_8_0.ProgressDesc = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIImage.new()

	var_8_22.id = "RewardImage"

	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -270, _1080p * 270, _1080p * 109.5, _1080p * 244.5)
	var_8_0:addElement(var_8_22)

	var_8_0.RewardImage = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIText.new()

	var_8_24.id = "ButtonPrompt"

	var_8_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_24:setText("", 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_24:SetAlignment(LUI.Alignment.Left)
	var_8_24:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_24:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 23, _1080p * -23, _1080p * -45, _1080p * -21)
	var_8_0:addElement(var_8_24)

	var_8_0.ButtonPrompt = var_8_24

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "RewardTitle"

	var_8_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_8_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 358, _1080p * 266, _1080p * 312)
	var_8_0:addElement(var_8_26)

	var_8_0.RewardTitle = var_8_26

	local var_8_27
	local var_8_28 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_8_1
	})

	var_8_28.id = "QualityWithText"

	var_8_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 183, _1080p * 373, _1080p * 405)
	var_8_0:addElement(var_8_28)

	var_8_0.QualityWithText = var_8_28

	local var_8_29
	local var_8_30 = LUI.UIImage.new()

	var_8_30.id = "Lock"

	var_8_30:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_8_30:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 56, _1080p * 111, _1080p * 149)
	var_8_0:addElement(var_8_30)

	var_8_0.Lock = var_8_30

	local function var_8_31()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Locked", var_8_33)

	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Locked", var_8_34)

	local var_8_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_30:RegisterAnimationSequence("Locked", var_8_35)

	local function var_8_36()
		var_8_12:AnimateSequence("Locked")
		var_8_16:AnimateSequence("Locked")
		var_8_30:AnimateSequence("Locked")
	end

	var_8_0._sequences.Locked = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Unlocked", var_8_38)

	local var_8_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Unlocked", var_8_39)

	local var_8_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_30:RegisterAnimationSequence("Unlocked", var_8_40)

	local function var_8_41()
		var_8_12:AnimateSequence("Unlocked")
		var_8_16:AnimateSequence("Unlocked")
		var_8_30:AnimateSequence("Unlocked")
	end

	var_8_0._sequences.Unlocked = var_8_41

	local var_8_42
	local var_8_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 270
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 109.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 244.5
		}
	}

	var_8_22:RegisterAnimationSequence("ConfigPlayercard", var_8_43)

	local function var_8_44()
		var_8_22:AnimateSequence("ConfigPlayercard")
	end

	var_8_0._sequences.ConfigPlayercard = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 63
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -72
		}
	}

	var_8_22:RegisterAnimationSequence("ConfigEmblem", var_8_46)

	local function var_8_47()
		var_8_22:AnimateSequence("ConfigEmblem")
	end

	var_8_0._sequences.ConfigEmblem = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_8_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_8_0.ProgressBar.Overlay
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_8_0.ProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_8_0.ProgressBar.Fill
		}
	}

	var_8_18:RegisterAnimationSequence("Complete", var_8_49)

	local function var_8_50()
		var_8_18:AnimateSequence("Complete")
	end

	var_8_0._sequences.Complete = var_8_50

	local var_8_51
	local var_8_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_8_0.ProgressBar.Overlay
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_8_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_8_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_8_0.ProgressBar.Fill
		}
	}

	var_8_18:RegisterAnimationSequence("Incomplete", var_8_52)

	local function var_8_53()
		var_8_18:AnimateSequence("Incomplete")
	end

	var_8_0._sequences.Incomplete = var_8_53

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WeaponMasterDetailsPanel", WeaponMasterDetailsPanel)
LockTable(_M)
