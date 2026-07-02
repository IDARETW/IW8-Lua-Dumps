module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.RoleIcon then
		if arg_1_2 and #arg_1_2 > 0 then
			arg_1_0.RoleIcon:SetAlpha(1)
			arg_1_0.RoleIcon:setImage(RegisterMaterial(arg_1_2))
		else
			arg_1_0.RoleIcon:SetAlpha(0)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		local var_3_0 = arg_2_0:GetDataSource().gamertag:GetValue(arg_2_1)
		local var_3_1 = arg_2_0:GetDataSource().gamertagWithHash:GetValue(arg_2_1)

		if var_3_1 and #var_3_1 > 0 and CONDITIONS.IsDisplayNameTag() and Engine.DDHAAEGIEI(arg_2_1) then
			var_3_0 = var_3_1
		end

		arg_2_0.Gamertag:setText(var_3_0)
	end

	arg_2_0.Gamertag:SubscribeToModelThroughElement(arg_2_0, "gamertag", var_2_0)
end

local function var_0_2(arg_4_0, arg_4_1)
	local function var_4_0()
		local var_5_0 = arg_4_0:GetDataSource()

		if var_5_0 then
			local var_5_1 = var_5_0.emblem:GetValue(arg_4_1)

			if var_5_1 ~= nil then
				if #var_5_1 > 0 then
					arg_4_0.Emblem:setImage(RegisterMaterial(var_5_1), 0)
				else
					local var_5_2 = var_5_0.emblemIndex and var_5_0.emblemIndex:GetValue(arg_4_1) or -1

					DebugPrint("LobbyGamertagPlayer: Failed to find emblem image for emblemIndex " .. tostring(var_5_2))
				end
			end
		end
	end

	arg_4_0.Emblem:SubscribeToModelThroughElement(arg_4_0, "emblem", var_4_0)
end

local function var_0_3(arg_6_0, arg_6_1)
	CLANS.DisplayClanMemberStatus(arg_6_0.Clan, arg_6_0.RoleIcon, arg_6_0._controllerIndex, arg_6_1)
end

