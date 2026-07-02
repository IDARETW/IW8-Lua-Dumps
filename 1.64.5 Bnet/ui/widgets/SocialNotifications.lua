module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Count:setText(arg_1_1)

	local var_1_0 = arg_1_1 > 0 and SWATCHES.genericMenu.newIndicator or SWATCHES.genericMenu.progressBackground

	arg_1_0.Background:SetRGBFromTable(var_1_0, 0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMessageCount = var_0_0
end

function SocialNotifications(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 24 * _1080p, 0, 18 * _1080p)

	var_3_0.id = "SocialNotifications"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.progressBackground, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 24, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Count"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_3_6:setText("0", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 24, _1080p * -11, _1080p * 11)
	var_3_0:addElement(var_3_6)

	var_3_0.Count = var_3_6

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialNotifications", SocialNotifications)
LockTable(_M)
