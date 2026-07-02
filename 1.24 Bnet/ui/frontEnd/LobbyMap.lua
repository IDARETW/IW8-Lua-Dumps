module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)
	local var_1_1

	if var_1_0.isTournament or var_1_0.isWarzone then
		var_1_1 = var_1_0.matchmakerSettings.maps[1]
	else
		var_1_1 = arg_1_1 and Dvar.DHEEJCCJBH("PTNOLQOOP") or Dvar.DHEEJCCJBH("NSQLTTMRMP")
	end

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.MapText)

	arg_2_0._curMap = nil
	arg_2_0._curMapName = nil
	arg_2_0._curGameMode = nil

	local function var_2_0()
		local var_3_0
		local var_3_1
		local var_3_2 = CONDITIONS.IsThirdGameMode() and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "" and Dvar.DHEEJCCJBH("PTNOLQOOP") ~= "none"
		local var_3_3 = var_0_0(arg_2_0, var_3_2)
		local var_3_4 = MP.GetLobbyMapName(var_3_3, var_3_2)

		if #var_3_4 == 0 then
			var_3_4 = var_3_2 and DataSources.frontEnd.lobby.missionName:GetValue(arg_2_1) or DataSources.frontEnd.lobby.mapName:GetValue(arg_2_1)
			var_3_0 = Engine.CBBHFCGDIC(var_3_4)
		else
			var_3_0 = var_3_4
		end

		local var_3_5
		local var_3_6 = CONDITIONS.IsBRTDMGameType() and Dvar.DHEEJCCJBH("scr_brtdm_locale") or nil

		if var_3_6 then
			var_3_5 = MP.GetBRTDMLocaleData(var_3_6)
			var_3_0 = Engine.CBBHFCGDIC(var_3_5.name)
		end

		if var_3_0 ~= nil then
			if arg_2_0._curMapName ~= var_3_0 then
				arg_2_0.MapText:setText(var_3_0)

				arg_2_0._curMapName = var_3_0
			end
		else
			arg_2_0.MapText:setText("")
		end

		if CONDITIONS.IsLaunchChunk() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/LC_GAME_MODE")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_bootCamp"))
		else
			local var_3_7 = var_0_0(arg_2_0, var_3_2)

			if var_3_7 ~= arg_2_0._curMap then
				arg_2_0._curMap = var_3_7

				if not var_3_2 or not CSV.mpMapTable.cols.cpMissionName then
					local var_3_8 = CSV.mpMapTable.cols.ref
				end

				local var_3_9 = MP.GetLobbyMapImage(var_3_7)

				if var_3_6 then
					var_3_9 = var_3_5.image
				end

				if var_3_9 and #var_3_9 > 0 then
					arg_2_0.MapImage:setImage(RegisterMaterial(var_3_9))
				else
					local var_3_10 = DataSources.frontEnd.lobby.mapImage:GetValue(arg_2_1)

					if var_3_10 ~= nil and #var_3_10 > 0 then
						arg_2_0.MapImage:setImage(RegisterMaterial(var_3_10))
					end
				end
			end
		end

		local var_3_11 = LUI.FlowManager.GetScopedData(arg_2_0)
		local var_3_12 = var_3_11.isTournament or var_3_11.isWarzone
		local var_3_13 = var_3_12 and var_3_11.matchmakerSettings.gameType or DataSources.frontEnd.lobby.gameType:GetValue(arg_2_1)

		if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) and not var_3_12 then
			local var_3_14 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.realismImage)

			if var_3_14 == "" then
				var_3_14 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.image)
			end

			arg_2_0.GameModeImage:setImage(RegisterMaterial(var_3_14))

			local var_3_15 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.name)

			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/REALISM_GAME_TYPE", var_3_15)
		else
			local var_3_16
			local var_3_17

			if MLG.IsCDLActive(arg_2_1) then
				var_3_17 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.CDLName)
				var_3_16 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.CDLImage)
			else
				var_3_17 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.name)

				if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.HardcoreModeOn) then
					var_3_16 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.hardcoreImage)
					arg_2_0._isHardcore = true
				else
					var_3_16 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_3_13, CSV.gameTypesTable.cols.image)
					arg_2_0._isHardcore = false
				end
			end

			arg_2_0.GameModeImage:setImage(RegisterMaterial(var_3_16))

			var_3_1 = arg_2_0._isHardcore and Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", var_3_17) or Engine.CBBHFCGDIC(var_3_17)
		end

		if Dvar.CFHDGABACF("ui_cranked") == 1 then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU/CRANKED")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_crank"), 0)
		elseif Dvar.CFHDGABACF("scr_dm_aonrules") == 1 then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_AON")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_aon"), 0)
		elseif Dvar.CFHDGABACF("ui_snr") == 1 then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/SR")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mp_mode_snr"), 0)
		elseif CONDITIONS.IsBloodMoney() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/PAYBACK")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_br_mode_plunder"), 0)
		elseif CONDITIONS.IsBRJugg() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRJUGG")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_juggernaut"), 0)
		elseif CONDITIONS.IsRiskGametype() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/RISK")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mission_generic"), 0)
		elseif CONDITIONS.IsBRMini() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRMINI")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_mini"), 0)
		elseif CONDITIONS.IsBRKingSlayer() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRKING")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_kingslayer"), 0)
		elseif CONDITIONS.IsBRTruckWar() then
			var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/BRTRUCK")

			arg_2_0.GameModeImage:setImage(RegisterMaterial("icon_mode_wz_br_truckwar"), 0)
		end

		if var_3_1 ~= nil then
			if arg_2_0._curGameMode ~= var_3_1 then
				arg_2_0.GameModeText:setText(var_3_1)

				arg_2_0._curGameMode = var_3_1
			end
		else
			arg_2_0.GameModeText:setText("")
		end
	end

	local var_2_1 = LUI.UITimer.new({
		interval = 500,
		event = "update_map_name"
	})

	var_2_1.id = "mapUpdateTimer"

	arg_2_0:addElement(var_2_1)
	var_2_0()
	arg_2_0:registerEventHandler("update_map_name", function(arg_4_0, arg_4_1)
		var_2_0()
	end)
	var_2_0()
