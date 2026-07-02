module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._areWeGameHost == nil then
		arg_1_0._areWeGameHost = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost"):GetValue(arg_1_1)
	end

	PRIVATE_MATCH.CheckMatchRuleGameModeData(arg_1_0, arg_1_1)

	return LUI.FlowManager.GetScopedData("WarzonePrivateMatchLobby").wzGameRef
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_1

	if var_2_0.isTournament or var_2_0.isWarzone then
		if CONDITIONS.IsWZPrivateMatch(arg_2_0) then
			local var_2_2 = var_0_0(arg_2_0, controllerIndex)

			if var_2_2 and #var_2_2 > 0 then
				var_2_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_2, CSV.gameTypesTable.cols.privateMap)

				return var_2_1
			end
		end

		var_2_1 = var_2_0.matchmakerSettings.maps[1]
	else
		var_2_1 = arg_2_1 and Dvar.DHEEJCCJBH("PTNOLQOOP") or Dvar.DHEEJCCJBH("NSQLTTMRMP")
	end

	return var_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.GameModeText:setText(arg_3_2)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.MapText)

	arg_4_0._curMap = nil
	arg_4_0._curMapName = nil
	arg_4_0._curGameMode = nil
	arg_4_0.SetGameModeName = var_0_2

	local function var_4_0()
		local var_5_0
		local var_5_1
		local var_5_2 = CONDITIONS.IsThirdGameMode() and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "" and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "none"

		if CONDITIONS.IsWZPrivateMatch(arg_4_0) then
			local var_5_3 = var_0_0(arg_4_0, arg_4_1)

			if var_5_3 and #var_5_3 > 0 then
				local var_5_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_3, CSV.gameTypesTable.cols.name)

				if var_5_4 and #var_5_4 > 0 then
					arg_4_0.GameModeText:setText(Engine.CBBHFCGDIC(var_5_4))
				end
			end
		end

		local var_5_5 = var_0_1(arg_4_0, var_5_2)

		if var_5_5 == nil or #var_5_5 == 0 then
			arg_4_0:SetAlpha(0)

			return
		else
			arg_4_0:SetAlpha(1)
		end

		local var_5_6 = MP.GetLobbyMapName(var_5_5, var_5_2)

		if #var_5_6 == 0 then
			var_5_6 = var_5_2 and DataSources.frontEnd.lobby.missionName:GetValue(arg_4_1) or DataSources.frontEnd.lobby.mapName:GetValue(arg_4_1)
			var_5_0 = Engine.CBBHFCGDIC(var_5_6)
		else
			var_5_0 = var_5_6
		end

		local var_5_7
		local var_5_8 = CONDITIONS.IsBRTDMGameType() and Dvar.DHEEJCCJBH("scr_brtdm_locale") or nil

		if var_5_8 then
			var_5_7 = MP.GetBRTDMLocaleData(var_5_8)
			var_5_0 = Engine.CBBHFCGDIC(var_5_7.name)
		end

		if var_5_0 ~= nil then
			if arg_4_0._curMapName ~= var_5_0 then
				arg_4_0.MapText:setText(var_5_0)

				arg_4_0._curMapName = var_5_0
			end
		else
			arg_4_0.MapText:setText("")
		end

		if CONDITIONS.IsLaunchChunk() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU/LC_GAME_MODE")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_bootCamp"))
		else
			local var_5_9 = var_0_1(arg_4_0, var_5_2)

			if var_5_9 == nil or #var_5_9 == 0 then
				arg_4_0:SetAlpha(0)

				return
			else
				arg_4_0:SetAlpha(1)
			end

			if var_5_9 ~= arg_4_0._curMap then
				arg_4_0._curMap = var_5_9

				if not var_5_2 or not CSV.mpMapTable.cols.cpMissionName then
					local var_5_10 = CSV.mpMapTable.cols.ref
				end

				local var_5_11 = MP.GetLobbyMapImage(var_5_9)

				if var_5_8 then
					var_5_11 = var_5_7.image
				end

				local var_5_12 = Dvar.DHEEJCCJBH("ui_lobby_map_image_override")

				if var_5_12 ~= nil and var_5_12 ~= "" then
					var_5_11 = var_5_12
				end

				if var_5_11 and #var_5_11 > 0 then
					arg_4_0.MapImage:setImage(RegisterMaterial(var_5_11))
				else
					local var_5_13 = DataSources.frontEnd.lobby.mapImage:GetValue(arg_4_1)

					if var_5_13 ~= nil and #var_5_13 > 0 then
						arg_4_0.MapImage:setImage(RegisterMaterial(var_5_13))
					end
				end
			end
		end

		local var_5_14 = LUI.FlowManager.GetScopedData(arg_4_0)
		local var_5_15 = var_5_14.isTournament or var_5_14.isWarzone
		local var_5_16 = var_5_15 and var_5_14.matchmakerSettings.gameType or DataSources.frontEnd.lobby.gameType:GetValue(arg_4_1)

		var_5_16 = CONDITIONS.IsWZPrivateMatch(arg_4_0) and var_0_0(arg_4_0, arg_4_1) or var_5_16

		if var_5_16 == nil or #var_5_16 == 0 then
			arg_4_0:SetAlpha(0)

			return
		else
			arg_4_0:SetAlpha(1)
		end

		if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) and not var_5_15 then
			local var_5_17 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.realismImage)

			if var_5_17 == "" then
				var_5_17 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.image)
			end

			arg_4_0.GameModeImage:setImage(RegisterMaterial(var_5_17))

			local var_5_18 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.name)

			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/REALISM_GAME_TYPE", var_5_18)
		else
			local var_5_19
			local var_5_20

			if MLG.IsCDLActive(arg_4_1) then
				var_5_20 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.CDLName)
				var_5_19 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.CDLImage)
			else
				var_5_20 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.name)

				if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn) then
					var_5_19 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.hardcoreImage)
					arg_4_0._isHardcore = true
				else
					var_5_19 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_5_16, CSV.gameTypesTable.cols.image)
					arg_4_0._isHardcore = false
				end
			end

			arg_4_0.GameModeImage:setImage(RegisterMaterial(var_5_19))

			var_5_1 = arg_4_0._isHardcore and Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_5_20) or Engine.CBBHFCGDIC(var_5_20)
		end

		local var_5_21

		if CONDITIONS.IsWZPrivateMatch(arg_4_0) then
			var_5_21 = var_5_1
		end

		if Dvar.CFHDGABACF("ui_cranked") == 1 then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU/CRANKED")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_crank"), 0)
		elseif CONDITIONS.IsAONGameType() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_AON")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_aon"), 0)
		elseif Dvar.CFHDGABACF("ui_snr") == 1 then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/SR")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_snr"), 0)
		elseif CONDITIONS.IsGoldWarGametype() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/GOLDWAR_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_gold_war"), 0)
		elseif CONDITIONS.IsBRTitaniumTrialsEnduranceGameType() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ345/CAL_TITANIUM_QUADS")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_titanium_trials"), 0)
		elseif CONDITIONS.IsMeleeMayhemGametype() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ350/MMP_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_knives"), 0)
		elseif CONDITIONS.IsBloodMoney() or CONDITIONS.IsWZRatRace() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/PAYBACK")

			local var_5_22 = "icon_br_mode_plunder"

			if CONDITIONS.IsMapPacificIsland() then
				var_5_22 = CONDITIONS.IsWW2Verse() and "icon_br_mode_wz_vanguard_plunder" or "icon_br_mode_wz_metaverse_plunder"
			end

			arg_4_0.GameModeImage:setImage(RegisterMaterial(var_5_22), 0)
		elseif CONDITIONS.IsBRJugg() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRJUGG")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_juggernaut"), 0)
		elseif CONDITIONS.IsRiskGametype() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/RISK")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mission_generic"), 0)
		elseif CONDITIONS.IsBRMini() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRMINI")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_mini"), 0)
		elseif CONDITIONS.IsBRKingSlayer() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRKING")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_kingslayer"), 0)
		elseif CONDITIONS.IsBRTruckWar() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRTRUCK")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_truckwar"), 0)
		elseif CONDITIONS.IsBRX1Variant() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/KYH_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_zeus"), 0)
		elseif CONDITIONS.IsBRX2Gametype() then
			var_5_1 = Engine.CBBHFCGDIC("BR_REVEAL_X2_EVENT/EVENT_TITLE_X2")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_x2"), 0)
		elseif CONDITIONS.IsKillstreakConfirmedGameType() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/KILLSTREAK_CONFIRMED")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_mp_killstreak_confirmed"), 0)
		elseif CONDITIONS.IsGunGameTDMGameType() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/GUN_TDM")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_mp_gungame_tdm"), 0)
		elseif CONDITIONS.IsBRRevealMode() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/DOV_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_exfiltration"), 0)
		elseif CONDITIONS.IsBRZombies() and not CONDITIONS.IsBRZ() then
			var_5_1 = CONDITIONS.IsMapAtlantis() and Engine.CBBHFCGDIC("PLAYLIST_WZ345/RXP_NAME") or Engine.CBBHFCGDIC("LUA_MENU_MP/ZOMBIE_ROYALE")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_zombies"), 0)
		elseif CONDITIONS.IsRebirthGametype() or CONDITIONS.IsRebirthSoloGametype() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/REBIRTH_NAME")

			local var_5_23 = "icon_mode_wz_br_rebirth"

			if CONDITIONS.IsMapPacificIsland() then
				var_5_23 = "icon_mode_wz_br_island_rebirth"
			elseif CONDITIONS.IsMapDragonsDen() then
				var_5_23 = "icon_mode_wz_br_dd_resurgence"
			end

			arg_4_0.GameModeImage:setImage(RegisterMaterial(var_5_23), 0)
		elseif CONDITIONS.IsBRExfiltrationMode() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/EXFILTRIOS_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_exfiltration"), 0)
		elseif CONDITIONS.IsBRRevealTwoMode() then
			var_5_1 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("PLAYLIST/DOV2_OVER_RUN"))

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_dov_p2"), 0)
		elseif CONDITIONS.IsWZPayload() then
			var_5_1 = Engine.CBBHFCGDIC("BR_PAYLOAD/PAYLOAD_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_payload"), 0)
		elseif CONDITIONS.IsBRGhosts() then
			var_5_1 = Engine.CBBHFCGDIC("LUA_MENU_DIVER/GHOST_EVENT")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_ghosts"), 0)
		elseif CONDITIONS.IsBRIronTrialsGametype() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/DBD_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_strongman84"), 0)
		elseif CONDITIONS.IsWW2Verse() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/VG_ROYALE_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_wz_Vanguard_Royale"), 0)
		elseif CONDITIONS.IsWZIncursion() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/RUGBY_NAME5")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_rumble"), 0)
		elseif CONDITIONS.IsWZRumble() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST/CLASH_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_rumble"), 0)
		elseif CONDITIONS.IsBRMendotaGameType() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ330/OP_MON")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_mendota"), 0)
		elseif CONDITIONS.IsRespectGametype() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ335/RESPECT")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_respect_circle"), 0)
		elseif CONDITIONS.IsOlarideGameType() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ350/OLARIDE_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_olaride"), 0)
		elseif CONDITIONS.IsBRResurgenceTrialsGametype() or CONDITIONS.IsBRResurgenceTrialsSoloGametype() then
			var_5_1 = Engine.CBBHFCGDIC("PLAYLIST_WZ355/RES_TRIALS_NAME")

			arg_4_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_resusup"), 0)
		end

		if var_5_1 ~= nil then
			if CONDITIONS.IsWZPrivateMatch(arg_4_0) and var_5_21 and #var_5_21 > 0 then
				var_5_1 = var_5_21
			end

			if arg_4_0._curGameMode ~= var_5_1 then
				arg_4_0.GameModeText:setText(var_5_1)

				arg_4_0._curGameMode = var_5_1
			end
		else
			arg_4_0.GameModeText:setText("")
		end
	end

	local var_4_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_map_name"
	})

	var_4_1.id = "mapUpdateTimer"

	arg_4_0:addElement(var_4_1)
	var_4_0()
	arg_4_0:registerEventHandler("update_map_name", function(arg_6_0, arg_6_1)
		var_4_0()
	end)
	var_4_0()
