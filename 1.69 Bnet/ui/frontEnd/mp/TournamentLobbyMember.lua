module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.Gamertag)
	local var_1_1 = 8 * _1080p
	local var_1_2 = var_1_0 / 2 + var_1_1
	local var_1_3 = var_1_2 * -1
	local var_1_4 = 0

	if arg_1_1 then
		var_1_4 = LAYOUT.GetElementWidth(arg_1_0.PlatformPresence)

		arg_1_0.PlatformPresence:SetLeft(var_1_2)
		arg_1_0.PlatformPresence:SetRight(var_1_2 + var_1_4)
	end

	local var_1_5 = LAYOUT.GetElementWidth(arg_1_0.MicIcon)

	arg_1_0.MicIcon:SetLeft(var_1_2 + var_1_4)
	arg_1_0.MicIcon:SetRight(var_1_2 + var_1_4 + var_1_5)

	local var_1_6 = LAYOUT.GetElementWidth(arg_1_0.RankIcon)

	arg_1_0.RankIcon:SetRight(var_1_3)
	arg_1_0.RankIcon:SetLeft(var_1_3 - var_1_6)
	arg_1_0.Rank:SetRight(var_1_3 - var_1_6)
	arg_1_0.Rank:SetLeft(var_1_3 - var_1_6 - 50 * _1080p)
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		local var_3_0 = arg_2_0:GetDataSource().name:GetValue(arg_2_1)

		if var_3_0 and #var_3_0 > 0 then
			arg_2_0.Gamertag:setText(var_3_0)
			arg_2_0:SetAlpha(1)
		else
			arg_2_0:SetAlpha(0)
		end

		var_0_0(arg_2_0, true)
	end

	arg_2_0.Gamertag:SubscribeToDataSourceThroughElement(arg_2_0, "name", var_2_0)

	local function var_2_1()
		local var_4_0 = arg_2_0:GetDataSource().rankIcon:GetValue(arg_2_1)

		if var_4_0 ~= nil then
			arg_2_0.RankIcon:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	arg_2_0.RankIcon:SubscribeToModelThroughElement(arg_2_0, "rankIcon", var_2_1)

	local function var_2_2()
		local var_5_0 = arg_2_0:GetDataSource().displayRank:GetValue(arg_2_1)

		if var_5_0 ~= nil then
			arg_2_0.Rank:setText(var_5_0, 0)
			ACTIONS.AnimateSequence(arg_2_0, PROGRESSION.GetPlayerIsInSeasonalProgression(arg_2_1) and "ElderRank" or "StandardRank")
		end
	end

	arg_2_0.Rank:SubscribeToModelThroughElement(arg_2_0, "displayRank", var_2_2)

	local function var_2_3()
		local var_6_0 = arg_2_0:GetDataSource().localPlayerIndex:GetValue(arg_2_1)

		if var_6_0 ~= nil and var_6_0 == 0 then
			ACTIONS.AnimateSequence(arg_2_0, "MyPlayer")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NotMyPlayer")
		end
	end

	arg_2_0.Gamertag:SubscribeToModelThroughElement(arg_2_0, "localPlayerIndex", var_2_3)

	local function var_2_4()
		local var_7_0 = arg_2_0:GetDataSource().microphoneAlpha:GetValue(arg_2_1)

		if var_7_0 ~= nil then
			arg_2_0.MicIcon:SetAlpha(var_7_0)
		end
	end

	arg_2_0.MicIcon:SubscribeToModelThroughElement(arg_2_0, "microphoneAlpha", var_2_4)

	local function var_2_5()
		local var_8_0 = arg_2_0:GetDataSource().microphoneIcon:GetValue(arg_2_1)

		if var_8_0 ~= nil then
			arg_2_0.MicIcon:setImage(RegisterMaterial(var_8_0))
		end
	end

	arg_2_0.MicIcon:SubscribeToModelThroughElement(arg_2_0, "microphoneIcon", var_2_5)

	local function var_2_6()
		local var_9_0 = arg_2_0:GetDataSource().presencePlatform:GetValue(arg_2_1)

		if var_9_0 ~= nil then
			arg_2_0.PlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_9_0])
			arg_2_0.PlatformPresence:SetAlpha(1)
		end
	end

	arg_2_0.PlatformPresence:SubscribeToModelThroughElement(arg_2_0, "presencePlatform", var_2_6)

	local function var_2_7()
		local var_10_0 = arg_2_0:GetDataSource().presencePlatform:GetValue(arg_2_1)

		arg_2_0:SetButtonDisabled(not var_10_0)
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "isInParty", var_2_7)
end

