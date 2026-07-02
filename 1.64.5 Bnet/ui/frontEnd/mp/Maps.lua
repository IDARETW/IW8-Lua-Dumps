module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("Maps", {
	"host"
})

local var_0_0 = "frontEnd.maps"

local function var_0_1()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_2(arg_2_0, arg_2_1)
	local var_2_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_2_1.ref, CSV.mpMapTable.cols.name)

	arg_2_1.name = Engine.CBBHFCGDIC("PLAYLIST/SIX_PLAYERS", var_2_0)

	table.insert(arg_2_0, arg_2_1)

	local var_2_1 = LUI.ShallowCopy(arg_2_1)

	var_2_1.name = Engine.CBBHFCGDIC("PLAYLIST/TEN_PLAYERS", var_2_0)
	var_2_1.isExtendedMode = true

	table.insert(arg_2_0, var_2_1)
end

local var_0_3 = 1

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.MapDetails:SetDataSourceThroughElement(arg_3_0.Maps, nil)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MAPS_CAPS"))

	local var_3_0 = Lobby.GetCurrentGameType()
	local var_3_1 = {}

	for iter_3_0 = 0, Lobby.DEFCCIGHCF() - 1 do
		local var_3_2 = Lobby.CJEHDHDGBH(iter_3_0)

		if PRIVATE_MATCH.ShouldDisplayMap(iter_3_0, arg_3_1) and PRIVATE_MATCH.MapSupportsCustomGames(var_3_2) then
			local var_3_3 = Lobby.CBEIEIFCEF(iter_3_0)
			local var_3_4 = Lobby.DIIFDCEJJ(iter_3_0)
			local var_3_5 = {
				isExtendedMode = false,
				name = Engine.CBBHFCGDIC(StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_3_2, CSV.mpMapTable.cols.name)),
				ref = var_3_2,
				desc = Lobby.BGCBFAABHB(iter_3_0),
				image = MP.GetMapImage(Lobby.CJEHDHDGBH(iter_3_0)),
				gameTypes = var_3_4,
				disabled = not string.match(var_3_4, var_3_0) and not Dvar.IBEGCHEFE("LSSRRSMNMR"),
				isOwned = Engine.BAJHDFAJJF(var_3_3)
			}

			if PRIVATE_MATCH.DoesMapNeedsMultipleModes(var_3_2) then
				var_0_2(var_3_1, var_3_5)
			else
				table.insert(var_3_1, var_3_5)
			end
		end
	end

	if LUI.FlowManager.GetScopedData(arg_3_0).isTournament then
		local var_3_6 = Lobby.RANDOM_MAP
		local var_3_7 = {
			disable = false,
			isOwned = true,
			desc = "",
			name = MP.GetLobbyMapName(var_3_6),
			ref = var_3_6,
			image = MP.GetLobbyMapImage(var_3_6),
			gameTypes = {}
		}

		table.insert(var_3_1, var_3_7)
	end

	table.sort(var_3_1, function(arg_4_0, arg_4_1)
		if arg_4_0.disabled ~= arg_4_1.disabled then
			return not arg_4_0.disabled and arg_4_1.disabled
		end

		if arg_4_0.name ~= arg_4_1.name then
			return arg_4_0.name < arg_4_1.name
		end
	end)

	local var_3_8 = LUI.DataSourceFromList.new(#var_3_1)

	function var_3_8.MakeDataSourceAtIndex(arg_5_0, arg_5_1)
		local var_5_0 = var_0_0 .. ".map." .. arg_5_1 + 1
		local var_5_1 = var_3_1[arg_5_1 + 1]
		local var_5_2 = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".isOwned")

		var_5_2:SetValue(arg_3_1, var_5_1.isOwned)

		return {
			name = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".name", var_5_1.name),
			ref = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".ref", var_5_1.ref),
			desc = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".desc", var_5_1.desc),
			image = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".image", var_5_1.image),
			gameTypes = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".gameTypes", var_5_1.gameTypes),
			disabled = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".disabled", var_5_1.disabled),
			isExtendedMode = LUI.DataSourceInGlobalModel.new(var_5_0 .. ".isExtendedMode", var_5_1.isExtendedMode),
			isOwned = var_5_2
		}
	end

	local var_3_9 = LUI.DataSourceInControllerModel.new("alwaysLoaded.isExtendedModeSelected")
	local var_3_10 = var_3_9:GetValue(arg_3_1)

	if var_3_10 == nil then
		var_3_9:SetValue(arg_3_1, Dvar.CFHDGABACF("scr_map_use10v10_objectives") == 1)
	end

	function var_3_8.GetDefaultFocusIndex()
		local var_6_0 = Dvar.DHEEJCCJBH("NSQLTTMRMP")

		for iter_6_0 = 0, var_3_8:GetCountValue(arg_3_1) - 1 do
			if var_3_8:GetDataSourceAtIndex(iter_6_0).ref:GetValue(arg_3_1) == var_6_0 then
				local var_6_1 = var_3_8:GetDataSourceAtIndex(iter_6_0).isExtendedMode:GetValue(arg_3_1)

				if not var_6_1 or var_6_1 and var_3_10 then
					return {
						x = 0,
						y = iter_6_0
					}
				end
			end
		end
	end

	arg_3_0:SetDataSource(var_3_8, arg_3_1)

	if Engine.ECHCFGDDDF() then
		local var_3_11 = LUI.UIElement.new()

		var_3_11:SetBlurStrength(5)
		var_3_11:setupWorldBlur()

		var_3_11.id = "blur"

		arg_3_0:addElement(var_3_11)
	end

	local var_3_12 = arg_3_0.Maps:GetFirstFocusablePosition()

	if LUI.IsLastInputKeyboardMouse(arg_3_1) and var_3_12 then
		arg_3_0.Maps:SetFocusedPosition(var_3_12, true)
	end
