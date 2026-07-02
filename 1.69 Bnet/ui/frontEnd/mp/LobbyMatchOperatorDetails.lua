module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.OperatorName)
	arg_1_0.OperatorName:setText(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateOperatorDetails = var_0_0

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "JP")
	end
end

function LobbyMatchOperatorDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 120 * _1080p)

	var_3_0.id = "LobbyMatchOperatorDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Gradient"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -84, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Gradient = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "MatchOperator"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/MATCH_OPERATOR"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetDecodeLetterLength(50)
	var_3_6:SetDecodeMaxRandChars(2)
	var_3_6:SetDecodeUpdatesPerLetter(10)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 296, 0, _1080p * 24)
	var_3_0:addElement(var_3_6)

	var_3_0.MatchOperator = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "OperatorName"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:setText("MURPHY", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 296, _1080p * 24, _1080p * 84)
	var_3_0:addElement(var_3_8)

	var_3_0.OperatorName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "SwitchFactionText"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 296, _1080p * 86, _1080p * 106)
	var_3_0:addElement(var_3_10)

	var_3_0.SwitchFactionText = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "HorizontalDivider"

	var_3_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_12:SetAlpha(0.8, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 27, _1080p * 28)
	var_3_0:addElement(var_3_12)

	var_3_0.HorizontalDivider = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		}
	}

	var_3_8:RegisterAnimationSequence("JP", var_3_14)

	local function var_3_15()
		var_3_8:AnimateSequence("JP")
	end

	var_3_0._sequences.JP = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyMatchOperatorDetails", LobbyMatchOperatorDetails)
LockTable(_M)
