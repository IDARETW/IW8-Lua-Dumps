module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Dvar.CFHDGABACF("MMNQKTMMQS")
	local var_1_1 = Dvar.CFHDGABACF("NORRQNNNOP")
	local var_1_2 = Dvar.CFHDGABACF("MPLTQKNSMM")

	arg_1_0.SoloButton:SetDetails(var_1_0, Lobby.BRMatchType.SOLO)
	arg_1_0.DuoButton:SetDetails(var_1_1, Lobby.BRMatchType.DUO)
	arg_1_0.SquadsButton:SetDetails(var_1_2, Lobby.BRMatchType.QUAD)
end

function LobbyBattleRoyaleGameSetup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "LobbyBattleRoyaleGameSetup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIText.new()

	var_2_4.id = "GameSetupTitle"

	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU/GAME_SETUP_CAPS"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 558, _1080p * 41, _1080p * 101)
	var_2_0:addElement(var_2_4)

	var_2_0.GameSetupTitle = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "ModeType"

	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/MODE_TYPE"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 202, _1080p * 155, _1080p * 179)
	var_2_0:addElement(var_2_6)

	var_2_0.ModeType = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleGamemodeButton", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "SoloButton"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 608, _1080p * 207, _1080p * 407)
	var_2_0:addElement(var_2_8)

	var_2_0.SoloButton = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleGamemodeButton", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "DuoButton"

	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 608, _1080p * 426, _1080p * 626)
	var_2_0:addElement(var_2_10)

	var_2_0.DuoButton = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleGamemodeButton", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "SquadsButton"

	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 608, _1080p * 641, _1080p * 841)
	var_2_0:addElement(var_2_12)

	var_2_0.SquadsButton = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "FillType"

	var_2_14:setText(Engine.CBBHFCGDIC("LUA_MENU/FILL_TYPE"), 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 202, _1080p * 881, _1080p * 905)
	var_2_0:addElement(var_2_14)

	var_2_0.FillType = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("LobbyBattleRoyaleFillTypeButton", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "LobbyBattleRoyaleFillTypeButton"

	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 608, _1080p * 926, _1080p * 976)
	var_2_0:addElement(var_2_16)

	var_2_0.LobbyBattleRoyaleFillTypeButton = var_2_16

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LobbyBattleRoyaleGameSetup", LobbyBattleRoyaleGameSetup)
LockTable(_M)
