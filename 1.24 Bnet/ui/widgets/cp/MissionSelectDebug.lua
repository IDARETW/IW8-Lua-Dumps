module(..., package.seeall)

function PopFunc()
	return
end

local function var_0_0(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.List:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_2_0.List:GetContentIndex(arg_3_1, arg_3_2)

		arg_3_0.missionInfo = arg_2_2[var_3_0 + 1]

		arg_3_0.Text:setText(arg_3_0.missionInfo.name)

		if not arg_3_0.registeredHandlers then
			arg_3_0.registeredHandlers = true
			arg_3_0.actionSFX = "ui_select_screen_return"

			arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
				if Engine.DDJFBBJAIG() then
					local var_4_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
					local var_4_1 = "set " .. var_4_0 .. "_start_obj " .. arg_4_0.missionInfo.objectiveRef

					Engine.DAGFFDGFII(var_4_1)
					ACTIONS.LeaveMenu(arg_2_0)
				else
					Engine.EBHIFJCGBH("mission_jump", tonumber(arg_4_0.missionInfo.index))
					ACTIONS.CloseAllMenus(arg_2_0)
				end
			end)
			arg_3_0:addEventHandler("grid_anim", function(arg_5_0, arg_5_1)
				arg_5_0:SetAlpha(arg_5_1.value)
			end)
		end
	end)
	arg_2_0.List:SetNumChildren(#arg_2_2)
	arg_2_0.List:RefreshContent()
	arg_2_0.List:FocusFirstItem()
end

local function var_0_1()
	local var_6_0 = {}

	CSV.cpMissionSelect.file = "cp/" .. Dvar.DHEEJCCJBH("NSQLTTMRMP") .. "_objectives.csv"

	for iter_6_0 = 0, StringTable.BFHCAIIDA(CSV.cpMissionSelect.file) - 1 do
		local var_6_1 = CSV.ReadRow(CSV.cpMissionSelect, iter_6_0)

		if var_6_1.showInMenus == "1" then
			if var_6_1.debugName == "" then
				var_6_1.name = Engine.CBBHFCGDIC(var_6_1.name)
			else
				var_6_1.name = Engine.CBBHFCGDIC(var_6_1.debugName)
			end

			table.insert(var_6_0, var_6_1)
		end
	end

	return var_6_0
end

local function var_0_2(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = var_0_1()

	var_0_0(arg_7_0, arg_7_1, var_7_0)
end

function MissionSelectDebug(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "MissionSelectDebug"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	var_8_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})
	var_8_0.HelperBar.id = "HelperBar"

	var_8_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_8_0.HelperBar:setPriority(10)
	var_8_0:addElement(var_8_0.HelperBar)

	local var_8_2 = var_8_0
	local var_8_3

	if Engine.DDJFBBJAIG() then
		local var_8_4 = MenuBuilder.BuildRegisteredType("MapBackgroundImage", {
			controllerIndex = var_8_1
		})

		var_8_4.id = "MapBackgroundImage"

		var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_8_0:addElement(var_8_4)

		var_8_0.MapBackgroundImage = var_8_4
	end

	local var_8_5
	local var_8_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		wrapX = false,
		adjustSizeToContent = true,
		scrollingThresholdY = 3,
		maxVisibleColumns = 1,
		maxVisibleRows = 14,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_7 = LUI.UIGrid.new(var_8_6)

	var_8_7.id = "List"

	var_8_7:setUseStencil(false)
	var_8_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 174, _1080p * 774, _1080p * 244, _1080p * 836)
	var_8_0:addElement(var_8_7)

	var_8_0.List = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "Scrollbar"

	var_8_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 146, _1080p * 244, _1080p * 906)
	var_8_0:addElement(var_8_9)

	var_8_0.Scrollbar = var_8_9

	local var_8_10 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_9,
		startCap = var_8_9.startCap,
		endCap = var_8_9.endCap,
		sliderArea = var_8_9.sliderArea,
		slider = var_8_9.sliderArea and var_8_9.sliderArea.slider,
		fixedSizeSlider = var_8_9.sliderArea and var_8_9.sliderArea.fixedSizeSlider
	})

	var_8_7:AddScrollbar(var_8_10)
	var_8_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_8_11 = LUI.UIBindButton.new()

	var_8_11.id = "selfBindButton"

	var_8_0:addElement(var_8_11)

	var_8_0.bindButton = var_8_11

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("MissionSelectDebug", MissionSelectDebug)
LUI.FlowManager.RegisterStackPopBehaviour("MissionSelectDebug", PopFunc)
LockTable(_M)
