module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1.num)
	assert(arg_1_1.image)
	arg_1_0.NumberLabel:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_MULTIPLIER", arg_1_1.num), 0)
	arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1.image))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Icon)
	assert(arg_2_0.NumberLabel)

	arg_2_0.SetupAccoladeData = var_0_0
end

function AARCommendationUnit(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 225 * _1080p, 0, 225 * _1080p)

	var_3_0.id = "AARCommendationUnit"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAlpha(0.8, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Icon"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -86.5, _1080p * 85.5, _1080p * -96.5, _1080p * 75.5)
	var_3_0:addElement(var_3_6)

	var_3_0.Icon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "NumberLabel"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_8:SetAlpha(0.5, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -32, _1080p * -8)
	var_3_0:addElement(var_3_8)

	var_3_0.NumberLabel = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_11)

	local function var_3_12()
		var_3_8:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_12

	local var_3_13
	local var_3_14 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_14)

	local function var_3_15()
		var_3_8:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_15

	local function var_3_16()
		return
	end

	var_3_0._sequences.AR = var_3_16

	var_3_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARCommendationUnit", AARCommendationUnit)
LockTable(_M)
