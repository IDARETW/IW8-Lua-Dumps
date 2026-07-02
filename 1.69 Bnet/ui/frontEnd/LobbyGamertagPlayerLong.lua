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
	CLANS.DisplayClanMemberStatus(arg_4_0.Clan, arg_4_0.RoleIcon, arg_4_0._controllerIndex, arg_4_1)
end

local function var_0_3(arg_5_0)
	CLANS.DisplayClanMemberStatus(arg_5_0.Clan, arg_5_0.RoleIcon, arg_5_0._controllerIndex, nil)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.UpdateRoleIcon = var_0_0
	arg_6_0.SetClanMemberStatus = var_0_2
	arg_6_0.ClearClanMemberStatus = var_0_3
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_6_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

	if arg_6_2.matchmadeTeam == "friendly" then
		ACTIONS.AnimateSequence(arg_6_0, "Friendly")
	elseif arg_6_2.matchmadeTeam == "enemy" then
		ACTIONS.AnimateSequence(arg_6_0, "Enemy")
	end

	local function var_6_0()
		local var_7_0 = arg_6_0:GetDataSource().usingGamepad:GetValue(arg_6_1)

		if var_7_0 ~= nil then
			if var_7_0 then
				arg_6_0.InputMethod:setImage(arg_6_0._GPDImg)
			else
				arg_6_0.InputMethod:setImage(arg_6_0._KBMImg)
			end
		end
	end

	arg_6_0.InputMethod:SubscribeToModelThroughElement(arg_6_0, "usingGamepad", var_6_0)

	local function var_6_1()
		local var_8_0 = arg_6_0:GetDataSource().subparty:GetValue(arg_6_1)

		if var_8_0 ~= nil then
			if var_8_0 >= 0 and var_8_0 == Lobby.GetLocalPlayerSubPartyIndex(arg_6_1) then
				arg_6_0.SubPartyIcon:SetAlpha(1)
			else
				arg_6_0.SubPartyIcon:SetAlpha(0)
			end
		end
	end

	arg_6_0.SubPartyIcon:SubscribeToModelThroughElement(arg_6_0, "subparty", var_6_1)

	local function var_6_2()
		local var_9_0 = arg_6_0:GetDataSource().presencePlatform:GetValue(arg_6_1)

		if var_9_0 ~= nil then
			arg_6_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_9_0])
		end
	end

	arg_6_0.SocialPlatformPresence:SubscribeToModelThroughElement(arg_6_0, "presencePlatform", var_6_2)

	local function var_6_3()
		local var_10_0 = arg_6_0:GetDataSource().isMyPlayer:GetValue(arg_6_1)

		if var_10_0 ~= nil then
			arg_6_0.YouIndicatorLeft:SetAlpha(var_10_0 and 1 or 0)
			arg_6_0.Gamertag:SetRGBFromTable(var_10_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
			arg_6_0.Clan:SetRGBFromTable(var_10_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
		end
	end

	arg_6_0.YouIndicatorLeft:SubscribeToModelThroughElement(arg_6_0, "isMyPlayer", var_6_3)

	local function var_6_4()
		local var_11_0 = arg_6_0:GetDataSource().isLobbyHost:GetValue(arg_6_1)

		if var_11_0 ~= nil and arg_6_0.HostIcon then
			arg_6_0.HostIcon:SetAlpha(var_11_0 and 0.5 or 0)
		end
	end

	arg_6_0:SubscribeToModelThroughElement(arg_6_0, "isLobbyHost", var_6_4)

	local function var_6_5()
		local var_12_0 = arg_6_0:GetDataSource().displayRank:GetValue(arg_6_1)

		if var_12_0 ~= nil then
			local var_12_1 = tonumber(var_12_0) or 0
			local var_12_2 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_12_1
			})
			local var_12_3 = PROGRESSION.GetPlayerProgressionData({
				_controllerIndex = arg_6_1
			})
			local var_12_4 = arg_6_0:GetDataSource().isMyPlayer
			local var_12_5 = false

			if var_12_4 then
				var_12_5 = var_12_4:GetValue(arg_6_1)
			end

			if var_12_4 ~= nil and var_12_5 and var_12_3._prestigeMasterLevel ~= PROGRESSION.MASTER_LEVEL.INVALID_LEVEL then
				arg_6_0.Rank:SetRGBFromTable(var_12_3._prestigeMasterColor)
			else
				ACTIONS.AnimateSequence(arg_6_0, var_12_2._isUsingSeasonalRank and "ElderRank" or "StandardRank")
			end
		end
	end

	arg_6_0:SubscribeToModelThroughElement(arg_6_0, "displayRank", var_6_5)
	var_0_1(arg_6_0, arg_6_1)

	if IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_6_0, "KORZH")
	end

	if CONDITIONS.IsClanUIEnabled() then
		local function var_6_6()
			local var_13_0 = arg_6_0:GetDataSource()

			if var_13_0 then
				local var_13_1 = var_13_0.xuid:GetValue(arg_6_1)
				local var_13_2 = CLANS.CLAN_DATA.GetXUIDClanData(arg_6_0._controllerIndex, var_13_1, arg_6_0)

				if var_13_2 then
					arg_6_0:SetClanMemberStatus(var_13_2)
				else
					arg_6_0:ClearClanMemberStatus()
				end
			end
		end

		arg_6_0:SubscribeToModelThroughElement(arg_6_0, "xuid", var_6_6)
	end
