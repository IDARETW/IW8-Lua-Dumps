module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.IntelImage:setImage(RegisterMaterial(arg_1_1.imageName), 0)
	arg_1_0.Time:setText(Engine.CBBHFCGDIC(arg_1_1.desc))
	arg_1_0.Location:setText(Engine.CBBHFCGDIC(arg_1_1.desc2))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_0
end

function CPIntelImage(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CPIntelImage"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Window"

	var_3_4:SetScale(0.09, 0)
	var_3_4:setImage(RegisterMaterial("computer_screen_windows_intel_audio"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 719, _1080p * 1786, _1080p * 244, _1080p * 872)
	var_3_0:addElement(var_3_4)

	var_3_0.Window = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "RemoteConnection"

	var_3_6:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_IMAGE_HEADER"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 718, _1080p * 1218, _1080p * 220, _1080p * 242)
	var_3_0:addElement(var_3_6)

	var_3_0.RemoteConnection = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "IntelImage"

	var_3_8:SetScale(-0.4, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 291, _1080p * 2213, _1080p * 31, _1080p * 1111)
	var_3_0:addElement(var_3_8)

	var_3_0.IntelImage = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Time"

	var_3_10:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1511, _1080p * 1824, _1080p * 851, _1080p * 869)
	var_3_0:addElement(var_3_10)

	var_3_0.Time = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "Location"

	var_3_12:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Right)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 673, _1080p * 986, _1080p * 851, _1080p * 869)
	var_3_0:addElement(var_3_12)

	var_3_0.Location = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPIntelImage", CPIntelImage)
LockTable(_M)
