module(..., package.seeall)

function Operation(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "Operation"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "operationName"

	var_1_4:SetRGBFromTable(SWATCHES.CAC.performanceHeader, 0)
	var_1_4:setText("", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 40, _1080p * 490, _1080p * 5, _1080p * 27)
	var_1_0:addElement(var_1_4)

	var_1_0.operationName = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("OperationStatus", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "OperationStatus"

	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 3, _1080p * 25, _1080p * 5, _1080p * 27)
	var_1_0:addElement(var_1_6)

	var_1_0.OperationStatus = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 45,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_6:RegisterAnimationSequence("OperationCompleted", var_1_8)

	local function var_1_9()
		var_1_6:AnimateSequence("OperationCompleted")
	end

	var_1_0._sequences.OperationCompleted = var_1_9

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_1_6:RegisterAnimationSequence("OperationIncomplete", var_1_10)

	local function var_1_11()
		var_1_6:AnimateSequence("OperationIncomplete")
	end

	var_1_0._sequences.OperationIncomplete = var_1_11

	return var_1_0
end

MenuBuilder.registerType("Operation", Operation)
LockTable(_M)
