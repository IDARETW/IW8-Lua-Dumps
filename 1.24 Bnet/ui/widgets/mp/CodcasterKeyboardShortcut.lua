module(..., package.seeall)

function CodcasterKeyboardShortcut(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 65 * _1080p)

	var_1_0.id = "CodcasterKeyboardShortcut"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_1_4:SetAlpha(0.9, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 95, _1080p * -400, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Gradient"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_6:SetAlpha(0.1, 0)
	var_1_6:SetXRotation(180, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.2, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 95, _1080p * -400, _1080p * 65, _1080p * -65)
	var_1_0:addElement(var_1_6)

	var_1_0.Gradient = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TextureLayer"

	var_1_8:SetAlpha(0.1, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.8, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 95, _1080p * -400, _1080p * 65, _1080p * -65)
	var_1_0:addElement(var_1_8)

	var_1_0.TextureLayer = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "KeyString"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 86, _1080p * 17, _1080p * 47)

	local function var_1_11()
		local var_2_0 = var_1_0:GetDataSource().keyString:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_10:setText(var_2_0, 0)
		end
	end

	var_1_10:SubscribeToModelThroughElement(var_1_0, "keyString", var_1_11)
	var_1_0:addElement(var_1_10)

	var_1_0.KeyString = var_1_10

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "KeyText"

	var_1_13:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_13:SetAlignment(LUI.Alignment.Left)
	var_1_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 109, _1080p * 399, _1080p * 20, _1080p * 44)

	local function var_1_14()
		local var_3_0 = var_1_0:GetDataSource().keyText:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_13:setText(var_3_0, 0)
		end
	end

	var_1_13:SubscribeToModelThroughElement(var_1_0, "keyText", var_1_14)
	var_1_0:addElement(var_1_13)

	var_1_0.KeyText = var_1_13

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "PopupGlowBottom"

	var_1_16:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_16:SetPixelGridEnabled(true)
	var_1_16:SetPixelGridContrast(0.5, 0)
	var_1_16:SetPixelGridBlockWidth(2, 0)
	var_1_16:SetPixelGridBlockHeight(2, 0)
	var_1_16:SetPixelGridGutterWidth(1, 0)
	var_1_16:SetPixelGridGutterHeight(1, 0)
	var_1_16:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -22, _1080p * -284, _1080p * 31.5, _1080p * 33.5)
	var_1_0:addElement(var_1_16)

	var_1_0.PopupGlowBottom = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "PopupGlowBottomCopy0"

	var_1_18:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_1_18:SetPixelGridEnabled(true)
	var_1_18:SetPixelGridContrast(0.5, 0)
	var_1_18:SetPixelGridBlockWidth(2, 0)
	var_1_18:SetPixelGridBlockHeight(2, 0)
	var_1_18:SetPixelGridGutterWidth(1, 0)
	var_1_18:SetPixelGridGutterHeight(1, 0)
	var_1_18:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * -22, _1080p * -284, _1080p * -33.5, _1080p * -31.5)
	var_1_0:addElement(var_1_18)

	var_1_0.PopupGlowBottomCopy0 = var_1_18

	return var_1_0
end

MenuBuilder.registerType("CodcasterKeyboardShortcut", CodcasterKeyboardShortcut)
LockTable(_M)
