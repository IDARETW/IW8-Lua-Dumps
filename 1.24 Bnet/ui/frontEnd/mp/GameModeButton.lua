module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageRussian() then
		ACTIONS.AnimateSequence(arg_1_0, "RU")
	end
end

function GameModeButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIHorizontalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "GameModeButton"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(5 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "MainButton"

	var_2_4.Text:SetLeft(_1080p * 20, 0)
	var_2_4.Text:setText(ToUpperCase(""), 0)
	var_2_4.Text:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 40)
	var_2_0:addElement(var_2_4)

	var_2_0.MainButton = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "OptionsButton"

	var_2_6.Text:SetLeft(0, 0)
	var_2_6.Text:setText(Engine.CBBHFCGDIC("MENU/OPTIONS"), 0)
	var_2_6.Text:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 425, _1080p * 544, 0, _1080p * 40)
	var_2_0:addElement(var_2_6)

	var_2_0.OptionsButton = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 560
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5,
			child = var_2_0.OptionsButton.Text
		}
	}

	var_2_6:RegisterAnimationSequence("RU", var_2_8)

	local function var_2_9()
		var_2_6:AnimateSequence("RU")
	end

	var_2_0._sequences.RU = var_2_9

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GameModeButton", GameModeButton)
LockTable(_M)
