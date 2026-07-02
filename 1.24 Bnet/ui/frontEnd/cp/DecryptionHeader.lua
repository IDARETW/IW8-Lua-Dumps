module(..., package.seeall)

function DecryptionHeader(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 939 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "DecryptionHeader"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_5 = LUI.UIBorder.new(var_1_4)

	var_1_5.id = "DecryptionBorderTop"

	var_1_5:SetRGBFromInt(7566195, 0)
	var_1_5:SetAlpha(0.5, 0)
	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 939, _1080p * 1, _1080p * 1)
	var_1_0:addElement(var_1_5)

	var_1_0.DecryptionBorderTop = var_1_5

	local var_1_6
	local var_1_7 = LUI.UIImage.new()

	var_1_7.id = "DecryptionBar"

	var_1_7:SetRGBFromInt(2238001, 0)
	var_1_7:SetAlpha(0.5, 0)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 939, _1080p * 1, _1080p * 32)
	var_1_0:addElement(var_1_7)

	var_1_0.DecryptionBar = var_1_7

	local var_1_8
	local var_1_9 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_1_10 = LUI.UIBorder.new(var_1_9)

	var_1_10.id = "DecryptionBorderBottom"

	var_1_10:SetRGBFromInt(7566195, 0)
	var_1_10:SetAlpha(0.5, 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 939, _1080p * 31, _1080p * 31)
	var_1_0:addElement(var_1_10)

	var_1_0.DecryptionBorderBottom = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "DecryptionText"

	var_1_12:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_1_12:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_AUDIO_DECRYPTION"), 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Center)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 939, _1080p * 2, _1080p * 30)
	var_1_0:addElement(var_1_12)

	var_1_0.DecryptionText = var_1_12

	return var_1_0
end

MenuBuilder.registerType("DecryptionHeader", DecryptionHeader)
LockTable(_M)
