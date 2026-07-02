module(..., package.seeall)

function MedalOverview(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 815 * _1080p, 0, 650 * _1080p)

	var_1_0.id = "MedalOverview"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "LeftBlur"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.4, 0)
	var_1_4:SetBlurStrength(2.75, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 400, _1080p * -140, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.LeftBlur = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIBlur.new()

	var_1_6.id = "RightBlur"

	var_1_6:SetRGBFromInt(0, 0)
	var_1_6:SetAlpha(0.4, 0)
	var_1_6:SetBlurStrength(2.75, 0)
	var_1_6:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -400, 0, _1080p * -140, 0)
	var_1_0:addElement(var_1_6)

	var_1_0.RightBlur = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "AvgMedals"

	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -400, 0, _1080p * -68, _1080p * -30)

	local function var_1_9()
		local var_2_0 = var_1_0:GetDataSource().avgMedals:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_8:setText(var_2_0, 0)
		end
	end

	var_1_8:SubscribeToModelThroughElement(var_1_0, "avgMedals", var_1_9)
	var_1_0:addElement(var_1_8)

	var_1_0.AvgMedals = var_1_8

	local var_1_10
	local var_1_11 = LUI.UIText.new()

	var_1_11.id = "AvgMedalsTitle"

	var_1_11:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/AVG_MEDALS"), 0)
	var_1_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_11:SetAlignment(LUI.Alignment.Center)
	var_1_11:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -400, 0, _1080p * -90, _1080p * -70)
	var_1_0:addElement(var_1_11)

	var_1_0.AvgMedalsTitle = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIText.new()

	var_1_13.id = "TotalMedals"

	var_1_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_13:SetAlignment(LUI.Alignment.Center)
	var_1_13:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 400, _1080p * -68, _1080p * -30)

	local function var_1_14()
		local var_3_0 = var_1_0:GetDataSource().totalMedals:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_13:setText(var_3_0, 0)
		end
	end

	var_1_13:SubscribeToModelThroughElement(var_1_0, "totalMedals", var_1_14)
	var_1_0:addElement(var_1_13)

	var_1_0.TotalMedals = var_1_13

	local var_1_15
	local var_1_16 = LUI.UIText.new()

	var_1_16.id = "TotalMedalsTitle"

	var_1_16:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/TOTAL_MEDALS"), 0)
	var_1_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_16:SetAlignment(LUI.Alignment.Center)
	var_1_16:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 400, _1080p * -90, _1080p * -70)
	var_1_0:addElement(var_1_16)

	var_1_0.TotalMedalsTitle = var_1_16

	local var_1_17
	local var_1_18 = {
		scrollingThresholdX = 0,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		wrapY = false,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MedalButton", {
				controllerIndex = var_1_1
			})
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 155,
		rowHeight = _1080p * 155,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_19 = LUI.UIDataSourceGrid.new(var_1_18)

	var_1_19.id = "MostImpressiveMedalGrid"

	var_1_19:setUseStencil(true)
	var_1_19:SetGridDataSourceThroughElement(var_1_0, "mostImpressiveMedals")
	var_1_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 815, _1080p * 40, _1080p * 360)
	var_1_0:addElement(var_1_19)

	var_1_0.MostImpressiveMedalGrid = var_1_19

	local var_1_20
	local var_1_21 = LUI.UIText.new()

	var_1_21.id = "Title"

	var_1_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MEDAL_MOST_IMPRESSIVE"), 0)
	var_1_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_21:SetAlignment(LUI.Alignment.Left)
	var_1_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -18, _1080p * 4, _1080p * 26)
	var_1_0:addElement(var_1_21)

	var_1_0.Title = var_1_21

	return var_1_0
end

MenuBuilder.registerType("MedalOverview", MedalOverview)
LockTable(_M)
