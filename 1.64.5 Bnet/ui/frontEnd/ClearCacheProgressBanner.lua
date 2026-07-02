module(..., package.seeall)

function MoveBanner(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0:SetTop(arg_1_1, arg_1_3)
	arg_1_0:SetBottom(arg_1_2, arg_1_3)
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MoveBanner = MoveBanner
end

function ClearCacheProgressBanner(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 435 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "ClearCacheProgressBanner"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("PreloadingShadersBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "BannerBackground"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.BannerBackground = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Icon"

	var_3_6:SetRGBFromTable(SWATCHES.KeyBinding.bindingSuccess, 0)
	var_3_6:setImage(RegisterMaterial("hud_icon_net_shader_warning"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 7, _1080p * 35, _1080p * -15, _1080p * 15)
	var_3_0:addElement(var_3_6)

	var_3_0.Icon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "ColoredText"

	var_3_8:SetRGBFromTable(SWATCHES.KeyBinding.bindingSuccess, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("MENU/CLEAR_CACHE_COMPLETED"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -217.5, _1080p * 217.5, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_8)

	var_3_0.ColoredText = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClearCacheProgressBanner", ClearCacheProgressBanner)
LockTable(_M)
