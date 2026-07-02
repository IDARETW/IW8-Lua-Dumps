module(..., package.seeall)

local var_0_0 = 15 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	if not arg_1_1 or type(arg_1_1) ~= "table" then
		assert(false, "You must provide a table containing data.")
	end

	arg_1_0.CategoryTitle:setText(arg_1_1.categoryName)
	arg_1_0.SelectedText:setText(arg_1_1.selections)

	if not arg_1_1.icons then
		arg_1_0.IconGrid:SetNumChildren(0)

		return
	end

	arg_1_0._index = arg_1_1.index

	local var_1_0 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.CategoryTitle, arg_1_1.categoryName)
	local var_1_1 = LAYOUT.GetTextHeightWithWrapping(arg_1_0.SelectedText, arg_1_1.selections)
	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.IconGrid:GetBuiltChildren()[1]:getLocalRect()
	local var_1_6 = #arg_1_1.icons
	local var_1_7 = math.ceil(var_1_6 / arg_1_0.IconGrid:GetMaxVisibleColumns())
	local var_1_8 = (var_1_5 - var_1_3) * var_1_7 + arg_1_0.IconGrid:GetSpacingY() * var_1_7
	local var_1_9 = var_1_0 + var_1_1 + var_0_0

	arg_1_0.IconGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.IconGrid:GetContentIndex(arg_2_1, arg_2_2)

		arg_2_0.IconImage:setImage(arg_1_1.icons[var_2_0 + 1])
	end)
	arg_1_0.IconGrid:SetNumChildren(var_1_6)
	arg_1_0.IconGrid:RefreshContent()

	arg_1_0._widgetHeight = math.max(var_1_9, var_1_8) + var_0_0
end

local function var_0_2(arg_3_0)
	return arg_3_0._widgetHeight
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0:getLocalRect()

	arg_4_0.SetData = var_0_1
	arg_4_0.GetWidgetHeight = var_0_2
	arg_4_0._widgetHeight = var_4_3 - var_4_1
end

function WZLookForPartyStatusItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 60 * _1080p)

	var_5_0.id = "WZLookForPartyStatusItem"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Bkg"

	var_5_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_5_4:SetAlpha(0.3, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * -2)
	var_5_0:addElement(var_5_4)

	var_5_0.Bkg = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "TopLIne"

	var_5_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_5_6:SetAlpha(0.45, 0)
	var_5_6:setImage(RegisterMaterial("line_dot_ch2"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_5_0:addElement(var_5_6)

	var_5_0.TopLIne = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "CategoryTitle"

	var_5_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 11, _1080p * 31)
	var_5_0:addElement(var_5_8)

	var_5_0.CategoryTitle = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIText.new()

	var_5_10.id = "SelectedText"

	var_5_10:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 266, _1080p * 31, _1080p * 49)
	var_5_0:addElement(var_5_10)

	var_5_0.SelectedText = var_5_10

	local var_5_11
	local var_5_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		maxVisibleRows = 2,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZLookForPartyStatusIcon", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 2,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 50,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_13 = LUI.UIGrid.new(var_5_12)

	var_5_13.id = "IconGrid"

	var_5_13:setUseStencil(true)
	var_5_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -164, _1080p * -10, _1080p * 9, _1080p * 111)
	var_5_0:addElement(var_5_13)

	var_5_0.IconGrid = var_5_13

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("WZLookForPartyStatusItem", WZLookForPartyStatusItem)
LockTable(_M)
