module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._dropdownOpen = arg_1_2

	if arg_1_0._dropdownOpen then
		ACTIONS.AnimateSequence(arg_1_0, "OpenDropdown")

		arg_1_0.DropdownList.m_requireFocusType = FocusType.ListSelection

		local var_1_0 = arg_1_0.DropdownList:GetBuiltChildren()

		for iter_1_0, iter_1_1 in ipairs(var_1_0) do
			iter_1_1.m_requireFocusType = nil
		end
	else
		ACTIONS.AnimateSequence(arg_1_0, "CloseDropdown")

		arg_1_0.DropdownList.m_requireFocusType = FocusType.MouseOver

		local var_1_1 = arg_1_0.DropdownList:GetBuiltChildren()

		for iter_1_2, iter_1_3 in ipairs(var_1_1) do
			iter_1_3.m_requireFocusType = FocusType.MouseOver
		end
	end

	arg_1_0:SetHandleMouse(arg_1_0._dropdownOpen)
	arg_1_0.DropdownList:SetMouseFocusBlocker(not arg_1_0._dropdownOpen)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0:SetDropdownState(arg_2_1, not arg_2_0._dropdownOpen)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.DropdownButton.ButtonLabel:setText(Engine.CBBHFCGDIC(arg_3_1))
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = -28
	local var_4_1 = arg_4_0.GamepadPrompt:GetCurrentAnchorsAndPositions()
	local var_4_2 = var_4_1.left - var_4_1.right
	local var_4_3 = arg_4_0.Arrow:GetCurrentAnchorsAndPositions()
	local var_4_4 = var_4_3.left - var_4_3.right

	if LUI.IsLastInputKeyboardMouse(arg_4_1.controllerIndex) then
		ACTIONS.AnimateSequence(arg_4_0, "HideGamepadPrompt")
		ACTIONS.AnimateSequence(arg_4_0, "ShowArrow")

		var_4_0 = var_4_0 + var_4_4
	else
		if arg_4_0._hidePromptOnGamepad then
			ACTIONS.AnimateSequence(arg_4_0, "HideGamepadPrompt")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ShowGamepadPrompt")

			var_4_0 = var_4_0 + var_4_2
		end

		if arg_4_0._hideArrowOnGamepad then
			ACTIONS.AnimateSequence(arg_4_0, "HideArrow")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ShowArrow")

			var_4_0 = var_4_0 + var_4_4
		end
	end

	arg_4_0.DropdownButton.ButtonLabel:SetRight(_1080p * var_4_0, 0)
end

