module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.RowGrid:SetNumRows(1)
	arg_1_0.RowGrid:SetNumColumns(0)
end

function MPStoreBillboardGridRow(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1680 * _1080p, 0, 190 * _1080p)

	var_2_0.id = "MPStoreBillboardGridRow"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_2_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MPStoreBillboardButton", {
				controllerIndex = var_2_1
			})
		end,
		refreshChild = function(arg_4_0, arg_4_1, arg_4_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 320,
		rowHeight = _1080p * 120,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_2_5 = LUI.UIGrid.new(var_2_4)

	var_2_5.id = "RowGrid"

	var_2_5:setUseStencil(true)
	var_2_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1680, _1080p * 40, _1080p * 190)
	var_2_0:addElement(var_2_5)

	var_2_0.RowGrid = var_2_5

	local var_2_6
	local var_2_7 = LUI.UIImage.new()

	var_2_7.id = "CategoryLine"

	var_2_7:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_7:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -700, _1080p * 31, _1080p * 32)
	var_2_0:addElement(var_2_7)

	var_2_0.CategoryLine = var_2_7

	local var_2_8
	local var_2_9 = LUI.UIStyledText.new()

	var_2_9.id = "CategoryText"

	var_2_9:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_2_9:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CATEGORIES")), 0)
	var_2_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_9:SetWordWrap(false)
	var_2_9:SetAlignment(LUI.Alignment.Left)
	var_2_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 570, _1080p * 4, _1080p * 28)
	var_2_0:addElement(var_2_9)

	var_2_0.CategoryText = var_2_9

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MPStoreBillboardGridRow", MPStoreBillboardGridRow)
LockTable(_M)
