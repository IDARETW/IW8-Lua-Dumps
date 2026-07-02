module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if type(arg_1_1 == "number") and arg_1_1 < 1 and arg_1_1 >= 0 then
		arg_1_0.PercentageOfCompletion:setText(Engine.CBBHFCGDIC("LUA_MENU/PERCENTAGE_OF_COMPLETION", arg_1_1 * 100))
		arg_1_0.FillBar:SetPercent(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetScore = var_0_0
end

function PCAchievementTotalScore(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 640 * _1080p, 0, 40 * _1080p)

	var_3_0.id = "PCAchievementTotalScore"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("PCAchievementFillBar", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "FillBar"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 640, _1080p * 27, _1080p * 36)
	var_3_0:addElement(var_3_4)

	var_3_0.FillBar = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "TotalCompletion"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU/TOTAL_COMPLETION"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 225, _1080p * 1, _1080p * 19)
	var_3_0:addElement(var_3_6)

	var_3_0.TotalCompletion = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "PercentageOfCompletion"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 463, _1080p * 640, _1080p * 1, _1080p * 19)
	var_3_0:addElement(var_3_8)

	var_3_0.PercentageOfCompletion = var_3_8

	local var_3_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_9)

	local function var_3_10()
		var_3_8:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("PCAchievementTotalScore", PCAchievementTotalScore)
LockTable(_M)