end

function LobbyMap(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 220 * _1080p)

	var_7_0.id = "LobbyMap"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:setUseStencil(true)

	local var_7_3

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_4 = LUI.UIImage.new()

		var_7_4.id = "MapImage"

		var_7_4:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
		var_7_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_7_0:addElement(var_7_4)

		var_7_0.MapImage = var_7_4
	end

	local var_7_5

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		var_7_5 = LUI.UIImage.new()
		var_7_5.id = "GradientBottom"

		var_7_5:SetRGBFromInt(0, 0)
		var_7_5:SetAlpha(0.9, 0)
		var_7_5:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_7_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_7_0:addElement(var_7_5)

		var_7_0.GradientBottom = var_7_5
	end

	local var_7_6

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		var_7_6 = LUI.UIImage.new()
		var_7_6.id = "GradientTop"

		var_7_6:SetRGBFromInt(0, 0)
		var_7_6:SetAlpha(0, 0)
		var_7_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
		var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_7_0:addElement(var_7_6)

		var_7_0.GradientTop = var_7_6
	end

	local var_7_7
	local var_7_8 = LUI.UIStyledText.new()

	var_7_8.id = "GameModeText"

	var_7_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_8:setText("", 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_7_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_8:SetStartupDelay(1000)
	var_7_8:SetLineHoldTime(400)
	var_7_8:SetAnimMoveTime(1500)
	var_7_8:SetAnimMoveSpeed(1500)
	var_7_8:SetEndDelay(1000)
	var_7_8:SetCrossfadeTime(400)
	var_7_8:SetFadeInTime(300)
	var_7_8:SetFadeOutTime(300)
	var_7_8:SetMaxVisibleLines(1)
	var_7_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 98, _1080p * -20, _1080p * -82, _1080p * -46)
	var_7_0:addElement(var_7_8)

	var_7_0.GameModeText = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "MapText"

	var_7_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_10:setText(ToUpperCase(""), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(2000)
	var_7_10:SetLineHoldTime(400)
	var_7_10:SetAnimMoveTime(2000)
	var_7_10:SetAnimMoveSpeed(150)
	var_7_10:SetEndDelay(2000)
	var_7_10:SetCrossfadeTime(250)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 98, _1080p * -20, _1080p * -50, _1080p * -22)
	var_7_0:addElement(var_7_10)

	var_7_0.MapText = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIImage.new()

	var_7_12.id = "GameModeImage"

	var_7_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 14, _1080p * 90, _1080p * -91, _1080p * -15)

	local function var_7_13()
		local var_8_0 = DataSources.frontEnd.lobby.gameTypeImage:GetValue(var_7_1)

		if var_8_0 ~= nil then
			var_7_12:setImage(RegisterMaterial(var_8_0), 0)
		end
	end

	local var_7_14 = DataSources.frontEnd.lobby.gameTypeImage

	var_7_12:SubscribeToModel(var_7_14:GetModel(var_7_1), var_7_13)
	var_7_0:addElement(var_7_12)

	var_7_0.GameModeImage = var_7_12

	local function var_7_15()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_15

	local var_7_16

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 41
			}
		}

		var_7_5:RegisterAnimationSequence("MapHeader", var_7_17)
	end

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_18 = {
			{
				value = 0.9,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_6:RegisterAnimationSequence("MapHeader", var_7_18)
	end

	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 45
		}
	}

	var_7_8:RegisterAnimationSequence("MapHeader", var_7_19)

	local var_7_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 72
		}
	}

	var_7_10:RegisterAnimationSequence("MapHeader", var_7_20)

	local var_7_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		}
	}

	var_7_12:RegisterAnimationSequence("MapHeader", var_7_21)

	local function var_7_22()
		if not CONDITIONS.IsLaunchChunk(var_7_0) then
			var_7_5:AnimateSequence("MapHeader")
		end

		if not CONDITIONS.IsLaunchChunk(var_7_0) then
			var_7_6:AnimateSequence("MapHeader")
		end

		var_7_8:AnimateSequence("MapHeader")
		var_7_10:AnimateSequence("MapHeader")
		var_7_12:AnimateSequence("MapHeader")
	end

	var_7_0._sequences.MapHeader = var_7_22

	local var_7_23

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_24 = {
			{
				value = 0.9,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -122
			}
		}

		var_7_5:RegisterAnimationSequence("MapDefault", var_7_24)
	end

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.X_Rotation
			}
		}

		var_7_6:RegisterAnimationSequence("MapDefault", var_7_25)
	end

	local var_7_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -46
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_7_8:RegisterAnimationSequence("MapDefault", var_7_26)

	local var_7_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -20
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_7_10:RegisterAnimationSequence("MapDefault", var_7_27)

	local var_7_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -15
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_7_12:RegisterAnimationSequence("MapDefault", var_7_28)

	local function var_7_29()
		if not CONDITIONS.IsLaunchChunk(var_7_0) then
			var_7_5:AnimateSequence("MapDefault")
		end

		if not CONDITIONS.IsLaunchChunk(var_7_0) then
			var_7_6:AnimateSequence("MapDefault")
		end

		var_7_8:AnimateSequence("MapDefault")
		var_7_10:AnimateSequence("MapDefault")
		var_7_12:AnimateSequence("MapDefault")
	end

	var_7_0._sequences.MapDefault = var_7_29

	var_0_3(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LobbyMap", LobbyMap)
LockTable(_M)