local function var_0_4(arg_7_0)
	CLANS.DisplayClanMemberStatus(arg_7_0.Clan, arg_7_0.RoleIcon, arg_7_0._controllerIndex, nil)
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.UpdateRoleIcon = var_0_0
	arg_8_0.SetClanMemberStatus = var_0_3
	arg_8_0.ClearClanMemberStatus = var_0_4
	arg_8_0._controllerIndex = arg_8_1

	if arg_8_2.matchmadeTeam == "friendly" then
		ACTIONS.AnimateSequence(arg_8_0, "Friendly")
	elseif arg_8_2.matchmadeTeam == "enemy" then
		ACTIONS.AnimateSequence(arg_8_0, "Enemy")
	end

	arg_8_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_8_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

	local function var_8_0()
		local var_9_0 = arg_8_0:GetDataSource().usingGamepad:GetValue(arg_8_1)

		if var_9_0 ~= nil then
			if var_9_0 then
				arg_8_0.InputMethod:setImage(arg_8_0._GPDImg)
			else
				arg_8_0.InputMethod:setImage(arg_8_0._KBMImg)
			end
		end
	end

	arg_8_0.InputMethod:SubscribeToModelThroughElement(arg_8_0, "usingGamepad", var_8_0)

	local function var_8_1()
		local var_10_0 = arg_8_0:GetDataSource().subparty:GetValue(arg_8_1)

		if var_10_0 ~= nil then
			if var_10_0 >= 0 and var_10_0 == Lobby.GetLocalPlayerSubPartyIndex(arg_8_1) then
				arg_8_0.SubPartyIcon:SetAlpha(1)
			else
				arg_8_0.SubPartyIcon:SetAlpha(0)
			end
		end
	end

	arg_8_0.SubPartyIcon:SubscribeToModelThroughElement(arg_8_0, "subparty", var_8_1)

	local function var_8_2()
		local var_11_0 = arg_8_0:GetDataSource().presencePlatform:GetValue(arg_8_1)

		if var_11_0 ~= nil then
			arg_8_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_11_0])
		end
	end

	arg_8_0.SocialPlatformPresence:SubscribeToModelThroughElement(arg_8_0, "presencePlatform", var_8_2)

	local function var_8_3()
		local var_12_0 = arg_8_0:GetDataSource().isMyPlayer:GetValue(arg_8_1)

		if var_12_0 ~= nil then
			arg_8_0.YouIndicatorLeft:SetAlpha(var_12_0 and 1 or 0)
			arg_8_0.Gamertag:SetRGBFromTable(var_12_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
			arg_8_0.Clan:SetRGBFromTable(var_12_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
		end
	end

	arg_8_0.YouIndicatorLeft:SubscribeToModelThroughElement(arg_8_0, "isMyPlayer", var_8_3)

	local function var_8_4()
		local var_13_0 = arg_8_0:GetDataSource().displayRank:GetValue(arg_8_1)

		if var_13_0 ~= nil then
			local var_13_1 = tonumber(var_13_0) or 0
			local var_13_2 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_13_1
			})
			local var_13_3 = PROGRESSION.GetPlayerProgressionData({
				_controllerIndex = arg_8_1
			})
			local var_13_4 = arg_8_0:GetDataSource().isMyPlayer
			local var_13_5 = false

			if var_13_4 then
				var_13_5 = var_13_4:GetValue(arg_8_1)
			end

			if var_13_4 ~= nil and var_13_5 and var_13_3._prestigeMasterLevel ~= PROGRESSION.MASTER_LEVEL.INVALID_LEVEL then
				arg_8_0.Rank:SetRGBFromTable(var_13_3._prestigeMasterColor)
			else
				ACTIONS.AnimateSequence(arg_8_0, var_13_2._isUsingSeasonalRank and "ElderRank" or "StandardRank")
			end
		end
	end

	arg_8_0:SubscribeToModelThroughElement(arg_8_0, "displayRank", var_8_4)
	var_0_1(arg_8_0, arg_8_1)
	var_0_2(arg_8_0, arg_8_1)

	if CONDITIONS.IsClanUIEnabled() then
		local function var_8_5()
			local var_14_0 = arg_8_0:GetDataSource()

			if var_14_0 then
				local var_14_1 = var_14_0.xuid:GetValue(arg_8_1)
				local var_14_2 = CLANS.CLAN_DATA.GetXUIDClanData(arg_8_0._controllerIndex, var_14_1, arg_8_0)

				if var_14_2 then
					arg_8_0:SetClanMemberStatus(var_14_2)
				else
					arg_8_0:ClearClanMemberStatus()
				end
			end
		end

		arg_8_0:SubscribeToModelThroughElement(arg_8_0, "xuid", var_8_5)
	end
end

