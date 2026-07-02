module(..., package.seeall)

local var_0_0 = 30000

local function var_0_1(arg_1_0)
	arg_1_0._showHorizontalSpinner = false

	arg_1_0.Spinner:SetAlpha(0)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.HideHorizontalSpinner = var_0_1
	arg_2_0._showHorizontalSpinner = true

	local function var_2_0()
		if Engine.CIEGIACHAE() and not Engine.FIDIEBFAG(arg_2_1) and DataSources.frontEnd.lobby.memberMaxCount:GetValue(arg_2_1) > Dvar.CFHDGABACF("MTTRPNMPRP") then
			local var_3_0 = CONDITIONS.IsMagmaGameMode() and "BRPublicLobby" or "MPPublicLobby"
			local var_3_1 = LUI.FlowManager.GetScopedData(var_3_0)

			if var_3_1 and var_3_1.matchmakingStartTime and not var_3_1.crossplayRecommendedReminderShown and Engine.BFBIDEGDFB() - var_3_1.matchmakingStartTime >= var_0_0 then
				local var_3_2, var_3_3 = Lobby.BGIBDIBHH()

				if var_3_2 and var_3_3 and var_3_2 ~= Lobby.PartyState.STARTING then
					local var_3_4 = {
						crossplayRecommendedReminder = true,
						controllerIndex = arg_2_1,
						onAccept = function()
							return
						end
					}

					LUI.FlowManager.RequestPopupMenu(nil, "LPCEnableCrossplayPopup", true, arg_2_1, false, var_3_4)

					var_3_1.crossplayRecommendedReminderShown = true
				end
			end
		end
	end

	local function var_2_1()
		if Tournament.BBAFFAGGHC(arg_2_1) and not Engine.DAFGFCFHJI() then
			if Tournament.BAEACBHFGF() then
				arg_2_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WAITING_FOR_MATCHMAKING"))
				arg_2_0.TournamentCountdownTime:SetAlpha(0)
				arg_2_0.Spinner:SetAlpha(1)
			else
				arg_2_0.Text:setText(Engine.CBBHFCGDIC("TOURNAMENT/MATCHMAKING_STARTS_IN"))
				arg_2_0.TournamentCountdownTime:setEndTime(Tournament.ECBAACCCDH())
				arg_2_0.TournamentCountdownTime:SetAlpha(1)
				arg_2_0.Spinner:SetAlpha(0)
			end
		else
			arg_2_0.TournamentCountdownTime:SetAlpha(0)

			local var_5_0 = Lobby.GetStatusString(arg_2_1)

			if var_5_0 then
				arg_2_0.Text:setText(var_5_0)

				local var_5_1 = #var_5_0 > 0 and not CONDITIONS.IsLaunchChunk() and arg_2_0._showHorizontalSpinner

				arg_2_0.Spinner:SetAlpha(var_5_1 and 1 or 0)
			else
				arg_2_0.Text:setText("")
				arg_2_0.Spinner:SetAlpha(0)
			end

			if Engine.CIEGIACHAE() and Engine.DAFGFCFHJI() then
				var_2_0()
			end
		end
	end

	local var_2_2 = LUI.UITimer.new({
		interval = 500,
		event = "update_lobby_status"
	})

	var_2_2.id = "lobbyStatusTimer"

	arg_2_0:addElement(var_2_2)
	arg_2_0:registerEventHandler("update_lobby_status", var_2_1)
	var_2_1()

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function LobbyMembersFooter(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 150 * _1080p)

	var_6_0.id = "LobbyMembersFooter"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "Text"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_4:setText("", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_4:SetWordWrap(false)
	var_6_4:SetAlignment(LUI.Alignment.Center)
	var_6_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -12, _1080p * 12)
	var_6_0:addElement(var_6_4)

	var_6_0.Text = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Spinner"

	var_6_6:setImage(RegisterMaterial("spinner_loading"), 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 93, _1080p * 103)
	var_6_0:addElement(var_6_6)

	var_6_0.Spinner = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("UICountdown", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "TournamentCountdownTime"

	var_6_8:SetRGBFromTable(SWATCHES.fieldOrders.highlight, 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:setEndTime(0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -100, _1080p * 100, _1080p * -61, _1080p * -37)
	var_6_0:addElement(var_6_8)

	var_6_0.TournamentCountdownTime = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "SpinnerRound"

	var_6_10:SetAlpha(0, 0)
	var_6_10:setImage(RegisterMaterial("icon_spinner"), 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * -902, _1080p * -27, _1080p * 31)
	var_6_0:addElement(var_6_10)

	var_6_0.SpinnerRound = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.frame
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		}
	}

	var_6_4:RegisterAnimationSequence("LoadingSpinner", var_6_13)

	local var_6_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("LoadingSpinner", var_6_14)

	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -17
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -90,
			duration = 600,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -180,
			duration = 400,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -260,
			duration = 420,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -360,
			duration = 580,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_6_10:RegisterAnimationSequence("LoadingSpinner", var_6_15)

	local function var_6_16()
		var_6_4:AnimateLoop("LoadingSpinner")
		var_6_6:AnimateLoop("LoadingSpinner")
		var_6_10:AnimateLoop("LoadingSpinner")
	end

	var_6_0._sequences.LoadingSpinner = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipSetup", var_6_18)

	local var_6_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_19)

	local function var_6_20()
		var_6_4:AnimateSequence("WZWipSetup")
		var_6_8:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_20

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LobbyMembersFooter", LobbyMembersFooter)
LockTable(_M)
