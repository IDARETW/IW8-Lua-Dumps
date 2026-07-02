module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.RankIcon:setImage(RegisterMaterial(PROGRESSION.GetRankIcon(arg_1_1, arg_1_2)))
	arg_1_0.RankNumber:setText(arg_1_1 + 1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitializeRankDisplay = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function RankTab(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 70 * _1080p, 0, 36 * _1080p)

	var_3_0.id = "RankTab"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "RankNumber"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_4:setText("999", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 70, _1080p * 8, _1080p * 28)
	var_3_0:addElement(var_3_4)

	var_3_0.RankNumber = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "RankIcon"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 36, 0, _1080p * 36)
	var_3_0:addElement(var_3_6)

	var_3_0.RankIcon = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.Icon1x1 = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.Icon2x1 = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.Intro = var_3_10

	local var_3_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_11)

	local function var_3_12()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RankTab", RankTab)
LockTable(_M)
