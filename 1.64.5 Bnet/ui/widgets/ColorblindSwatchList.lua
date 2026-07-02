module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1 = Engine.CBCJIDDIED(arg_1_1)

	assert(COLOR_BLIND.UIFilter[COLOR_BLIND.modes.none][arg_1_2])

	arg_1_0._swatchWidgets = {}

	for iter_1_0, iter_1_1 in pairs(COLOR_BLIND.UIFilter[COLOR_BLIND.modes.none][arg_1_2]) do
		local var_1_2 = MenuBuilder.BuildRegisteredType("ColorblindSwatch", {
			controllerIndex = arg_1_1
		})

		var_1_2:Setup(arg_1_1, arg_1_2, iter_1_0)
		arg_1_0:addElement(var_1_2)
		table.insert(arg_1_0._swatchWidgets, var_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0._swatchWidgets) do
		iter_2_1:UpdateSwatch(arg_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0
	arg_3_0.Update = var_0_1
end

function ColorblindSwatchList(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIHorizontalStackedLayout.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "ColorblindSwatchList"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:SetSpacing(5 * _1080p)

	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "SwatchCat"

	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 123, _1080p * -9, _1080p * 9)
	var_4_0:addElement(var_4_4)

	var_4_0.SwatchCat = var_4_4

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ColorblindSwatchList", ColorblindSwatchList)
LockTable(_M)
