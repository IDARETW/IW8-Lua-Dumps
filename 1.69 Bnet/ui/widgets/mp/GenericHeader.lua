module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function GenericHeader(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 526 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "GenericHeader"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "Title"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 10, _1080p * 30)
	var_2_0:addElement(var_2_4)

	var_2_0.Title = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Line"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 35)
	var_2_0:addElement(var_2_6)

	var_2_0.Line = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GenericHeader", GenericHeader)
LockTable(_M)
