module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.GenericOptionButtonBase.Title)
	arg_1_0.GenericOptionButtonBase.Title:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._isEquipped = arg_2_1

	assert(arg_2_0.Equipped)
	arg_2_0.GenericOptionButtonBase:SetEquipped(arg_2_1)
	ACTIONS.AnimateSequence(arg_2_0.Equipped, arg_2_1 and "On" or "Off")
end

function RefreshAnimation(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0._lastState ~= arg_3_1 then
		arg_3_0._lastState = arg_3_1

		WZWIP.AnimateThemeElement(arg_3_0, arg_3_1, {
			doSnapToState = arg_3_2
		})
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = LUI.Alignment.Left

	arg_4_0:SetNotifyOnLayoutInit(true)
	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		RefreshAnimation(arg_5_0, "ButtonOver")
	end)
	arg_4_0:addEventHandler("button_active", function(arg_6_0, arg_6_1)
		RefreshAnimation(arg_6_0, "ButtonActive")
	end)
	arg_4_0:addEventHandler("button_over_active", function(arg_7_0, arg_7_1)
		RefreshAnimation(arg_7_0, "ButtonOverActive")
	end)
	arg_4_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		RefreshAnimation(arg_8_0, "ButtonUp")
	end)
	arg_4_0:addEventHandler("button_disable_active", function(arg_9_0, arg_9_1)
		RefreshAnimation(arg_9_0, "ButtonDisabledActive")
	end)
	arg_4_0:addEventHandler("button_over_disable_active", function(arg_10_0, arg_10_1)
		RefreshAnimation(arg_10_0, "ButtonOverDisabledActive")
	end)
	arg_4_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		RefreshAnimation(arg_11_0, "ButtonOverDisabled")
	end)
	arg_4_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		RefreshAnimation(arg_12_0, "ButtonUpDisabled")
	end)

	arg_4_0.SetText = var_0_0
	arg_4_0.SetEquipped = var_0_1

	if IsLanguageArabic() then
		local var_4_1 = arg_4_0.Equipped:GetCurrentAnchorsAndPositions()
		local var_4_2 = arg_4_0.Lock:GetCurrentAnchorsAndPositions()
		local var_4_3 = arg_4_0.NewItemSmallIcon:GetCurrentAnchorsAndPositions()

		arg_4_0.Equipped:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_4_1.left * -1, var_4_1.right * -1, var_4_1.top, var_4_1.bottom)
		arg_4_0.Lock:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_4_2.left * -1, var_4_2.right * -1, var_4_2.top, var_4_2.bottom)
		arg_4_0.NewItemSmallIcon:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_4_3.right * -1, var_4_3.left * -1, var_4_3.top, var_4_3.bottom)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function GenericOptionButton(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIButton.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_13_0.id = "GenericOptionButton"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("GenericOptionButtonBase", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "GenericOptionButtonBase"

	var_13_4.Title:SetLeft(_1080p * 20, 0)
	var_13_4.Title:SetRight(_1080p * -10, 0)
	var_13_4.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW")), 0)
	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.GenericOptionButtonBase = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "Lock"

	var_13_6:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_13_6:SetAlpha(0, 0)
	var_13_6:setImage(RegisterMaterial("icon_lock"), 0)
	var_13_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -10, _1080p * -13, _1080p * 13)
	var_13_0:addElement(var_13_6)

	var_13_0.Lock = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "Equipped"

	var_13_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -36, _1080p * -12, _1080p * -12, _1080p * 12)
	var_13_0:addElement(var_13_8)

	var_13_0.Equipped = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "NewItemSmallIcon"

	var_13_10:SetAlpha(0, 0)
	var_13_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -27, _1080p * -19, _1080p * 15, _1080p * 23)
	var_13_0:addElement(var_13_10)

	var_13_0.NewItemSmallIcon = var_13_10

	local var_13_11
	local var_13_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("DefaultSequence", var_13_12)

	local function var_13_13()
		var_13_6:AnimateSequence("DefaultSequence")
	end

	var_13_0._sequences.DefaultSequence = var_13_13

	local var_13_14
	local var_13_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOver", var_13_15)

	local function var_13_16()
		var_13_6:AnimateSequence("ButtonOver")
	end

	var_13_0._sequences.ButtonOver = var_13_16

	local var_13_17
	local var_13_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUp", var_13_18)

	local function var_13_19()
		var_13_6:AnimateSequence("ButtonUp")
	end

	var_13_0._sequences.ButtonUp = var_13_19

	local function var_13_20()
		return
	end

	var_13_0._sequences.Locked = var_13_20

	local function var_13_21()
		return
	end

	var_13_0._sequences.NewNotification = var_13_21

	local var_13_22
	local var_13_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverDisabled", var_13_23)

	local function var_13_24()
		var_13_6:AnimateSequence("ButtonOverDisabled")
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_24

	local var_13_25
	local var_13_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabled", var_13_26)

	local function var_13_27()
		var_13_6:AnimateSequence("ButtonUpDisabled")
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_27

	local function var_13_28()
		return
	end

	var_13_0._sequences.ButtonUpSnap = var_13_28

	local var_13_29
	local var_13_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonUpDisabledSnap", var_13_30)

	local function var_13_31()
		var_13_6:AnimateSequence("ButtonUpDisabledSnap")
	end

	var_13_0._sequences.ButtonUpDisabledSnap = var_13_31

	local var_13_32
	local var_13_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonActive", var_13_33)

	local function var_13_34()
		var_13_6:AnimateSequence("ButtonActive")
	end

	var_13_0._sequences.ButtonActive = var_13_34

	local var_13_35
	local var_13_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverActive", var_13_36)

	local function var_13_37()
		var_13_6:AnimateSequence("ButtonOverActive")
	end

	var_13_0._sequences.ButtonOverActive = var_13_37

	local var_13_38
	local var_13_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonDisabledActive", var_13_39)

	local function var_13_40()
		var_13_6:AnimateSequence("ButtonDisabledActive")
	end

	var_13_0._sequences.ButtonDisabledActive = var_13_40

	local var_13_41
	local var_13_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ButtonOverDisabledActive", var_13_42)

	local function var_13_43()
		var_13_6:AnimateSequence("ButtonOverDisabledActive")
	end

	var_13_0._sequences.ButtonOverDisabledActive = var_13_43

	local var_13_44
	local var_13_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("NotificationOn", var_13_45)

	local function var_13_46()
		var_13_10:AnimateSequence("NotificationOn")
	end

	var_13_0._sequences.NotificationOn = var_13_46

	local var_13_47
	local var_13_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_10:RegisterAnimationSequence("NotificationOff", var_13_48)

	local function var_13_49()
		var_13_10:AnimateSequence("NotificationOff")
	end

	var_13_0._sequences.NotificationOff = var_13_49

	local var_13_50
	local var_13_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_13_0.GenericOptionButtonBase.Title
		}
	}

	var_13_4:RegisterAnimationSequence("WZWipSetup", var_13_51)

	local function var_13_52()
		var_13_4:AnimateSequence("WZWipSetup")
	end

	var_13_0._sequences.WZWipSetup = var_13_52

	PostLoadFunc(var_13_0, var_13_1, arg_13_1)
	ACTIONS.AnimateSequence(var_13_0, "DefaultSequence")

	return var_13_0
end

MenuBuilder.registerType("GenericOptionButton", GenericOptionButton)
LockTable(_M)
