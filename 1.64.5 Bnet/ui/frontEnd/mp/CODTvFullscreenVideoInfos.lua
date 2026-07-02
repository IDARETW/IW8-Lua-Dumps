module(..., package.seeall)

function CODTvFullscreenVideoInfos(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p)

	var_1_0.id = "CODTvFullscreenVideoInfos"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.75, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "NowPlaying"

	var_1_6:setText(Engine.CBBHFCGDIC("CODTV/NOW_PLAYING"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Right)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 892, _1080p * 5, _1080p * 25)
	var_1_0:addElement(var_1_6)

	var_1_0.NowPlaying = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "VideoTitle"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Right)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 892, _1080p * 35, _1080p * 65)
	var_1_0:addElement(var_1_8)

	var_1_0.VideoTitle = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Spacer"

	var_1_10:SetAlpha(0.5, 0)
	var_1_10:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 26, _1080p * 27)
	var_1_0:addElement(var_1_10)

	var_1_0.Spacer = var_1_10

	return var_1_0
end

MenuBuilder.registerType("CODTvFullscreenVideoInfos", CODTvFullscreenVideoInfos)
LockTable(_M)
