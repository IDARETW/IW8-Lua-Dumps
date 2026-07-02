module(..., package.seeall)

function GenericContentPanel(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p)

	var_1_0.id = "GenericContentPanel"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "ClanTagBacker"

	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.ClanTagBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Divider"

	var_1_6:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_1_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 46, _1080p * 47)
	var_1_0:addElement(var_1_6)

	var_1_0.Divider = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Text"

	var_1_8:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetStartupDelay(2000)
	var_1_8:SetLineHoldTime(400)
	var_1_8:SetAnimMoveTime(2000)
	var_1_8:SetAnimMoveSpeed(150)
	var_1_8:SetEndDelay(2000)
	var_1_8:SetCrossfadeTime(1000)
	var_1_8:SetFadeInTime(300)
	var_1_8:SetFadeOutTime(300)
	var_1_8:SetMaxVisibleLines(1)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, 0, _1080p * 10, _1080p * 40)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	return var_1_0
end

MenuBuilder.registerType("GenericContentPanel", GenericContentPanel)
LockTable(_M)
