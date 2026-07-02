module(..., package.seeall)

function WatchRankT9Progress(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 196 * _1080p, 0, 56 * _1080p)

	var_1_0.id = "WatchRankT9Progress"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	}
	local var_1_5 = LUI.UIBorder.new(var_1_4)

	var_1_5.id = "BorderShadow"

	var_1_5:SetRGBFromInt(0, 0)
	var_1_5:SetAlpha(0.2, 0)
	var_1_5:SetBorderThicknessLeft(_1080p * 5, 0)
	var_1_5:SetBorderThicknessRight(_1080p * 5, 0)
	var_1_5:SetBorderThicknessTop(_1080p * 5, 0)
	var_1_5:SetBorderThicknessBottom(_1080p * 5, 0)
	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 196, _1080p * 3, _1080p * 59)
	var_1_0:addElement(var_1_5)

	var_1_0.BorderShadow = var_1_5

	local var_1_6
	local var_1_7 = {
		borderThicknessLeft = _1080p * 5,
		borderThicknessRight = _1080p * 5,
		borderThicknessTop = _1080p * 5,
		borderThicknessBottom = _1080p * 5
	}
	local var_1_8 = LUI.UIBorder.new(var_1_7)

	var_1_8.id = "Border"

	var_1_8:SetRGBFromInt(0, 0)
	var_1_8:SetBorderThicknessLeft(_1080p * 5, 0)
	var_1_8:SetBorderThicknessRight(_1080p * 5, 0)
	var_1_8:SetBorderThicknessTop(_1080p * 5, 0)
	var_1_8:SetBorderThicknessBottom(_1080p * 5, 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 196, 0, _1080p * 56)
	var_1_0:addElement(var_1_8)

	var_1_0.Border = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "Pip1"

	var_1_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 46, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_10)

	var_1_0.Pip1 = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "Pip2"

	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 56, _1080p * 93, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_12)

	var_1_0.Pip2 = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "Pip3"

	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 103, _1080p * 140, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_14)

	var_1_0.Pip3 = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "Pip4"

	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 150, _1080p * 187, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_16)

	var_1_0.Pip4 = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "Div1"

	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 52, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_18)

	var_1_0.Div1 = var_1_18

	local var_1_19
	local var_1_20 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_20.id = "Div2"

	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 97, _1080p * 99, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_20)

	var_1_0.Div2 = var_1_20

	local var_1_21
	local var_1_22 = MenuBuilder.BuildRegisteredType("WatchRankT9ProgressPip", {
		controllerIndex = var_1_1
	})

	var_1_22.id = "Div3"

	var_1_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 144, _1080p * 146, _1080p * 9, _1080p * 47)
	var_1_0:addElement(var_1_22)

	var_1_0.Div3 = var_1_22

	local function var_1_23()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Progress25", var_1_25)

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Progress25", var_1_26)

	local var_1_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Progress25", var_1_27)

	local var_1_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Progress25", var_1_28)

	local function var_1_29()
		var_1_10:AnimateSequence("Progress25")
		var_1_12:AnimateSequence("Progress25")
		var_1_14:AnimateSequence("Progress25")
		var_1_16:AnimateSequence("Progress25")
	end

	var_1_0._sequences.Progress25 = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Progress50", var_1_31)

	local var_1_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Progress50", var_1_32)

	local var_1_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Progress50", var_1_33)

	local var_1_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Progress50", var_1_34)

	local function var_1_35()
		var_1_10:AnimateSequence("Progress50")
		var_1_12:AnimateSequence("Progress50")
		var_1_14:AnimateSequence("Progress50")
		var_1_16:AnimateSequence("Progress50")
	end

	var_1_0._sequences.Progress50 = var_1_35

	local var_1_36
	local var_1_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Progress75", var_1_37)

	local var_1_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Progress75", var_1_38)

	local var_1_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Progress75", var_1_39)

	local var_1_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Progress75", var_1_40)

	local function var_1_41()
		var_1_10:AnimateSequence("Progress75")
		var_1_12:AnimateSequence("Progress75")
		var_1_14:AnimateSequence("Progress75")
		var_1_16:AnimateSequence("Progress75")
	end

	var_1_0._sequences.Progress75 = var_1_41

	local var_1_42
	local var_1_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Progress100", var_1_43)

	local var_1_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Progress100", var_1_44)

	local var_1_45 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Progress100", var_1_45)

	local var_1_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Progress100", var_1_46)

	local function var_1_47()
		var_1_10:AnimateSequence("Progress100")
		var_1_12:AnimateSequence("Progress100")
		var_1_14:AnimateSequence("Progress100")
		var_1_16:AnimateSequence("Progress100")
	end

	var_1_0._sequences.Progress100 = var_1_47

	local var_1_48
	local var_1_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Progress0", var_1_49)

	local var_1_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_12:RegisterAnimationSequence("Progress0", var_1_50)

	local var_1_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("Progress0", var_1_51)

	local var_1_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_16:RegisterAnimationSequence("Progress0", var_1_52)

	local function var_1_53()
		var_1_10:AnimateSequence("Progress0")
		var_1_12:AnimateSequence("Progress0")
		var_1_14:AnimateSequence("Progress0")
		var_1_16:AnimateSequence("Progress0")
	end

	var_1_0._sequences.Progress0 = var_1_53

	return var_1_0
end

MenuBuilder.registerType("WatchRankT9Progress", WatchRankT9Progress)
LockTable(_M)
