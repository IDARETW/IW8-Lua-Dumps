module(..., package.seeall)

function ClansMemberScreenGridWidget(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1035 * _1080p, 0, 670 * _1080p)

	var_1_0.id = "ClansMemberScreenGridWidget"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 2,
		maxVisibleRows = 8,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_1_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("SocialFriendCard", {
				controllerIndex = var_1_1
			})
		end,
		refreshChild = function(arg_3_0, arg_3_1, arg_3_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 510,
		rowHeight = _1080p * 80,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_5 = LUI.UIGrid.new(var_1_4)

	var_1_5.id = "ClanMembersScreenGrid"

	var_1_5:setUseStencil(true)
	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 672)
	var_1_0:addElement(var_1_5)

	var_1_0.ClanMembersScreenGrid = var_1_5

	local var_1_6
	local var_1_7 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_1_1
	})

	var_1_7.id = "VerticalScrollbar"

	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1024, _1080p * 1035, _1080p * 4, _1080p * 664)
	var_1_0:addElement(var_1_7)

	var_1_0.VerticalScrollbar = var_1_7

	local var_1_8 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_1_7,
		startCap = var_1_7.startCap,
		endCap = var_1_7.endCap,
		sliderArea = var_1_7.sliderArea,
		slider = var_1_7.sliderArea and var_1_7.sliderArea.slider,
		fixedSizeSlider = var_1_7.sliderArea and var_1_7.sliderArea.fixedSizeSlider
	})

	var_1_5:AddScrollbar(var_1_8)

	return var_1_0
end

MenuBuilder.registerType("ClansMemberScreenGridWidget", ClansMemberScreenGridWidget)
LockTable(_M)
