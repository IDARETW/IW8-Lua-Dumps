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

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateRoleIcon = var_0_0
	arg_2_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_2_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

	if arg_2_2.matchmadeTeam == "friendly" then
		ACTIONS.AnimateSequence(arg_2_0, "Friendly")
	elseif arg_2_2.matchmadeTeam == "enemy" then
		ACTIONS.AnimateSequence(arg_2_0, "Enemy")
	end

	local function var_2_0()
		local var_3_0 = arg_2_0:GetDataSource().usingGamepad:GetValue(arg_2_1)

		if var_3_0 ~= nil then
			if var_3_0 then
				arg_2_0.InputMethod:setImage(arg_2_0._GPDImg)
			else
				arg_2_0.InputMethod:setImage(arg_2_0._KBMImg)
			end
		end
	end

	arg_2_0.InputMethod:SubscribeToModelThroughElement(arg_2_0, "usingGamepad", var_2_0)

	local function var_2_1()
		local var_4_0 = arg_2_0:GetDataSource().subparty:GetValue(arg_2_1)

		if var_4_0 ~= nil then
			if var_4_0 >= 0 and var_4_0 == Lobby.GetLocalPlayerSubPartyIndex(arg_2_1) then
				arg_2_0.SubPartyIcon:SetAlpha(1)
			else
				arg_2_0.SubPartyIcon:SetAlpha(0)
			end
		end
	end

	arg_2_0.SubPartyIcon:SubscribeToModelThroughElement(arg_2_0, "subparty", var_2_1)

	local function var_2_2()
		local var_5_0 = arg_2_0:GetDataSource().presencePlatform:GetValue(arg_2_1)

		if var_5_0 ~= nil then
			arg_2_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[var_5_0])
		end
	end

	arg_2_0.SocialPlatformPresence:SubscribeToModelThroughElement(arg_2_0, "presencePlatform", var_2_2)

	local function var_2_3()
		local var_6_0 = arg_2_0:GetDataSource().isMyPlayer:GetValue(arg_2_1)

		if var_6_0 ~= nil then
			arg_2_0.YouIndicatorLeft:SetAlpha(var_6_0 and 1 or 0)
			arg_2_0.Gamertag:SetRGBFromTable(var_6_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
			arg_2_0.Clan:SetRGBFromTable(var_6_0 and SWATCHES.Scoreboard.highlight or SWATCHES.genericMenu.default)
		end
	end

	arg_2_0.YouIndicatorLeft:SubscribeToModelThroughElement(arg_2_0, "isMyPlayer", var_2_3)

	local function var_2_4()
		local var_7_0 = arg_2_0:GetDataSource().isLobbyHost:GetValue(arg_2_1)

		if var_7_0 ~= nil and arg_2_0.HostIcon then
			arg_2_0.HostIcon:SetAlpha(var_7_0 and 0.5 or 0)
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "isLobbyHost", var_2_4)

	local function var_2_5()
		local var_8_0 = arg_2_0:GetDataSource().displayRank:GetValue(arg_2_1)

		if var_8_0 ~= nil then
			ACTIONS.AnimateSequence(arg_2_0, PROGRESSION.IsElderRank(tonumber(var_8_0)) and "ElderRank" or "StandardRank")
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "displayRank", var_2_5)

	if IsLanguageKorean() or IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZH")
	end
end

