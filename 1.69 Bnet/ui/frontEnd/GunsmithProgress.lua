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
	arg_2_0.kbmButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		WZWIP.AnimateThemeElement(arg_2_0, "Over")
	end)
	arg_2_0.kbmButton:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_2_0, "Up")
	end)
	arg_2_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		WZWIP.AnimateThemeElement(arg_6_0, "Over")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		WZWIP.AnimateThemeElement(arg_7_0, "Up")
	end)

	if IsLanguageFrench() then
		ACTIONS.AnimateSequence(arg_2_0, "FR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function GunsmithProgress(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 530 * _1080p, 0, 53 * _1080p)

	var_8_0.id = "GunsmithProgress"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "kbmButton"

	var_8_4:SetAlpha(0.8, 0)
	var_8_4.Text:SetLeft(_1080p * 20, 0)
	var_8_4.Text:setText(ToUpperCase(""), 0)
	var_8_4.Text:SetAlignment(LUI.Alignment.Left)
	var_8_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 18, _1080p * 530, _1080p * -24.5, _1080p * 21.5)
	var_8_0:addElement(var_8_4)

	var_8_0.kbmButton = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIText.new()

	var_8_6.id = "NextUnlocksButton"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_8_6:setText(Engine.CBBHFCGDIC("CAS/BUTTON_NEXT_UNLOCKS"), 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_6:SetAlignment(LUI.Alignment.Right)
	var_8_6:SetTintFontIcons(true)
	var_8_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -146, _1080p * 162, _1080p * -11.5, _1080p * 6.5)
	var_8_0:addElement(var_8_6)

	var_8_0.NextUnlocksButton = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("MiniNextUnlockItems", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "MiniNextUnlockItems"

	var_8_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -350, 0, _1080p * -26.5, _1080p * 26.5)
	var_8_0:addElement(var_8_8)

	var_8_0.MiniNextUnlockItems = var_8_8

	local function var_8_9()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10
	local var_8_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_6:RegisterAnimationSequence("Over", var_8_11)

	local function var_8_12()
		var_8_6:AnimateSequence("Over")
	end

	var_8_0._sequences.Over = var_8_12

	local var_8_13
	local var_8_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.lockedText
		}
	}

	var_8_6:RegisterAnimationSequence("Up", var_8_14)

	local function var_8_15()
		var_8_6:AnimateSequence("Up")
	end

	var_8_0._sequences.Up = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -54
		}
	}

	var_8_4:RegisterAnimationSequence("FR", var_8_17)

	local function var_8_18()
		var_8_4:AnimateSequence("FR")
	end

	var_8_0._sequences.FR = var_8_18

	local var_8_19
	local var_8_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipSetup", var_8_20)

	local function var_8_21()
		var_8_6:AnimateSequence("WZWipSetup")
	end

	var_8_0._sequences.WZWipSetup = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipOver", var_8_23)

	local function var_8_24()
		var_8_6:AnimateSequence("WZWipOver")
	end

	var_8_0._sequences.WZWipOver = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("WZWipUp", var_8_26)

	local function var_8_27()
		var_8_6:AnimateSequence("WZWipUp")
	end

	var_8_0._sequences.WZWipUp = var_8_27

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("GunsmithProgress", GunsmithProgress)
LockTable(_M)