local function var_0_4(arg_5_0, arg_5_1)
	if arg_5_1 then
		arg_5_0._hidePromptOnGamepad = arg_5_1.hidePromptOnGamepad
		arg_5_0._hideArrowOnGamepad = arg_5_1.hideArrowOnGamepad

		var_0_3(arg_5_0, {
			controllerIndex = arg_5_0._controllerIndex
		})
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0.DropdownList:SetNumChildren(arg_6_1 and #arg_6_1 or 0)

	arg_6_0.DropdownList._options = arg_6_1

	arg_6_0.DropdownList:RefreshContent()
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0:getParent()
	local var_7_1 = var_7_0:getParent()
	local var_7_2 = var_7_0._options and var_7_0._options[arg_7_2 + 1]

	if var_7_2 then
		arg_7_0.ButtonLabel:setText(Engine.CBBHFCGDIC(var_7_2.text))

		if not arg_7_0._handlersAdded then
			arg_7_0:addEventHandler("button_action", function(arg_8_0, arg_8_1)
				var_7_1:SetButtonText(var_7_2.text)
				var_7_1:SetDropdownState(var_7_1._controllerIndex, false)

				if var_7_2.action then
					var_7_2.action(arg_8_0, var_7_1._controllerIndex)
				end
			end)

			arg_7_0._handlersAdded = true
		end
	end
end

local function var_0_7(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._controllerIndex = arg_9_1
	arg_9_0.SetDropdownState = var_0_0
	arg_9_0.ToggleDropdownState = var_0_1
	arg_9_0.SetButtonText = var_0_2
	arg_9_0.SetGamepadOptions = var_0_4
	arg_9_0.SetDropdownOptions = var_0_5

	arg_9_0.DropdownList:SetRefreshChild(var_0_6)
	arg_9_0:SetDropdownState(arg_9_1, false)

	arg_9_0.DropdownButton.m_requireFocusType = FocusType.MouseOver

	arg_9_0.DropdownButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		arg_10_0:getParent():ToggleDropdownState(arg_10_1.controllerIndex)
	end)
	arg_9_0:addEventHandler("leftmouseup", function(arg_11_0, arg_11_1)
		arg_11_0:SetDropdownState(arg_11_1.controllerIndex, false)
	end)
	arg_9_0:addAndCallEventHandler("update_input_type", var_0_3, {
		controllerIndex = arg_9_1
	})
end

function CompactDropdown(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 160 * _1080p)

	var_12_0.id = "CompactDropdown"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "ListBackground"

	var_12_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_12_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 31, _1080p * 147)
	var_12_0:addElement(var_12_4)

	var_12_0.ListBackground = var_12_4

	local var_12_5
	local var_12_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CompactDropdownButton", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 225,
		rowHeight = _1080p * 26,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_7 = LUI.UIGrid.new(var_12_6)

	var_12_7.id = "DropdownList"

	var_12_7:setUseStencil(true)
	var_12_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 31, _1080p * 147)
	var_12_0:addElement(var_12_7)

	var_12_0.DropdownList = var_12_7

	local var_12_8
	local var_12_9 = LUI.UIImage.new()

	var_12_9.id = "Divider"

	var_12_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 28, _1080p * 29)
	var_12_0:addElement(var_12_9)

	var_12_0.Divider = var_12_9

	local var_12_10
	local var_12_11 = MenuBuilder.BuildRegisteredType("CompactDropdownButton", {
		controllerIndex = var_12_1
	})

	var_12_11.id = "DropdownButton"

	var_12_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 26)
	var_12_0:addElement(var_12_11)

	var_12_0.DropdownButton = var_12_11

	local var_12_12
	local var_12_13 = LUI.UIImage.new()

	var_12_13.id = "Arrow"

	var_12_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_12_13:SetZRotation(180, 0)
	var_12_13:setImage(RegisterMaterial("icon_option_arrow_up_down"), 0)
	var_12_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -13, _1080p * 1, _1080p * 25)
	var_12_0:addElement(var_12_13)

	var_12_0.Arrow = var_12_13

	local var_12_14
	local var_12_15 = LUI.UIText.new()

	var_12_15.id = "GamepadPrompt"

	var_12_15:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
	var_12_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_15:SetAlignment(LUI.Alignment.Right)
	var_12_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -52, _1080p * -28, _1080p * 4, _1080p * 22)
	var_12_0:addElement(var_12_15)

	var_12_0.GamepadPrompt = var_12_15

	local function var_12_16()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_16

	local var_12_17 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("OpenDropdown", var_12_17)

	local var_12_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_7:RegisterAnimationSequence("OpenDropdown", var_12_18)

	local var_12_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("OpenDropdown", var_12_19)

	local var_12_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_12_13:RegisterAnimationSequence("OpenDropdown", var_12_20)

	local function var_12_21()
		var_12_4:AnimateSequence("OpenDropdown")
		var_12_7:AnimateSequence("OpenDropdown")
		var_12_9:AnimateSequence("OpenDropdown")
		var_12_13:AnimateSequence("OpenDropdown")
	end

	var_12_0._sequences.OpenDropdown = var_12_21

	local var_12_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("CloseDropdown", var_12_22)

	local var_12_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_7:RegisterAnimationSequence("CloseDropdown", var_12_23)

	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("CloseDropdown", var_12_24)

	local var_12_25 = {
		{
			value = 180,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_12_13:RegisterAnimationSequence("CloseDropdown", var_12_25)

	local function var_12_26()
		var_12_4:AnimateSequence("CloseDropdown")
		var_12_7:AnimateSequence("CloseDropdown")
		var_12_9:AnimateSequence("CloseDropdown")
		var_12_13:AnimateSequence("CloseDropdown")
	end

	var_12_0._sequences.CloseDropdown = var_12_26

	local var_12_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_13:RegisterAnimationSequence("ShowArrow", var_12_27)

	local var_12_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -50
		}
	}

	var_12_15:RegisterAnimationSequence("ShowArrow", var_12_28)

	local function var_12_29()
		var_12_13:AnimateSequence("ShowArrow")
		var_12_15:AnimateSequence("ShowArrow")
	end

	var_12_0._sequences.ShowArrow = var_12_29

	local var_12_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_13:RegisterAnimationSequence("HideArrow", var_12_30)

	local var_12_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -13
		}
	}

	var_12_15:RegisterAnimationSequence("HideArrow", var_12_31)

	local function var_12_32()
		var_12_13:AnimateSequence("HideArrow")
		var_12_15:AnimateSequence("HideArrow")
	end

	var_12_0._sequences.HideArrow = var_12_32

	local var_12_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_15:RegisterAnimationSequence("ShowGamepadPrompt", var_12_33)

	local function var_12_34()
		var_12_15:AnimateSequence("ShowGamepadPrompt")
	end

	var_12_0._sequences.ShowGamepadPrompt = var_12_34

	local var_12_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_15:RegisterAnimationSequence("HideGamepadPrompt", var_12_35)

	local function var_12_36()
		var_12_15:AnimateSequence("HideGamepadPrompt")
	end

	var_12_0._sequences.HideGamepadPrompt = var_12_36

	var_0_7(var_12_0, var_12_1, arg_12_1)
	ACTIONS.AnimateSequence(var_12_0, "CloseDropdown")

	return var_12_0
end

MenuBuilder.registerType("CompactDropdown", CompactDropdown)
LockTable(_M)
