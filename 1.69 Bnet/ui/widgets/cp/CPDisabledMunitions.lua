module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = StringTable.BFHCAIIDA(CSV.munitions.file) - 1
	local var_1_1 = {}

	for iter_1_0 = 0, var_1_0 do
		local var_1_2 = StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.index, iter_1_0, CSV.munitions.cols.noIndoors)
		local var_1_3

		if var_1_2 ~= nil and var_1_2 == "1" then
			var_1_3 = StringTable.DIFCHIGDFB(CSV.munitions.file, CSV.munitions.cols.index, iter_1_0, CSV.munitions.cols.icon)
		end

		if var_1_3 and var_1_3 ~= "" then
			table.insert(var_1_1, var_1_3)
		end
	end

	arg_1_0.GridLayout:SetNumChildren(#var_1_1)
	arg_1_0.GridLayout:SetNumRows(1)
	arg_1_0.GridLayout:SetNumColumns(#var_1_1)
	arg_1_0.GridLayout:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + arg_2_2 * arg_1_0.GridLayout:GetNumColumns()

		arg_2_0.Icon:setImage(RegisterMaterial(var_1_1[var_2_0 + 1]))
		arg_2_0.Icon:SetAlpha(1, 0)
	end)
	arg_1_0.GridLayout:RefreshContent()
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	var_0_0(arg_3_0, arg_3_1)
	arg_3_0:SetAlpha(0)
	arg_3_0:SubscribeToDataSourceThroughElement(arg_3_0, nil, function()
		local var_4_0 = arg_3_0:GetDataSource()

		if var_4_0 then
			if var_4_0.timeLimit:GetValue(arg_3_1) == 101 then
				arg_3_0:SetAlpha(1)
			else
				arg_3_0:SetAlpha(0)
			end
		end
	end)
end

function CPDisabledMunitions(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 100 * _1080p)

	var_5_0.id = "CPDisabledMunitions"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "Background"

	var_5_4:SetAlpha(0, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 9,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CPDisabledMunitionsIcon", {
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
	local var_5_7 = LUI.UIGrid.new(var_5_6)

	var_5_7.id = "GridLayout"

	var_5_7:SetScale(-0.25, 0)
	var_5_7:setUseStencil(true)
	var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -65, _1080p * 527, _1080p * 33, _1080p * 97)
	var_5_0:addElement(var_5_7)

	var_5_0.GridLayout = var_5_7

	local var_5_8
	local var_5_9 = LUI.UIText.new()

	var_5_9.id = "Title"

	var_5_9:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_9:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/DISABLED_MUNITIONS"), 0)
	var_5_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_9:SetAlignment(LUI.Alignment.Left)
	var_5_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 8, _1080p * -174, _1080p * 12, _1080p * 36)
	var_5_0:addElement(var_5_9)

	var_5_0.Title = var_5_9

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPDisabledMunitions", CPDisabledMunitions)
LockTable(_M)
