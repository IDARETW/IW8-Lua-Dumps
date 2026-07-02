module(..., package.seeall)

local var_0_0

local function var_0_1(arg_1_0, arg_1_1)
	if var_0_0 then
		WipeGlobalModelsAtPath(var_0_0)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	Engine.DHFCHIIJCA("squad_lobby")

	local var_2_0 = {
		"head_mp_western_wyatt_1_1"
	}
	local var_2_1 = {
		"body_mp_western_wyatt_1_1"
	}

	FrontEndScene.RequestBodyModels(var_2_1)
	FrontEndScene.RequestHeadModels(var_2_0)

	local var_2_2 = {}
	local var_2_3 = {
		"sdr_mp_crouch_idle",
		"sdr_mp_stand_idle01"
	}
	local var_2_4 = {
		operatorPose = operatorPose,
		element = arg_2_0
	}

	for iter_2_0 = 1, 2 do
		local var_2_5 = var_2_3[iter_2_0]
		local var_2_6 = FrontEndScene.ClientCharacters["ArenaLeft" .. iter_2_0]

		table.insert(var_2_2, var_2_6)
		OPERATOR.UpdateClientCharacter(var_2_6, "body_mp_western_wyatt_1_1", "head_mp_western_wyatt_1_1", var_2_4)

		local var_2_7 = FrontEndScene.ClientCharacters["ArenaRight" .. iter_2_0]

		table.insert(var_2_2, var_2_7)
		OPERATOR.UpdateClientCharacter(var_2_7, "body_mp_western_wyatt_1_1", "head_mp_western_wyatt_1_1", var_2_4)
	end

	FrontEndScene.SetupCharacters(var_2_2)
end

local function var_0_3(arg_3_0, arg_3_1)
	if Dvar.IBEGCHEFE("LLPNKKORPT") then
		local var_3_0 = MP_COMMON.IsMatchRulesCODCastingEnabled(false)

		CODCASTER.SetCODCastingEnabled(var_3_0)
		Lobby.IEEDICEJE(var_3_0 and CODCASTER.CanCODCast())
		arg_3_0.CDLRestrictionTag:UpdateVisibility(arg_3_1)
	else
		local var_3_1 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.isCodCastingEnabled")

		arg_3_0:SubscribeToModel(var_3_1:GetModel(arg_3_1), function()
			local var_4_0 = var_3_1:GetValue(arg_3_1)

			CODCASTER.SetCODCastingEnabled(var_4_0)
		end, true)

		local var_3_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areMLGRulesEnabled")

		arg_3_0:SubscribeToModel(var_3_2:GetModel(arg_3_1), function()
			arg_3_0.CDLRestrictionTag:UpdateVisibility(arg_3_1)
		end)
	end

	if CODCASTER.CanCODCast() then
		CODCASTER.CreateCODCasterSettingsButton(arg_3_0.SystemLinkLobbyButtons, arg_3_1)
	end
end

local function var_0_4(arg_6_0, arg_6_1)
	arg_6_0 = arg_6_0 or Engine.IJEBHJIJF()

	local var_6_0
	local var_6_1 = Lobby.GetLocalPlayerDataSource(arg_6_0)

	if var_6_1 then
		var_6_0 = var_6_1.desiredTeam:GetValue(arg_6_0)
	end

	var_6_0 = var_6_0 or Lobby.GetLocalClientTeam(arg_6_0)

	local var_6_2 = Lobby.GetSuperFactionIndexFromTeam(var_6_0)

	if Engine.EAIICIFIFA() then
		var_6_2 = OPERATOR.GetSelectedOperatorIndex(arg_6_0)
	end

	var_6_2 = var_6_2 or OPERATOR.SuperFaction.WEST

	local var_6_3, var_6_4 = OPERATOR.GetEquippedOperatorSkin(arg_6_0, var_6_2)

	FrontEndScene.RequestBodyModels({
		var_6_3
	})
	FrontEndScene.RequestHeadModels({
		var_6_4
	})

	local var_6_5, var_6_6 = OPERATOR.GetWeaponDataFromLoadout(arg_6_0)
	local var_6_7 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_6_0)
	local var_6_8 = OPERATOR.ValidateAccessoryModel(var_6_7, var_6_3)

	FrontEndScene.RequestWeaponWorldModels({
		var_6_5,
		var_6_6,
		var_6_8
	})

	local var_6_9 = Lobby.GetWalkAnimationForIndex(var_6_3, var_6_4, arg_6_1 + 1, var_6_5)
	local var_6_10 = {
		showCharacter = true,
		operatorPose = var_6_9,
		element = self,
		weaponModel = var_6_5,
		secondaryModel = var_6_6,
		accessoryModel = var_6_8
	}

	OPERATOR.UpdateClientCharacter(arg_6_1, var_6_3, var_6_4, var_6_10)

	local var_6_11 = Lobby.GetPetIndexForCharacter(arg_6_1)

	if var_6_11 then
		OPERATOR.UpdatePet(arg_6_0, var_6_11, {
			executionPet = OPERATOR.GetPetForEquippedOperator(arg_6_0, var_6_2),
			element = self
		})
	end
