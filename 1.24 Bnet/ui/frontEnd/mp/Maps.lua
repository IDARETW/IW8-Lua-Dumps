module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("Maps", {
	"host"
})

local var_0_0 = "frontEnd.maps"

local function var_0_1()
	WipeGlobalModelsAtPath(var_0_0)
end

local var_0_2 = 1

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.MapDetails:SetDataSourceThroughElement(arg_2_0.Maps, nil)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MAPS_CAPS"))

	local var_2_0 = Lobby.GetCurrentGameType()
	local var_2_1 = {}

	for iter_2_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		local var_2_2 = Lobby.CJEHDHDGBH(iter_2_0)

		if PRIVATE_MATCH.ShouldDisplayMap(iter_2_0, arg_2_1) and PRIVATE_MATCH.MapSupportsCustomGames(var_2_2) then
			local var_2_3 = Lobby.CBEIEIFCEF(iter_2_0)
			local var_2_4 = Lobby.DIIFDCEJJ(iter_2_0)
			local var_2_5 = {
				name = Lobby.CAAHCDGEDH(iter_2_0),
				ref = var_2_2,
				desc = Lobby.BGCBFAABHB(iter_2_0),
				image = MP.GetMapImage(Lobby.CJEHDHDGBH(iter_2_0)),
				gameTypes = var_2_4,
				disabled = not string.match(var_2_4, var_2_0) and not Dvar.IBEGCHEFE("LSSRRSMNMR"),
				isOwned = Engine.BAJHDFAJJF(var_2_3)
			}

			table.insert(var_2_1, var_2_5)
		end
	end

	if LUI.FlowManager.GetScopedData(arg_2_0).isTournament then
		local var_2_6 = Lobby.RANDOM_MAP
		local var_2_7 = {
			disable = false,
			isOwned = true,
			desc = "",
			name = MP.GetLobbyMapName(var_2_6),
			ref = var_2_6,
			image = MP.GetLobbyMapImage(var_2_6),
			gameTypes = {}
		}

		table.insert(var_2_1, var_2_7)
	end

	table.sort(var_2_1, function(arg_3_0, arg_3_1)
		if arg_3_0.disabled ~= arg_3_1.disabled then
			return not arg_3_0.disabled and arg_3_1.disabled
		end

		if arg_3_0.name ~= arg_3_1.name then
			return arg_3_0.name < arg_3_1.name
		end
	end)

	local var_2_8 = LUI.DataSourceFromList.new(#var_2_1)

	function var_2_8.MakeDataSourceAtIndex(arg_4_0, arg_4_1)
		local var_4_0 = var_0_0 .. ".map." .. arg_4_1 + 1
		local var_4_1 = var_2_1[arg_4_1 + 1]
		local var_4_2 = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".isOwned")

		var_4_2:SetValue(arg_2_1, var_4_1.isOwned)

		return {
			name = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".name", var_4_1.name),
			ref = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".ref", var_4_1.ref),
			desc = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".desc", var_4_1.desc),
			image = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".image", var_4_1.image),
			gameTypes = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".gameTypes", var_4_1.gameTypes),
			disabled = LUI.DataSourceInGlobalModel.new(var_4_0 .. ".disabled", var_4_1.disabled),
			isOwned = var_4_2
		}
	end

	function var_2_8.GetDefaultFocusIndex()
		local var_5_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		for iter_5_0 = 0, var_2_8:GetCountValue(arg_2_1) - 1 do
			if var_2_8:GetDataSourceAtIndex(iter_5_0).ref:GetValue(arg_2_1) == var_5_0 then
				return {
					x = 0,
					y = iter_5_0
				}
			end
		end
	end

	arg_2_0:SetDataSource(var_2_8, arg_2_1)

	if Engine.ECHCFGDDDF() then
		local var_2_9 = LUI.UIElement.new()

		var_2_9:SetBlurStrength(5)
		var_2_9:setupWorldBlur()

		var_2_9.id = "blur"

		arg_2_0:addElement(var_2_9)
	end

	local var_2_10 = arg_2_0.Maps:GetFirstFocusablePosition()

	if LUI.IsLastInputKeyboardMouse(arg_2_1) and var_2_10 then
		arg_2_0.Maps:SetFocusedPosition(var_2_10, true)
	end
end

function Maps(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "Maps"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("MapDetails", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "MapDetails"

	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MapDetails = var_6_4

	local var_6_5
	local var_6_6 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 11,
		buildArrowsLabel = true,
		wrapX = false,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 4,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MapButton", {
				controllerIndex = var_6_1
			})
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_7 = LUI.UIDataSourceGrid.new(var_6_6)

	var_6_7.id = "Maps"

	var_6_7:setUseStencil(false)
	var_6_7:SetGridDataSourceThroughElement(var_6_0, nil)
	var_6_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 806)
	var_6_0:addElement(var_6_7)

	var_6_0.Maps = var_6_7

	local var_6_8
	local var_6_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_6_1
	})

	var_6_9.id = "Scrollbar"

	var_6_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 541, _1080p * 216, _1080p * 756)
	var_6_0:addElement(var_6_9)

	var_6_0.Scrollbar = var_6_9

	local var_6_10
	local var_6_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_11.id = "MenuTitle"

	var_6_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAPS_CAPS")), 0)
	var_6_11.Line:SetLeft(0, 0)
	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_11)

	var_6_0.MenuTitle = var_6_11

	local var_6_12

	if CONDITIONS.InFrontendPublicMP(var_6_0) then
		local var_6_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_6_1
		})

		var_6_13.id = "MPPlayerDetails"

		var_6_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_6_0:addElement(var_6_13)

		var_6_0.MPPlayerDetails = var_6_13
	end

	local var_6_14
	local var_6_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_15.id = "LobbyMembersFooter"

	var_6_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_15)

	var_6_0.LobbyMembersFooter = var_6_15

	local var_6_16 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_6_9,
		startCap = var_6_9.startCap,
		endCap = var_6_9.endCap,
		sliderArea = var_6_9.sliderArea,
		slider = var_6_9.sliderArea and var_6_9.sliderArea.slider,
		fixedSizeSlider = var_6_9.sliderArea and var_6_9.sliderArea.fixedSizeSlider
	})

	var_6_7:AddScrollbar(var_6_16)
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_6_17 = LUI.UIBindButton.new()

	var_6_17.id = "selfBindButton"

	var_6_0:addElement(var_6_17)

	var_6_0.bindButton = var_6_17

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("Maps", Maps)
LUI.FlowManager.RegisterStackPopBehaviour("Maps", var_0_1)
LockTable(_M)
