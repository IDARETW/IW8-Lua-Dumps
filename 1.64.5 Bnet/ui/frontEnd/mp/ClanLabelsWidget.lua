module(..., package.seeall)

local function var_0_0(arg_1_0)
	if not arg_1_0._labels then
		arg_1_0._labels = {}

		arg_1_0.NoSearchLabels:SetAlpha(1)
	else
		arg_1_0.NoSearchLabels:SetAlpha(0)
	end

	arg_1_0.LabelGrid:SetNumChildren(#arg_1_0._labels)
	arg_1_0.LabelGrid:RefreshContent()
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._labels = arg_2_1

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0)
	arg_3_0.LabelGrid:SetNumChildren(0)
	arg_3_0.LabelGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_4_2 + arg_4_1 + 1
		local var_4_1 = arg_3_0._labels[var_4_0]

		arg_4_0:SetLabel(CLANS.CLAN_LABEL_STRINGS[var_4_1])
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetLabels = var_0_1

	var_0_2(arg_5_0)
end

function ClanLabelsWidget(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 826 * _1080p, 0, 75 * _1080p)

	var_6_0.id = "ClanLabelsWidget"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "LabelsHeader"

	var_6_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_LABELS_HEADER"), 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_4:SetAlignment(LUI.Alignment.Center)
	var_6_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 30)
	var_6_0:addElement(var_6_4)

	var_6_0.LabelsHeader = var_6_4

	local var_6_5
	local var_6_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 3,
		wrapY = false,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		buildArrowsLabel = false,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanLabelWidget", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 152,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Middle
	}
	local var_6_7 = LUI.UIGrid.new(var_6_6)

	var_6_7.id = "LabelGrid"

	var_6_7:setUseStencil(true)
	var_6_7:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 38, _1080p * 66)
	var_6_0:addElement(var_6_7)

	var_6_0.LabelGrid = var_6_7

	local var_6_8
	local var_6_9 = LUI.UIText.new()

	var_6_9.id = "NoSearchLabels"

	var_6_9:setText(Engine.CBBHFCGDIC("CLANS/NO_SEARCH_LABELS"), 0)
	var_6_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_9:SetAlignment(LUI.Alignment.Center)
	var_6_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 163, _1080p * 663, _1080p * 34, _1080p * 54)
	var_6_0:addElement(var_6_9)

	var_6_0.NoSearchLabels = var_6_9

	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ClanLabelsWidget", ClanLabelsWidget)
LockTable(_M)
