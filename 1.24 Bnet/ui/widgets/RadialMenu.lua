module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if LUI.IsLastInputGamepad(arg_1_1) then
		local var_1_0 = arg_1_0:GetLastUsedItem()

		arg_1_0:SetSelection(var_1_0)
		arg_1_0:SetKeepSelectionWhileInDeadZone(true, true)
	end
end

local function var_0_1(arg_2_0)
	return arg_2_0._selectedIndex
end

local function var_0_2(arg_3_0)
	return arg_3_0._widgets[arg_3_0._selectedIndex + 1]
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	return arg_4_0:IsMouseInside() or arg_4_0._entireRadialMenuHandleMouse
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._keyboardButtonTapThresholdMs = 125
	arg_5_0._gamepadButtonTapThresholdMs = 180
	arg_5_0._brLayoutGamepadButtonTapThresholdMs = 250
	arg_5_0._entireRadialMenuHandleMouse = false
	arg_5_0._widgets = {}
	arg_5_0._selectedIndex = -1
	arg_5_2.controllerIndex = arg_5_1

	function arg_5_2.buildChild(arg_6_0)
		local var_6_0 = MenuBuilder.BuildRegisteredType("RadialMenu8Slice", {
			controllerIndex = arg_5_2.controllerIndex,
			index = arg_6_0
		})

		arg_5_0._widgets[arg_6_0 + 1] = var_6_0
		var_6_0._isGimmeSlot = GESTURES.IsGimmeSlotActive(arg_6_0, arg_5_1)

		local var_6_1 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.radial[arg_6_0]:get()
		local var_6_2
		local var_6_3
		local var_6_4

		if var_6_1 > LOOT.emptyID then
			var_6_2 = LOOT.GetTypeForID(var_6_1)
			var_6_3 = LOOT.GetItemRef(var_6_2, var_6_1)
			var_6_4 = LOOT.GetItemImage(var_6_2, var_6_3)
		end

		if var_6_4 and var_6_4 ~= "" then
			var_6_0._itemIndex = LOOT.GetIndexForRef(var_6_2, var_6_3)
			var_6_0._lootType = var_6_2
			var_6_0._itemRef = var_6_3
			var_6_0._isAvailable = not var_6_0._isGimmeSlot or not Engine.DDJFBBJAIG()

			var_6_0.Icon:setImage(RegisterMaterial(var_6_4))
			var_6_0.Icon:SetAlpha(1)
			ACTIONS.AnimateSequence(var_6_0, var_6_0._isAvailable and "Available" or "Unavailable")
		else
			var_6_0._itemIndex = -1

			var_6_0.Icon:SetAlpha(0)
			ACTIONS.AnimateSequence(var_6_0, "Unavailable")
		end

		return var_6_0
	end

	function arg_5_2.selectionChanged(arg_7_0)
		local var_7_0

		arg_5_0._currentSelectionIndex = arg_7_0

		if arg_5_0._oldSelectedWidget then
			ACTIONS.AnimateSequence(arg_5_0._oldSelectedWidget, arg_5_0._oldSelectedWidget._isAvailable and "Available" or "Unavailable")
		end

		arg_5_0._selectedIndex = arg_7_0

		if arg_7_0 == -1 then
			arg_5_0._selectionArrow:SetAlpha(0)
			arg_5_0.ItemName:setText("")

			if not CONDITIONS.InFrontend(arg_5_0) then
				arg_5_0.ReleaseActionLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_RELEASE"))
			end
		else
			arg_5_0._selectionArrow:SetAlpha(1)

			var_7_0 = arg_5_0._widgets[arg_7_0 + 1]

			if var_7_0._itemIndex ~= -1 then
				local var_7_1 = LOOT.GetItemName(var_7_0._lootType, var_7_0._itemRef)

				if var_7_0._isGimmeSlot and Engine.DDJFBBJAIG() then
					arg_5_0.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/X_NL_RESERVED", var_7_1))
				else
					arg_5_0.ItemName:setText(var_7_1)
				end
			elseif var_7_0._isGimmeSlot and Engine.DDJFBBJAIG() then
				arg_5_0.ItemName:setText(Engine.CBBHFCGDIC("LUA_MENU/RESERVED"))
			else
				arg_5_0.ItemName:setText("")
			end

			if LUI.IsLastInputKeyboardMouse(arg_5_1) and var_7_0 then
				ACTIONS.AnimateSequence(var_7_0, "ExpandedSelection")
			end

			ACTIONS.AnimateSequence(var_7_0, var_7_0._isAvailable and "AvailableSelected" or "UnavailableSelected")
			ACTIONS.AnimateSequence(arg_5_0, var_7_0._isAvailable and "Available" or "Unavailable")

			if not CONDITIONS.InFrontend(arg_5_0) then
				arg_5_0.ReleaseActionLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_RELEASE"))
			end
		end

		arg_5_0._oldSelectedWidget = var_7_0
	end

	arg_5_0.GetSelectedIndex = var_0_1
	arg_5_0.GetSelectedWidget = var_0_2
	arg_5_0.SetInitialSelection = var_0_0
	arg_5_0._currentSelectionIndex = -1
	arg_5_0._closeRadialWidgetOverride = true
	arg_5_2.drawCircleInCode = false

	function arg_5_2.buildArrow()
		arg_5_0._selectionArrow = MenuBuilder.BuildRegisteredType("RadialSelectionArrow", {
			controllerIndex = arg_5_1
		})

		arg_5_0._selectionArrow:SetAlpha(0)

		return arg_5_0._selectionArrow
	end

	arg_5_0:SetupRadialMenu(arg_5_2)
	arg_5_0:SetHandleMouse(true)

	arg_5_0.IsPositionInside = var_0_3

	local function var_5_0(arg_9_0, arg_9_1)
		if not Engine.DDJFBBJAIG() or CONDITIONS.IsNewBarracksIdentityEnabled() then
			arg_9_0.BackButton:SetAlpha(0)
			arg_9_0.BackButton:SetFocusable(false)
		else
			arg_9_0.BackButton:SetAlpha(LUI.IsLastInputKeyboardMouse(arg_5_1) and 1 or 0)
			arg_9_0.BackButton:SetFocusable(LUI.IsLastInputKeyboardMouse(arg_5_1) and true or false)
		end

		arg_9_0._buttonTapThreshold = LUI.IsLastInputKeyboardMouse(arg_9_1.controllerIndex) and arg_9_0._keyboardButtonTapThresholdMs or arg_9_0._gamepadButtonTapThresholdMs
		arg_9_0._brButtonLayoutTapThreshold = LUI.IsLastInputGamepad(arg_9_1.controllerIndex) and arg_9_0._brLayoutGamepadButtonTapThresholdMs
	end

	arg_5_0:addAndCallEventHandler("update_input_type", var_5_0, {
		controllerIndex = arg_5_1
	})

	if CONDITIONS.InFrontend(arg_5_0) then
		ACTIONS.AnimateSequence(arg_5_0, "InFrontend")
	end
