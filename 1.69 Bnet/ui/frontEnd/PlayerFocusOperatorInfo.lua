module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.OperatorName:setText(Engine.CBBHFCGDIC(OPERATOR.GetName(arg_1_1)))

	local var_1_0 = OPERATOR.GetFactionName(arg_1_1)

	arg_1_0.OperatorFactionName:setText(Engine.CBBHFCGDIC(var_1_0))

	local var_1_1 = OPERATOR.GetFactionIcon(arg_1_1)

	arg_1_0.FactionIcon:setImage(RegisterMaterial(var_1_1))

	local var_1_2 = OPERATOR.GetOperatorSkinRef(arg_1_2, arg_1_3)

	arg_1_0.OperatorSkinName:setText(Engine.CBBHFCGDIC(OPERATOR.GetSkinName(var_1_2)))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.SetInfo = var_0_0
end

function PlayerFocusOperatorInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 250 * _1080p)

	var_3_0.id = "PlayerFocusOperatorInfo"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "FactionIcon"

	var_3_4:SetAlpha(0.85, 0)
	var_3_4:SetColorOp(COLOR_OP.saturation, 0)
	var_3_4:SetColorOpParam(0.03, 0)
	var_3_4:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 215, _1080p * 34, _1080p * 249)
	var_3_0:addElement(var_3_4)

	var_3_0.FactionIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "OperatorName"

	var_3_6:SetAlpha(0.7, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetDecodeLetterLength(50)
	var_3_6:SetDecodeMaxRandChars(2)
	var_3_6:SetDecodeUpdatesPerLetter(10)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 589, _1080p * 34, _1080p * 104)
	var_3_0:addElement(var_3_6)

	var_3_0.OperatorName = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "OperatorSkinName"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 460, _1080p * 107, _1080p * 137)
	var_3_0:addElement(var_3_8)

	var_3_0.OperatorSkinName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "OperatorFactionName"

	var_3_10:SetAlpha(0.7, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetDecodeLetterLength(50)
	var_3_10:SetDecodeMaxRandChars(2)
	var_3_10:SetDecodeUpdatesPerLetter(10)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 589, 0, _1080p * 30)
	var_3_0:addElement(var_3_10)

	var_3_0.OperatorFactionName = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "OperatorSwitch"

	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 153, _1080p * 480, _1080p * 173, _1080p * 193)
	var_3_0:addElement(var_3_12)

	var_3_0.OperatorSwitch = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PlayerFocusOperatorInfo", PlayerFocusOperatorInfo)
LockTable(_M)
