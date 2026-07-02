module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._playerData
	local var_1_1 = var_1_0.xuid
	local var_1_2 = var_1_0.platformId
	local var_1_3 = var_1_0.isCrossplayPlayer

	if type(var_1_1) ~= "userdata" then
		var_1_1 = Friends.CAIJHBHGGC(var_1_1)
	end

	if Engine.BAHIIBFDDG() or Engine.BEFACAIFDD() or not Lobby.CHBBHFHJEH(var_1_1) then
		LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberActions", true, arg_1_1, false, {
			isWZPrivateMatch = true,
			xuid = var_1_1,
			platformId = var_1_2,
			isCrossplayPlayer = var_1_3
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._enableButtonAction = type(arg_2_2) == "table" and arg_2_2.enableButtonAction
	arg_2_0._playerData = arg_2_2

	if arg_2_2 and type(arg_2_2) == "number" then
		local var_2_0 = arg_2_2

		arg_2_0.TeamIndex:setText(var_2_0)
		arg_2_0.TeamIndex:SetAlpha(1)

		if SWATCHES.BRSquad["player" .. var_2_0] then
			arg_2_0.TeamIndex:SetRGBFromTable(SWATCHES.BRSquad["player" .. var_2_0])
		end

		arg_2_0.Gamertag:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/AVAILABLE_SLOT"))
		arg_2_0.Gamertag:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault)
		ACTIONS.AnimateSequence(arg_2_0, "Empty")

		return
	end

	ACTIONS.AnimateSequence(arg_2_0, "Available")

	if arg_2_2.isLobbyHost then
		arg_2_0.HostIcon:SetAlpha(1)
		arg_2_0.TeamIndex:SetAlpha(0)
	else
		arg_2_0.HostIcon:SetAlpha(0)
		arg_2_0.TeamIndex:SetAlpha(1)
	end

	local var_2_1 = arg_2_2.index

	arg_2_0.TeamIndex:setText(var_2_1)

	local var_2_2 = tonumber(arg_2_2.rank) or 0
	local var_2_3 = tonumber(arg_2_2.prestige) or 0
	local var_2_4 = PROGRESSION.ValidatePrestigeLevel(var_2_3, {
		_isBackendPrestigeLevel = true
	})
	local var_2_5 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = var_2_2,
		_prestigeLevel = var_2_4
	})
	local var_2_6 = var_2_5._rank
	local var_2_7 = var_2_5._rankDisplay
	local var_2_8 = var_2_5._rankIcon

	arg_2_0.Rank:setText(var_2_7)
	arg_2_0.RankIcon:setImage(RegisterMaterial(var_2_8))

	local var_2_9 = arg_2_2.clanTag

	arg_2_0.ClanTag:setText(var_2_9)

	local var_2_10 = arg_2_2.microphoneState
	local var_2_11 = Mic.GetIcon(var_2_10)
	local var_2_12 = Mic.GetIconAlpha(var_2_10)

	arg_2_0.MicIcon:SetAlpha(var_2_12)
	arg_2_0.MicIcon:setImage(RegisterMaterial(var_2_11))

	local var_2_13 = arg_2_2.gamertag
	local var_2_14 = arg_2_2.gamertagWithHash

	if var_2_14 and #var_2_14 > 0 and CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_2_1) then
		var_2_13 = var_2_14
	end

	if var_2_13 then
		arg_2_0.Gamertag:setText(var_2_13)
	end

	if arg_2_2.isUsingGamePad then
		arg_2_0.InputMethod:setImage(arg_2_0._GPDImg)
	else
		arg_2_0.InputMethod:setImage(arg_2_0._KBMImg)
	end

	local var_2_15 = arg_2_2.platform

	arg_2_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_2_15])

	if arg_2_2.isMyPlayer then
		arg_2_0.Gamertag:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
		arg_2_0.ClanTag:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
		arg_2_0.Rank:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
		arg_2_0.HostIcon:SetRGBFromTable(SWATCHES.Scoreboard.highlight)
	else
		arg_2_0.Gamertag:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault)
		arg_2_0.ClanTag:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault)
		arg_2_0.Rank:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault)
		arg_2_0.HostIcon:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault)
	end

	if arg_2_0._onFocused and arg_2_0:getParent() and arg_2_0:getParent():getParent() then
		arg_2_0:getParent():getParent():processEvent({
			name = "wz_private_match_player_on_focus",
			playerData = arg_2_0._playerData
		})
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if arg_3_0._enableButtonAction then
			arg_3_0._onFocused = true

			if not arg_4_1.controller then
				local var_4_0 = arg_3_1
			end

			ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")

			if arg_3_0:getParent() and arg_3_0:getParent():getParent() then
				arg_3_0:getParent():getParent():processEvent({
					name = "wz_private_match_player_on_focus",
					playerData = arg_4_0._playerData
				})
			end
		end
	end)
	arg_3_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		if arg_3_0._enableButtonAction then
			arg_3_0._onFocused = false

			if not arg_5_1.controller then
				local var_5_0 = arg_3_1
			end

			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
		end
	end)
	arg_3_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if arg_3_0._enableButtonAction then
			local var_6_0 = arg_6_1.controller or arg_3_1

			var_0_0(arg_6_0, var_6_0)
		end
	end)
end

