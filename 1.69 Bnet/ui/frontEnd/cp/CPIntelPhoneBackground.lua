module(..., package.seeall)

function CPIntelPhoneBackground(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 364 * _1080p, 0, 663 * _1080p)

	var_1_0.id = "CPIntelPhoneBackground"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "BlackBackground"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 361, _1080p * 1, _1080p * 661)
	var_1_0:addElement(var_1_4)

	var_1_0.BlackBackground = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "GreyBackground"

	var_1_6:SetRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 361, _1080p * 73, _1080p * 602)
	var_1_0:addElement(var_1_6)

	var_1_0.GreyBackground = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "TimeLabel"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 246, _1080p * 12, _1080p * 30)
	var_1_0:addElement(var_1_8)

	var_1_0.TimeLabel = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "SignalIcon"

	var_1_10:SetScale(-0.5, 0)
	var_1_10:setImage(RegisterMaterial("screen_icon_signal"), 0)
	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 70, _1080p * -11, _1080p * 53)
	var_1_0:addElement(var_1_10)

	var_1_0.SignalIcon = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Battery"

	var_1_12:SetScale(-0.6, 0)
	var_1_12:setImage(RegisterMaterial("screen_icon_battery"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 293, _1080p * 357, _1080p * -11, _1080p * 53)
	var_1_0:addElement(var_1_12)

	var_1_0.Battery = var_1_12

	return var_1_0
end

MenuBuilder.registerType("CPIntelPhoneBackground", CPIntelPhoneBackground)
LockTable(_M)