end

function LobbyMap(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 220 * _1080p)

	var_5_0.id = "LobbyMap"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		local var_5_4 = LUI.UIImage.new()

		var_5_4.id = "MapImage"

		var_5_4:SetRGBFromInt(14211288, 0)
		var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_5_0:addElement(var_5_4)

		var_5_0.MapImage = var_5_4
	end

	local var_5_5

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		var_5_5 = LUI.UIImage.new()
		var_5_5.id = "GradientBottom"

		var_5_5:SetRGBFromInt(0, 0)
		var_5_5:SetAlpha(0.9, 0)
		var_5_5:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_5_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_5_0:addElement(var_5_5)

		var_5_0.GradientBottom = var_5_5
	end

	local var_5_6

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		var_5_6 = LUI.UIImage.new()
		var_5_6.id = "GradientTop"

		var_5_6:SetRGBFromInt(0, 0)
		var_5_6:SetAlpha(0, 0)
		var_5_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
		var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
		var_5_0:addElement(var_5_6)

		var_5_0.GradientTop = var_5_6
	end

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "GameModeText"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_8:SetStartupDelay(2000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(2000)
	var_5_8:SetAnimMoveSpeed(150)
	var_5_8:SetEndDelay(2000)
	var_5_8:SetCrossfadeTime(250)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(1)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 98, _1080p * -20, _1080p * -82, _1080p * -46)
	var_5_0:addElement(var_5_8)

	var_5_0.GameModeText = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "MapText"

	var_5_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_10:setText(ToUpperCase(""), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_10:SetStartupDelay(2000)
	var_5_10:SetLineHoldTime(400)
	var_5_10:SetAnimMoveTime(2000)
	var_5_10:SetAnimMoveSpeed(150)
	var_5_10:SetEndDelay(2000)
	var_5_10:SetCrossfadeTime(250)
	var_5_10:SetFadeInTime(300)
	var_5_10:SetFadeOutTime(300)
	var_5_10:SetMaxVisibleLines(1)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 98, _1080p * -20, _1080p * -50, _1080p * -22)
	var_5_0:addElement(var_5_10)

	var_5_0.MapText = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "GameModeImage"

	var_5_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 14, _1080p * 90, _1080p * -91, _1080p * -15)

	local function var_5_13()
		local var_6_0 = DataSources.frontEnd.lobby.gameTypeImage:GetValue(var_5_1)

		if var_6_0 ~= nil then
			var_5_12:setImage(RegisterMaterial(var_6_0), 0)
		end
	end

	local var_5_14 = DataSources.frontEnd.lobby.gameTypeImage

	var_5_12:SubscribeToModel(var_5_14:GetModel(var_5_1), var_5_13)
	var_5_0:addElement(var_5_12)

	var_5_0.GameModeImage = var_5_12

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		local var_5_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 41
			}
		}

		var_5_5:RegisterAnimationSequence("MapHeader", var_5_17)
	end

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		local var_5_18 = {
			{
				value = 0.9,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_6:RegisterAnimationSequence("MapHeader", var_5_18)
	end

	local var_5_19 = {
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

	var_5_8:RegisterAnimationSequence("MapHeader", var_5_19)

	local var_5_20 = {
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

	var_5_10:RegisterAnimationSequence("MapHeader", var_5_20)

	local var_5_21 = {
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

	var_5_12:RegisterAnimationSequence("MapHeader", var_5_21)

	local function var_5_22()
		if not CONDITIONS.IsLaunchChunk(var_5_0) then
			var_5_5:AnimateSequence("MapHeader")
		end

		if not CONDITIONS.IsLaunchChunk(var_5_0) then
			var_5_6:AnimateSequence("MapHeader")
		end

		var_5_8:AnimateSequence("MapHeader")
		var_5_10:AnimateSequence("MapHeader")
		var_5_12:AnimateSequence("MapHeader")
	end

	var_5_0._sequences.MapHeader = var_5_22

	local var_5_23

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		local var_5_24 = {
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

		var_5_5:RegisterAnimationSequence("MapDefault", var_5_24)
	end

	if not CONDITIONS.IsLaunchChunk(var_5_0) then
		local var_5_25 = {
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

		var_5_6:RegisterAnimationSequence("MapDefault", var_5_25)
	end

	local var_5_26 = {
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

	var_5_8:RegisterAnimationSequence("MapDefault", var_5_26)

	local var_5_27 = {
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

	var_5_10:RegisterAnimationSequence("MapDefault", var_5_27)

	local var_5_28 = {
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

	var_5_12:RegisterAnimationSequence("MapDefault", var_5_28)

	local function var_5_29()
		if not CONDITIONS.IsLaunchChunk(var_5_0) then
			var_5_5:AnimateSequence("MapDefault")
		end

		if not CONDITIONS.IsLaunchChunk(var_5_0) then
			var_5_6:AnimateSequence("MapDefault")
		end

		var_5_8:AnimateSequence("MapDefault")
		var_5_10:AnimateSequence("MapDefault")
		var_5_12:AnimateSequence("MapDefault")
	end

	var_5_0._sequences.MapDefault = var_5_29

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LobbyMap", LobbyMap)
LockTable(_M)
