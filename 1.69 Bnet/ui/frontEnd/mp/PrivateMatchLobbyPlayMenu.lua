module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	if var_0_0 then
		WipeGlobalModelsAtPath(var_0_0)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	if LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost"):GetValue(arg_2_1) then
		local var_2_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(false)

		Lobby.IEEDICEJE(var_2_0 and CODCASTER.CanCODCast())

		if arg_2_0.CDLRestrictionTag then
			arg_2_0.CDLRestrictionTag:UpdateVisibility(arg_2_1)
		end
	else
		local var_2_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isCodCastingEnabled")

		arg_2_0:SubscribeToModel(var_2_1:GetModel(arg_2_1), function()
			local var_3_0 = var_2_1:GetValue(arg_2_1)

			CODCASTER.SetCODCastingEnabled(var_3_0)
		end, true)

		if arg_2_0.CDLRestrictionTag then
			local var_2_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

			arg_2_0:SubscribeToModel(var_2_2:GetModel(arg_2_1), function()
				arg_2_0.CDLRestrictionTag:UpdateVisibility(arg_2_1)
			end)
		end
	end

	if CODCASTER.CanCODCast() then
		CODCASTER.CreateCODCasterSettingsButton(arg_2_0.PrivateMatchLobbyButtons, arg_2_1)
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	PRIVATE_MATCH.DisplayDevCheatWarning(arg_5_0)
	assert(arg_5_0.PrivateMatchLobbyButtons)
	assert(arg_5_0.PrivateMatchLobbyButtons.widgetModelPath)

	arg_5_0.Cleanup = var_0_1
	var_0_0 = arg_5_0.PrivateMatchLobbyButtons.widgetModelPath

	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)

	if CONDITIONS.IsCoreMultiplayer() and not var_5_0.isTournament then
		var_0_2(arg_5_0, arg_5_1)
	end

	Engine.DHFCHIIJCA("squad_lobby")

	local var_5_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby"
	})

	var_5_1.id = "lobbyTimer"

	arg_5_0:addElement(var_5_1)
	arg_5_0:registerEventHandler("update_lobby", function(arg_6_0, arg_6_1)
		local var_6_0 = FrontEndScene.MaxLobbyCharacters

		if CONDITIONS.IsThirdGameMode() then
			var_6_0 = 4
		end

		local var_6_1 = {
			forceSuperfactionBasedOnTeam = true,
			maxCharactersToShow = var_6_0,
			widget = arg_5_0
		}

		Lobby.UpdateClientCharactersDelayed(arg_5_0, arg_5_1, var_6_1)
	end)

	if CONDITIONS.IsThirdGameMode() then
		local function var_5_2()
			if CONDITIONS.IsSpecOpsGameType() and CONDITIONS.AreSpecOpsStarsEnabled() then
				ACTIONS.AnimateSequence(arg_5_0.LobbyMap, "MapHeader")
			else
				ACTIONS.AnimateSequence(arg_5_0.LobbyMap, "MapDefault")
			end
		end

		arg_5_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_5_1), var_5_2)
		var_5_2()
	end

	assert(arg_5_0.Vignette)
	assert(arg_5_0.GradientRight)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.GradientRight)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1, nil)
	end

	local function var_5_3()
		local var_8_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_5_0.Vignette:SetScale(var_8_0)
		arg_5_0.GradientRight:SetScale(var_8_0)
	end

	arg_5_0:addAndCallEventHandler("onVideoChange", var_5_3)
end

function PrivateMatchLobbyPlayMenu(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIHorizontalNavigator.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "PrivateMatchLobbyPlayMenu"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "GradientRight"

	var_9_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_4:SetAlpha(0.5, 0)
	var_9_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_9_4:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_9_0:addElement(var_9_4)

	var_9_0.GradientRight = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "Vignette"

	var_9_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_6:SetAlpha(0.5, 0)
	var_9_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_9_0:addElement(var_9_6)

	var_9_0.Vignette = var_9_6

	local var_9_7
	local var_9_8 = MenuBuilder.BuildRegisteredType("PrivateMatchLobbyButtons", {
		controllerIndex = var_9_1
	})

	var_9_8.id = "PrivateMatchLobbyButtons"

	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 556, _1080p * 216, _1080p * 356)
	var_9_0:addElement(var_9_8)

	var_9_0.PrivateMatchLobbyButtons = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("LobbyMembers", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "LobbyMembers"

	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 250, _1080p * 860, _1080p * 213, _1080p * 822)
	var_9_0:addElement(var_9_10)

	var_9_0.LobbyMembers = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "LobbyMap"

	var_9_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -336, _1080p * -116)
	var_9_0:addElement(var_9_12)

	var_9_0.LobbyMap = var_9_12

	local var_9_13

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsStarsEnabled(var_9_0) then
		local var_9_14 = MenuBuilder.BuildRegisteredType("SOStarRequirementsSmall", {
			controllerIndex = var_9_1
		})

		var_9_14.id = "StarRequirements"

		var_9_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -246, _1080p * -116)
		var_9_0:addElement(var_9_14)

		var_9_0.StarRequirements = var_9_14
	end

	local var_9_15

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsRewardsEnabled(var_9_0) then
		local var_9_16 = MenuBuilder.BuildRegisteredType("SOStarRewardNext", {
			controllerIndex = var_9_1
		})

		var_9_16.id = "StarReward"

		var_9_16:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 536, _1080p * 676, _1080p * -336, _1080p * -116)
		var_9_0:addElement(var_9_16)

		var_9_0.StarReward = var_9_16
	end

	local var_9_17
	local var_9_18 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_9_1
	})

	var_9_18.id = "CDLRestrictionTag"

	var_9_18:SetAlpha(0, 0)
	var_9_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 446, _1080p * 173, _1080p * 203)
	var_9_0:addElement(var_9_18)

	var_9_0.CDLRestrictionTag = var_9_18

	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("PrivateMatchLobbyPlayMenu", PrivateMatchLobbyPlayMenu)
LockTable(_M)
