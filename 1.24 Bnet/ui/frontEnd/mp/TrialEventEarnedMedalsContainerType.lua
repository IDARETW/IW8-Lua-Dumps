module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._medalsData = arg_1_2
	arg_1_0._medalType = arg_1_1
	arg_1_0._medalTotal = arg_1_3

	arg_1_0.Medals:RefreshContent()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.RefreshData = var_0_0
	arg_2_0._medalsData = {}

	local function var_2_0(arg_3_0, arg_3_1, arg_3_2)
		arg_3_0._column = arg_3_1 + 1

		arg_3_0:SetMedal({
			medalType = arg_2_0._medalType,
			earned = arg_3_0._column <= arg_2_0._medalTotal
		})
	end

	arg_2_0.Medals:SetRefreshChild(var_2_0)
end

function TrialEventEarnedMedalsContainerType(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 32 * _1080p)

	var_4_0.id = "TrialEventEarnedMedalsContainerType"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIText.new()

	var_4_4.id = "Type"

	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 96, _1080p * -13, _1080p * 15)
	var_4_0:addElement(var_4_4)

	var_4_0.Type = var_4_4

	local var_4_5
	local var_4_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("TrialEventMedal", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 32,
		rowHeight = _1080p * 32,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_7 = LUI.UIGrid.new(var_4_6)

	var_4_7.id = "Medals"

	var_4_7:setUseStencil(true)
	var_4_7:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 104, _1080p * 281, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_7)

	var_4_0.Medals = var_4_7

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TrialEventEarnedMedalsContainerType", TrialEventEarnedMedalsContainerType)
LockTable(_M)
