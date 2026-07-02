module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function StoreCategoryHeaderRow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "StoreCategoryHeaderRow"
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

	var_2_4.id = "Label"

	var_2_4:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_2_4:setText(ToUpperCase(""), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetTracking(10 * _1080p, 0)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 30)
	var_2_0:addElement(var_2_4)

	var_2_0.Label = var_2_4

	local function var_2_5()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_5

	local var_2_6
	local var_2_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -21
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_7)

	local function var_2_8()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_8

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("StoreCategoryHeaderRow", StoreCategoryHeaderRow)
LockTable(_M)
