module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._teamSwitcherDisabled = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.DisableTeamSwitcher = var_0_0
	arg_2_0._teamSwitcherDisabled = false

	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZHJP")
	end

	local function var_2_0(arg_3_0, arg_3_1)
		if arg_3_0._teamSwitcherDisabled == false then
			if LUI.IsLastInputGamepad(arg_3_1.controllerIndex) then
				ACTIONS.AnimateSequence(arg_3_0, "Gamepad")
			else
				ACTIONS.AnimateSequence(arg_3_0, "KBM")
			end
		end
	end

	arg_2_0:addEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})
	var_2_0(arg_2_0, {
		controllerIndex = arg_2_1
	})
end

function LobbyTeamDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 120 * _1080p)

	var_4_0.id = "LobbyTeamDetails"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Gradient"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -5, _1080p * 120)
	var_4_0:addElement(var_4_4)

	var_4_0.Gradient = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "FactionIcon"

	var_4_6:SetColorOp(COLOR_OP.saturation, 0)
	var_4_6:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -67, _1080p * 67, _1080p * -8, _1080p * 126)
	var_4_0:addElement(var_4_6)

	var_4_0.FactionIcon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "SuperfactionName"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/THE_WEST")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetDecodeLetterLength(50)
	var_4_8:SetDecodeMaxRandChars(2)
	var_4_8:SetDecodeUpdatesPerLetter(10)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 65, 0, _1080p * 22, _1080p * 96)
	var_4_0:addElement(var_4_8)

	var_4_0.SuperfactionName = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "TeamSwitchName"

	var_4_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_10:setText(Engine.CBBHFCGDIC("LUA_MENU/YOUR_TEAM"), 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 350, _1080p * 90, _1080p * 112)
	var_4_0:addElement(var_4_10)

	var_4_0.TeamSwitchName = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "HorizontalDivider"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_12:SetAlpha(0.8, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 65, 0, _1080p * 27, _1080p * 28)
	var_4_0:addElement(var_4_12)

	var_4_0.HorizontalDivider = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("LobbyTeamSwitcher", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "LobbyTeamSwitcher"

	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 67, _1080p * 302, _1080p * 84, _1080p * 118)
	var_4_0:addElement(var_4_14)

	var_4_0.LobbyTeamSwitcher = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIText.new()

	var_4_16.id = "TeamViewName"

	var_4_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_16:setText("", 0)
	var_4_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_16:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 65, 0, 0, _1080p * 24)
	var_4_0:addElement(var_4_16)

	var_4_0.TeamViewName = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 89
		}
	}

	var_4_8:RegisterAnimationSequence("KORZHJP", var_4_18)

	local function var_4_19()
		var_4_8:AnimateSequence("KORZHJP")
	end

	var_4_0._sequences.KORZHJP = var_4_19

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("KBM", var_4_20)

	local var_4_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("KBM", var_4_21)

	local function var_4_22()
		var_4_10:AnimateSequence("KBM")
		var_4_14:AnimateSequence("KBM")
	end

	var_4_0._sequences.KBM = var_4_22

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Gamepad", var_4_23)

	local var_4_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Gamepad", var_4_24)

	local function var_4_25()
		var_4_10:AnimateSequence("Gamepad")
		var_4_14:AnimateSequence("Gamepad")
	end

	var_4_0._sequences.Gamepad = var_4_25

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 101
		}
	}

	var_4_4:RegisterAnimationSequence("LPCLobby", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -59
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 59
		}
	}

	var_4_6:RegisterAnimationSequence("LPCLobby", var_4_27)

	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		}
	}

	var_4_8:RegisterAnimationSequence("LPCLobby", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("LPCLobby", var_4_29)

	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		}
	}

	var_4_12:RegisterAnimationSequence("LPCLobby", var_4_30)

	local var_4_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("LPCLobby", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		}
	}

	var_4_16:RegisterAnimationSequence("LPCLobby", var_4_32)

	local function var_4_33()
		var_4_4:AnimateSequence("LPCLobby")
		var_4_6:AnimateSequence("LPCLobby")
		var_4_8:AnimateSequence("LPCLobby")
		var_4_10:AnimateSequence("LPCLobby")
		var_4_12:AnimateSequence("LPCLobby")
		var_4_14:AnimateSequence("LPCLobby")
		var_4_16:AnimateSequence("LPCLobby")
	end

	var_4_0._sequences.LPCLobby = var_4_33

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyTeamDetails", LobbyTeamDetails)
LockTable(_M)