function LobbyGamertagPlayer(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 130 * _1080p)

	var_15_0.id = "LobbyGamertagPlayer"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0

	var_15_0:setUseStencil(true)

	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "Background"

	var_15_4:SetRGBFromInt(0, 0)
	var_15_4:SetAlpha(0.4, 0)
	var_15_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.Background = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "TextureLayer"

	var_15_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_15_6:SetAlpha(0.1, 0)
	var_15_6:SetPixelGridEnabled(true)
	var_15_6:SetPixelGridContrast(0.8, 0)
	var_15_6:SetPixelGridBlockWidth(2, 0)
	var_15_6:SetPixelGridBlockHeight(2, 0)
	var_15_6:SetPixelGridGutterWidth(1, 0)
	var_15_6:SetPixelGridGutterHeight(1, 0)
	var_15_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_15_0:addElement(var_15_6)

	var_15_0.TextureLayer = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "Gradient"

	var_15_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_15_8:SetAlpha(0, 0)
	var_15_8:SetPixelGridEnabled(true)
	var_15_8:SetPixelGridContrast(0.2, 0)
	var_15_8:SetPixelGridBlockWidth(2, 0)
	var_15_8:SetPixelGridBlockHeight(2, 0)
	var_15_8:SetPixelGridGutterWidth(1, 0)
	var_15_8:SetPixelGridGutterHeight(1, 0)
	var_15_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_15_0:addElement(var_15_8)

	var_15_0.Gradient = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIImage.new()

	var_15_10.id = "PlayerCard"

	var_15_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 99, _1080p * 459, _1080p * 33, _1080p * -7)

	local function var_15_11()
		local var_16_0 = var_15_0:GetDataSource().background:GetValue(var_15_1)

		if var_16_0 ~= nil then
			var_15_10:setImage(RegisterMaterial(var_16_0), 0)
		end
	end

	var_15_10:SubscribeToModelThroughElement(var_15_0, "background", var_15_11)
	var_15_0:addElement(var_15_10)

	var_15_0.PlayerCard = var_15_10

	local var_15_12
	local var_15_13 = LUI.UIImage.new()

	var_15_13.id = "RankIcon"

	var_15_13:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_15_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 460, _1080p * 520, _1080p * -32, _1080p * 28)

	local function var_15_14()
		local var_17_0 = var_15_0:GetDataSource().rankIcon:GetValue(var_15_1)

		if var_17_0 ~= nil then
			var_15_13:setImage(RegisterMaterial(var_17_0), 0)
		end
	end

	var_15_13:SubscribeToModelThroughElement(var_15_0, "rankIcon", var_15_14)
	var_15_0:addElement(var_15_13)

	var_15_0.RankIcon = var_15_13

	local var_15_15
	local var_15_16 = LUI.UIText.new()

	var_15_16.id = "Rank"

	var_15_16:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_15_16:SetAlignment(LUI.Alignment.Center)
	var_15_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 520, _1080p * 28, _1080p * 58)

	local function var_15_17()
		local var_18_0 = var_15_0:GetDataSource().displayRank:GetValue(var_15_1)

		if var_18_0 ~= nil then
			var_15_16:setText(var_18_0, 0)
		end
	end

	var_15_16:SubscribeToModelThroughElement(var_15_0, "displayRank", var_15_17)
	var_15_0:addElement(var_15_16)

	var_15_0.Rank = var_15_16

	local var_15_18
	local var_15_19 = LUI.UIImage.new()

	var_15_19.id = "Emblem"

	var_15_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 98, _1080p * 33, _1080p * 123)
	var_15_0:addElement(var_15_19)

	var_15_0.Emblem = var_15_19

	local var_15_20
	local var_15_21 = LUI.UIStyledText.new()

	var_15_21.id = "Gamertag"

	var_15_21:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_15_21:setText("WWWWWWWWWWWWWWWWW", 0)
	var_15_21:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_15_21:SetWordWrap(false)
	var_15_21:SetAlignment(LUI.Alignment.Left)
	var_15_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 110, _1080p * 365, _1080p * 2, _1080p * 24)
	var_15_0:addElement(var_15_21)

	var_15_0.Gamertag = var_15_21

	local var_15_22
	local var_15_23 = LUI.UIStyledText.new()

	var_15_23.id = "Clan"

	var_15_23:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_15_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_23:SetWordWrap(false)
	var_15_23:SetAlignment(LUI.Alignment.Left)
	var_15_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 99, _1080p * 4, _1080p * 24)

	local function var_15_24()
		local var_19_0 = var_15_0:GetDataSource().clanTag:GetValue(var_15_1)

		if var_19_0 ~= nil then
			var_15_23:setText(var_19_0, 0)
		end
	end

	var_15_23:SubscribeToModelThroughElement(var_15_0, "clanTag", var_15_24)
	var_15_0:addElement(var_15_23)

	var_15_0.Clan = var_15_23

	local var_15_25
	local var_15_26 = LUI.UIImage.new()

	var_15_26.id = "MicIcon"

	var_15_26:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_15_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 488, _1080p * 520, _1080p * -64, _1080p * -32)

	local function var_15_27()
		local var_20_0 = var_15_0:GetDataSource().microphoneAlpha:GetValue(var_15_1)

		if var_20_0 ~= nil then
			var_15_26:SetAlpha(var_20_0, 0)
		end
	end

	var_15_26:SubscribeToModelThroughElement(var_15_0, "microphoneAlpha", var_15_27)

	local function var_15_28()
		local var_21_0 = var_15_0:GetDataSource().microphoneIcon:GetValue(var_15_1)

		if var_21_0 ~= nil then
			var_15_26:setImage(RegisterMaterial(var_21_0), 0)
		end
	end

	var_15_26:SubscribeToModelThroughElement(var_15_0, "microphoneIcon", var_15_28)
	var_15_0:addElement(var_15_26)

	var_15_0.MicIcon = var_15_26

	local var_15_29
	local var_15_30 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_30.id = "HighlightTop"

	var_15_30:SetAlpha(0, 0)
	var_15_30:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 520, 0, _1080p * 2)
	var_15_0:addElement(var_15_30)

	var_15_0.HighlightTop = var_15_30

	local var_15_31
	local var_15_32 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_15_1
	})

	var_15_32.id = "HighlightBottom"

	var_15_32:SetAlpha(0, 0)
	var_15_32:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 520, _1080p * -2, 0)
	var_15_0:addElement(var_15_32)

	var_15_0.HighlightBottom = var_15_32

	local var_15_33
	local var_15_34 = LUI.UIImage.new()

	var_15_34.id = "SubPartyIcon"

	var_15_34:SetRGBFromTable(SWATCHES.BattleNetChat.partyChat, 0)
	var_15_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 5, 0, _1080p * 130)
	var_15_0:addElement(var_15_34)

	var_15_0.SubPartyIcon = var_15_34

	local var_15_35
	local var_15_36 = LUI.UIImage.new()

	var_15_36.id = "RoleIcon"

	var_15_36:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_15_36:SetAlpha(0, 0)
	var_15_36:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 372, _1080p * 401, _1080p * -62, _1080p * -34)
	var_15_0:addElement(var_15_36)

	var_15_0.RoleIcon = var_15_36

	local var_15_37
	local var_15_38 = LUI.UIImage.new()

	var_15_38.id = "InputMethod"

	var_15_38:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_15_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 404, _1080p * 432, _1080p * 3, _1080p * 31)
	var_15_0:addElement(var_15_38)

	var_15_0.InputMethod = var_15_38

	local var_15_39
	local var_15_40 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_15_1
	})

	var_15_40.id = "SocialPlatformPresence"

	var_15_40:SetAlpha(0.75, 0)
	var_15_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 437, _1080p * 459, _1080p * 6, _1080p * 28)
	var_15_0:addElement(var_15_40)

	var_15_0.SocialPlatformPresence = var_15_40

	local var_15_41
	local var_15_42 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_15_1
	})

	var_15_42.id = "YouIndicatorLeft"

	var_15_42:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -75, 0, 0, _1080p * 30)
	var_15_0:addElement(var_15_42)

	var_15_0.YouIndicatorLeft = var_15_42

	local var_15_43
	local var_15_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("DefaultSequence", var_15_44)

	local var_15_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("DefaultSequence", var_15_45)

	local var_15_46 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("DefaultSequence", var_15_46)

	local var_15_47 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("DefaultSequence", var_15_47)

	local var_15_48 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("DefaultSequence", var_15_48)

	local var_15_49 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("DefaultSequence", var_15_49)

	local function var_15_50()
		var_15_10:AnimateSequence("DefaultSequence")
		var_15_13:AnimateSequence("DefaultSequence")
		var_15_16:AnimateSequence("DefaultSequence")
		var_15_19:AnimateSequence("DefaultSequence")
		var_15_21:AnimateSequence("DefaultSequence")
		var_15_23:AnimateSequence("DefaultSequence")
	end

	var_15_0._sequences.DefaultSequence = var_15_50

	local var_15_51
	local var_15_52 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOver", var_15_52)

	local var_15_53 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		},
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOver", var_15_53)

	local var_15_54 = {
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonOver", var_15_54)

	local var_15_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_55)

	local var_15_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("ButtonOver", var_15_56)

	local var_15_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonOver", var_15_57)

	local var_15_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("ButtonOver", var_15_58)

	local var_15_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("ButtonOver", var_15_59)

	local var_15_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("ButtonOver", var_15_60)

	local var_15_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_30:RegisterAnimationSequence("ButtonOver", var_15_61)

	local var_15_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_32:RegisterAnimationSequence("ButtonOver", var_15_62)

	local var_15_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_40:RegisterAnimationSequence("ButtonOver", var_15_63)

	local function var_15_64()
		var_15_4:AnimateSequence("ButtonOver")
		var_15_6:AnimateSequence("ButtonOver")
		var_15_8:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_13:AnimateSequence("ButtonOver")
		var_15_16:AnimateSequence("ButtonOver")
		var_15_19:AnimateSequence("ButtonOver")
		var_15_21:AnimateSequence("ButtonOver")
		var_15_23:AnimateSequence("ButtonOver")
		var_15_30:AnimateSequence("ButtonOver")
		var_15_32:AnimateSequence("ButtonOver")
		var_15_40:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_64

	local var_15_65
	local var_15_66 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUp", var_15_66)

	local var_15_67 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUp", var_15_67)

	local var_15_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("ButtonUp", var_15_68)

	local var_15_69 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_69)

	local var_15_70 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_13:RegisterAnimationSequence("ButtonUp", var_15_70)

	local var_15_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonUp", var_15_71)

	local var_15_72 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_19:RegisterAnimationSequence("ButtonUp", var_15_72)

	local var_15_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_21:RegisterAnimationSequence("ButtonUp", var_15_73)

	local var_15_74 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_23:RegisterAnimationSequence("ButtonUp", var_15_74)

	local var_15_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_30:RegisterAnimationSequence("ButtonUp", var_15_75)

	local var_15_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_32:RegisterAnimationSequence("ButtonUp", var_15_76)

	local var_15_77 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_40:RegisterAnimationSequence("ButtonUp", var_15_77)

	local function var_15_78()
		var_15_4:AnimateSequence("ButtonUp")
		var_15_6:AnimateSequence("ButtonUp")
		var_15_8:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
		var_15_13:AnimateSequence("ButtonUp")
		var_15_16:AnimateSequence("ButtonUp")
		var_15_19:AnimateSequence("ButtonUp")
		var_15_21:AnimateSequence("ButtonUp")
		var_15_23:AnimateSequence("ButtonUp")
		var_15_30:AnimateSequence("ButtonUp")
		var_15_32:AnimateSequence("ButtonUp")
		var_15_40:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_78

	local var_15_79
	local var_15_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.friendlyTeam
		}
	}

	var_15_4:RegisterAnimationSequence("Friendly", var_15_80)

	local function var_15_81()
		var_15_4:AnimateSequence("Friendly")
	end

	var_15_0._sequences.Friendly = var_15_81

	local var_15_82
	local var_15_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_15_4:RegisterAnimationSequence("Enemy", var_15_83)

	local function var_15_84()
		var_15_4:AnimateSequence("Enemy")
	end

	var_15_0._sequences.Enemy = var_15_84

	local var_15_85
	local var_15_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_15_16:RegisterAnimationSequence("ElderRank", var_15_86)

	local function var_15_87()
		var_15_16:AnimateSequence("ElderRank")
	end

	var_15_0._sequences.ElderRank = var_15_87

	local var_15_88
	local var_15_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_15_16:RegisterAnimationSequence("StandardRank", var_15_89)

	local function var_15_90()
		var_15_16:AnimateSequence("StandardRank")
	end

	var_15_0._sequences.StandardRank = var_15_90

	var_0_5(var_15_0, var_15_1, arg_15_1)
	ACTIONS.AnimateSequence(var_15_0, "DefaultSequence")

	return var_15_0
end

MenuBuilder.registerType("LobbyGamertagPlayer", LobbyGamertagPlayer)
LockTable(_M)
