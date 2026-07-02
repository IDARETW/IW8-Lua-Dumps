module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)
	arg_1_0.BarracksHeader.Title:setText(Engine.CBBHFCGDIC(arg_1_1.name))
	arg_1_0.Stat:setText(arg_1_1.value)
	arg_1_0:SetAlpha(1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
end

function CombatRecordStatBox(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 280 * _1080p, 0, 160 * _1080p)

	var_3_0.id = "CombatRecordStatBox"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Stat"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText(ToUpperCase(""), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 14, _1080p * -14, _1080p * -12, _1080p * 38)
	var_3_0:addElement(var_3_6)

	var_3_0.Stat = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("BarracksHeader", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "BarracksHeader"

	var_3_8.Title:setText(ToUpperCase(""), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
	var_3_0:addElement(var_3_8)

	var_3_0.BarracksHeader = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_3_6:RegisterAnimationSequence("HideIcon", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("HideIcon")
	end

	var_3_0._sequences.HideIcon = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 140
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -20
		}
	}

	var_3_6:RegisterAnimationSequence("ShowIcon", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("ShowIcon")
	end

	var_3_0._sequences.ShowIcon = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CombatRecordStatBox", CombatRecordStatBox)
LockTable(_M)
