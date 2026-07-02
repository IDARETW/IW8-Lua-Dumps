module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleGameSetup", arg_1_2)

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_1, false, {
			widget = var_2_0
		})
	end

	arg_1_0.LobbyMapButton:addEventHandler("button_action", var_1_0)

	local function var_1_1(arg_3_0, arg_3_1)
		if Lobby.BGIADHIHAG() then
			local var_3_0 = DataSources.frontEnd.lobby.battleRoyale.playlist:GetValue(arg_1_1)

			if var_3_0 ~= nil and Playlist.CEBBBFJJEB(var_3_0) then
				Engine.DAGFFDGFII("uploadstats", arg_3_1.controller)
				LUI.FlowManager.RequestAddMenu("BattleRoyalePublicLobby", false, arg_1_1, false, {
					openFromPlaylist = true
				})
			end
		end
	end

	arg_1_0.LobbyStartMatchButton:addEventHandler("button_action", var_1_1)
end

function LobbyBattleRoyaleButtons(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 194 * _1080p)

	var_4_0.id = "LobbyBattleRoyaleButtons"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LobbyStartMatchButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "LobbyStartMatchButton"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 31)
	var_4_0:addElement(var_4_4)

	var_4_0.LobbyStartMatchButton = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("LobbyMapButton", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "LobbyMapButton"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 300, _1080p * 44, _1080p * 194)
	var_4_0:addElement(var_4_6)

	var_4_0.LobbyMapButton = var_4_6

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyBattleRoyaleButtons", LobbyBattleRoyaleButtons)
LockTable(_M)
