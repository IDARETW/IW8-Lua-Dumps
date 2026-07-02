module(..., package.seeall)

function WZBladesNewNotif(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 32 * _1080p)

	var_1_0.id = "WZBladesNewNotif"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "WZWipButtonOver"

	var_1_4:SetRGBFromInt(15066083, 0)
	var_1_4:setImage(RegisterMaterial("menu_blade_highlight_backing_ch2"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -78, _1080p * 78, _1080p * -19, _1080p * 41)
	var_1_0:addElement(var_1_4)

	var_1_0.WZWipButtonOver = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Text"

	var_1_6:SetRGBFromTable(SWATCHES.CH2.Ch2DarkGrey, 0)
	var_1_6:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/NEW_CAPS")), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetStartupDelay(2000)
	var_1_6:SetLineHoldTime(400)
	var_1_6:SetAnimMoveTime(300)
	var_1_6:SetAnimMoveSpeed(50)
	var_1_6:SetEndDelay(1500)
	var_1_6:SetCrossfadeTime(750)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_1_6:SetOutlineRGBFromInt(0, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -20, _1080p * -17, _1080p * 19)
	var_1_0:addElement(var_1_6)

	var_1_0.Text = var_1_6

	return var_1_0
end

MenuBuilder.registerType("WZBladesNewNotif", WZBladesNewNotif)
LockTable(_M)
