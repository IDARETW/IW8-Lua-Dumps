module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.icon and #arg_1_1.icon > 0 then
		arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1.icon))
	else
		arg_1_0.Icon:SetAlpha(0)
	end

	if arg_1_1.amountEarned and arg_1_1.amountNeeded and arg_1_1.amountNeeded > 0 then
		arg_1_0.ProgressBar:SetProgress(arg_1_1.amountEarned / arg_1_1.amountNeeded, 0)
		arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1.amountEarned, arg_1_1.amountNeeded))
	else
		arg_1_0.ProgressBar:SetAlpha(0)
		arg_1_0.ProgressDesc:SetAlpha(0)
	end

	if arg_1_1.isUnlocked then
		arg_1_0.Checkbox:SetValue(arg_1_1.isComplete)
		ACTIONS.AnimateSequence(arg_1_0, "Unlocked")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Locked")
	end

	if arg_1_1.rewardLoot then
		local var_1_0 = LOOT.GetTypeForID(arg_1_1.rewardLoot)
		local var_1_1 = LOOT.GetItemQualityWithID(var_1_0, arg_1_1.rewardLoot)
		local var_1_2 = LOOT.GetRarityImage(var_1_1)

		arg_1_0.Rarity:setImage(RegisterMaterial(var_1_2))
		LOOT.ApplyRarityIconColoring(arg_1_0.Rarity, var_1_1)
	else
		arg_1_0.Rarity:SetAlpha(0)
	end

	arg_1_0:SetButtonDisabled(not arg_1_1.isUnlocked)

	local var_1_3
	local var_1_4 = not arg_1_1.isUnlocked and "ButtonUpDisabled" or arg_1_1.isComplete and "ButtonUpCompleted" or "ButtonUp"

	ACTIONS.AnimateSequence(arg_1_0, var_1_4)

	arg_1_0._challenge = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		if arg_3_0._challenge then
			arg_3_0:dispatchEventToParent({
				name = "update_weapon_master_challenge_details",
				challenge = arg_3_0._challenge
			})
		end

		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if arg_4_0._challenge then
			ACTIONS.AnimateSequence(arg_2_0, arg_4_0._challenge.isComplete and "ButtonUpCompleted" or "ButtonUp")
		end
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		if arg_5_0._challenge then
			arg_5_0:dispatchEventToParent({
				name = "update_weapon_master_challenge_details",
				challenge = arg_5_0._challenge
			})
		end

		ACTIONS.AnimateSequence(arg_2_0, "ButtonOverDisabled")
	end)
end

function WeaponMasterButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 176 * _1080p, 0, 150 * _1080p)

	var_6_0.id = "WeaponMasterButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "ProgressBar"

	var_6_4.Overlay:SetRGBFromTable(SWATCHES.genericButton.border, 0)
	var_6_4.Fill:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 132, _1080p * 150)
	var_6_0:addElement(var_6_4)

	var_6_0.ProgressBar = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Background"

	var_6_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -18)
	var_6_0:addElement(var_6_6)

	var_6_0.Background = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Icon"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * -56, _1080p * 20)
	var_6_0:addElement(var_6_8)

	var_6_0.Icon = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "ProgressDesc"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_6_10:setText("1000/1000", 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -51, _1080p * -29)
	var_6_0:addElement(var_6_10)

	var_6_0.ProgressDesc = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "Checkbox"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, _1080p * 31, _1080p * 5, _1080p * 31)
	var_6_0:addElement(var_6_12)

	var_6_0.Checkbox = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "Rarity"

	var_6_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -31, _1080p * -5, _1080p * 5, _1080p * 31)
	var_6_0:addElement(var_6_14)

	var_6_0.Rarity = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "LockIcon"

	var_6_16:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_6_16:SetAlpha(0, 0)
	var_6_16:setImage(RegisterMaterial("icon_lock"), 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 29, _1080p * 7, _1080p * 29)
	var_6_0:addElement(var_6_16)

	var_6_0.LockIcon = var_6_16

	local function var_6_17()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Locked", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Locked", var_6_20)

	local function var_6_21()
		var_6_12:AnimateSequence("Locked")
		var_6_16:AnimateSequence("Locked")
	end

	var_6_0._sequences.Locked = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_6_0.ProgressBar.Fill
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonOver", var_6_23)

	local var_6_24 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOver", var_6_24)

	local function var_6_25()
		var_6_4:AnimateSequence("ButtonOver")
		var_6_10:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle,
			child = var_6_0.ProgressBar.Fill
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUp", var_6_27)

	local var_6_28 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.descText
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUp", var_6_28)

	local function var_6_29()
		var_6_4:AnimateSequence("ButtonUp")
		var_6_10:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOverDisabled", var_6_31)

	local var_6_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonOverDisabled", var_6_32)

	local function var_6_33()
		var_6_8:AnimateSequence("ButtonOverDisabled")
		var_6_10:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_33

	local var_6_34
	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.labelText
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUpDisabled", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextDisabled
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpDisabled", var_6_36)

	local function var_6_37()
		var_6_8:AnimateSequence("ButtonUpDisabled")
		var_6_10:AnimateSequence("ButtonUpDisabled")
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_37

	local var_6_38
	local var_6_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("Unlocked", var_6_39)

	local var_6_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("Unlocked", var_6_40)

	local function var_6_41()
		var_6_12:AnimateSequence("Unlocked")
		var_6_16:AnimateSequence("Unlocked")
	end

	var_6_0._sequences.Unlocked = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			child = var_6_0.ProgressBar.Fill
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUpCompleted", var_6_43)

	local var_6_44 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_10:RegisterAnimationSequence("ButtonUpCompleted", var_6_44)

	local function var_6_45()
		var_6_4:AnimateSequence("ButtonUpCompleted")
		var_6_10:AnimateSequence("ButtonUpCompleted")
	end

	var_6_0._sequences.ButtonUpCompleted = var_6_45

	var_6_0:addEventHandler("button_disable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUpDisabled")
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WeaponMasterButton", WeaponMasterButton)
LockTable(_M)