local function var_0_2(arg_11_0, arg_11_1)
	arg_11_0._teamIndex = arg_11_1
end

local function var_0_3(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_0.Gamertag)
	arg_12_0.Gamertag:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	arg_12_0.Gamertag:SetFontSize(22 * _1080p)

	arg_12_0.Setup = Setup
	arg_12_0.SetTeamIndex = var_0_2
	arg_12_0.SetupDatasourceSubscriptions = var_0_1

	arg_12_0.MicIcon:SetAlpha(0)
	arg_12_0.PartyLeader:SetAlpha(0)
	arg_12_0.PlatformPresence:SetAlpha(0)

	local function var_12_0(arg_13_0, arg_13_1)
		assert(arg_12_1)

		local var_13_0 = arg_13_0:GetDataSource()
		local var_13_1 = var_13_0.xuid:GetValue(arg_12_1)

		if var_13_0.isInParty:GetValue(arg_12_1) and var_13_1 then
			local var_13_2 = Friends.CAIJHBHGGC(var_13_1)
			local var_13_3 = var_13_0.isCrossplayPlayer:GetValue(arg_12_1)

			LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberActions", true, arg_12_1, false, {
				xuid = var_13_2,
				isCrossplayPlayer = var_13_3
			})
		end
	end

	arg_12_0:registerEventHandler("button_action", var_12_0)
end

