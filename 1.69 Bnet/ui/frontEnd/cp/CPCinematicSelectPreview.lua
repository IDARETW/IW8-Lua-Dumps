module(..., package.seeall)

function CPCinematicSelectPreview(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "CPCinematicSelectPreview"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		fullscreen = true,
		controllerIndex = var_1_1
	})

	var_1_4.id = "Preview"

	var_1_0:addElement(var_1_4)

	var_1_0.Preview = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Backer"

	var_1_6:setImage(RegisterMaterial("gradient_bottom"), 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 159, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Backer = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TopCorner"

	var_1_8:SetAlpha(0.75, 0)
	var_1_8:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -738, 0, _1080p * 196)
	var_1_0:addElement(var_1_8)

	var_1_0.TopCorner = var_1_8

	return var_1_0
end

MenuBuilder.registerType("CPCinematicSelectPreview", CPCinematicSelectPreview)
LockTable(_M)
