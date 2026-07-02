module(..., package.seeall)

function OperationDetailsPanel(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 330 * _1080p)

	var_1_0.id = "OperationDetailsPanel"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "DoubleNotchedBacker"

	var_1_4:SetAlpha(0.5, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.DoubleNotchedBacker = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "DividerTop"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.headerBoarder, 0)
	var_1_6:SetPixelGridEnabled(true)
	var_1_6:SetPixelGridContrast(0.2, 0)
	var_1_6:SetPixelGridBlockWidth(2, 0)
	var_1_6:SetPixelGridBlockHeight(2, 0)
	var_1_6:SetPixelGridGutterWidth(1, 0)
	var_1_6:SetPixelGridGutterHeight(1, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 52, _1080p * 53)
	var_1_0:addElement(var_1_6)

	var_1_0.DividerTop = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "OperationsText"

	var_1_8:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_1_8:setText(ToUpperCase("Upgrade operations"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 40, _1080p * -96, _1080p * 13, _1080p * 41)
	var_1_0:addElement(var_1_8)

	var_1_0.OperationsText = var_1_8

	local var_1_9
	local var_1_10 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 3,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperationDetails", {
				controllerIndex = var_1_1
			})
		end,
		refreshChild = function(arg_3_0, arg_3_1, arg_3_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.vertical,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_11 = LUI.UIGrid.new(var_1_10)

	var_1_11.id = "OperatorDetailsGrid"

	var_1_11:setUseStencil(true)
	var_1_11:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -96, _1080p * 63, _1080p * 307)
	var_1_0:addElement(var_1_11)

	var_1_0.OperatorDetailsGrid = var_1_11

	local function var_1_12()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_12

	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_1_8:RegisterAnimationSequence("WestAlign", var_1_13)

	local var_1_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_1_11:RegisterAnimationSequence("WestAlign", var_1_14)

	local function var_1_15()
		var_1_8:AnimateSequence("WestAlign")
		var_1_11:AnimateSequence("WestAlign")
	end

	var_1_0._sequences.WestAlign = var_1_15

	local function var_1_16()
		return
	end

	var_1_0._sequences.TwoOperations = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.ThreeOperations = var_1_17

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_1_8:RegisterAnimationSequence("EastAlign", var_1_18)

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -96
		}
	}

	var_1_11:RegisterAnimationSequence("EastAlign", var_1_19)

	local function var_1_20()
		var_1_8:AnimateSequence("EastAlign")
		var_1_11:AnimateSequence("EastAlign")
	end

	var_1_0._sequences.EastAlign = var_1_20

	return var_1_0
end

MenuBuilder.registerType("OperationDetailsPanel", OperationDetailsPanel)
LockTable(_M)
