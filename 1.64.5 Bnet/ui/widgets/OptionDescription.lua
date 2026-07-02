module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function OptionDescription(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 933 * _1080p, 0, 24 * _1080p)

	var_2_0.id = "OptionDescription"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "Text"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_4:setText("", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 24)
	var_2_0:addElement(var_2_4)

	var_2_0.Text = var_2_4

	local function var_2_5()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_5

	local var_2_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_6)

	local function var_2_7()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_7

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OptionDescription", OptionDescription)
LockTable(_M)