end

function Maps(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0.id = "Maps"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("MapDetails", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "MapDetails"

	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.MapDetails = var_7_4

	local var_7_5
	local var_7_6 = {
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
		controllerIndex = var_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("MapButton", {
				controllerIndex = var_7_1
			})
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 40,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_7 = LUI.UIDataSourceGrid.new(var_7_6)

	var_7_7.id = "Maps"

	var_7_7:setUseStencil(false)
	var_7_7:SetGridDataSourceThroughElement(var_7_0, nil)
	var_7_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 806)
	var_7_0:addElement(var_7_7)

	var_7_0.Maps = var_7_7

	local var_7_8
	local var_7_9 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_7_1
	})

	var_7_9.id = "Scrollbar"

	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 525, _1080p * 541, _1080p * 216, _1080p * 756)
	var_7_0:addElement(var_7_9)

	var_7_0.Scrollbar = var_7_9

	local var_7_10
	local var_7_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_11.id = "MenuTitle"

	var_7_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MAPS_CAPS")), 0)
	var_7_11.Line:SetLeft(0, 0)
	var_7_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_7_0:addElement(var_7_11)

	var_7_0.MenuTitle = var_7_11

	local var_7_12

	if CONDITIONS.InFrontendPublicMP(var_7_0) then
		local var_7_13 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_7_1
		})

		var_7_13.id = "MPPlayerDetails"

		var_7_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1404, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_7_0:addElement(var_7_13)

		var_7_0.MPPlayerDetails = var_7_13
	end

	local var_7_14
	local var_7_15 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_7_1
	})

	var_7_15.id = "LobbyMembersFooter"

	var_7_15:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_7_0:addElement(var_7_15)

	var_7_0.LobbyMembersFooter = var_7_15

	local var_7_16 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_7_9,
		startCap = var_7_9.startCap,
		endCap = var_7_9.endCap,
		sliderArea = var_7_9.sliderArea,
		slider = var_7_9.sliderArea and var_7_9.sliderArea.slider,
		fixedSizeSlider = var_7_9.sliderArea and var_7_9.sliderArea.fixedSizeSlider
	})

	var_7_7:AddScrollbar(var_7_16)
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_7_17 = LUI.UIBindButton.new()

	var_7_17.id = "selfBindButton"

	var_7_0:addElement(var_7_17)

	var_7_0.bindButton = var_7_17

	var_7_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_7_1
		end

		ACTIONS.LeaveMenu(var_7_0)
	end)
	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("Maps", Maps)
LUI.FlowManager.RegisterStackPopBehaviour("Maps", var_0_1)
LockTable(_M)
