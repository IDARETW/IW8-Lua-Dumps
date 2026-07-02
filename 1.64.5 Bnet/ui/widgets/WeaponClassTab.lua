module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	function arg_1_0.Setup(arg_2_0, arg_2_1)
		arg_2_0.TabText:setText(ToUpperCase(arg_2_1.name))
	end

	function arg_1_0.Enable(arg_3_0)
		arg_3_0._disabled = false

		ACTIONS.AnimateSequence(arg_3_0, "Unfocused")
	end

	function arg_1_0.Disable(arg_4_0)
		arg_4_0._disabled = true

		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
	end

	function arg_1_0.IsEnabled(arg_5_0)
		return not arg_5_0._disabled
	end

	arg_1_0:registerEventHandler("focus_tab", function(arg_6_0, arg_6_1)
		if arg_6_1.index == arg_6_0.index then
			if arg_6_1.playSound then
				arg_6_0._sequences.Focused()
			else
				arg_6_0._sequences.FocusedNoSound()
			end

			arg_6_0.focused = true
		elseif arg_6_0.focused then
			arg_6_0._sequences.UnFocused()

			arg_6_0.focused = false
		end
	end)
	arg_1_0:SetHandleMouse(true)
	arg_1_0:registerEventHandler("mouseenter", function(arg_7_0, arg_7_1)
		if not arg_7_0.focused then
			if not arg_7_0._disabled then
				arg_7_0._sequences.Highlighted()
			else
				arg_7_0._sequences.Focused()
			end
		end
	end)
	arg_1_0:registerEventHandler("mouseleave", function(arg_8_0, arg_8_1)
		if arg_8_0.focused and not arg_8_0._disabled then
			arg_8_0._sequences.FocusedNoSound()
		else
			arg_8_0._sequences.UnFocused()
		end
	end)
	arg_1_0:registerEventHandler("leftmousedown", function(arg_9_0, arg_9_1)
		return
	end)
	arg_1_0:registerEventHandler("leftmouseup", function(arg_10_0, arg_10_1)
		if arg_10_1.inside and not arg_10_0._disabled then
			arg_10_0:playSound("menu_open")
			arg_10_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_10_0.index
			})
		end
	end)
	arg_1_0:registerEventHandler("tab_disable_blur", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_11_0, "NoBlur")
	end)
	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "disabled", function(arg_12_0)
		if DataModel.JJEHAEBDF(arg_12_0) then
			arg_1_0:Disable()
		end
	end)

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "Loc")
	end
end

function WeaponClassTab(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 198 * _1080p, 0, 84 * _1080p)

	var_13_0.id = "WeaponClassTab"
	var_13_0._animationSets = {}
	var_13_0._sequences = {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Backer"

	var_13_4:SetRGBFromTable(SWATCHES.tabManager.tabBackground, 0)
	var_13_4:SetAlpha(0.3, 0)
	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -8)
	var_13_0:addElement(var_13_4)

	var_13_0.Backer = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIText.new()

	var_13_6.id = "TabText"

	var_13_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_6:SetAlignment(LUI.Alignment.Center)
	var_13_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_13_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 24, _1080p * -24, _1080p * -9, _1080p * 9)

	local function var_13_7()
		local var_14_0 = var_13_0:GetDataSource().name:GetValue(var_13_1)

		if var_14_0 ~= nil then
			var_13_6:setText(ToUpperCase(var_14_0), 0)
		end
	end

	var_13_6:SubscribeToModelThroughElement(var_13_0, "name", var_13_7)
	var_13_0:addElement(var_13_6)

	var_13_0.TabText = var_13_6

	local var_13_8
	local var_13_9 = LUI.UIImage.new()

	var_13_9.id = "DisabledIcon"

	var_13_9:SetAlpha(0, 0)
	var_13_9:SetZRotation(2, 0)
	var_13_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1)
	var_13_0:addElement(var_13_9)

	var_13_0.DisabledIcon = var_13_9

	local var_13_10
	local var_13_11 = LUI.UIImage.new()

	var_13_11.id = "Highlight"

	var_13_11:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_11:SetAlpha(0, 0)
	var_13_11:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -6, _1080p * 6, _1080p * -8, 0)
	var_13_0:addElement(var_13_11)

	var_13_0.Highlight = var_13_11

	local function var_13_12()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_12

	local var_13_13 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("Focused", var_13_13)

	local var_13_14 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_13_6:RegisterAnimationSequence("Focused", var_13_14)

	local var_13_15 = {
		{
			value = 0.4,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_11:RegisterAnimationSequence("Focused", var_13_15)

	local function var_13_16()
		var_13_4:AnimateSequence("Focused")
		var_13_6:AnimateSequence("Focused")
		var_13_11:AnimateSequence("Focused")
	end

	var_13_0._sequences.Focused = var_13_16

	local var_13_17 = {
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("UnFocused", var_13_17)

	local var_13_18 = {
		{
			value = 10066329,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_6:RegisterAnimationSequence("UnFocused", var_13_18)

	local var_13_19 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_11:RegisterAnimationSequence("UnFocused", var_13_19)

	local function var_13_20()
		var_13_4:AnimateSequence("UnFocused")
		var_13_6:AnimateSequence("UnFocused")
		var_13_11:AnimateSequence("UnFocused")
	end

	var_13_0._sequences.UnFocused = var_13_20

	local function var_13_21()
		return
	end

	var_13_0._sequences.Locked = var_13_21

	local var_13_22 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("Disabled", var_13_22)

	local var_13_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_9:RegisterAnimationSequence("Disabled", var_13_23)

	local function var_13_24()
		var_13_6:AnimateSequence("Disabled")
		var_13_9:AnimateSequence("Disabled")
	end

	var_13_0._sequences.Disabled = var_13_24

	local var_13_25 = {
		{
			value = 13421772,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_13_4:RegisterAnimationSequence("Highlighted", var_13_25)

	local function var_13_26()
		var_13_4:AnimateSequence("Highlighted")
	end

	var_13_0._sequences.Highlighted = var_13_26

	local var_13_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("FocusedNoSound", var_13_27)

	local var_13_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_13_6:RegisterAnimationSequence("FocusedNoSound", var_13_28)

	local var_13_29 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_11:RegisterAnimationSequence("FocusedNoSound", var_13_29)

	local function var_13_30()
		var_13_4:AnimateSequence("FocusedNoSound")
		var_13_6:AnimateSequence("FocusedNoSound")
		var_13_11:AnimateSequence("FocusedNoSound")
	end

	var_13_0._sequences.FocusedNoSound = var_13_30

	local var_13_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_13_6:RegisterAnimationSequence("Loc", var_13_31)

	local function var_13_32()
		var_13_6:AnimateSequence("Loc")
	end

	var_13_0._sequences.Loc = var_13_32

	var_0_0(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("WeaponClassTab", WeaponClassTab)
LockTable(_M)