end

function LobbyGamertagPlayerLong(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 545 * _1080p, 0, 40 * _1080p)

	var_14_0.id = "LobbyGamertagPlayerLong"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0

	var_14_0:setUseStencil(true)

	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "Backer"

	var_14_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_14_4:SetAlpha(0.3, 0)
	var_14_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 465, 0, 0)
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
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 465, 0, 0)
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
	var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * -72, _1080p * -7, _1080p * 7)
	var_14_0:addElement(var_14_8)

	var_14_0.Glow = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIImage.new()

	var_14_10.id = "Line"

	var_14_10:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_14_10:SetAlpha(0, 0)
	var_14_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_14_0:addElement(var_14_10)

	var_14_0.Line = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIImage.new()

	var_14_12.id = "TeamColor"

	var_14_12:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_14_12:SetAlpha(0, 0)
	var_14_12:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_14_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -1, _1080p * 465, 0, 0)
	var_14_0:addElement(var_14_12)

	var_14_0.TeamColor = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIStyledText.new()

	var_14_14.id = "Gamertag"

	var_14_14:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_14_14:setText("WWWWWWWWWWWWWWWWW", 0)
	var_14_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_14_14:SetWordWrap(false)
	var_14_14:SetAlignment(LUI.Alignment.Left)
	var_14_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_14_14:SetStartupDelay(1000)
	var_14_14:SetLineHoldTime(400)
	var_14_14:SetAnimMoveTime(150)
	var_14_14:SetAnimMoveSpeed(50)
	var_14_14:SetEndDelay(1000)
	var_14_14:SetCrossfadeTime(400)
	var_14_14:SetFadeInTime(300)
	var_14_14:SetFadeOutTime(300)
	var_14_14:SetMaxVisibleLines(1)
	var_14_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 170, _1080p * 368, _1080p * -12, _1080p * 10)
	var_14_0:addElement(var_14_14)

	var_14_0.Gamertag = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIImage.new()

	var_14_16.id = "RankIcon"

	var_14_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 65, _1080p * 93, _1080p * -14, _1080p * 14)

	local function var_14_17()
		local var_15_0 = var_14_0:GetDataSource().rankIcon:GetValue(var_14_1)

		if var_15_0 ~= nil then
			var_14_16:setImage(RegisterMaterial(var_15_0), 0)
		end
	end

	var_14_16:SubscribeToModelThroughElement(var_14_0, "rankIcon", var_14_17)
	var_14_0:addElement(var_14_16)

	var_14_0.RankIcon = var_14_16

	local var_14_18
	local var_14_19 = LUI.UIImage.new()

	var_14_19.id = "RoleIcon"

	var_14_19:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_19:SetAlpha(0, 0)
	var_14_19:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 371, _1080p * 399, _1080p * -15, _1080p * 13)
	var_14_0:addElement(var_14_19)

	var_14_0.RoleIcon = var_14_19

	local var_14_20
	local var_14_21 = LUI.UIText.new()

	var_14_21.id = "Rank"

	var_14_21:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_14_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_21:SetWordWrap(false)
	var_14_21:SetAlignment(LUI.Alignment.Right)
	var_14_21:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 64, _1080p * -12, _1080p * 12)

	local function var_14_22()
		local var_16_0 = var_14_0:GetDataSource().displayRank:GetValue(var_14_1)

		if var_16_0 ~= nil then
			var_14_21:setText(var_16_0, 0)
		end
	end

	var_14_21:SubscribeToModelThroughElement(var_14_0, "displayRank", var_14_22)
	var_14_0:addElement(var_14_21)

	var_14_0.Rank = var_14_21

	local var_14_23
	local var_14_24 = LUI.UIStyledText.new()

	var_14_24.id = "Clan"

	var_14_24:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_14_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_14_24:SetWordWrap(false)
	var_14_24:SetAlignment(LUI.Alignment.Left)
	var_14_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 93, _1080p * 157, _1080p * -9, _1080p * 9)

	local function var_14_25()
		local var_17_0 = var_14_0:GetDataSource().clanTag:GetValue(var_14_1)

		if var_17_0 ~= nil then
			var_14_24:setText(var_17_0, 0)
		end
	end

	var_14_24:SubscribeToModelThroughElement(var_14_0, "clanTag", var_14_25)
	var_14_0:addElement(var_14_24)

	var_14_0.Clan = var_14_24

	local var_14_26
	local var_14_27 = LUI.UIImage.new()

	var_14_27.id = "MicIcon"

	var_14_27:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 3, _1080p * 35, _1080p * -16, _1080p * 16)

	local function var_14_28()
		local var_18_0 = var_14_0:GetDataSource().microphoneAlpha:GetValue(var_14_1)

		if var_18_0 ~= nil then
			var_14_27:SetAlpha(var_18_0, 0)
		end
	end

	var_14_27:SubscribeToModelThroughElement(var_14_0, "microphoneAlpha", var_14_28)

	local function var_14_29()
		local var_19_0 = var_14_0:GetDataSource().microphoneIcon:GetValue(var_14_1)

		if var_19_0 ~= nil then
			var_14_27:setImage(RegisterMaterial(var_19_0), 0)
		end
	end

	var_14_27:SubscribeToModelThroughElement(var_14_0, "microphoneIcon", var_14_29)
	var_14_0:addElement(var_14_27)

	var_14_0.MicIcon = var_14_27

	local var_14_30
	local var_14_31 = LUI.UIImage.new()

	var_14_31.id = "SubPartyIcon"

	var_14_31:SetRGBFromTable(SWATCHES.BattleNetChat.partyChat, 0)
	var_14_31:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 5, _1080p * -20, _1080p * 20)
	var_14_0:addElement(var_14_31)

	var_14_0.SubPartyIcon = var_14_31

	local var_14_32
	local var_14_33 = LUI.UIImage.new()

	var_14_33.id = "InputMethod"

	var_14_33:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_33:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 402, _1080p * 430, _1080p * -15, _1080p * 13)
	var_14_0:addElement(var_14_33)

	var_14_0.InputMethod = var_14_33

	local var_14_34
	local var_14_35 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_14_1
	})

	var_14_35.id = "SocialPlatformPresence"

	var_14_35:SetAlpha(0.75, 0)
	var_14_35:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 434, _1080p * 456, _1080p * -12, _1080p * 10)
	var_14_0:addElement(var_14_35)

	var_14_0.SocialPlatformPresence = var_14_35

	local var_14_36
	local var_14_37 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_14_1
	})

	var_14_37.id = "YouIndicatorLeft"

	var_14_37:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -75, 0, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_37)

	var_14_0.YouIndicatorLeft = var_14_37

	local var_14_38
	local var_14_39 = LUI.UIImage.new()

	var_14_39.id = "HostIcon"

	var_14_39:SetRGBFromInt(0, 0)
	var_14_39:SetAlpha(0, 0)
	var_14_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 463, _1080p * 465, _1080p * 41, _1080p * 43)
	var_14_0:addElement(var_14_39)

	var_14_0.HostIcon = var_14_39

	local var_14_40
	local var_14_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("DefaultSequence", var_14_41)

	local var_14_42 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("DefaultSequence", var_14_42)

	local var_14_43 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("DefaultSequence", var_14_43)

	local var_14_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("DefaultSequence", var_14_44)

	local function var_14_45()
		var_14_14:AnimateSequence("DefaultSequence")
		var_14_16:AnimateSequence("DefaultSequence")
		var_14_21:AnimateSequence("DefaultSequence")
		var_14_24:AnimateSequence("DefaultSequence")
	end

	var_14_0._sequences.DefaultSequence = var_14_45

	local var_14_46
	local var_14_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonOver", var_14_47)

	local var_14_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.backgroundFocus
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_48)

	local var_14_49 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_49)

	local var_14_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
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
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 465
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_50)

	local var_14_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonOver", var_14_51)

	local var_14_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonOver", var_14_52)

	local var_14_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("ButtonOver", var_14_53)

	local var_14_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOver", var_14_54)

	local var_14_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_35:RegisterAnimationSequence("ButtonOver", var_14_55)

	local function var_14_56()
		var_14_4:AnimateSequence("ButtonOver")
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_14:AnimateSequence("ButtonOver")
		var_14_16:AnimateSequence("ButtonOver")
		var_14_21:AnimateSequence("ButtonOver")
		var_14_24:AnimateSequence("ButtonOver")
		var_14_35:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_56

	local var_14_57
	local var_14_58 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonUp", var_14_58)

	local var_14_59 = {
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

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_59)

	local var_14_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUp", var_14_60)

	local var_14_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_61)

	local var_14_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_14:RegisterAnimationSequence("ButtonUp", var_14_62)

	local var_14_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonUp", var_14_63)

	local var_14_64 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_21:RegisterAnimationSequence("ButtonUp", var_14_64)

	local var_14_65 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUp", var_14_65)

	local var_14_66 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_35:RegisterAnimationSequence("ButtonUp", var_14_66)

	local function var_14_67()
		var_14_4:AnimateSequence("ButtonUp")
		var_14_6:AnimateSequence("ButtonUp")
		var_14_8:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_14:AnimateSequence("ButtonUp")
		var_14_16:AnimateSequence("ButtonUp")
		var_14_21:AnimateSequence("ButtonUp")
		var_14_24:AnimateSequence("ButtonUp")
		var_14_35:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_67

	local var_14_68
	local var_14_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.enemyTeam
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("Enemy", var_14_69)

	local function var_14_70()
		var_14_12:AnimateSequence("Enemy")
	end

	var_14_0._sequences.Enemy = var_14_70

	local var_14_71
	local var_14_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.friendlyTeam
		},
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_12:RegisterAnimationSequence("Friendly", var_14_72)

	local function var_14_73()
		var_14_12:AnimateSequence("Friendly")
	end

	var_14_0._sequences.Friendly = var_14_73

	local var_14_74
	local var_14_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_14_21:RegisterAnimationSequence("ElderRank", var_14_75)

	local function var_14_76()
		var_14_21:AnimateSequence("ElderRank")
	end

	var_14_0._sequences.ElderRank = var_14_76

	local var_14_77
	local var_14_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_14_21:RegisterAnimationSequence("StandardRank", var_14_78)

	local function var_14_79()
		var_14_21:AnimateSequence("StandardRank")
	end

	var_14_0._sequences.StandardRank = var_14_79

	local var_14_80
	local var_14_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_14_24:RegisterAnimationSequence("KORZH", var_14_81)

	local function var_14_82()
		var_14_24:AnimateSequence("KORZH")
	end

	var_14_0._sequences.KORZH = var_14_82

	var_0_4(var_14_0, var_14_1, arg_14_1)
	ACTIONS.AnimateSequence(var_14_0, "DefaultSequence")

	return var_14_0
end

MenuBuilder.registerType("LobbyGamertagPlayerLong", LobbyGamertagPlayerLong)
LockTable(_M)
