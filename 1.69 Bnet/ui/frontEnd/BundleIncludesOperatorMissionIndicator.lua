module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.Amount:setText(Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_OPERATOR_MISSION_POINTS_REWARD", arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetAmount = var_0_0
end

function BundleIncludesOperatorMissionIndicator(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 138 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "BundleIncludesOperatorMissionIndicator"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CODPointsIcon"

	var_3_6:setImage(RegisterMaterial("icon_currency_codpoints_32x32"), 0)
	var_3_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -26, _1080p * -2, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_6)

	var_3_0.CODPointsIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Amount"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/BUNDLE_OPERATOR_MISSION_POINTS_REWARD"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(1)
	var_3_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -104, _1080p * -28, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_8)

	var_3_0.Amount = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "OperatorMissionIcon"

	var_3_10:setImage(RegisterMaterial("ui_icon_operator_mission_flipbook"), 0)
	var_3_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_3_0:addElement(var_3_10)

	var_3_0.OperatorMissionIcon = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("BundleIncludesOperatorMissionIndicator", BundleIncludesOperatorMissionIndicator)
LockTable(_M)
