module(..., package.seeall)

local function var_0_0(arg_1_0)
	assert(arg_1_0.CommendationGrid)

	arg_1_0.CommendationGrid.default = false

	arg_1_0.CommendationGrid:SetNumChildren(#arg_1_0._dataPackage)
	arg_1_0.CommendationGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.CommendationGrid:GetContentIndex(arg_2_1, arg_2_2, {
			relativePosition = false
		})
		local var_2_1 = arg_1_0._dataPackage[var_2_0 + 1]

		if var_2_1 then
			arg_2_0:SetupAccoladeData(var_2_1)
			arg_2_0:addEventHandler("gain_focus", function()
				arg_1_0.Details:SetupAccoladeDetails(var_2_1)
			end)
		end
	end)
	arg_1_0.CommendationGrid:RefreshContent()
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_2.accoladesDataPackage)

	arg_4_0._dataPackage = arg_4_2.accoladesDataPackage

	var_0_0(arg_4_0)
end

function AARCommendations(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "AARCommendations"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 3,
		wrapY = true,
		arrowsVerticalOffset = 5,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AARCommendationUnit", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 225,
		rowHeight = _1080p * 225,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_5 = LUI.UIGrid.new(var_5_4)

	var_5_5.id = "CommendationGrid"

	var_5_5:setUseStencil(true)
	var_5_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 1295, _1080p * 200, _1080p * 905)
	var_5_0:addElement(var_5_5)

	var_5_0.CommendationGrid = var_5_5

	local var_5_6
	local var_5_7 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_5_1
	})

	var_5_7.id = "VerticalMinimalScrollbar"

	var_5_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1295, _1080p * 1311, _1080p * 200, _1080p * 895)
	var_5_0:addElement(var_5_7)

	var_5_0.VerticalMinimalScrollbar = var_5_7

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("AARCommendationsDetails", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "Details"

	var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 200, _1080p * 895)
	var_5_0:addElement(var_5_9)

	var_5_0.Details = var_5_9

	local var_5_10 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_5_7,
		startCap = var_5_7.startCap,
		endCap = var_5_7.endCap,
		sliderArea = var_5_7.sliderArea,
		slider = var_5_7.sliderArea and var_5_7.sliderArea.slider,
		fixedSizeSlider = var_5_7.sliderArea and var_5_7.sliderArea.fixedSizeSlider
	})

	var_5_5:AddScrollbar(var_5_10)
	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("AARCommendations", AARCommendations)
LockTable(_M)