function TournamentLobbyMember(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 290 * _1080p, 0, 34 * _1080p)

	var_14_0.id = "TournamentLobbyMember"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Backer"

	var_14_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_14_4:SetAlpha(0.3, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.Backer = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "TextureLayer"

	var_14_6:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_14_6:SetAlpha(0.1, 0)
	var_14_6:SetPixelGridEnabled(true)
	var_14_6:SetPixelGridContrast(0.8, 0)
	var_14_6:SetPixelGridBlockWidth(2, 0)
	var_14_6:SetPixelGridBlockHeight(2, 0)
	var_14_6:SetPixelGridGutterWidth(1, 0)
	var_14_6:SetPixelGridGutterHeight(1, 0)
	var_14_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_14_0:addElement(var_14_6)

	var_14_0.TextureLayer = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "Glow"

	var_14_8:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:SetPixelGridEnabled(true)
	var_14_8:SetPixelGridContrast(0.5, 0)
	var_14_8:SetPixelGridBlockWidth(2, 0)
	var_14_8:SetPixelGridBlockHeight(2, 0)
	var_14_8:SetPixelGridGutterWidth(1, 0)
	var_14_8:SetPixelGridGutterHeight(1, 0)
	var_14_8:setImage(RegisterMaterial("button_glow"), 0)
	var_14_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * 8, _1080p * -7, _1080p * 7)
	var_14_0:addElement(var_14_8)

	var_14_0.Glow = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIStyledText.new()

	var_14_10.id = "Gamertag"

	var_14_10:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_10:setText("", 0)
	var_14_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_10:SetWordWrap(false)
	var_14_10:SetAlignment(LUI.Alignment.Center)
	var_14_10:SetShadowMinDistance(-0.2, 0)
	var_14_10:SetShadowMaxDistance(0.2, 0)
	var_14_10:SetShadowUOffset(-0.002, 0)
	var_14_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_14_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -135, _1080p * 135, _1080p * -11, _1080p * 11)
	var_14_0:addElement(var_14_10)

	var_14_0.Gamertag = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "MicIcon"

	var_14_12:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_12:setImage(RegisterMaterial("icon_mic_talking"), 0)
	var_14_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 98, _1080p * 128, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_12)

	var_14_0.MicIcon = var_14_12

	local var_14_13
	local var_14_14 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_14_1
	})

	var_14_14.id = "PlatformPresence"

	var_14_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 76, _1080p * 98, _1080p * -11, _1080p * 11)
	var_14_0:addElement(var_14_14)

	var_14_0.PlatformPresence = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIImage.new()

	var_14_16.id = "RankIcon"

	var_14_16:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_16:setImage(RegisterMaterial("icon_rank_sm_01"), 0)
	var_14_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -74, _1080p * -44, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_16)

	var_14_0.RankIcon = var_14_16

	local var_14_17
	local var_14_18 = LUI.UIStyledText.new()

	var_14_18.id = "Rank"

	var_14_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_18:setText("", 0)
	var_14_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_18:SetWordWrap(false)
	var_14_18:SetAlignment(LUI.Alignment.Right)
	var_14_18:SetShadowMinDistance(-0.2, 0)
	var_14_18:SetShadowMaxDistance(0.2, 0)
	var_14_18:SetShadowUOffset(-0.002, 0)
	var_14_18:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_14_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -115, _1080p * -77, _1080p * -10, _1080p * 10)
	var_14_0:addElement(var_14_18)

	var_14_0.Rank = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIImage.new()

	var_14_20.id = "PartyLeader"

	var_14_20:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_14_20:SetAlpha(0, 0)
	var_14_20:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_14_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 12, _1080p * -43, _1080p * -21)
	var_14_0:addElement(var_14_20)

	var_14_0.PartyLeader = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIImage.new()

	var_14_22.id = "Line"

	var_14_22:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_14_22:SetAlpha(0, 0)
	var_14_22:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_14_0:addElement(var_14_22)

	var_14_0.Line = var_14_22

	local function var_14_23()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_23

	local var_14_24
	local var_14_25 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_25)

	local var_14_26 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 7
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_26)

	local var_14_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOver", var_14_27)

	local var_14_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOver", var_14_28)

	local function var_14_29()
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_18:AnimateSequence("ButtonOver")
		var_14_22:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_29

	local var_14_30
	local var_14_31 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.background
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonUp", var_14_31)

	local var_14_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_32)

	local var_14_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeam
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUp", var_14_33)

	local var_14_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUp", var_14_34)

	local var_14_35 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUp", var_14_35)

	local var_14_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUp", var_14_36)

	local function var_14_37()
		var_14_4:AnimateSequence("ButtonUp")
		var_14_6:AnimateSequence("ButtonUp")
		var_14_8:AnimateSequence("ButtonUp")
		var_14_12:AnimateSequence("ButtonUp")
		var_14_14:AnimateSequence("ButtonUp")
		var_14_22:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_37

	local var_14_38
	local var_14_39 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_39)

	local var_14_40 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundDisabledFocus
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOverDisabled", var_14_40)

	local var_14_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOverDisabled", var_14_41)

	local var_14_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonOverDisabled", var_14_42)

	local var_14_43 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOverDisabled", var_14_43)

	local function var_14_44()
		var_14_6:AnimateSequence("ButtonOverDisabled")
		var_14_8:AnimateSequence("ButtonOverDisabled")
		var_14_12:AnimateSequence("ButtonOverDisabled")
		var_14_14:AnimateSequence("ButtonOverDisabled")
		var_14_22:AnimateSequence("ButtonOverDisabled")
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_44

	local var_14_45
	local var_14_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_10:RegisterAnimationSequence("MyPlayer", var_14_46)

	local function var_14_47()
		var_14_10:AnimateSequence("MyPlayer")
	end

	var_14_0._sequences.MyPlayer = var_14_47

	local var_14_48
	local var_14_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_14_10:RegisterAnimationSequence("NotMyPlayer", var_14_49)

	local function var_14_50()
		var_14_10:AnimateSequence("NotMyPlayer")
	end

	var_14_0._sequences.NotMyPlayer = var_14_50

	local var_14_51
	local var_14_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_14_18:RegisterAnimationSequence("ElderRank", var_14_52)

	local function var_14_53()
		var_14_18:AnimateSequence("ElderRank")
	end

	var_14_0._sequences.ElderRank = var_14_53

	local var_14_54
	local var_14_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_14_18:RegisterAnimationSequence("StandardRank", var_14_55)

	local function var_14_56()
		var_14_18:AnimateSequence("StandardRank")
	end

	var_14_0._sequences.StandardRank = var_14_56

	var_14_0:addEventHandler("button_over", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonOver")
	end)
	var_14_0:addEventHandler("button_up", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonUp")
	end)
	var_14_0:addEventHandler("button_over_disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonOverDisabled")
	end)
	var_14_0:addEventHandler("button_disable", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonUp")
	end)
	var_0_3(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("TournamentLobbyMember", TournamentLobbyMember)
LockTable(_M)
