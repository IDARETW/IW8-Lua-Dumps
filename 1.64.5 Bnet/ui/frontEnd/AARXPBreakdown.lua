module(..., package.seeall)

function AARXPBreakdown(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 406 * _1080p, 0, 28 * _1080p)

	var_1_0.id = "AARXPBreakdown"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "Value"

	var_1_4:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_1_4:setText("0000", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetWordWrap(false)
	var_1_4:SetAlignment(LUI.Alignment.Right)
	var_1_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -100, 0, _1080p * -12, _1080p * 12)
	var_1_0:addElement(var_1_4)

	var_1_0.Value = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Title"

	var_1_6:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_1_6:setText("", 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -100, _1080p * -14, _1080p * 14)
	var_1_0:addElement(var_1_6)

	var_1_0.Title = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Intro", var_1_8)

	local var_1_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Intro", var_1_9)

	local function var_1_10()
		var_1_4:AnimateSequence("Intro")
		var_1_6:AnimateSequence("Intro")
	end

	var_1_0._sequences.Intro = var_1_10

	return var_1_0
end

MenuBuilder.registerType("AARXPBreakdown", AARXPBreakdown)
LockTable(_M)
