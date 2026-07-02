module(..., package.seeall)

function SetupVehicleInfo(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.VehicleName:setText(Engine.CBBHFCGDIC(arg_1_1.name))

	if arg_1_1.vehicleIcon and #arg_1_1.vehicleIcon > 0 then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.vehicleIcon))
	end

	arg_1_0:SetButtonDisabled(arg_1_1.isLocked)

	if arg_1_1.isLocked then
		ACTIONS.AnimateSequence(arg_1_0, "Locked")
	end

	if not CONDITIONS.IsBattleTracksEnabled() then
		local var_1_0 = CONDITIONS.IsVehicleHornsEnabled() and "ShowAllText" or "ShowCamoText"

		ACTIONS.AnimateSequence(arg_1_0, var_1_0)
	end

	arg_1_0.NewItemSmallIcon:UpdateAlpha(arg_1_1.isNew and 1 or 0)
	arg_1_0.LockedText:setText(Engine.CBBHFCGDIC("VEHICLES/SKINS_LOCKED", arg_1_1.name), 0)

	arg_1_0._vehicleInfo = arg_1_1
	arg_1_0._equippedCamoInfo = arg_1_2
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.SetupVehicleInfo = SetupVehicleInfo

	arg_2_0:addEventHandler("button_over", function()
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")
		arg_2_0:dispatchEventToParent({
			name = "vehicle_button_over",
			vehicleInfo = arg_2_0._vehicleInfo,
			equippedCamoInfo = arg_2_0._equippedCamoInfo
		})
	end)
	arg_2_0:addEventHandler("button_up", function()
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function()
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("button_over_disable", function()
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOverDisabled")
		arg_2_0:dispatchEventToParent({
			name = "vehicle_button_over",
			vehicleInfo = arg_2_0._vehicleInfo,
			equippedCamoInfo = arg_2_0._equippedCamoInfo
		})
	end)
	arg_2_0:addEventHandler("button_action", function()
		LUI.FlowManager.GetScopedData("VehicleSelect").currentVehicleRef = arg_2_0._vehicleInfo.ref

		LUI.FlowManager.RequestAddMenu("VehicleCustomization", true, arg_2_1, false, {
			vehicleInfo = arg_2_0._vehicleInfo
		})
	end)
end

function VehicleButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 385 * _1080p, 0, 90 * _1080p)

	var_8_0.id = "VehicleButton"
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
	var_8_6:setImage(RegisterMaterial("customization_empty_slot"), 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -139, _1080p * -11, _1080p * 19, _1080p * 83)
	var_8_0:addElement(var_8_6)

	var_8_0.Image = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "VehicleName"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(2000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(2000)
	var_8_8:SetAnimMoveSpeed(150)
	var_8_8:SetEndDelay(2000)
	var_8_8:SetCrossfadeTime(250)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 14, _1080p * -151, _1080p * 11, _1080p * 39)
	var_8_0:addElement(var_8_8)

	var_8_0.VehicleName = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "NewItemSmallIcon"

	var_8_10:SetAlpha(0, 0)
	var_8_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_8_0:addElement(var_8_10)

	var_8_0.NewItemSmallIcon = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Lock"

	var_8_12:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_12:SetAlpha(0, 0)
	var_8_12:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -25, _1080p * -5, _1080p * 5, _1080p * 25)
	var_8_0:addElement(var_8_12)

	var_8_0.Lock = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIStyledText.new()

	var_8_14.id = "LockedText"

	var_8_14:SetAlpha(0, 0)
	var_8_14:setText(Engine.CBBHFCGDIC("VEHICLES/SKINS_LOCKED"), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Left)
	var_8_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_8_14:SetStartupDelay(1000)
	var_8_14:SetLineHoldTime(400)
	var_8_14:SetAnimMoveTime(2000)
	var_8_14:SetAnimMoveSpeed(150)
	var_8_14:SetEndDelay(1000)
	var_8_14:SetCrossfadeTime(400)
	var_8_14:SetFadeInTime(300)
	var_8_14:SetFadeOutTime(300)
	var_8_14:SetMaxVisibleLines(2)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 234, _1080p * 42, _1080p * 62)
	var_8_0:addElement(var_8_14)

	var_8_0.LockedText = var_8_14

	local function var_8_15()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("Locked", var_8_17)

	local function var_8_18()
		var_8_12:AnimateSequence("Locked")
	end

	var_8_0._sequences.Locked = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_20)

	local var_8_21 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_21)

	local function var_8_22()
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_22

	local var_8_23
	local var_8_24 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_24)

	local var_8_25 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_25)

	local function var_8_26()
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_26

	local var_8_27
	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverDisabled", var_8_28)

	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOverDisabled", var_8_29)

	local var_8_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonOverDisabled", var_8_30)

	local function var_8_31()
		var_8_6:AnimateSequence("ButtonOverDisabled")
		var_8_8:AnimateSequence("ButtonOverDisabled")
		var_8_14:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_31

	local var_8_32
	local var_8_33 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_33)

	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUpDisabled", var_8_34)

	local var_8_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ButtonUpDisabled", var_8_35)

	local function var_8_36()
		var_8_6:AnimateSequence("ButtonUpDisabled")
		var_8_8:AnimateSequence("ButtonUpDisabled")
		var_8_14:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_36

	local function var_8_37()
		return
	end

	var_8_0._sequences.ShowCamoText = var_8_37

	local function var_8_38()
		return
	end

	var_8_0._sequences.ShowAllText = var_8_38

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("VehicleButton", VehicleButton)
LockTable(_M)
