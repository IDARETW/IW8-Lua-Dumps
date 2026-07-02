module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.icon and #arg_1_1.icon > 0 then
		arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1.icon))
	else
		arg_1_0.Icon:SetAlpha(0)
	end

	if arg_1_1.name and #arg_1_1.name > 0 then
		arg_1_0.Title:setText(arg_1_1.name)
	else
		arg_1_0.Title:SetAlpha(0)
	end

	if arg_1_1.desc and #arg_1_1.desc > 0 then
		arg_1_0.ChallengeText:setText(arg_1_1.desc)
	else
		arg_1_0.ChallengeText:SetAlpha(0)
	end

	if not arg_1_1.isUnlocked then
		ACTIONS.AnimateSequence(arg_1_0, "Locked")

		if arg_1_1.name and #arg_1_1.name > 0 and arg_1_1.prevChallengeName and #arg_1_1.prevChallengeName > 0 then
			arg_1_0.LockText:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE_X_TO_UNLOCK_Y", arg_1_1.prevChallengeName, arg_1_1.name))
		else
			arg_1_0.LockText:SetAlpha(0)
		end

		if arg_1_1.amountEarned and arg_1_1.amountNeeded and arg_1_1.amountNeeded > 0 then
			arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1.amountEarned, arg_1_1.amountNeeded))
			arg_1_0.ProgressBar:SetProgress(arg_1_1.amountEarned / arg_1_1.amountNeeded, 0)
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
		arg_1_0.Checkbox:SetValue(arg_1_1.isComplete)

		local var_1_0 = false

		if arg_1_1.amountEarned and arg_1_1.amountNeeded and arg_1_1.amountNeeded > 0 then
			arg_1_0.ProgressBar:SetProgress(arg_1_1.amountEarned / arg_1_1.amountNeeded, 0)
			arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1.amountEarned, arg_1_1.amountNeeded))

			var_1_0 = true
		end

		arg_1_0.ProgressBar:SetAlpha(var_1_0 and 1 or 0)
		arg_1_0.ProgressDesc:SetAlpha(var_1_0 and 1 or 0)
	end

	local var_1_1 = false

	if arg_1_1.rewardLoot then
		local var_1_2 = true
		local var_1_3 = LOOT.GetTypeForID(arg_1_1.rewardLoot)

		if var_1_3 == LOOT.itemTypes.PLAYERCARD then
			ACTIONS.AnimateSequence(arg_1_0, "ConfigPlayercard")
		elseif var_1_3 == LOOT.itemTypes.EMBLEM then
			ACTIONS.AnimateSequence(arg_1_0, "ConfigEmblem")
		else
			DebugPrint("WeaponMasterDetailsPanel: reward loot type not supported ( " .. var_1_3 .. " )")

			var_1_2 = false
		end

		if var_1_2 then
			local var_1_4 = LOOT.GetLootProperties(var_1_3, arg_1_1.rewardLoot)

			arg_1_0.RewardName:setText(Engine.CBBHFCGDIC("CHALLENGE/X_DASH_Y", var_1_4.name, var_1_4.class))
			arg_1_0.RewardImage:setImage(RegisterMaterial(var_1_4.image))
			arg_1_0.QualityWithText:UpdateQualityText(var_1_4.rarity)

			var_1_1 = true
		end
	end

	arg_1_0.RewardTitle:SetAlpha(var_1_1 and 1 or 0)
	arg_1_0.RewardName:SetAlpha(var_1_1 and 1 or 0)
	arg_1_0.RewardImage:SetAlpha(var_1_1 and 1 or 0)
	arg_1_0.QualityWithText:SetAlpha(var_1_1 and 1 or 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function WeaponMasterDetailsPanel(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 576 * _1080p, 0, 615 * _1080p)

	var_3_0.id = "WeaponMasterDetailsPanel"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Title"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(2000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(150)
	var_3_6:SetEndDelay(2000)
	var_3_6:SetCrossfadeTime(250)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 82, _1080p * -23, _1080p * 21, _1080p * 57)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Icon"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 66, _1080p * 15, _1080p * 63)
	var_3_0:addElement(var_3_8)

	var_3_0.Icon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "ChallengeText"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 436, _1080p * 107, _1080p * 129)
	var_3_0:addElement(var_3_10)

	var_3_0.ChallengeText = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "LockText"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -23, _1080p * 170, _1080p * 194)
	var_3_0:addElement(var_3_12)

	var_3_0.LockText = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "RewardName"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetStartupDelay(2000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(2000)
	var_3_14:SetAnimMoveSpeed(150)
	var_3_14:SetEndDelay(2000)
	var_3_14:SetCrossfadeTime(250)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 23, _1080p * -23, _1080p * 331, _1080p * 361)
	var_3_0:addElement(var_3_14)

	var_3_0.RewardName = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "Checkbox"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 58, _1080p * 109, _1080p * 151)
	var_3_0:addElement(var_3_16)

	var_3_0.Checkbox = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "ProgressBar"

	var_3_18.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_18.Overlay:SetAlpha(0.2, 0)
	var_3_18.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 66, _1080p * -23, _1080p * 133, _1080p * 151)
	var_3_0:addElement(var_3_18)

	var_3_0.ProgressBar = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "ProgressDesc"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_20:setText("", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Right)
	var_3_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -129, _1080p * -23, _1080p * 107, _1080p * 129)
	var_3_0:addElement(var_3_20)

	var_3_0.ProgressDesc = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "RewardImage"

	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -270, _1080p * 270, _1080p * 109.5, _1080p * 244.5)
	var_3_0:addElement(var_3_22)

	var_3_0.RewardImage = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIText.new()

	var_3_24.id = "PreviewPompt"

	var_3_24:setText("", 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Left)
	var_3_24:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 23, _1080p * -23, _1080p * -39, _1080p * -21)
	var_3_0:addElement(var_3_24)

	var_3_0.PreviewPompt = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "RewardTitle"

	var_3_26.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 358, _1080p * 266, _1080p * 312)
	var_3_0:addElement(var_3_26)

	var_3_0.RewardTitle = var_3_26

	local var_3_27
	local var_3_28 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_3_1
	})

	var_3_28.id = "QualityWithText"

	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 183, _1080p * 373, _1080p * 405)
	var_3_0:addElement(var_3_28)

	var_3_0.QualityWithText = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIImage.new()

	var_3_30.id = "Lock"

	var_3_30:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_3_30:setImage(RegisterMaterial("icon_lock"), 0)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 56, _1080p * 111, _1080p * 149)
	var_3_0:addElement(var_3_30)

	var_3_0.Lock = var_3_30

	local function var_3_31()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_31

	local var_3_32
	local var_3_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Locked", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Locked", var_3_34)

	local var_3_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Locked", var_3_35)

	local function var_3_36()
		var_3_12:AnimateSequence("Locked")
		var_3_16:AnimateSequence("Locked")
		var_3_30:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_36

	local var_3_37
	local var_3_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Unlocked", var_3_38)

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Unlocked", var_3_39)

	local var_3_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_30:RegisterAnimationSequence("Unlocked", var_3_40)

	local function var_3_41()
		var_3_12:AnimateSequence("Unlocked")
		var_3_16:AnimateSequence("Unlocked")
		var_3_30:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_41

	local var_3_42
	local var_3_43 = {
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

	var_3_22:RegisterAnimationSequence("ConfigPlayercard", var_3_43)

	local function var_3_44()
		var_3_22:AnimateSequence("ConfigPlayercard")
	end

	var_3_0._sequences.ConfigPlayercard = var_3_44

	local var_3_45
	local var_3_46 = {
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

	var_3_22:RegisterAnimationSequence("ConfigEmblem", var_3_46)

	local function var_3_47()
		var_3_22:AnimateSequence("ConfigEmblem")
	end

	var_3_0._sequences.ConfigEmblem = var_3_47

	local var_3_48
	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground,
			child = var_3_0.ProgressBar.Overlay
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.ProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_3_0.ProgressBar.Fill
		}
	}

	var_3_18:RegisterAnimationSequence("Complete", var_3_49)

	local function var_3_50()
		var_3_18:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_50

	local var_3_51
	local var_3_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_3_0.ProgressBar.Overlay
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.bodycopy,
			child = var_3_0.ProgressBar.Fill
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.ProgressBar.Fill
		}
	}

	var_3_18:RegisterAnimationSequence("Incomplete", var_3_52)

	local function var_3_53()
		var_3_18:AnimateSequence("Incomplete")
	end

	var_3_0._sequences.Incomplete = var_3_53

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponMasterDetailsPanel", WeaponMasterDetailsPanel)
LockTable(_M)
