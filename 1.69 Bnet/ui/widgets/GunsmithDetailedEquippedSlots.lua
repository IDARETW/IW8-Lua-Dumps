module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function GunsmithDetailedEquippedSlots(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 332 * _1080p, 0, 32 * _1080p)

	var_2_0.id = "GunsmithDetailedEquippedSlots"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "EquippedText"

	var_2_4:SetRGBFromTable(SWATCHES.genericMenu.subtitle, 0)
	var_2_4:setText("Equipped #/#:", 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 822, _1080p * -14, _1080p * 14)
	var_2_0:addElement(var_2_4)

	var_2_0.EquippedText = var_2_4

	local var_2_5
	local var_2_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 10,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LargeAttachment", {
				controllerIndex = var_2_1
			})
		end,
		refreshChild = function(arg_4_0, arg_4_1, arg_4_2)
			return
		end,
		spacingX = _1080p * 15,
		spacingY = _1080p * 15,
		columnWidth = _1080p * 50,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_7 = LUI.UIGrid.new(var_2_6)

	var_2_7.id = "Grid"

	var_2_7:setUseStencil(false)
	var_2_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 166, _1080p * 756, _1080p * -8, _1080p * 41)
	var_2_0:addElement(var_2_7)

	var_2_0.Grid = var_2_7

	local function var_2_8()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_8

	local var_2_9
	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_10)

	local function var_2_11()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_2_4:RegisterAnimationSequence("WZWipSetup", var_2_13)

	local function var_2_14()
		var_2_4:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_14

	local function var_2_15()
		return
	end

	var_2_0._sequences.DisplayExtraAttachments = var_2_15

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("GunsmithDetailedEquippedSlots", GunsmithDetailedEquippedSlots)
LockTable(_M)