end

function RadialMenu(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_10_0.id = "RadialMenu"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "RadialInnerBase"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.7, 0)
	var_10_4:setImage(RegisterMaterial("radial_inner_base"), 0)
	var_10_0:addElement(var_10_4)

	var_10_0.RadialInnerBase = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIStyledText.new()

	var_10_6.id = "ItemName"

	var_10_6:setText("", 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_6:SetAlignment(LUI.Alignment.Center)
	var_10_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_6:SetTintFontIcons(true)
	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -112, _1080p * 112, _1080p * -11, _1080p * 11)
	var_10_0:addElement(var_10_6)

	var_10_0.ItemName = var_10_6

	local var_10_7

	if not CONDITIONS.InFrontend(var_10_0) then
		var_10_7 = LUI.UIStyledText.new()
		var_10_7.id = "ReleaseActionLabel"

		var_10_7:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_10_7:setText(Engine.CBBHFCGDIC("LUA_MENU/RADIAL_RELEASE"), 0)
		var_10_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_7:SetAlignment(LUI.Alignment.Center)
		var_10_7:SetTintFontIcons(true)
		var_10_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -97, _1080p * 3, _1080p * -192, _1080p * -172)
		var_10_0:addElement(var_10_7)

		var_10_0.ReleaseActionLabel = var_10_7
	end

	local var_10_8
	local var_10_9 = LUI.UIStyledText.new()

	var_10_9.id = "CommandsLabel"

	var_10_9:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_9:setText(Engine.CBBHFCGDIC("LUA_MENU/SELECT"), 0)
	var_10_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_9:SetWordWrap(false)
	var_10_9:SetAlignment(LUI.Alignment.Center)
	var_10_9:SetTintFontIcons(true)
	var_10_9:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -3, _1080p * 97, _1080p * -192, _1080p * -172)
	var_10_0:addElement(var_10_9)

	var_10_0.CommandsLabel = var_10_9

	local var_10_10
	local var_10_11 = LUI.UIStyledText.new()

	var_10_11.id = "CancelLabel"

	var_10_11:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_11:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_10_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_11:SetAlignment(LUI.Alignment.Center)
	var_10_11:SetTintFontIcons(true)
	var_10_11:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -50, _1080p * 50, _1080p * -192, _1080p * -172)
	var_10_0:addElement(var_10_11)

	var_10_0.CancelLabel = var_10_11

	local var_10_12

	if not CONDITIONS.InFrontend(var_10_0) then
		var_10_12 = LUI.UIText.new()
		var_10_12.id = "DPadButton"

		var_10_12:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_10_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_DPAD_UP_BUTTON"), 0)
		var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_12:SetAlignment(LUI.Alignment.Center)
		var_10_12:SetTintFontIcons(true)
		var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -83, _1080p * -11, _1080p * 284, _1080p * 314)
		var_10_0:addElement(var_10_12)

		var_10_0.DPadButton = var_10_12
	end

	local var_10_13
	local var_10_14 = LUI.UIStyledText.new()

	var_10_14.id = "CommandsButton"

	var_10_14:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_14:setText(Engine.CBBHFCGDIC("PLATFORM/RIGHT_STICK"), 0)
	var_10_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_14:SetAlignment(LUI.Alignment.Center)
	var_10_14:SetTintFontIcons(true)
	var_10_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_14:SetStartupDelay(1000)
	var_10_14:SetLineHoldTime(400)
	var_10_14:SetAnimMoveTime(150)
	var_10_14:SetAnimMoveSpeed(50)
	var_10_14:SetEndDelay(1000)
	var_10_14:SetCrossfadeTime(400)
	var_10_14:SetFadeInTime(300)
	var_10_14:SetFadeOutTime(300)
	var_10_14:SetMaxVisibleLines(1)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 11, _1080p * 83, _1080p * -228, _1080p * -198)
	var_10_0:addElement(var_10_14)

	var_10_0.CommandsButton = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIStyledText.new()

	var_10_16.id = "CancelMouseButton"

	var_10_16:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_16:setText(Engine.CBBHFCGDIC("KEY/MOUSE2"), 0)
	var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_16:SetAlignment(LUI.Alignment.Center)
	var_10_16:SetTintFontIcons(true)
	var_10_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_16:SetStartupDelay(1000)
	var_10_16:SetLineHoldTime(400)
	var_10_16:SetAnimMoveTime(150)
	var_10_16:SetAnimMoveSpeed(50)
	var_10_16:SetEndDelay(1000)
	var_10_16:SetCrossfadeTime(400)
	var_10_16:SetFadeInTime(300)
	var_10_16:SetFadeOutTime(300)
	var_10_16:SetMaxVisibleLines(1)
	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -36, _1080p * 36, _1080p * -230, _1080p * -200)
	var_10_0:addElement(var_10_16)

	var_10_0.CancelMouseButton = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "Plus"

	var_10_18:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_18:setImage(RegisterMaterial("icon_plus"), 0)
	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 251, _1080p * 261, _1080p * 294, _1080p * 304)
	var_10_0:addElement(var_10_18)

	var_10_0.Plus = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIStyledText.new()

	var_10_20.id = "SelectButtonLabel"

	var_10_20:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_20:SetAlpha(0, 0)
	var_10_20:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_10_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_20:SetAlignment(LUI.Alignment.Center)
	var_10_20:SetTintFontIcons(true)
	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -257, _1080p * -157, _1080p * -20, 0)
	var_10_0:addElement(var_10_20)

	var_10_0.SelectButtonLabel = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIStyledText.new()

	var_10_22.id = "SelectButtonPrompt"

	var_10_22:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_22:SetAlpha(0, 0)
	var_10_22:setText(Engine.CBBHFCGDIC("KEY/MOUSE2"), 0)
	var_10_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_22:SetAlignment(LUI.Alignment.Center)
	var_10_22:SetTintFontIcons(true)
	var_10_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_22:SetStartupDelay(1000)
	var_10_22:SetLineHoldTime(400)
	var_10_22:SetAnimMoveTime(150)
	var_10_22:SetAnimMoveSpeed(50)
	var_10_22:SetEndDelay(1000)
	var_10_22:SetCrossfadeTime(400)
	var_10_22:SetFadeInTime(300)
	var_10_22:SetFadeOutTime(300)
	var_10_22:SetMaxVisibleLines(1)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -246, _1080p * -174, _1080p * -50, _1080p * -20)
	var_10_0:addElement(var_10_22)

	var_10_0.SelectButtonPrompt = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "BackButton"

	var_10_24:SetAlpha(0, 0)
	var_10_24.Text:SetLeft(_1080p * 20, 0)
	var_10_24.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BACK"), 0)
	var_10_24.Text:SetAlignment(LUI.Alignment.Center)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -49, _1080p * 49, _1080p * 11, _1080p * 49)
	var_10_0:addElement(var_10_24)

	var_10_0.BackButton = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIStyledText.new()

	var_10_26.id = "Hint"

	var_10_26:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_10_26:SetAlpha(0, 0)
	var_10_26:setText(Engine.CBBHFCGDIC("LUA_MENU/GESTURE_HINT"), 0)
	var_10_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_26:SetAlignment(LUI.Alignment.Center)
	var_10_26:SetTintFontIcons(true)
	var_10_26:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -257, _1080p * 256, _1080p * 69, _1080p * 89)
	var_10_0:addElement(var_10_26)

	var_10_0.Hint = var_10_26

	local function var_10_27()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_27

	local var_10_28

	if not CONDITIONS.InFrontend(var_10_0) then
		local var_10_29 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -20
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 78
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 8
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			}
		}

		var_10_7:RegisterAnimationSequence("InFrontend", var_10_29)
	end

	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_10_9:RegisterAnimationSequence("InFrontend", var_10_30)

	local var_10_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 58
		}
	}

	var_10_11:RegisterAnimationSequence("InFrontend", var_10_31)

	if not CONDITIONS.InFrontend(var_10_0) then
		local var_10_32 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 3
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 462
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 75
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 492
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			}
		}

		var_10_12:RegisterAnimationSequence("InFrontend", var_10_32)
	end

	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_10_14:RegisterAnimationSequence("InFrontend", var_10_33)

	local var_10_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_10_16:RegisterAnimationSequence("InFrontend", var_10_34)

	local var_10_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("InFrontend", var_10_35)

	local var_10_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("InFrontend", var_10_36)

	local var_10_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("InFrontend", var_10_37)

	local var_10_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_26:RegisterAnimationSequence("InFrontend", var_10_38)

	local function var_10_39()
		if not CONDITIONS.InFrontend(var_10_0) then
			var_10_7:AnimateSequence("InFrontend")
		end

		var_10_9:AnimateSequence("InFrontend")
		var_10_11:AnimateSequence("InFrontend")

		if not CONDITIONS.InFrontend(var_10_0) then
			var_10_12:AnimateSequence("InFrontend")
		end

		var_10_14:AnimateSequence("InFrontend")
		var_10_16:AnimateSequence("InFrontend")
		var_10_18:AnimateSequence("InFrontend")
		var_10_20:AnimateSequence("InFrontend")
		var_10_22:AnimateSequence("InFrontend")
		var_10_26:AnimateSequence("InFrontend")
	end

	var_10_0._sequences.InFrontend = var_10_39

	local var_10_40
	local var_10_41 = {
		{
			value = 6973799,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_10_6:RegisterAnimationSequence("Unavailable", var_10_41)

	local function var_10_42()
		var_10_6:AnimateSequence("Unavailable")
	end

	var_10_0._sequences.Unavailable = var_10_42

	local var_10_43
	local var_10_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_10_6:RegisterAnimationSequence("Available", var_10_44)

	local function var_10_45()
		var_10_6:AnimateSequence("Available")
	end

	var_10_0._sequences.Available = var_10_45

	local var_10_46
	local var_10_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("PreviewMode", var_10_47)

	local var_10_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("PreviewMode", var_10_48)

	local function var_10_49()
		var_10_20:AnimateSequence("PreviewMode")
		var_10_22:AnimateSequence("PreviewMode")
	end

	var_10_0._sequences.PreviewMode = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -281
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -256
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 195
		}
	}

	var_10_26:RegisterAnimationSequence("ShowHintInCenter", var_10_51)

	local function var_10_52()
		var_10_26:AnimateSequence("ShowHintInCenter")
	end

	var_10_0._sequences.ShowHintInCenter = var_10_52

	local var_10_53

	if not CONDITIONS.InFrontend(var_10_0) then
		local var_10_54 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_7:RegisterAnimationSequence("HidePrompts", var_10_54)
	end

	local var_10_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_9:RegisterAnimationSequence("HidePrompts", var_10_55)

	local var_10_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_11:RegisterAnimationSequence("HidePrompts", var_10_56)

	if not CONDITIONS.InFrontend(var_10_0) then
		local var_10_57 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_12:RegisterAnimationSequence("HidePrompts", var_10_57)
	end

	local var_10_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("HidePrompts", var_10_58)

	local var_10_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_16:RegisterAnimationSequence("HidePrompts", var_10_59)

	local var_10_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_18:RegisterAnimationSequence("HidePrompts", var_10_60)

	local var_10_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_20:RegisterAnimationSequence("HidePrompts", var_10_61)

	local var_10_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_22:RegisterAnimationSequence("HidePrompts", var_10_62)

	local function var_10_63()
		if not CONDITIONS.InFrontend(var_10_0) then
			var_10_7:AnimateSequence("HidePrompts")
		end

		var_10_9:AnimateSequence("HidePrompts")
		var_10_11:AnimateSequence("HidePrompts")

		if not CONDITIONS.InFrontend(var_10_0) then
			var_10_12:AnimateSequence("HidePrompts")
		end

		var_10_14:AnimateSequence("HidePrompts")
		var_10_16:AnimateSequence("HidePrompts")
		var_10_18:AnimateSequence("HidePrompts")
		var_10_20:AnimateSequence("HidePrompts")
		var_10_22:AnimateSequence("HidePrompts")
	end

	var_10_0._sequences.HidePrompts = var_10_63

	var_10_24:addEventHandler("button_action", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("RadialMenu", RadialMenu)
LockTable(_M)