function LobbyGamertagPlayerLong(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 545 * _1080p, 0, 40 * _1080p)

	var_9_0.id = "LobbyGamertagPlayerLong"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:setUseStencil(true)

	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Backer"

	var_9_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_9_4:SetAlpha(0.3, 0)
	var_9_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 465, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Backer = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "TextureLayer"

	var_9_6:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_9_6:SetAlpha(0.1, 0)
	var_9_6:SetPixelGridEnabled(true)
	var_9_6:SetPixelGridContrast(0.8, 0)
	var_9_6:SetPixelGridBlockWidth(2, 0)
	var_9_6:SetPixelGridBlockHeight(2, 0)
	var_9_6:SetPixelGridGutterWidth(1, 0)
	var_9_6:SetPixelGridGutterHeight(1, 0)
	var_9_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 465, 0, 0)
	var_9_0:addElement(var_9_6)

	var_9_0.TextureLayer = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "Glow"

	var_9_8:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_9_8:SetAlpha(0, 0)
	var_9_8:SetPixelGridEnabled(true)
	var_9_8:SetPixelGridContrast(0.5, 0)
	var_9_8:SetPixelGridBlockWidth(2, 0)
	var_9_8:SetPixelGridBlockHeight(2, 0)
	var_9_8:SetPixelGridGutterWidth(1, 0)
	var_9_8:SetPixelGridGutterHeight(1, 0)
	var_9_8:setImage(RegisterMaterial("button_glow"), 0)
	var_9_8:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_9_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * -72, _1080p * -7, _1080p * 7)
	var_9_0:addElement(var_9_8)

	var_9_0.Glow = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Line"

	var_9_10:SetRGBFromTable(SWATCHES.Scoreboard.friendlyTeam, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_9_0:addElement(var_9_10)

	var_9_0.Line = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "TeamColor"

	var_9_12:SetRGBFromTable(SWATCHES.HUD.friendlyTeam, 0)
	var_9_12:SetAlpha(0, 0)
	var_9_12:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_9_12:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -1, _1080p * 465, 0, 0)
	var_9_0:addElement(var_9_12)

	var_9_0.TeamColor = var_9_12

	local var_9_13
	local var_9_14 = LUI.UIStyledText.new()

	var_9_14.id = "Gamertag"

	var_9_14:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_9_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_9_14:SetWordWrap(false)
	var_9_14:SetAlignment(LUI.Alignment.Left)
	var_9_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_14:SetStartupDelay(1000)
	var_9_14:SetLineHoldTime(400)
	var_9_14:SetAnimMoveTime(150)
	var_9_14:SetAnimMoveSpeed(50)
	var_9_14:SetEndDelay(1000)
	var_9_14:SetCrossfadeTime(400)
	var_9_14:SetFadeInTime(300)
	var_9_14:SetFadeOutTime(300)
	var_9_14:SetMaxVisibleLines(1)
	var_9_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 170, _1080p * 368, _1080p * -12, _1080p * 10)

	local function var_9_15()
		local var_10_0 = var_9_0:GetDataSource().gamertag:GetValue(var_9_1)

		if var_10_0 ~= nil then
			var_9_14:setText(var_10_0, 0)
		end
	end

	var_9_14:SubscribeToModelThroughElement(var_9_0, "gamertag", var_9_15)
	var_9_0:addElement(var_9_14)

	var_9_0.Gamertag = var_9_14

	local var_9_16
	local var_9_17 = LUI.UIImage.new()

	var_9_17.id = "RankIcon"

	var_9_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 65, _1080p * 93, _1080p * -14, _1080p * 14)

	local function var_9_18()
		local var_11_0 = var_9_0:GetDataSource().rankIcon:GetValue(var_9_1)

		if var_11_0 ~= nil then
			var_9_17:setImage(RegisterMaterial(var_11_0), 0)
		end
	end

	var_9_17:SubscribeToModelThroughElement(var_9_0, "rankIcon", var_9_18)
	var_9_0:addElement(var_9_17)

	var_9_0.RankIcon = var_9_17

	local var_9_19

	if CONDITIONS.IsThirdGameMode(var_9_0) then
		local var_9_20 = LUI.UIImage.new()

		var_9_20.id = "RoleIcon"

		var_9_20:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_9_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 371, _1080p * 399, _1080p * -15, _1080p * 13)
		var_9_0:addElement(var_9_20)

		var_9_0.RoleIcon = var_9_20
	end

	local var_9_21
	local var_9_22 = LUI.UIText.new()

	var_9_22.id = "Rank"

	var_9_22:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_9_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_22:SetWordWrap(false)
	var_9_22:SetAlignment(LUI.Alignment.Right)
	var_9_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 38, _1080p * 64, _1080p * -12, _1080p * 12)

	local function var_9_23()
		local var_12_0 = var_9_0:GetDataSource().displayRank:GetValue(var_9_1)

		if var_12_0 ~= nil then
			var_9_22:setText(var_12_0, 0)
		end
	end

	var_9_22:SubscribeToModelThroughElement(var_9_0, "displayRank", var_9_23)
	var_9_0:addElement(var_9_22)

	var_9_0.Rank = var_9_22

	local var_9_24
	local var_9_25 = LUI.UIStyledText.new()

	var_9_25.id = "Clan"

	var_9_25:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_9_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_25:SetWordWrap(false)
	var_9_25:SetAlignment(LUI.Alignment.Left)
	var_9_25:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 93, _1080p * 157, _1080p * -9, _1080p * 9)

	local function var_9_26()
		local var_13_0 = var_9_0:GetDataSource().clanTag:GetValue(var_9_1)

		if var_13_0 ~= nil then
			var_9_25:setText(var_13_0, 0)
		end
	end

	var_9_25:SubscribeToModelThroughElement(var_9_0, "clanTag", var_9_26)
	var_9_0:addElement(var_9_25)

	var_9_0.Clan = var_9_25

	local var_9_27
	local var_9_28 = LUI.UIImage.new()

	var_9_28.id = "MicIcon"

	var_9_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 3, _1080p * 35, _1080p * -16, _1080p * 16)

	local function var_9_29()
		local var_14_0 = var_9_0:GetDataSource().microphoneAlpha:GetValue(var_9_1)

		if var_14_0 ~= nil then
			var_9_28:SetAlpha(var_14_0, 0)
		end
	end

	var_9_28:SubscribeToModelThroughElement(var_9_0, "microphoneAlpha", var_9_29)

	local function var_9_30()
		local var_15_0 = var_9_0:GetDataSource().microphoneIcon:GetValue(var_9_1)

		if var_15_0 ~= nil then
			var_9_28:setImage(RegisterMaterial(var_15_0), 0)
		end
	end

	var_9_28:SubscribeToModelThroughElement(var_9_0, "microphoneIcon", var_9_30)
	var_9_0:addElement(var_9_28)

	var_9_0.MicIcon = var_9_28

	local var_9_31
	local var_9_32 = LUI.UIImage.new()

	var_9_32.id = "SubPartyIcon"

	var_9_32:SetRGBFromTable(SWATCHES.BattleNetChat.partyChat, 0)
	var_9_32:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 5, _1080p * -20, _1080p * 20)
	var_9_0:addElement(var_9_32)

	var_9_0.SubPartyIcon = var_9_32

	local var_9_33
	local var_9_34 = LUI.UIImage.new()

	var_9_34.id = "InputMethod"

	var_9_34:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_9_34:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 402, _1080p * 430, _1080p * -15, _1080p * 13)
	var_9_0:addElement(var_9_34)

	var_9_0.InputMethod = var_9_34

	local var_9_35
	local var_9_36 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_9_1
	})

	var_9_36.id = "SocialPlatformPresence"

	var_9_36:SetAlpha(0.75, 0)
	var_9_36:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 434, _1080p * 456, _1080p * -12, _1080p * 10)
	var_9_0:addElement(var_9_36)

	var_9_0.SocialPlatformPresence = var_9_36

	local var_9_37
	local var_9_38 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_9_1
	})

	var_9_38.id = "YouIndicatorLeft"

	var_9_38:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -75, 0, _1080p * -15, _1080p * 15)
	var_9_0:addElement(var_9_38)

	var_9_0.YouIndicatorLeft = var_9_38

	local var_9_39
	local var_9_40 = LUI.UIImage.new()

	var_9_40.id = "HostIcon"

	var_9_40:SetRGBFromInt(0, 0)
	var_9_40:SetAlpha(0, 0)
	var_9_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 463, _1080p * 465, _1080p * 41, _1080p * 43)
	var_9_0:addElement(var_9_40)

	var_9_0.HostIcon = var_9_40

	local var_9_41 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("DefaultSequence", var_9_41)

	local var_9_42 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("DefaultSequence", var_9_42)

	local var_9_43 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("DefaultSequence", var_9_43)

	local var_9_44 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("DefaultSequence", var_9_44)

	local function var_9_45()
		var_9_14:AnimateSequence("DefaultSequence")
		var_9_17:AnimateSequence("DefaultSequence")
		var_9_22:AnimateSequence("DefaultSequence")
		var_9_25:AnimateSequence("DefaultSequence")
	end

	var_9_0._sequences.DefaultSequence = var_9_45

	local var_9_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonOver", var_9_46)

	local var_9_47 = {
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

	var_9_6:RegisterAnimationSequence("ButtonOver", var_9_47)

	local var_9_48 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_48)

	local var_9_49 = {
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

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_49)

	local var_9_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonOver", var_9_50)

	local var_9_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ButtonOver", var_9_51)

	local var_9_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("ButtonOver", var_9_52)

	local var_9_53 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ButtonOver", var_9_53)

	local var_9_54 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("ButtonOver", var_9_54)

	local function var_9_55()
		var_9_4:AnimateSequence("ButtonOver")
		var_9_6:AnimateSequence("ButtonOver")
		var_9_8:AnimateSequence("ButtonOver")
		var_9_10:AnimateSequence("ButtonOver")
		var_9_14:AnimateSequence("ButtonOver")
		var_9_17:AnimateSequence("ButtonOver")
		var_9_22:AnimateSequence("ButtonOver")
		var_9_25:AnimateSequence("ButtonOver")
		var_9_36:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_55

	local var_9_56 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_4:RegisterAnimationSequence("ButtonUp", var_9_56)

	local var_9_57 = {
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

	var_9_6:RegisterAnimationSequence("ButtonUp", var_9_57)

	local var_9_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_59)

	local var_9_60 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("ButtonUp", var_9_60)

	local var_9_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_17:RegisterAnimationSequence("ButtonUp", var_9_61)

	local var_9_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_22:RegisterAnimationSequence("ButtonUp", var_9_62)

	local var_9_63 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("ButtonUp", var_9_63)

	local var_9_64 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_36:RegisterAnimationSequence("ButtonUp", var_9_64)

	local function var_9_65()
		var_9_4:AnimateSequence("ButtonUp")
		var_9_6:AnimateSequence("ButtonUp")
		var_9_8:AnimateSequence("ButtonUp")
		var_9_10:AnimateSequence("ButtonUp")
		var_9_14:AnimateSequence("ButtonUp")
		var_9_17:AnimateSequence("ButtonUp")
		var_9_22:AnimateSequence("ButtonUp")
		var_9_25:AnimateSequence("ButtonUp")
		var_9_36:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_65

	local var_9_66 = {
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

	var_9_12:RegisterAnimationSequence("Enemy", var_9_66)

	local function var_9_67()
		var_9_12:AnimateSequence("Enemy")
	end

	var_9_0._sequences.Enemy = var_9_67

	local var_9_68 = {
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

	var_9_12:RegisterAnimationSequence("Friendly", var_9_68)

	local function var_9_69()
		var_9_12:AnimateSequence("Friendly")
	end

	var_9_0._sequences.Friendly = var_9_69

	local var_9_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_9_22:RegisterAnimationSequence("ElderRank", var_9_70)

	local function var_9_71()
		var_9_22:AnimateSequence("ElderRank")
	end

	var_9_0._sequences.ElderRank = var_9_71

	local var_9_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_9_22:RegisterAnimationSequence("StandardRank", var_9_72)

	local function var_9_73()
		var_9_22:AnimateSequence("StandardRank")
	end

	var_9_0._sequences.StandardRank = var_9_73

	local var_9_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_9_25:RegisterAnimationSequence("KORZH", var_9_74)

	local function var_9_75()
		var_9_25:AnimateSequence("KORZH")
	end

	var_9_0._sequences.KORZH = var_9_75

	var_0_1(var_9_0, var_9_1, arg_9_1)
	ACTIONS.AnimateSequence(var_9_0, "DefaultSequence")

	return var_9_0
end

MenuBuilder.registerType("LobbyGamertagPlayerLong", LobbyGamertagPlayerLong)
LockTable(_M)
