module(..., package.seeall)

local var_0_0 = 24

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = Dvar.IBEGCHEFE("LRQNOKNRRN") and Dvar.CFHDGABACF("LQNKMNMLRR") or var_0_0
	local var_1_1 = var_1_0
	local var_1_2 = {
		scrollingThresholdX = 1,
		maxVisibleColumns = 1,
		wrapY = true,
		maxVelocity = 5000,
		buildArrowsLabel = true,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		springCoefficient = 5000,
		maxVisibleRows = var_1_1,
		controllerIndex = arg_1_1,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		scrollingThresholdPixelY = _1080p * 42 * 2,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_1_3 = LUI.UIGrid.new(var_1_2)

	var_1_3.id = "List"

	var_1_3:setUseStencil(true)
	var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 774, 0, _1080p * 504)
	arg_1_0:addElement(var_1_3)

	arg_1_0.List = var_1_3

	local var_1_4
	local var_1_5 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_1_1
	})

	var_1_5.id = "VerticalScrollbar"

	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 785, _1080p * 791, 0, _1080p * 504)
	arg_1_0:addElement(var_1_5)

	arg_1_0.VerticalScrollbar = var_1_5

	local var_1_6 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_1_0.VerticalScrollbar,
		startCap = arg_1_0.VerticalScrollbar.startCap,
		endCap = arg_1_0.VerticalScrollbar.endCap,
		sliderArea = arg_1_0.VerticalScrollbar.sliderArea,
		slider = arg_1_0.VerticalScrollbar.sliderArea and arg_1_0.VerticalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_1_0.VerticalScrollbar.sliderArea and arg_1_0.VerticalScrollbar.sliderArea.fixedSizeSlider
	})

	var_1_3:AddScrollbar(var_1_6)

	local var_1_7, var_1_8, var_1_9 = Lobby.GetMembersListDataSource()

	local function var_1_10()
		local var_2_0 = var_1_9:GetValue(arg_1_1)
		local var_2_1 = var_1_7:GetValue(arg_1_1)

		if not var_2_1 or var_2_1 > var_1_0 then
			return
		end

		local var_2_2 = 0

		for iter_2_0 = arg_1_0.List:GetNumRows() - 1, var_2_1, -1 do
			local var_2_3 = arg_1_0.List:GetElementAtPosition(0, iter_2_0)

			if var_2_3 then
				var_2_3:closeTree()
			end
		end

		arg_1_0.List:SetNumRows(var_2_0)

		for iter_2_1 = 0, var_2_0 - 1 do
			if var_1_8[iter_2_1].team:GetValue(arg_1_1) ~= Teams.follower then
				local var_2_4 = arg_1_0.List:GetElementAtPosition(0, var_2_2)

				if not var_2_4 then
					var_2_4 = MenuBuilder.BuildRegisteredType("LobbyMemberExpander", {
						controllerIndex = arg_1_1
					})
					var_2_4.id = "LobbyMember" .. var_2_2

					arg_1_0.List:AddElement(var_2_4)
				end

				var_2_4:SetDataSource(var_1_8[iter_2_1], arg_1_1)
				var_2_4:RefreshExpander(arg_1_1, iter_2_1, var_2_2)

				var_2_2 = var_2_2 + 1
			end
		end

		arg_1_0.List:RefreshContent()
	end

	arg_1_0:SubscribeToModel(var_1_7:GetModel(arg_1_1), var_1_10)
	arg_1_0:SubscribeToModel(var_1_9:GetModel(arg_1_1), var_1_10)
end

function LobbyMembersList(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 800 * _1080p, 0, 527 * _1080p)

	var_3_0.id = "LobbyMembersList"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(10 * _1080p)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyMembersList", LobbyMembersList)
LockTable(_M)
