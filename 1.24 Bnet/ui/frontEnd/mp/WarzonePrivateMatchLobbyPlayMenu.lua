module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	Engine.DHFCHIIJCA("squad_lobby")

	local var_1_0 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby"
	})

	var_1_0.id = "lobbyTimer"

	arg_1_0:addElement(var_1_0)
	arg_1_0:registerEventHandler("update_lobby", function(arg_2_0, arg_2_1)
		local var_2_0 = {
			forceSuperfactionBasedOnTeam = true,
			maxCharactersToShow = FrontEndScene.MaxLobbyCharacters,
			widget = arg_1_0
		}

		Lobby.UpdateClientCharacters(arg_1_1, var_2_0)
	end)
	assert(arg_1_0.Vignette)
	assert(arg_1_0.GradientRight)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.GradientRight)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1, nil)
	end

	local function var_1_1()
		local var_3_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_1_0.Vignette:SetScale(var_3_0)
		arg_1_0.GradientRight:SetScale(var_3_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_1)
end

function WarzonePrivateMatchLobbyPlayMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "WarzonePrivateMatchLobbyPlayMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "GradientRight"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.5, 0)
	var_4_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_4_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_4_0:addElement(var_4_4)

	var_4_0.GradientRight = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Vignette"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_6:SetAlpha(0.5, 0)
	var_4_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_4_0:addElement(var_4_6)

	var_4_0.Vignette = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchPlayMenuButtons", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "WarzonePrivateMatchPlayMenuButtons"

	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 516)
	var_4_0:addElement(var_4_8)

	var_4_0.WarzonePrivateMatchPlayMenuButtons = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("LobbyMembers", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "LobbyMembers"

	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 250, _1080p * 860, _1080p * 213, _1080p * 822)
	var_4_0:addElement(var_4_10)

	var_4_0.LobbyMembers = var_4_10

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WarzonePrivateMatchLobbyPlayMenu", WarzonePrivateMatchLobbyPlayMenu)
LockTable(_M)
