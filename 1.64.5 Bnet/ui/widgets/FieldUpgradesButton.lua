module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideRestriction")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	local var_2_0 = LOOT.GetItemID(LOOT.itemTypes.SUPER, arg_2_5)

	if not CONDITIONS.IsThirdGameMode() then
		arg_2_0.isNew = Loot.HDJCADADF(arg_2_0._controllerIndex, var_2_0)
		arg_2_0.itemRef = arg_2_5
	end

	if arg_2_0.isNew then
		arg_2_0.NewItemNotification:UpdateBreadcrumbByID(arg_2_0._controllerIndex, var_2_0, true)
	end

	arg_2_0.Image:setImage(RegisterMaterial(arg_2_1))
	ACTIONS.AnimateSequence(arg_2_0.Equipped, arg_2_3 and "On" or "Off")

	if arg_2_3 then
		arg_2_0.NewItemNotification:UpdateAlpha(0, 0, true)
	end

	ACTIONS.AnimateSequence(arg_2_0, arg_2_2 and "Unlocked" or "Locked")
	var_0_0(arg_2_0, arg_2_4)
	arg_2_0:SetButtonDisabled(not arg_2_2)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Equipped)
	assert(arg_3_0.Image)

	arg_3_0.RefreshData = var_0_1
	arg_3_0._controllerIndex = arg_3_1
	arg_3_0.itemRef = ""
	arg_3_0.isNew = false

	local function var_3_0(arg_4_0, arg_4_1)
		if arg_4_0.MenuButtonOver then
			arg_4_0.MenuButtonOver(arg_4_0, arg_4_1)
		end
	end

	arg_3_0:registerEventHandler("button_over_disable", var_3_0)

	local function var_3_1(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
		ACTIONS.AnimateSequence(arg_3_0, "Expand")

		if arg_5_0.MenuButtonOver then
			arg_5_0.MenuButtonOver(arg_5_0, arg_5_1)
		end
	end

	arg_3_0:registerEventHandler("button_over", var_3_1)
	arg_3_0:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
		if arg_6_0.MenuButtonAction then
			arg_6_0.MenuButtonAction(arg_6_0, arg_6_1)
		end
	end)
	arg_3_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_7_0.isNew then
			local var_7_0 = LOOT.GetItemID(LOOT.itemTypes.SUPER, arg_7_0.itemRef)

			arg_7_0.NewItemNotification:ClearBreadcrumbByID(arg_7_0._controllerIndex, var_7_0, true)
		end
	end)
end

function FieldUpgradesButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 84 * _1080p, 0, 116 * _1080p)

	var_8_0.id = "FieldUpgradesButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "LoadoutItemButtonBackground"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.LoadoutItemButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Image"

	var_8_6:SetAlpha(0.6, 0)
	var_8_6:setImage(RegisterMaterial("hud_icon_killstreak_apache"), 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -35, _1080p * 35)
	var_8_0:addElement(var_8_6)

	var_8_0.Image = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "Equipped"

	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -23, _1080p * -7, _1080p * 7, _1080p * 23)
	var_8_0:addElement(var_8_8)

	var_8_0.Equipped = var_8_8

	local var_8_9

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		var_8_9 = LUI.UIImage.new()
		var_8_9.id = "Lock"

		var_8_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_8_9:SetAlpha(0, 0)
		var_8_9:setImage(RegisterMaterial("icon_lock"), 0)
		var_8_9:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
		var_8_0:addElement(var_8_9)

		var_8_0.Lock = var_8_9
	end

	local var_8_10
	local var_8_11 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_8_1
	})

	var_8_11.id = "NewItemNotification"

	var_8_11:SetAlpha(0, 0)
	var_8_11:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_8_0:addElement(var_8_11)

	var_8_0.NewItemNotification = var_8_11

	local var_8_12
	local var_8_13 = LUI.UIImage.new()

	var_8_13.id = "RestrictionWarning"

	var_8_13:SetAlpha(0, 0)
	var_8_13:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 31, 0, _1080p * 30)
	var_8_0:addElement(var_8_13)

	var_8_0.RestrictionWarning = var_8_13

	local function var_8_14()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_14

	local var_8_15
	local var_8_16 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_16)

	local var_8_17 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_17)

	local var_8_18 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUp", var_8_18)

	local var_8_19 = {
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

	var_8_13:RegisterAnimationSequence("ButtonUp", var_8_19)

	local function var_8_20()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
		var_8_11:AnimateSequence("ButtonUp")
		var_8_13:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_20

	local var_8_21
	local var_8_22 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_22)

	local var_8_23 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_23)

	local var_8_24 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOver", var_8_24)

	local var_8_25 = {
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

	var_8_13:RegisterAnimationSequence("ButtonOver", var_8_25)

	local function var_8_26()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
		var_8_11:AnimateSequence("ButtonOver")
		var_8_13:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_6:RegisterAnimationSequence("Disable", var_8_28)

	local function var_8_29()
		var_8_6:AnimateSequence("Disable")
	end

	var_8_0._sequences.Disable = var_8_29

	local var_8_30
	local var_8_31 = {
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

	var_8_6:RegisterAnimationSequence("Enable", var_8_31)

	local function var_8_32()
		var_8_6:AnimateSequence("Enable")
	end

	var_8_0._sequences.Enable = var_8_32

	local var_8_33

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_34 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_9:RegisterAnimationSequence("Locked", var_8_34)
	end

	local function var_8_35()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_9:AnimateSequence("Locked")
		end
	end

	var_8_0._sequences.Locked = var_8_35

	local var_8_36

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_9:RegisterAnimationSequence("Unlocked", var_8_37)
	end

	local function var_8_38()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_9:AnimateSequence("Unlocked")
		end
	end

	var_8_0._sequences.Unlocked = var_8_38

	local var_8_39
	local var_8_40 = {
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

	var_8_4:RegisterAnimationSequence("Expand", var_8_40)

	local function var_8_41()
		var_8_4:AnimateSequence("Expand")
	end

	var_8_0._sequences.Expand = var_8_41

	local var_8_42
	local var_8_43 = {
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

	var_8_4:RegisterAnimationSequence("Contract", var_8_43)

	local function var_8_44()
		var_8_4:AnimateSequence("Contract")
	end

	var_8_0._sequences.Contract = var_8_44

	local var_8_45
	local var_8_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("ShowRestriction", var_8_46)

	local function var_8_47()
		var_8_13:AnimateSequence("ShowRestriction")
	end

	var_8_0._sequences.ShowRestriction = var_8_47

	local var_8_48
	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("HideRestriction", var_8_49)

	local function var_8_50()
		var_8_13:AnimateSequence("HideRestriction")
	end

	var_8_0._sequences.HideRestriction = var_8_50

	var_8_0:addEventHandler("button_up", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
		ACTIONS.AnimateSequence(var_8_0, "Contract")
	end)
	var_8_0:addEventHandler("disable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Disable")
	end)
	var_8_0:addEventHandler("enable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Enable")
	end)
	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("FieldUpgradesButton", FieldUpgradesButton)
LockTable(_M)
