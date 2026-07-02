module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		[Lobby.BotTeams.FFA] = arg_1_0.FFABots,
		[Lobby.BotTeams.Enemy] = arg_1_0.EnemyBots,
		[Lobby.BotTeams.Friendly] = arg_1_0.FriendlyBots
	}

	local function var_1_1(arg_2_0, arg_2_1)
		local var_2_0 = {}
		local var_2_1 = Dvar.IBEGCHEFE("splitscreen") and Lobby.BotLimitForSplitScreen or Lobby.BotLimit

		for iter_2_0 = 0, var_2_1 do
			table.insert(var_2_0, tostring(iter_2_0))
		end

		local var_2_2 = 1 + Lobby.BEAJCIDDGF(arg_2_0)

		if var_2_2 > #var_2_0 then
			Lobby.DGDIGJDHH(arg_2_0, #var_2_0 - 1)

			var_2_2 = #var_2_0
		end

		if not arg_2_1 then
			local var_2_3 = Lobby.GetMaxBotLimit()

			if var_2_3 < var_2_2 then
				Lobby.DGDIGJDHH(arg_2_0, var_2_3)

				var_2_2 = var_2_3 + 1
			end
		end

		local var_2_4 = Lobby.BEAJCIDDGF(arg_2_0)
		local var_2_5 = 0

		if arg_2_1 then
			var_2_5 = Lobby.BEAJCIDDGF(arg_2_1)
		end

		if var_2_4 + var_2_5 > Lobby.GetMaxBotLimit() then
			Lobby.DGDIGJDHH(arg_2_0, 0)

			var_2_2 = 1

			if arg_2_1 then
				Lobby.DGDIGJDHH(arg_2_1, 0)
			end
		end

		return {
			wrapAround = false,
			labels = var_2_0,
			action = function(arg_3_0)
				local var_3_0 = Lobby.BEAJCIDDGF(arg_2_0)
				local var_3_1 = arg_3_0 - 1

				if var_3_0 < var_3_1 then
					local var_3_2 = var_3_1
					local var_3_3 = false
					local var_3_4

					if arg_2_1 then
						var_3_4 = Lobby.BEAJCIDDGF(arg_2_1)
						var_3_2 = var_3_2 + var_3_4
						var_3_3 = var_3_4 > 0
					end

					if var_3_2 <= Lobby.GetMaxBotLimit() then
						Lobby.DGDIGJDHH(arg_2_0, var_3_1)
					elseif var_3_3 then
						Lobby.DGDIGJDHH(arg_2_0, var_3_1)
						var_1_0[arg_2_1]:SetCurrentValue(var_3_4)
					else
						var_1_0[arg_2_0]:SetCurrentValue(var_3_0 + 1)
					end
				else
					Lobby.DGDIGJDHH(arg_2_0, var_3_1)
				end
			end,
			defaultValue = var_2_2
		}
	end

	local function var_1_2(arg_4_0)
		local var_4_0 = {
			Engine.CBBHFCGDIC("LUA_MENU/BOTS_RECRUIT"),
			Engine.CBBHFCGDIC("LUA_MENU/BOTS_REGULAR"),
			Engine.CBBHFCGDIC("LUA_MENU/BOTS_HARDENED"),
			Engine.CBBHFCGDIC("LUA_MENU/BOTS_VETERAN"),
			Engine.CBBHFCGDIC("LUA_MENU/BOTS_MIXED")
		}

		return {
			wrapAround = true,
			labels = var_4_0,
			action = function(arg_5_0)
				Lobby.BGJCGDFHGA(arg_4_0, arg_5_0 - 1)
			end,
			defaultValue = 1 + Lobby.DHBAICDCJC(arg_4_0)
		}
	end

	if arg_1_0.FriendlyBots and arg_1_0.FriendlyBotsDifficulty and arg_1_0.EnemyBots and arg_1_0.EnemyBotsDifficulty then
		LUI.AddUIArrowTextButtonLogic(arg_1_0.FriendlyBots, arg_1_1, var_1_1(Lobby.BotTeams.Friendly, Lobby.BotTeams.Enemy))
		LUI.AddUIArrowTextButtonLogic(arg_1_0.EnemyBots, arg_1_1, var_1_1(Lobby.BotTeams.Enemy, Lobby.BotTeams.Friendly))
		LUI.AddUIArrowTextButtonLogic(arg_1_0.FriendlyBotsDifficulty, arg_1_1, var_1_2(Lobby.BotTeams.Friendly))
		LUI.AddUIArrowTextButtonLogic(arg_1_0.EnemyBotsDifficulty, arg_1_1, var_1_2(Lobby.BotTeams.Enemy))
	end

	if arg_1_0.FFABots and arg_1_0.FFABotsDifficulty then
		LUI.AddUIArrowTextButtonLogic(arg_1_0.FFABots, arg_1_1, var_1_1(Lobby.BotTeams.FFA))
		LUI.AddUIArrowTextButtonLogic(arg_1_0.FFABotsDifficulty, arg_1_1, var_1_2(Lobby.BotTeams.FFA))
	end

	local var_1_3 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")

	arg_1_0:SubscribeToModel(var_1_3:GetModel(arg_1_1), function(arg_6_0)
		local var_6_0 = DataModel.JJEHAEBDF(arg_6_0)
		local var_6_1 = IsSystemLink()

		if arg_1_0.FriendlyBots and arg_1_0.FriendlyBotsDifficulty then
			arg_1_0.FriendlyBots:SetButtonDisabled(not var_6_0 and not var_6_1)
			arg_1_0.FriendlyBotsDifficulty:SetButtonDisabled(not var_6_0 and not var_6_1)
		end

		if arg_1_0.EnemyBots and arg_1_0.EnemyBotsDifficulty then
			arg_1_0.EnemyBots:SetButtonDisabled(not var_6_0 and not var_6_1)
			arg_1_0.EnemyBotsDifficulty:SetButtonDisabled(not var_6_0 and not var_6_1)
		end

		if arg_1_0.FFABots and arg_1_0.FFABotsDifficulty then
			arg_1_0.FFABots:SetButtonDisabled(not var_6_0 and not var_6_1)
			arg_1_0.FFABotsDifficulty:SetButtonDisabled(not var_6_0 and not var_6_1)
		end
	end)
end

function GameSetupButtonsBots(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 280 * _1080p)

	var_7_0.id = "GameSetupButtonsBots"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(10 * _1080p)

	local var_7_3

	if CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_4 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_4.id = "FriendlyBots"

		if CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_4.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/FRIENDLY_BOTS_DESC")
		end

		var_7_4.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FRIENDLY_BOTS_CAPS")), 0)
		var_7_4.Text:setText(ToUpperCase(""), 0)
		var_7_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
		var_7_0:addElement(var_7_4)

		var_7_0.FriendlyBots = var_7_4
	end

	local var_7_5

	if CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_6 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_6.id = "FriendlyBotsDifficulty"

		if CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_6.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/FRIENDLY_BOTDIFFICULTY_DESC")
		end

		var_7_6.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BOTDIFFICULTY_CAPS")), 0)
		var_7_6.Text:setText(ToUpperCase(""), 0)
		var_7_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 50, _1080p * 90)
		var_7_0:addElement(var_7_6)

		var_7_0.FriendlyBotsDifficulty = var_7_6
	end

	local var_7_7

	if CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_8 = LUI.UIImage.new()

		var_7_8.id = "SpacerImage"

		var_7_8:SetAlpha(0, 0)
		var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, _1080p * 100, _1080p * 110)
		var_7_0:addElement(var_7_8)

		var_7_0.SpacerImage = var_7_8
	end

	local var_7_9

	if CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_10 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_10.id = "EnemyBots"

		if CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_10.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/ENEMY_BOTS_DESC")
		end

		var_7_10.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/ENEMY_BOTS_CAPS")), 0)
		var_7_10.Text:setText(ToUpperCase(""), 0)
		var_7_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 120, _1080p * 160)
		var_7_0:addElement(var_7_10)

		var_7_0.EnemyBots = var_7_10
	end

	local var_7_11

	if CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_12 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_12.id = "EnemyBotsDifficulty"

		if CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_12.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/ENEMY_BOTDIFFICULTY_DESC")
		end

		var_7_12.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BOTDIFFICULTY_CAPS")), 0)
		var_7_12.Text:setText(ToUpperCase(""), 0)
		var_7_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 170, _1080p * 210)
		var_7_0:addElement(var_7_12)

		var_7_0.EnemyBotsDifficulty = var_7_12
	end

	local var_7_13

	if not CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_14 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_14.id = "FFABots"

		if not CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_14.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/BOTS_DESC")
		end

		var_7_14.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BOTS_CAPS")), 0)
		var_7_14.Text:setText(ToUpperCase(""), 0)
		var_7_14:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 220, _1080p * 260)
		var_7_0:addElement(var_7_14)

		var_7_0.FFABots = var_7_14
	end

	local var_7_15

	if not CONDITIONS.IsTeamBasedGameType(var_7_0) then
		local var_7_16 = MenuBuilder.BuildRegisteredType("GenericArrowButton", {
			controllerIndex = var_7_1
		})

		var_7_16.id = "FFABotsDifficulty"

		if not CONDITIONS.IsTeamBasedGameType(var_7_0) then
			var_7_16.buttonDescription = Engine.CBBHFCGDIC("LUA_MENU/BOTDIFFICULTY_DESC")
		end

		var_7_16.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BOTDIFFICULTY_CAPS")), 0)
		var_7_16.Text:setText(ToUpperCase(""), 0)
		var_7_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 270, _1080p * 310)
		var_7_0:addElement(var_7_16)

		var_7_0.FFABotsDifficulty = var_7_16
	end

	local var_7_17
	local var_7_18 = LUI.UIImage.new()

	var_7_18.id = "Spacer"

	var_7_18:SetAlpha(0, 0)
	var_7_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, 0, _1080p * 320, _1080p * 330)
	var_7_0:addElement(var_7_18)

	var_7_0.Spacer = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "ButtonDescriptionText"

	var_7_20:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_7_20.Description:SetRight(_1080p * 415, 0)
	var_7_20.Description:SetRGBFromInt(16777215, 0)
	var_7_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 650, _1080p * 340, _1080p * 372)
	var_7_0:addElement(var_7_20)

	var_7_0.ButtonDescriptionText = var_7_20

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("GameSetupButtonsBots", GameSetupButtonsBots)
LockTable(_M)
