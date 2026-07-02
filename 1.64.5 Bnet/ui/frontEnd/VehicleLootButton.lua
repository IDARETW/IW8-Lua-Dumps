module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.ref)
	arg_1_0:SetButtonDisabled(not arg_1_2.isUnlocked)
	arg_1_0.Lock:SetAlpha(arg_1_2.isUnlocked and 0 or 1)
	arg_1_0.LootName:setText(Engine.CBBHFCGDIC(arg_1_2.name))

	if arg_1_2.rarity then
		arg_1_0.QualityMarker:SetAlpha(not arg_1_2.isUnlocked and 0.4 or 1)

		local var_1_0 = LOOT.GetRarityColor(arg_1_2.rarity)

		arg_1_0.QualityMarker:SetRGBFromTable(var_1_0)
	else
		arg_1_0.QualityMarker:SetAlpha(0)
	end

	ACTIONS.AnimateSequence(arg_1_0.Selected, arg_1_2.isSelected and "On" or "Off")

	arg_1_2.isNew = arg_1_0.NewItemNotification:UpdateBreadcrumbByID(arg_1_1, arg_1_2.lootID, true)

	if arg_1_2.isChallenge then
		arg_1_0.Lock:setImage(RegisterMaterial("menu_icon_challenge"), 0)
	end

	arg_1_0._itemData = arg_1_2
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateLootButton = var_0_0

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		arg_3_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_2_0._itemData
		})
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonOver")
	end)
	arg_2_0:addEventHandler("button_over_disable", function(arg_4_0, arg_4_1)
		arg_4_0:dispatchEventToParent({
			name = "loot_button_over",
			itemData = arg_2_0._itemData
		})
		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOverDisabled")
	end)
	arg_2_0:registerEventHandler("button_up", function(arg_5_0, arg_5_1)
		arg_2_0.NewItemNotification:ClearBreadcrumbByID(arg_2_1, arg_2_0._itemData.lootID)

		arg_2_0._itemData.isNew = false

		if arg_2_0:GetCurrentMenu() then
			arg_2_0:dispatchEventToCurrentMenu({
				name = "loot_button_up",
				itemData = arg_2_0._itemData
			})
		end

		WZWIP.AnimateThemeElement(arg_5_0, "ButtonUp")
	end)
	arg_2_0:addEventHandler("button_disable", function(arg_6_0, arg_6_1)
		arg_6_0:dispatchEventToParent({
			name = "loot_button_up",
			itemData = arg_2_0._itemData
		})
		WZWIP.AnimateThemeElement(arg_6_0, "ButtonUpDisabled")
	end)
	arg_2_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		arg_7_0:dispatchEventToParent({
			name = "loot_button_action",
			itemData = arg_2_0._itemData
		})
	end)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function VehicleLootButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 48 * _1080p)

	var_8_0.id = "VehicleLootButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericButtonBackground"

	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericButtonBackground = var_8_4

	local var_8_5
	local var_8_6 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_8_7 = LUI.UIBorder.new(var_8_6)

	var_8_7.id = "Border"

	var_8_7:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_8_7:SetAlpha(0, 0)
	var_8_7:SetBorderThicknessLeft(_1080p * 0, 0)
	var_8_7:SetBorderThicknessRight(_1080p * 0, 0)
	var_8_7:SetBorderThicknessBottom(_1080p * 0, 0)
	var_8_0:addElement(var_8_7)

	var_8_0.Border = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "Selected"

	var_8_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -30, _1080p * -10, _1080p * -10, _1080p * 10)
	var_8_0:addElement(var_8_9)

	var_8_0.Selected = var_8_9

	local var_8_10
	local var_8_11 = LUI.UIStyledText.new()

	var_8_11.id = "LootName"

	var_8_11:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_11:setText("Name", 0)
	var_8_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_11:SetAlignment(LUI.Alignment.Left)
	var_8_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_11:SetStartupDelay(2000)
	var_8_11:SetLineHoldTime(400)
	var_8_11:SetAnimMoveTime(2000)
	var_8_11:SetAnimMoveSpeed(150)
	var_8_11:SetEndDelay(2000)
	var_8_11:SetCrossfadeTime(250)
	var_8_11:SetFadeInTime(300)
	var_8_11:SetFadeOutTime(300)
	var_8_11:SetMaxVisibleLines(1)
	var_8_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 27, _1080p * 420, _1080p * 13, _1080p * 37)
	var_8_0:addElement(var_8_11)

	var_8_0.LootName = var_8_11

	local var_8_12
	local var_8_13 = LUI.UIImage.new()

	var_8_13.id = "Lock"

	var_8_13:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_8_13:SetAlpha(0, 0)
	var_8_13:setImage(RegisterMaterial("icon_lock"), 0)
	var_8_13:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -29, _1080p * -9, _1080p * -10, _1080p * 10)
	var_8_0:addElement(var_8_13)

	var_8_0.Lock = var_8_13

	local var_8_14
	local var_8_15 = LUI.UIImage.new()

	var_8_15.id = "QualityMarker"

	var_8_15:SetPixelGridEnabled(true)
	var_8_15:SetPixelGridContrast(0.5, 0)
	var_8_15:SetPixelGridBlockWidth(2, 0)
	var_8_15:SetPixelGridBlockHeight(2, 0)
	var_8_15:SetPixelGridGutterWidth(1, 0)
	var_8_15:SetPixelGridGutterHeight(1, 0)
	var_8_15:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_8_0:addElement(var_8_15)

	var_8_0.QualityMarker = var_8_15

	local var_8_16
	local var_8_17 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_8_1
	})

	var_8_17.id = "NewItemNotification"

	var_8_17:SetAlpha(0, 0)
	var_8_17:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -15, _1080p * -4, _1080p * 4)
	var_8_0:addElement(var_8_17)

	var_8_0.NewItemNotification = var_8_17

	local function var_8_18()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOver", var_8_20)

	local function var_8_21()
		var_8_11:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUp", var_8_23)

	local function var_8_24()
		var_8_11:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonOverDisabled", var_8_26)

	local function var_8_27()
		var_8_11:AnimateSequence("ButtonOverDisabled")
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_8_11:RegisterAnimationSequence("ButtonUpDisabled", var_8_29)

	local function var_8_30()
		var_8_11:AnimateSequence("ButtonUpDisabled")
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_30

	local var_8_31
	local var_8_32 = {
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

	var_8_11:RegisterAnimationSequence("WZWipSetup", var_8_32)

	local function var_8_33()
		var_8_11:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_33

	local var_8_34
	local var_8_35 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipButtonUp", var_8_35)

	local function var_8_36()
		var_8_11:AnimateSequence("WZWipButtonUp")
	end

	var_8_0._sequences.WZWipButtonUp = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = 0.3,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipButtonUpDisabled", var_8_38)

	local function var_8_39()
		var_8_11:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_8_0._sequences.WZWipButtonUpDisabled = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipButtonOver", var_8_41)

	local function var_8_42()
		var_8_11:AnimateSequence("WZWipButtonOver")
	end

	var_8_0._sequences.WZWipButtonOver = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_11:RegisterAnimationSequence("WZWipButtonOverDisabled", var_8_44)

	local function var_8_45()
		var_8_11:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_8_0._sequences.WZWipButtonOverDisabled = var_8_45

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("VehicleLootButton", VehicleLootButton)
LockTable(_M)
