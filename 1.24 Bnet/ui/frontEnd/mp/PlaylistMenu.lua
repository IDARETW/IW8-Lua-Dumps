module(..., package.seeall)

local var_0_0 = "frontEnd.playlists"
local var_0_1 = var_0_0 .. ".category"

local function var_0_2()
	Lobby.DFJICHHJFI(var_0_1)
end

local function var_0_3()
	WipeGlobalModelsAtPath(var_0_0)
end

local function var_0_4(arg_3_0, arg_3_1)
	if arg_3_0 ~= nil then
		return arg_3_0 .. "_small"
	else
		return arg_3_0
	end
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Tabs)
	assert(arg_4_0.Tabs.Tabs)
	assert(arg_4_0.PlaylistList)
	assert(arg_4_0.PlaylistList.PlaylistButtons)
	assert(arg_4_0.PlaylistInfo)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYLIST_SELECT"))

	local var_4_0 = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		enableSway = false,
		controllerIndex = arg_4_1
	})

	arg_4_0:addElement(var_4_0)

	local var_4_1 = Playlist.BHDAHAHGDF()
	local var_4_2 = Playlist.CAFBBGBAI()
	local var_4_3 = var_0_1
	local var_4_4 = LUI.DataSourceInGlobalModel.new(var_4_3 .. ".count")
	local var_4_5 = LUI.DataSourceFromList.new(var_4_4)

	function var_4_5.MakeDataSourceAtIndex(arg_5_0, arg_5_1)
		local var_5_0 = LUI.DataSourceInGlobalModel.new(var_4_3 .. ".index." .. arg_5_1)
		local var_5_1 = var_4_3 .. "." .. arg_5_1 .. ".playlist"
		local var_5_2 = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".count")
		local var_5_3 = LUI.DataSourceFromList.new(var_5_2)

		function var_5_3.MakeDataSourceAtIndex(arg_6_0, arg_6_1)
			return {
				name = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".name." .. arg_6_1),
				disabled = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".disabled." .. arg_6_1),
				hasDLC = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".hasDLC." .. arg_6_1),
				image = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".image." .. arg_6_1),
				smallImage = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".smallImage." .. arg_6_1),
				desc = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".desc." .. arg_6_1),
				categoryIndex = var_5_0,
				playlistIndex = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".index." .. arg_6_1),
				minPlayerSize = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".minPlayerSize." .. arg_6_1),
				maxPlayerSize = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".maxPlayerSize." .. arg_6_1),
				minPartySize = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".minPartySize." .. arg_6_1),
				maxPartySize = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".maxPartySize." .. arg_6_1),
				xpScale = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".xpScale." .. arg_6_1),
				weaponXpScale = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".weaponXpScale." .. arg_6_1),
				battlePassXpScale = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".battlePassXpScale." .. arg_6_1),
				isNew = LUI.DataSourceInGlobalModel.new(var_5_1 .. ".isNew." .. arg_6_1)
			}
		end

		function var_5_3.GetDefaultFocusIndex()
			if var_5_0:GetValue(arg_4_1) == var_4_1 then
				for iter_7_0 = 0, var_5_3:GetCountValue(arg_4_1) - 1 do
					if var_4_2 == var_5_3:GetDataSourceAtIndex(iter_7_0).playlistIndex:GetValue(arg_4_1) + 1 then
						return iter_7_0
					end
				end
			end
		end

		return {
			name = LUI.DataSourceInGlobalModel.new(var_4_3 .. ".name." .. arg_5_1),
			disabled = LUI.DataSourceInGlobalModel.new(var_4_3 .. ".disabled." .. arg_5_1),
			type = LUI.DataSourceInGlobalModel.new(var_4_3 .. ".type." .. arg_5_1),
			index = var_5_0,
			focusFunction = function()
				return
			end,
			playlists = var_5_3
		}
	end

	function var_4_5.GetDefaultFocusIndex()
		for iter_9_0 = 0, var_4_5:GetCountValue(arg_4_1) - 1 do
			if var_4_1 == var_4_5:GetDataSourceAtIndex(iter_9_0).index:GetValue(arg_4_1) + 1 then
				return iter_9_0
			end
		end
	end

	arg_4_0.Tabs.Tabs:SetTabManagerDataSource(var_4_5, arg_4_1)
	arg_4_0.PlaylistList.PlaylistButtons:SetGridDataSourceThroughElement(arg_4_0.Tabs.Tabs, "playlists")
	arg_4_0.PlaylistInfo:SetDataSourceThroughElement(arg_4_0.PlaylistList.PlaylistButtons, nil)

	if LUI.IsLastInputMouseNavigation(arg_4_1) then
		local var_4_6 = arg_4_0.PlaylistList.PlaylistButtons:GetFirstFocusablePosition()
		local var_4_7 = arg_4_0.PlaylistList.PlaylistButtons:GetContentIndex(var_4_6.x, var_4_6.y)
		local var_4_8 = arg_4_0.PlaylistList.PlaylistButtons._gridDataSource:GetDataSourceAtIndex(var_4_7, arg_4_1)

		arg_4_0.PlaylistList.PlaylistButtons:SetDataSource(var_4_8, arg_4_1)
	end

	arg_4_0:addElement(MP.GetGameModeMaterialStreamer())
	arg_4_0:addElement(Lobby.GetMPMapMaterialStreamer())
	arg_4_0:addElement(Lobby.GetMPMapPreloadStreamer(arg_4_1))

	local function var_4_9()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_4_0.Vignette:SetScale(var_10_0)
		arg_4_0.GradientRight:SetScale(var_10_0)
	end

	arg_4_0:addAndCallEventHandler("onVideoChange", var_4_9)
