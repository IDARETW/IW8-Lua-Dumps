module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NotVisibleSwatch:SetUpdateHandler(arg_1_1)
	arg_1_0.BarelyVisibleSwatch:SetUpdateHandler(arg_1_1)
	arg_1_0.EasilyVisibleSwatch:SetUpdateHandler(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.NotVisibleSwatch.Label:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.BarelyVisibleSwatch.Label:SetAlpha(arg_2_1 and 1 or 0)
	arg_2_0.EasilyVisibleSwatch.Label:SetAlpha(arg_2_1 and 1 or 0)
end

local function var_0_2(arg_3_0)
	arg_3_0.NotVisibleSwatch.colorModifier = -0.3
	arg_3_0.BarelyVisibleSwatch.colorModifier = 0
	arg_3_0.EasilyVisibleSwatch.colorModifier = 0.3
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.NotVisibleSwatch)
	assert(arg_4_0.BarelyVisibleSwatch)
	assert(arg_4_0.EasilyVisibleSwatch)

	arg_4_0.SetSwatchUpdateHandler = var_0_0
	arg_4_0.SetLabelsVisible = var_0_1

	var_0_2(arg_4_0)
end

function CalibrationGuide(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 250 * _1080p)

	var_5_0.id = "CalibrationGuide"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("CalibrationSwatch", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "NotVisibleSwatch"

	var_5_4.Visibility:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_NOT_VISIBLE"), 0)
	var_5_4.Label:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_GUIDE_LABEL_1"), 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 250, 0, _1080p * 250)
	var_5_0:addElement(var_5_4)

	var_5_0.NotVisibleSwatch = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("CalibrationSwatch", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "BarelyVisibleSwatch"

	var_5_6.Visibility:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_BARELY_VISIBLE"), 0)
	var_5_6.Label:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_GUIDE_LABEL_2"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 250, _1080p * 500, 0, _1080p * 250)
	var_5_0:addElement(var_5_6)

	var_5_0.BarelyVisibleSwatch = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("CalibrationSwatch", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "EasilyVisibleSwatch"

	var_5_8.Visibility:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_EASILY_VISIBLE"), 0)
	var_5_8.Label:setText(Engine.CBBHFCGDIC("MENU/BRIGHTNESS_GUIDE_LABEL_3"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 500, _1080p * 750, 0, _1080p * 250)
	var_5_0:addElement(var_5_8)

	var_5_0.EasilyVisibleSwatch = var_5_8

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CalibrationGuide", CalibrationGuide)
LockTable(_M)
