module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if PROGRESSION.IsWeaponMaxLevel(arg_1_1, arg_1_3) then
		arg_1_0:SetAlpha(0)
		arg_1_0.kbmButton:SetHandleMouse(false)

		arg_1_0.weaponMaxLevel = true
	else
		arg_1_0:SetAlpha(1)
		arg_1_0.kbmButton:SetHandleMouse(not LUI.IsLastInputGamepad(arg_1_1))

		arg_1_0.weaponMaxLevel = false

		arg_1_0.MiniNextUnlockItems:Setup(arg_1_2, arg_1_3, arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
	arg_2_0.weaponMaxLevel = false
	arg_2_0.kbmButton.m_requireFocusType = FocusType.MouseOver

	local function var_2_0(arg_3_0, arg_3_1)
		if not arg_3_0.weaponMaxLevel then
			arg_3_0.kbmButton:SetAlpha(LUI.IsLastInputGamepad(arg_3_1.controllerIndex) and 0 or 1)
			arg_3_0.kbmButton:SetHandleMouse(not LUI.IsLastInputGamepad(arg_3_1.controllerIndex))

			local var_3_0 = LUI.IsLastInputGamepad(arg_3_1.controllerIndex) and "CAS/BUTTON_NEXT_UNLOCKS" or "CAS/BUTTON_NEXT_UNLOCKS_KBM"

			arg_3_0.NextUnlocksButton:setText(Engine.CBBHFCGDIC(var_3_0))
		end
	end

	local var_2_1 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_right_trigger",
				button_ref = "button_right_trigger",
				helper_text = ""
			}
		}
	}

	arg_2_0.kbmButton:AddTooltipData(arg_2_1, var_2_1)
	arg_2_0:registerAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})

	if IsLanguageFrench() then
		ACTIONS.AnimateSequence(arg_2_0, "FR")
	end
end

function GunsmithProgress(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 53 * _1080p)

	var_4_0.id = "GunsmithProgress"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "kbmButton"

	var_4_4:SetAlpha(0.8, 0)
	var_4_4.Text:SetLeft(_1080p * 20, 0)
	var_4_4.Text:setText(ToUpperCase(""), 0)
	var_4_4.Text:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 530, _1080p * -24.5, _1080p * 21.5)
	var_4_0:addElement(var_4_4)

	var_4_0.kbmButton = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "NextUnlocksButton"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("CAS/BUTTON_NEXT_UNLOCKS"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Right)
	var_4_6:SetTintFontIcons(true)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -146, _1080p * 162, _1080p * -11.5, _1080p * 6.5)
	var_4_0:addElement(var_4_6)

	var_4_0.NextUnlocksButton = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItems", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "MiniNextUnlockItems"

	var_4_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -350, 0, _1080p * -26.5, _1080p * 26.5)
	var_4_0:addElement(var_4_8)

	var_4_0.MiniNextUnlockItems = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("Over", var_4_11)

	local function var_4_12()
		var_4_6:AnimateSequence("Over")
	end

	var_4_0._sequences.Over = var_4_12

	local var_4_13
	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.lockedText
		}
	}

	var_4_6:RegisterAnimationSequence("Up", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("Up")
	end

	var_4_0._sequences.Up = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -54
		}
	}

	var_4_4:RegisterAnimationSequence("FR", var_4_17)

	local function var_4_18()
		var_4_4:AnimateSequence("FR")
	end

	var_4_0._sequences.FR = var_4_18

	var_4_4:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Over")
	end)
	var_4_4:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Up")
	end)
	var_4_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Over")
	end)
	var_4_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "Up")
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("GunsmithProgress", GunsmithProgress)
LockTable(_M)