end

function PlaylistMenu(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0.id = "PlaylistMenu"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	var_11_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_11_1
	})
	var_11_0.HelperBar.id = "HelperBar"

	var_11_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_11_0.HelperBar:setPriority(10)
	var_11_0:addElement(var_11_0.HelperBar)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Vignette"

	var_11_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_4:SetAlpha(0.65, 0)
	var_11_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_11_0:addElement(var_11_4)

	var_11_0.Vignette = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "GradientRight"

	var_11_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_11_6:SetAlpha(0.5, 0)
	var_11_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_11_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_11_0:addElement(var_11_6)

	var_11_0.GradientRight = var_11_6

	local var_11_7

	if Engine.HDGDBCJFG() then
		local var_11_8 = MenuBuilder.BuildRegisteredType("online_friends_widget", {
			controllerIndex = var_11_1
		})

		var_11_8.id = "FriendsElement"

		var_11_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -500, 0, _1080p * -72, _1080p * -54)
		var_11_0:addElement(var_11_8)

		var_11_0.FriendsElement = var_11_8
	end

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("PlaylistInfo", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "PlaylistInfo"

	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 650, _1080p * 1824, _1080p * 300, _1080p * 800)
	var_11_0:addElement(var_11_10)

	var_11_0.PlaylistInfo = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("PlaylistList", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "PlaylistList"

	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 295, _1080p * 885)
	var_11_0:addElement(var_11_12)

	var_11_0.PlaylistList = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "TabBacker"

	var_11_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_11_0:addElement(var_11_14)

	var_11_0.TabBacker = var_11_14

	local var_11_15

	if CONDITIONS.InFrontendPublicMP(var_11_0) then
		local var_11_16 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_11_1
		})

		var_11_16.id = "MPPlayerDetails"

		var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
		var_11_0:addElement(var_11_16)

		var_11_0.MPPlayerDetails = var_11_16
	end

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("SubMenuTabsBar", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "Tabs"

	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 158, _1080p * 1386, _1080p * 107, _1080p * 177)
	var_11_0:addElement(var_11_18)

	var_11_0.Tabs = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "MenuTitle"

	var_11_20.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYLIST_SELECT"), 0)
	var_11_20.Line:SetLeft(0, 0)
	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_11_0:addElement(var_11_20)

	var_11_0.MenuTitle = var_11_20

	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 10,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_11_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_11_21 = LUI.UIBindButton.new()

	var_11_21.id = "selfBindButton"

	var_11_0:addElement(var_11_21)

	var_11_0.bindButton = var_11_21

	var_11_0.bindButton:addEventHandler("button_secondary", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_11_1
		end

		ACTIONS.LeaveMenu(var_11_0)
	end)
	var_0_5(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("PlaylistMenu", PlaylistMenu)
LUI.FlowManager.RegisterStackPushBehaviour("PlaylistMenu", var_0_2)
LUI.FlowManager.RegisterStackPopBehaviour("PlaylistMenu", var_0_3)
LockTable(_M)