end

local function var_0_5()
	var_0_4(Engine.CAGFAECIIG(0), FrontEndScene.ClientCharacters.LocalSquadMember)

	if Engine.JEDFGECDJ() > 1 then
		var_0_4(Engine.CAGFAECIIG(1), FrontEndScene.ClientCharacters.Lobby1)
	else
		FrontEndScene.HideAllLobbyCharactersPastIndex(2)
	end
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	PRIVATE_MATCH.DisplayDevCheatWarning(arg_8_0)
	assert(arg_8_0.SystemLinkLobbyButtons)

	arg_8_0.Cleanup = var_0_1
	var_0_0 = arg_8_0.SystemLinkLobbyButtons.widgetModelPath

	arg_8_0:setPriority(-1)

	if CONDITIONS.IsCoreMultiplayer() then
		var_0_3(arg_8_0, arg_8_1)
	end

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearAllPickupMunitions(arg_8_1)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")

	if Dvar.IBEGCHEFE("tournament_in_system_link") == true and Engine.BHICADFIHA() then
		var_0_2(arg_8_0, arg_8_1)
	end

	if CONDITIONS.IsThirdGameMode() then
		local function var_8_0()
			if CONDITIONS.IsSpecOpsGameType() and CONDITIONS.AreSpecOpsStarsEnabled() then
				ACTIONS.AnimateSequence(arg_8_0.LobbyMap, "MapHeader")
			else
				ACTIONS.AnimateSequence(arg_8_0.LobbyMap, "MapDefault")
			end
		end

		arg_8_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_8_1), var_8_0)
		var_8_0()
	end

	assert(arg_8_0.Vignette)
	assert(arg_8_0.GradientRight)

	local function var_8_1()
		local var_10_0 = CoD.GetAspectRatioScaleAdjust(0.4)

		arg_8_0.Vignette:SetScale(var_10_0)
		arg_8_0.GradientRight:SetScale(var_10_0)
	end

	arg_8_0:addAndCallEventHandler("onVideoChange", var_8_1)

	if Engine.CGABICJHAI() then
		LAYOUT.AddAspectRatioFadeFrame(arg_8_0, arg_8_1, nil)
	end

	local var_8_2 = LUI.UITimer.new({
		interval = 1000,
		event = "update_lobby"
	})

	var_8_2.id = "lobbyTimer"

	arg_8_0:addElement(var_8_2)
	arg_8_0:registerEventHandler("update_lobby", function(arg_11_0, arg_11_1)
		var_0_5(arg_11_0, arg_8_1)
	end)
end

function SystemLinkLobbyPlayMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIHorizontalNavigator.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "SystemLinkLobbyPlayMenu"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Vignette"

	var_12_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_4:SetAlpha(0.5, 0)
	var_12_4:setImage(RegisterMaterial("gradient_curve"), 0)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 900, _1080p * 160, _1080p * -70)
	var_12_0:addElement(var_12_4)

	var_12_0.Vignette = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "GradientRight"

	var_12_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_6:SetAlpha(0.5, 0)
	var_12_6:setImage(RegisterMaterial("gradient_curve"), 0)
	var_12_6:SetAnchorsAndPosition(1, 0, 0, 0, 0, _1080p * -900, _1080p * 160, _1080p * -70)
	var_12_0:addElement(var_12_6)

	var_12_0.GradientRight = var_12_6

	local var_12_7

	if CONDITIONS.IsLaunchChunk(var_12_0) then
		local var_12_8 = LUI.UIImage.new()

		var_12_8.id = "LCBackground"

		var_12_8:setImage(RegisterMaterial("loading_mp_m_speedball_bg"), 0)
		var_12_0:addElement(var_12_8)

		var_12_0.LCBackground = var_12_8
	end

	local var_12_9
	local var_12_10 = MenuBuilder.BuildRegisteredType("SystemLinkLobbyButtons", {
		controllerIndex = var_12_1
	})

	var_12_10.id = "SystemLinkLobbyButtons"

	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 556, _1080p * 216, _1080p * 393)
	var_12_0:addElement(var_12_10)

	var_12_0.SystemLinkLobbyButtons = var_12_10

	local var_12_11

	if not CONDITIONS.IsLaunchChunk(var_12_0) then
		var_12_11 = MenuBuilder.BuildRegisteredType("LobbyMembers", {
			controllerIndex = var_12_1
		})
		var_12_11.id = "LobbyMembers"

		var_12_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 230, _1080p * 840, _1080p * 216, _1080p * 826)
		var_12_0:addElement(var_12_11)

		var_12_0.LobbyMembers = var_12_11
	end

	local var_12_12
	local var_12_13 = MenuBuilder.BuildRegisteredType("LobbyMap", {
		controllerIndex = var_12_1
	})

	var_12_13.id = "LobbyMap"

	var_12_13:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 526, _1080p * -336, _1080p * -116)
	var_12_0:addElement(var_12_13)

	var_12_0.LobbyMap = var_12_13

	local var_12_14

	if Engine.EAIICIFIFA() and CONDITIONS.AreSpecOpsStarsEnabled(var_12_0) then
		local var_12_15 = MenuBuilder.BuildRegisteredType("SOStarRequirementsSmall", {
			controllerIndex = var_12_1
		})

		var_12_15.id = "StarRequirements"

		var_12_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 834, _1080p * 964)
		var_12_0:addElement(var_12_15)

		var_12_0.StarRequirements = var_12_15
	end

	local var_12_16
	local var_12_17 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_12_1
	})

	var_12_17.id = "CDLRestrictionTag"

	var_12_17:SetAlpha(0, 0)
	var_12_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 446, _1080p * 173, _1080p * 203)
	var_12_0:addElement(var_12_17)

	var_12_0.CDLRestrictionTag = var_12_17

	local function var_12_18()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_18

	local var_12_19
	local var_12_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1235
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -776
		}
	}

	var_12_10:RegisterAnimationSequence("ShowPlayerInfo", var_12_20)

	if not CONDITIONS.IsLaunchChunk(var_12_0) then
		local var_12_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 633
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1243
			}
		}

		var_12_11:RegisterAnimationSequence("ShowPlayerInfo", var_12_21)
	end

	local function var_12_22()
		var_12_10:AnimateSequence("ShowPlayerInfo")

		if not CONDITIONS.IsLaunchChunk(var_12_0) then
			var_12_11:AnimateSequence("ShowPlayerInfo")
		end
	end

	var_12_0._sequences.ShowPlayerInfo = var_12_22

	local var_12_23
	local var_12_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 556
		}
	}

	var_12_10:RegisterAnimationSequence("HidePlayerInfo", var_12_24)

	if not CONDITIONS.IsLaunchChunk(var_12_0) then
		local var_12_25 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 230
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 840
			}
		}

		var_12_11:RegisterAnimationSequence("HidePlayerInfo", var_12_25)
	end

	local function var_12_26()
		var_12_10:AnimateSequence("HidePlayerInfo")

		if not CONDITIONS.IsLaunchChunk(var_12_0) then
			var_12_11:AnimateSequence("HidePlayerInfo")
		end
	end

	var_12_0._sequences.HidePlayerInfo = var_12_26

	var_12_10:addEventHandler("gain_focus", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_12_1
		end

		ACTIONS.AnimateSequence(var_12_0, "HidePlayerInfo")
	end)
	var_0_6(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("SystemLinkLobbyPlayMenu", SystemLinkLobbyPlayMenu)
LockTable(_M)
