module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function StreakCostWidget(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 194 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "StreakCostWidget"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "Text"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_2_4:SetAlpha(0.7, 0)
	var_2_4:setText("8 Kills", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 41, _1080p * 194, _1080p * 4, _1080p * 28)
	var_2_0:addElement(var_2_4)

	var_2_0.Text = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Skull"

	var_2_6:SetAlpha(0.7, 0)
	var_2_6:setImage(RegisterMaterial("icon_skull_small"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_2_0:addElement(var_2_6)

	var_2_0.Skull = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_skull_small")
		}
	}

	var_2_6:RegisterAnimationSequence("Kills", var_2_8)

	local function var_2_9()
		var_2_6:AnimateSequence("Kills")
	end

	var_2_0._sequences.Kills = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_scorestreak")
		}
	}

	var_2_6:RegisterAnimationSequence("Score", var_2_10)

	local function var_2_11()
		var_2_6:AnimateSequence("Score")
	end

	var_2_0._sequences.Score = var_2_11

	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("StreakCostWidget", StreakCostWidget)
LockTable(_M)
