module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 1, #arg_1_1 do
		local var_1_0 = arg_1_1[iter_1_0]
		local var_1_1 = var_1_0.categoryIndex:GetValue(arg_1_2)
		local var_1_2 = var_1_0.playlistIndex:GetValue(arg_1_2)

		Playlist.CBHGDIGEI(var_1_1, var_1_2)
	end

	if PlaylistUtils.AtLeastOneGameModeFiltered(arg_1_0, arg_1_2) then
		return
	end

	local var_1_3 = arg_1_0.playlists
	local var_1_4 = arg_1_0.playlists:GetCountValue(arg_1_2)

	for iter_1_1 = 0, var_1_4 do
		local var_1_5, var_1_6 = PlaylistUtils.GetCategoryAndPlaylistIndex(var_1_3, iter_1_1)

		if var_1_5 and var_1_6 then
			local var_1_7, var_1_8 = Playlist.CGJBAEBBG(var_1_5, var_1_6)

			if not var_1_8 and var_1_3:GetDataSourceAtIndex(iter_1_1).maxPlayerSize:GetValue(arg_1_2) <= Lobby.MaxPlayerCountForSplitscreen then
				Playlist.CBHGDIGEI(var_1_5, var_1_6)

				return
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = {
		title = Engine.CBBHFCGDIC("MENU/NOTICE")
	}
	local var_2_1 = arg_2_1.maxPlayerPlaylists
	local var_2_2 = arg_2_1.controllerIndex

	if var_2_1 and #var_2_1 > 0 then
		if #var_2_1 <= 1 then
			local var_2_3 = var_2_1[1].name:GetValue(var_2_2)

			var_2_0.message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.JCBDICCAH(var_2_3))
		else
			var_2_0.message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_MULTIPLE_UNSUPPORTED_MODES")
		end
	elseif arg_2_1.isSplitScreenWarning then
		if Engine.JEDFGECDJ() > 1 then
			var_2_0.message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE", Engine.JCBDICCAH(arg_2_1.text))
		else
			var_2_0.message = Engine.CBBHFCGDIC("LUA_MENU_MP/SPLITSCREEN_SINGLE_UNSUPPORTED_MODE_PARTY", Engine.JCBDICCAH(arg_2_1.text))
		end
	end

	var_2_0.controllerIndex = var_2_2
	var_2_0.gameModes = var_2_1
	var_2_0.buttons = {
		{
			label = Engine.CBBHFCGDIC("MENU/OK"),
			action = function()
				LUI.FlowManager.RequestLeaveMenu()
			end
		}
	}

	local var_2_4 = "GenericImagePopup"

	if var_2_1 and #var_2_1 > 1 then
		assert(arg_2_1.acceptFunc)
		table.insert(var_2_0.buttons, 1, {
			label = Engine.CBBHFCGDIC("LUA_MENU_MP/REMOVE_MODES_CONTINUE"),
			action = function(arg_4_0, arg_4_1)
				var_0_0(arg_2_1.dataSource, var_2_1, var_2_2)
				arg_2_1.acceptFunc()
			end
		})

		var_2_4 = "RestrictSplitScreenPopup"
	end

	local var_2_5 = MenuBuilder.BuildRegisteredType(var_2_4, var_2_0)

	var_2_5.isSignInMenu = true

	return var_2_5
end

MenuBuilder.registerType("SplitScreenPopups", var_0_1)
LockTable(_M)
