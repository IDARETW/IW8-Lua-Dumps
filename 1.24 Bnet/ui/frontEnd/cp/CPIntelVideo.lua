module(..., package.seeall)

function CPIntelVideo(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "CPIntelVideo"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Window"

	var_1_4:setImage(RegisterMaterial("computer_screen_windows_intel_audio"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1580, _1080p * 331, _1080p * 811)
	var_1_0:addElement(var_1_4)

	var_1_0.Window = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "RemoteConnection"

	var_1_6:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_VIDEO_HEADER"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1160, _1080p * 331, _1080p * 351)
	var_1_0:addElement(var_1_6)

	var_1_0.RemoteConnection = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Image"

	var_1_8:SetRGBFromInt(0, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 638, _1080p * 1567, _1080p * 362, _1080p * 807)
	var_1_0:addElement(var_1_8)

	var_1_0.Image = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIStyledText.new()

	var_1_10.id = "CategoryText"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_1_10:setText("", 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Left)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1046, _1080p * 276, _1080p * 300)
	var_1_0:addElement(var_1_10)

	var_1_0.CategoryText = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "IntelName"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Right)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1140, _1080p * 1578, _1080p * 276, _1080p * 300)
	var_1_0:addElement(var_1_12)

	var_1_0.IntelName = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIImage.new()

	var_1_14.id = "Line"

	var_1_14:SetRGBFromInt(6250335, 0)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1578, _1080p * 306, _1080p * 307)
	var_1_0:addElement(var_1_14)

	var_1_0.Line = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "Cinematic"

	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 638, _1080p * 1567, _1080p * 362, _1080p * 807)
	var_1_0:addElement(var_1_16)

	var_1_0.Cinematic = var_1_16

	return var_1_0
end

MenuBuilder.registerType("CPIntelVideo", CPIntelVideo)
LockTable(_M)
