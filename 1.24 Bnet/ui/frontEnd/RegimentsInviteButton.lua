module(..., package.seeall)

local var_0_0 = 12 * _1080p
local var_0_1 = 5 * _1080p

local function var_0_2(arg_1_0, arg_1_1)
	arg_1_0.InvitationsCount:setText(arg_1_1)

	if arg_1_1 > 0 then
		ACTIONS.AnimateSequence(arg_1_0, "SomeInvites")
	else
		ACTIONS.AnimateSequence(arg_1_0, "NoInvites")
	end
end

local function var_0_3(arg_2_0)
	local var_2_0 = arg_2_0.PromptText:GetCurrentAnchorsAndPositions().left + LAYOUT.GetTextWidth(arg_2_0.PromptText)

	if arg_2_0._isPC then
		var_2_0 = var_2_0 + var_0_0

		arg_2_0.ButtonBG:SetRight(var_2_0)
	end

	arg_2_0.InvitationsCount:SetLeft(var_2_0 + var_0_1)
	arg_2_0.InvitationsCount:SetRight(var_2_0 + var_0_1 + arg_2_0._countWidth)
	arg_2_0.InvitationsCountBox:SetLeft(var_2_0 + var_0_1)
	arg_2_0.InvitationsCountBox:SetRight(var_2_0 + var_0_1 + arg_2_0._countBoxWidth)
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0.ButtonBG:addEventHandler("button_action", arg_3_1)
end

local function var_0_5(arg_4_0, arg_4_1)
	arg_4_0.PromptText:setText(arg_4_1)
	var_0_3(arg_4_0)
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetInvites = var_0_2
	arg_5_0.SetAction = var_0_4
	arg_5_0.SetPromptText = var_0_5

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	arg_5_0._countWidth = LAYOUT.GetElementWidth(arg_5_0.InvitationsCount)
	arg_5_0._countBoxWidth = LAYOUT.GetElementWidth(arg_5_0.InvitationsCountBox)

	arg_5_0.ButtonBG:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if arg_5_0._isPC then
			ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
		end
	end)
	arg_5_0.ButtonBG:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_5_0._isPC then
			ACTIONS.AnimateSequence(arg_5_0, "ButtonUp")
		end
	end)

	local function var_5_0(arg_8_0, arg_8_1)
		arg_8_0._isPC = LUI.IsLastInputKeyboardMouse(arg_8_1.controllerIndex)

		if arg_8_0._isPC then
			ACTIONS.AnimateSequence(arg_8_0, "PC")
			ACTIONS.AnimateSequence(arg_8_0, "ButtonUp")
		else
			ACTIONS.AnimateSequence(arg_8_0, "Console")
		end

		var_0_3(arg_8_0)
	end

	local var_5_1 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt1",
				button_ref = "button_alt1",
				helper_text = ""
			}
		}
	}

	arg_5_0.ButtonBG:AddTooltipData(arg_5_1, var_5_1)
	arg_5_0:registerAndCallEventHandler("update_input_type", var_5_0, {
		controllerIndex = arg_5_1
	})

	local var_5_2, var_5_3, var_5_4, var_5_5 = arg_5_0.Prompt:getLocalRect()
	local var_5_6 = var_5_4 - var_5_2

	arg_5_0.Prompt:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_5_2, var_5_4, -LUI.ButtonHelperText.GAMEPAD_BUTTON_ICON_HEIGHT / 2, LUI.ButtonHelperText.GAMEPAD_BUTTON_ICON_HEIGHT / 2)
	arg_5_0.Prompt:SetTintFontIcons(true)
	arg_5_0.Prompt:SetRGBFromTable(SWATCHES.tabManager.tabText)
end

function RegimentsInviteButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 31 * _1080p)

	var_9_0.id = "RegimentsInviteButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("SocialPlayerButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "ButtonBG"

	var_9_4:SetAlpha(0, 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 120, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.ButtonBG = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "InvitationsCountBox"

	var_9_6:SetRGBFromTable(SWATCHES.genericMenu.progressBackground, 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 126, _1080p * 150, _1080p * -9.5, _1080p * 8.5)
	var_9_0:addElement(var_9_6)

	var_9_0.InvitationsCountBox = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIText.new()

	var_9_8.id = "InvitationsCount"

	var_9_8:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_9_8:setText("0", 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_8:SetWordWrap(false)
	var_9_8:SetAlignment(LUI.Alignment.Center)
	var_9_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 126, _1080p * 150, _1080p * -12.5, _1080p * 9.5)
	var_9_0:addElement(var_9_8)

	var_9_0.InvitationsCount = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIStyledText.new()

	var_9_10.id = "PromptText"

	var_9_10:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_9_10:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_INVITES"), 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_10:SetWordWrap(false)
	var_9_10:SetAlignment(LUI.Alignment.Left)
	var_9_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 28, _1080p * 116, _1080p * -11.5, _1080p * 10.5)
	var_9_0:addElement(var_9_10)

	var_9_0.PromptText = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIStyledText.new()

	var_9_12.id = "Prompt"

	var_9_12:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_9_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT1_BUTTON"), 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetAlignment(LUI.Alignment.Left)
	var_9_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -6, _1080p * 16, _1080p * -12.5, _1080p * 11.5)
	var_9_0:addElement(var_9_12)

	var_9_0.Prompt = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14
	local var_9_15 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_15)

	local function var_9_16()
		var_9_10:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_16

	local var_9_17
	local var_9_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("Console", var_9_18)

	local var_9_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_9_10:RegisterAnimationSequence("Console", var_9_19)

	local var_9_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("Console", var_9_20)

	local function var_9_21()
		var_9_4:AnimateSequence("Console")
		var_9_10:AnimateSequence("Console")
		var_9_12:AnimateSequence("Console")
	end

	var_9_0._sequences.Console = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("PC", var_9_23)

	local var_9_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_9_10:RegisterAnimationSequence("PC", var_9_24)

	local var_9_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_12:RegisterAnimationSequence("PC", var_9_25)

	local function var_9_26()
		var_9_4:AnimateSequence("PC")
		var_9_10:AnimateSequence("PC")
		var_9_12:AnimateSequence("PC")
	end

	var_9_0._sequences.PC = var_9_26

	local var_9_27
	local var_9_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_9_6:RegisterAnimationSequence("JP", var_9_28)

	local var_9_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12
		}
	}

	var_9_8:RegisterAnimationSequence("JP", var_9_29)

	local function var_9_30()
		var_9_6:AnimateSequence("JP")
		var_9_8:AnimateSequence("JP")
	end

	var_9_0._sequences.JP = var_9_30

	local var_9_31
	local var_9_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.newIndicator
		}
	}

	var_9_6:RegisterAnimationSequence("SomeInvites", var_9_32)

	local function var_9_33()
		var_9_6:AnimateSequence("SomeInvites")
	end

	var_9_0._sequences.SomeInvites = var_9_33

	local var_9_34
	local var_9_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.progressBackground
		}
	}

	var_9_6:RegisterAnimationSequence("NoInvites", var_9_35)

	local function var_9_36()
		var_9_6:AnimateSequence("NoInvites")
	end

	var_9_0._sequences.NoInvites = var_9_36

	local var_9_37
	local var_9_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 12.5
		}
	}

	var_9_10:RegisterAnimationSequence("AR", var_9_38)

	local function var_9_39()
		var_9_10:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_39

	local var_9_40
	local var_9_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.listButtonDefault
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_41)

	local function var_9_42()
		var_9_10:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_42

	var_0_6(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("RegimentsInviteButton", RegimentsInviteButton)
LockTable(_M)
