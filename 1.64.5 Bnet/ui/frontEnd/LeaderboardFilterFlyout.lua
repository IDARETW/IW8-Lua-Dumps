module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._playlistFilterButtons = {}

	local var_1_0
	local var_1_1 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = arg_1_2
	})

	var_1_1.id = "Playlist"

	var_1_1.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/PLAYLIST"), 0)
	var_1_1:SetAlignment(LUI.Alignment.Left)
	var_1_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, 0, _1080p * 35)
	arg_1_0:addElement(var_1_1)

	arg_1_0.Playlist = var_1_1

	for iter_1_0, iter_1_1 in pairs(Leaderboards.PlaylistFilters) do
		local var_1_2 = MenuBuilder.BuildRegisteredType("LeaderboardFilterButton", {
			controllerIndex = arg_1_2
		})

		var_1_2.id = "filterButton"

		var_1_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, _1080p * 110, _1080p * 160)

		var_1_2.filterCategory = Leaderboards.FilterCategory.Playlist

		var_1_2.Text:setText(Engine.CBBHFCGDIC(iter_1_1.Title))

		var_1_2.filter = iter_1_1

		var_1_2:SetFiltered(false)

		if (arg_1_1.playlistFilter and 1 or 0) == iter_1_1.Value then
			var_1_2:SetFiltered(true)
		end

		arg_1_0:addElement(var_1_2)
		table.insert(arg_1_0._playlistFilterButtons, var_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._playerFilterButtons = {}
	arg_2_0._platformFilterButtons = {}
	arg_2_0._playlistFilterButtons = {}

	local var_2_0
	local var_2_1 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = arg_2_1
	})

	var_2_1.id = "Players"

	var_2_1.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_PLAYERS"), 0)
	var_2_1:SetAlignment(LUI.Alignment.Left)
	var_2_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, 0, _1080p * 35)
	arg_2_0:addElement(var_2_1)

	arg_2_0.Players = var_2_1

	for iter_2_0, iter_2_1 in pairs(Leaderboards.Filters) do
		local var_2_2 = MenuBuilder.BuildRegisteredType("LeaderboardFilterButton", {
			controllerIndex = arg_2_1
		})

		var_2_2.id = "filterButton"

		var_2_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, _1080p * 110, _1080p * 160)

		var_2_2.filterCategory = Leaderboards.FilterCategory.Player

		var_2_2.Text:setText(Engine.CBBHFCGDIC(iter_2_1.Title))

		var_2_2.filter = iter_2_1

		var_2_2:SetFiltered(false)

		if arg_2_2.filter.Value == iter_2_1.Value then
			var_2_2:SetFiltered(true)
		end

		arg_2_0:addElement(var_2_2)
		table.insert(arg_2_0._playerFilterButtons, var_2_2)
	end

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericHeader", {
		controllerIndex = arg_2_1
	})

	var_2_4.id = "Platform"

	var_2_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_PLATFORM"), 0)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, 0, _1080p * 35)
	arg_2_0:addElement(var_2_4)

	arg_2_0.Platform = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("LeaderboardFilterButton", {
		controllerIndex = arg_2_1
	})

	var_2_6.id = "FirstParty"

	var_2_6.Text:setText("", 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 590, _1080p * 45, _1080p * 95)
	arg_2_0:addElement(var_2_6)

	arg_2_0.FirstParty = var_2_6

	table.insert(arg_2_0._platformFilterButtons, arg_2_0.FirstParty)

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("LeaderboardFilterButton", {
		controllerIndex = arg_2_1
	})

	var_2_8.id = "Activision"

	var_2_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LB_FILTER_GROUP_ACTIVISION"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 595, _1080p * 110, _1080p * 160)
	arg_2_0:addElement(var_2_8)

	arg_2_0.Activision = var_2_8

	table.insert(arg_2_0._platformFilterButtons, arg_2_0.Activision)

	arg_2_0.Activision.filterCategory = Leaderboards.FilterCategory.Platform
	arg_2_0.Activision.filter = Leaderboards.PlatformFilters.None

	arg_2_0.Activision:SetFiltered(arg_2_2.platformFilter.Value == arg_2_0.Activision.filter.Value and true or false)

	local var_2_9 = CoD.GetPlatformPresence()
	local var_2_10 = false

	for iter_2_2, iter_2_3 in pairs(Leaderboards.PlatformFilters) do
		if iter_2_3.IsLocalClientPlatform and iter_2_3.IsLocalClientPlatform(var_2_9) then
			arg_2_0.FirstParty.filterCategory = Leaderboards.FilterCategory.Platform

			arg_2_0.FirstParty.Text:setText(Engine.CBBHFCGDIC(iter_2_3.Title))

			arg_2_0.FirstParty.filter = iter_2_3

			arg_2_0.FirstParty:SetFiltered(arg_2_2.platformFilter.Value == arg_2_0.FirstParty.filter.Value and true or false)

			var_2_10 = true

			break
		end
	end

	if not var_2_10 then
		arg_2_0.FirstParty:closeTree()
	end

	if arg_2_2.showPlaylistFilter then
		var_0_0(arg_2_0, arg_2_2, arg_2_1)
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1.filterCategory == Leaderboards.FilterCategory.Player then
		return arg_3_0._playerFilterButtons
	elseif arg_3_1.filterCategory == Leaderboards.FilterCategory.Platform then
		return arg_3_0._platformFilterButtons
	else
		return arg_3_0._playlistFilterButtons
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1.filterCategory == Leaderboards.FilterCategory.Player then
		arg_4_0._playerFilter = arg_4_1.filter
	elseif arg_4_1.filterCategory == Leaderboards.FilterCategory.Platform then
		arg_4_0._platformFilter = arg_4_1.filter
	else
		arg_4_0._playlistFilter = arg_4_1.filter.Value == 1 and true or false
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = var_0_2(arg_5_0, arg_5_1)

	var_0_3(arg_5_0, arg_5_1)

	for iter_5_0 = 1, #var_5_0 do
		if var_5_0[iter_5_0].filter.Value ~= arg_5_1.filter.Value then
			var_5_0[iter_5_0]:SetFiltered(false)
		end
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._playerFilter = arg_6_2.filter
	arg_6_0._platformFilter = arg_6_2.platformFilter
	arg_6_0._playlistFilter = arg_6_2.playlistFilter

	assert(arg_6_0.MenuTitle)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_FILTER_TITLE"))

	if arg_6_2.showOnlyPlaylistFilter then
		var_0_0(arg_6_0, arg_6_2, arg_6_1)
	else
		var_0_1(arg_6_0, arg_6_1, arg_6_2)
	end

	arg_6_0:addEventHandler("leaderboard_on_filter_changed", function(arg_7_0, arg_7_1)
		var_0_4(arg_7_0, arg_7_1.child)

		return true
	end)

	function arg_6_2.backButtonOverride()
		arg_6_2.setFilterOptions(arg_6_0._playerFilter, arg_6_0._platformFilter, arg_6_0._playlistFilter)
	end
end

function LeaderboardFilterFlyout(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalList.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "LeaderboardFilterFlyout"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:setUseStencil(true)
	var_9_0:SetSpacing(20 * _1080p)

	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "MenuTitle"

	var_9_4.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD_FILTER_TITLE"), 0)
	var_9_4.Line:SetLeft(0, 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 700, 0, _1080p * 100)
	var_9_0:addElement(var_9_4)

	var_9_0.MenuTitle = var_9_4

	var_0_5(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("LeaderboardFilterFlyout", LeaderboardFilterFlyout)
LockTable(_M)