local function var_0_3(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_7_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")
	arg_7_0.SetupSquadMember = var_0_1

	var_0_2(arg_7_0, arg_7_1)
end

function WarzonePrivateMatchSquadTeamMember(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 38 * _1080p)

	var_8_0.id = "WarzonePrivateMatchSquadTeamMember"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "TextBacker"

	var_8_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_8_4:SetAlpha(0.2, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.TextBacker = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "MicIcon"

	var_8_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, _1080p * -8, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_6)

	var_8_0.MicIcon = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "SocialPlatformPresence"

	var_8_8:SetAlpha(0.75, 0)
	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -56, _1080p * -38, _1080p * 10, _1080p * 28)
	var_8_0:addElement(var_8_8)

	var_8_0.SocialPlatformPresence = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "InputMethod"

	var_8_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -87, _1080p * -63, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_10)

	var_8_0.InputMethod = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "Gamertag"

	var_8_12:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_12:setText("WWWWWWWWWWWWWWWW", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_12:SetUseEllipses(ELLIPSES.enabled_default)
	var_8_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 166, _1080p * 331, _1080p * -8, _1080p * 9)
	var_8_0:addElement(var_8_12)

	var_8_0.Gamertag = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "ClanTag"

	var_8_14:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_14:SetWordWrap(false)
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 98, _1080p * 165, _1080p * -8, _1080p * 9)
	var_8_0:addElement(var_8_14)

	var_8_0.ClanTag = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "RankIcon"

	var_8_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 74, _1080p * 98, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_16)

	var_8_0.RankIcon = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "Rank"

	var_8_18:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_18:setText("", 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_18:SetWordWrap(false)
	var_8_18:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 43, _1080p * 72, _1080p * -9, _1080p * 9)
	var_8_0:addElement(var_8_18)

	var_8_0.Rank = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "HostIcon"

	var_8_20:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_20:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 30, _1080p * -10, _1080p * 10)
	var_8_0:addElement(var_8_20)

	var_8_0.HostIcon = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIImage.new()

	var_8_22.id = "Divider"

	var_8_22:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_22:SetAlpha(0.25, 0)
	var_8_22:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 39, _1080p * 41, _1080p * 2, _1080p * -2)
	var_8_0:addElement(var_8_22)

	var_8_0.Divider = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIText.new()

	var_8_24.id = "TeamIndex"

	var_8_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_24:setText("1", 0)
	var_8_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_24:SetWordWrap(false)
	var_8_24:SetAlignment(LUI.Alignment.Center)
	var_8_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 34, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_24)

	var_8_0.TeamIndex = var_8_24

	local function var_8_25()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("Empty", var_8_27)

	local var_8_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Empty", var_8_28)

	local var_8_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Empty", var_8_29)

	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 195
		}
	}

	var_8_12:RegisterAnimationSequence("Empty", var_8_30)

	local var_8_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Empty", var_8_31)

	local var_8_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Empty", var_8_32)

	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Empty", var_8_33)

	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("Empty", var_8_34)

	local var_8_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("Empty", var_8_35)

	local function var_8_36()
		var_8_6:AnimateSequence("Empty")
		var_8_8:AnimateSequence("Empty")
		var_8_10:AnimateSequence("Empty")
		var_8_12:AnimateSequence("Empty")
		var_8_14:AnimateSequence("Empty")
		var_8_16:AnimateSequence("Empty")
		var_8_18:AnimateSequence("Empty")
		var_8_20:AnimateSequence("Empty")
		var_8_22:AnimateSequence("Empty")
	end

	var_8_0._sequences.Empty = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Available", var_8_38)

	local var_8_39 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Available", var_8_39)

	local var_8_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 331
		}
	}

	var_8_12:RegisterAnimationSequence("Available", var_8_40)

	local var_8_41 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("Available", var_8_41)

	local var_8_42 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("Available", var_8_42)

	local var_8_43 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("Available", var_8_43)

	local var_8_44 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("Available", var_8_44)

	local function var_8_45()
		var_8_8:AnimateSequence("Available")
		var_8_10:AnimateSequence("Available")
		var_8_12:AnimateSequence("Available")
		var_8_14:AnimateSequence("Available")
		var_8_16:AnimateSequence("Available")
		var_8_18:AnimateSequence("Available")
		var_8_22:AnimateSequence("Available")
	end

	var_8_0._sequences.Available = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorNormal
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_47)

	local function var_8_48()
		var_8_4:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_48

	local var_8_49
	local var_8_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_50)

	local function var_8_51()
		var_8_4:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_51

	local var_8_52
	local var_8_53 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("Solo", var_8_53)

	local var_8_54 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("Solo", var_8_54)

	local var_8_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 303
		}
	}

	var_8_12:RegisterAnimationSequence("Solo", var_8_55)

	local var_8_56 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 133
		}
	}

	var_8_14:RegisterAnimationSequence("Solo", var_8_56)

	local var_8_57 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 61
		}
	}

	var_8_16:RegisterAnimationSequence("Solo", var_8_57)

	local var_8_58 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 34
		}
	}

	var_8_18:RegisterAnimationSequence("Solo", var_8_58)

	local var_8_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("Solo", var_8_59)

	local var_8_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_24:RegisterAnimationSequence("Solo", var_8_60)

	local function var_8_61()
		var_8_8:AnimateSequence("Solo")
		var_8_10:AnimateSequence("Solo")
		var_8_12:AnimateSequence("Solo")
		var_8_14:AnimateSequence("Solo")
		var_8_16:AnimateSequence("Solo")
		var_8_18:AnimateSequence("Solo")
		var_8_22:AnimateSequence("Solo")
		var_8_24:AnimateSequence("Solo")
	end

	var_8_0._sequences.Solo = var_8_61

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WarzonePrivateMatchSquadTeamMember", WarzonePrivateMatchSquadTeamMember)
LockTable(_M)
