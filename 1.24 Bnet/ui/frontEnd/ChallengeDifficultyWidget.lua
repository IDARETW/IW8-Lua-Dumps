module(..., package.seeall)

function ChallengeDifficultyWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 24 * _1080p)

	var_1_0.id = "ChallengeDifficultyWidget"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "Difficulty"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_4:setText(Engine.CBBHFCGDIC("MENU/VETERAN_CAPS"), 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 200, _1080p * 2, _1080p * 22)
	var_1_0:addElement(var_1_4)

	var_1_0.Difficulty = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Icon"

	var_1_6:setImage(RegisterMaterial("icon_challenge_difficulty_veteran"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 25, 0, _1080p * 24)
	var_1_0:addElement(var_1_6)

	var_1_0.Icon = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8
	local var_1_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/REGULAR_CAPS")
		}
	}

	var_1_4:RegisterAnimationSequence("One", var_1_9)

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_challenge_difficulty_regular")
		}
	}

	var_1_6:RegisterAnimationSequence("One", var_1_10)

	local function var_1_11()
		var_1_4:AnimateSequence("One")
		var_1_6:AnimateSequence("One")
	end

	var_1_0._sequences.One = var_1_11

	local var_1_12
	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/HARDENED_CAPS")
		}
	}

	var_1_4:RegisterAnimationSequence("Two", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_challenge_difficulty_hard")
		}
	}

	var_1_6:RegisterAnimationSequence("Two", var_1_14)

	local function var_1_15()
		var_1_4:AnimateSequence("Two")
		var_1_6:AnimateSequence("Two")
	end

	var_1_0._sequences.Two = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/VETERAN_CAPS")
		}
	}

	var_1_4:RegisterAnimationSequence("Three", var_1_17)

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_challenge_difficulty_veteran")
		}
	}

	var_1_6:RegisterAnimationSequence("Three", var_1_18)

	local function var_1_19()
		var_1_4:AnimateSequence("Three")
		var_1_6:AnimateSequence("Three")
	end

	var_1_0._sequences.Three = var_1_19

	return var_1_0
end

MenuBuilder.registerType("ChallengeDifficultyWidget", ChallengeDifficultyWidget)
LockTable(_M)
