module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GridCountArrows(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "GridCountArrows"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "ArrowUp"

	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * -68, 0, _1080p * 32)
	var_2_0:addElement(var_2_4)

	var_2_0.ArrowUp = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ArrowDown"

	var_2_6.Arrow:SetZRotation(180, 0)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 68, _1080p * 100, 0, _1080p * 32)
	var_2_0:addElement(var_2_6)

	var_2_0.ArrowDown = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "ListCount"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -68, _1080p * 68, _1080p * -10, _1080p * 10)
	var_2_0:addElement(var_2_8)

	var_2_0.ListCount = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_8:RegisterAnimationSequence("AR", var_2_10)

	local function var_2_11()
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_11

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GridCountArrows", GridCountArrows)
LockTable(_M)
