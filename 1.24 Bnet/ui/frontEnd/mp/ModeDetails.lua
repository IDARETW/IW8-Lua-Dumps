module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		ACTIONS.AnimateSequence(arg_1_0, "ShowIcon")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideIcon")
	end

	arg_1_0._isIconShown = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.GenericItemInfo, "WARNING: Map Detail Items Are Missing")

	arg_2_0.ShowIcon = var_0_0
	arg_2_0._isIconShown = true

	local var_2_0 = arg_2_0.GenericItemInfo

	function arg_2_0.SetMode(arg_3_0, arg_3_1, arg_3_2)
		var_2_0.BodyText:setText(arg_3_1.desc)

		if arg_3_1.image then
			if arg_3_1.CDLImage and arg_3_2 == Lobby.gameModeCategories.CWL then
				var_2_0.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_3_1.CDLName)))
				arg_3_0.Icon:setImage(arg_3_1.CDLImage)
			else
				var_2_0.HeaderText:setText(ToUpperCase(arg_3_1.name))
				arg_3_0.Icon:setImage(arg_3_1.image)
			end
		end

		ACTIONS.AnimateSequence(arg_3_0, "Update")
	end
end

function ModeDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 820 * _1080p, 0, 200 * _1080p)

	var_4_0.id = "ModeDetails"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericItemInfo", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericItemInfo"

	var_4_6.BodyText:setText("", 0)
	var_4_6.HeaderText:setText(ToUpperCase(""), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 196, _1080p * -26, _1080p * -173, _1080p * -40)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericItemInfo = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Icon"

	var_4_8:setImage(RegisterMaterial("gamemode_generic"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 173, _1080p * 27, _1080p * 173)
	var_4_0:addElement(var_4_8)

	var_4_0.Icon = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_4_8:RegisterAnimationSequence("Update", var_4_10)

	local function var_4_11()
		var_4_8:AnimateSequence("Update")
	end

	var_4_0._sequences.Update = var_4_11

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -186
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		}
	}

	var_4_6:RegisterAnimationSequence("HideIcon", var_4_12)

	local var_4_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideIcon", var_4_13)

	local function var_4_14()
		var_4_6:AnimateSequence("HideIcon")
		var_4_8:AnimateSequence("HideIcon")
	end

	var_4_0._sequences.HideIcon = var_4_14

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -40
		}
	}

	var_4_6:RegisterAnimationSequence("ShowIcon", var_4_15)

	local var_4_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowIcon", var_4_16)

	local function var_4_17()
		var_4_6:AnimateSequence("ShowIcon")
		var_4_8:AnimateSequence("ShowIcon")
	end

	var_4_0._sequences.ShowIcon = var_4_17

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ModeDetails", ModeDetails)
LockTable(_M)
