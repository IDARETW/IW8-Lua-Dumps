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

	if arg_2_2.matchmadeTeam == "friendly" then
		ACTIONS.AnimateSequence(arg_2_0, "Friendly")
	elseif arg_2_2.matchmadeTeam == "enemy" then
		ACTIONS.AnimateSequence(arg_2_0, "Enemy")
	end

	arg_2_0._GPDImg = RegisterMaterial("icon_platform_controller")
	arg_2_0._KBMImg = RegisterMaterial("icon_platform_mousekeyboard")

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
		local var_7_0 = arg_2_0:GetDataSource().displayRank:GetValue(arg_2_1)

		if var_7_0 ~= nil then
			ACTIONS.AnimateSequence(arg_2_0, PROGRESSION.IsElderRank(tonumber(var_7_0)) and "ElderRank" or "StandardRank")
		end
	end

	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "displayRank", var_2_4)
end

function LobbyGamertagPlayer(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 130 * _1080p)

	var_8_0.id = "LobbyGamertagPlayer"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:setUseStencil(true)

	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.4, 0)
	var_8_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "TextureLayer"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_8_6:SetAlpha(0.1, 0)
	var_8_6:SetPixelGridEnabled(true)
	var_8_6:SetPixelGridContrast(0.8, 0)
	var_8_6:SetPixelGridBlockWidth(2, 0)
	var_8_6:SetPixelGridBlockHeight(2, 0)
	var_8_6:SetPixelGridGutterWidth(1, 0)
	var_8_6:SetPixelGridGutterHeight(1, 0)
	var_8_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_8_0:addElement(var_8_6)

	var_8_0.TextureLayer = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "Gradient"

	var_8_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_8:SetAlpha(0, 0)
	var_8_8:SetPixelGridEnabled(true)
	var_8_8:SetPixelGridContrast(0.2, 0)
	var_8_8:SetPixelGridBlockWidth(2, 0)
	var_8_8:SetPixelGridBlockHeight(2, 0)
	var_8_8:SetPixelGridGutterWidth(1, 0)
	var_8_8:SetPixelGridGutterHeight(1, 0)
	var_8_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 520, 0, 0)
	var_8_0:addElement(var_8_8)

	var_8_0.Gradient = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIImage.new()

	var_8_10.id = "PlayerCard"

	var_8_10:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 99, _1080p * 459, _1080p * 33, _1080p * -7)

	local function var_8_11()
		local var_9_0 = var_8_0:GetDataSource().background:GetValue(var_8_1)

		if var_9_0 ~= nil then
			var_8_10:setImage(RegisterMaterial(var_9_0), 0)
		end
	end

	var_8_10:SubscribeToModelThroughElement(var_8_0, "background", var_8_11)
	var_8_0:addElement(var_8_10)

	var_8_0.PlayerCard = var_8_10

	local var_8_12
	local var_8_13 = LUI.UIImage.new()

	var_8_13.id = "RankIcon"

	var_8_13:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 460, _1080p * 520, _1080p * -32, _1080p * 28)

	local function var_8_14()
		local var_10_0 = var_8_0:GetDataSource().rankIcon:GetValue(var_8_1)

		if var_10_0 ~= nil then
			var_8_13:setImage(RegisterMaterial(var_10_0), 0)
		end
	end

	var_8_13:SubscribeToModelThroughElement(var_8_0, "rankIcon", var_8_14)
	var_8_0:addElement(var_8_13)

	var_8_0.RankIcon = var_8_13

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "Rank"

	var_8_16:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_16:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 520, _1080p * 28, _1080p * 58)

	local function var_8_17()
		local var_11_0 = var_8_0:GetDataSource().displayRank:GetValue(var_8_1)

		if var_11_0 ~= nil then
			var_8_16:setText(var_11_0, 0)
		end
	end

	var_8_16:SubscribeToModelThroughElement(var_8_0, "displayRank", var_8_17)
	var_8_0:addElement(var_8_16)

	var_8_0.Rank = var_8_16

	local var_8_18
	local var_8_19 = LUI.UIImage.new()

	var_8_19.id = "Emblem"

	var_8_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 98, _1080p * 33, _1080p * 123)

	local function var_8_20()
		local var_12_0 = var_8_0:GetDataSource().emblem:GetValue(var_8_1)

		if var_12_0 ~= nil then
			var_8_19:setImage(RegisterMaterial(var_12_0), 0)
		end
	end

	var_8_19:SubscribeToModelThroughElement(var_8_0, "emblem", var_8_20)
	var_8_0:addElement(var_8_19)

	var_8_0.Emblem = var_8_19

	local var_8_21
	local var_8_22 = LUI.UIStyledText.new()

	var_8_22.id = "Gamertag"

	var_8_22:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_22:SetWordWrap(false)
	var_8_22:SetAlignment(LUI.Alignment.Left)
	var_8_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 110, _1080p * 365, _1080p * 2, _1080p * 24)

	local function var_8_23()
		local var_13_0 = var_8_0:GetDataSource().gamertag:GetValue(var_8_1)

		if var_13_0 ~= nil then
			var_8_22:setText(var_13_0, 0)
		end
	end

	var_8_22:SubscribeToModelThroughElement(var_8_0, "gamertag", var_8_23)
	var_8_0:addElement(var_8_22)

	var_8_0.Gamertag = var_8_22

	local var_8_24
	local var_8_25 = LUI.UIStyledText.new()

	var_8_25.id = "Clan"

	var_8_25:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_25:SetWordWrap(false)
	var_8_25:SetAlignment(LUI.Alignment.Left)
	var_8_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 99, _1080p * 4, _1080p * 24)

	local function var_8_26()
		local var_14_0 = var_8_0:GetDataSource().clanTag:GetValue(var_8_1)

		if var_14_0 ~= nil then
			var_8_25:setText(var_14_0, 0)
		end
	end

	var_8_25:SubscribeToModelThroughElement(var_8_0, "clanTag", var_8_26)
	var_8_0:addElement(var_8_25)

	var_8_0.Clan = var_8_25

	local var_8_27
	local var_8_28 = LUI.UIImage.new()

	var_8_28.id = "MicIcon"

	var_8_28:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 488, _1080p * 520, _1080p * -64, _1080p * -32)

	local function var_8_29()
		local var_15_0 = var_8_0:GetDataSource().microphoneAlpha:GetValue(var_8_1)

		if var_15_0 ~= nil then
			var_8_28:SetAlpha(var_15_0, 0)
		end
	end

	var_8_28:SubscribeToModelThroughElement(var_8_0, "microphoneAlpha", var_8_29)

	local function var_8_30()
		local var_16_0 = var_8_0:GetDataSource().microphoneIcon:GetValue(var_8_1)

		if var_16_0 ~= nil then
			var_8_28:setImage(RegisterMaterial(var_16_0), 0)
		end
	end

	var_8_28:SubscribeToModelThroughElement(var_8_0, "microphoneIcon", var_8_30)
	var_8_0:addElement(var_8_28)

	var_8_0.MicIcon = var_8_28

	local var_8_31
	local var_8_32 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_32.id = "HighlightTop"

	var_8_32:SetAlpha(0, 0)
	var_8_32:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 520, 0, _1080p * 2)
	var_8_0:addElement(var_8_32)

	var_8_0.HighlightTop = var_8_32

	local var_8_33
	local var_8_34 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_8_1
	})

	var_8_34.id = "HighlightBottom"

	var_8_34:SetAlpha(0, 0)
	var_8_34:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 520, _1080p * -2, 0)
	var_8_0:addElement(var_8_34)

	var_8_0.HighlightBottom = var_8_34

	local var_8_35
	local var_8_36 = LUI.UIImage.new()

	var_8_36.id = "SubPartyIcon"

	var_8_36:SetRGBFromTable(SWATCHES.BattleNetChat.partyChat, 0)
	var_8_36:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 5, 0, _1080p * 130)
	var_8_0:addElement(var_8_36)

	var_8_0.SubPartyIcon = var_8_36

	local var_8_37

	if CONDITIONS.IsThirdGameMode(var_8_0) then
		local var_8_38 = LUI.UIImage.new()

		var_8_38.id = "RoleIcon"

		var_8_38:SetRGBFromTable(SWATCHES.text.primaryText, 0)
		var_8_38:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 372, _1080p * 401, _1080p * -62, _1080p * -34)
		var_8_0:addElement(var_8_38)

		var_8_0.RoleIcon = var_8_38
	end

	local var_8_39
	local var_8_40 = LUI.UIImage.new()

	var_8_40.id = "InputMethod"

	var_8_40:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_8_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 404, _1080p * 432, _1080p * 3, _1080p * 31)
	var_8_0:addElement(var_8_40)

	var_8_0.InputMethod = var_8_40

	local var_8_41
	local var_8_42 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_8_1
	})

	var_8_42.id = "SocialPlatformPresence"

	var_8_42:SetAlpha(0.75, 0)
	var_8_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 437, _1080p * 459, _1080p * 6, _1080p * 28)
	var_8_0:addElement(var_8_42)

	var_8_0.SocialPlatformPresence = var_8_42

	local var_8_43
	local var_8_44 = MenuBuilder.BuildRegisteredType("YouIndicatorLeft", {
		controllerIndex = var_8_1
	})

	var_8_44.id = "YouIndicatorLeft"

	var_8_44:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -75, 0, 0, _1080p * 30)
	var_8_0:addElement(var_8_44)

	var_8_0.YouIndicatorLeft = var_8_44

	local var_8_45 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("DefaultSequence", var_8_45)

	local var_8_46 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("DefaultSequence", var_8_46)

	local var_8_47 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("DefaultSequence", var_8_47)

	local var_8_48 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_19:RegisterAnimationSequence("DefaultSequence", var_8_48)

	local var_8_49 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("DefaultSequence", var_8_49)

	local var_8_50 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_25:RegisterAnimationSequence("DefaultSequence", var_8_50)

	local function var_8_51()
		var_8_10:AnimateSequence("DefaultSequence")
		var_8_13:AnimateSequence("DefaultSequence")
		var_8_16:AnimateSequence("DefaultSequence")
		var_8_19:AnimateSequence("DefaultSequence")
		var_8_22:AnimateSequence("DefaultSequence")
		var_8_25:AnimateSequence("DefaultSequence")
	end

	var_8_0._sequences.DefaultSequence = var_8_51

	local var_8_52 = {
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

	var_8_4:RegisterAnimationSequence("ButtonOver", var_8_52)

	local var_8_53 = {
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

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_53)

	local var_8_54 = {
		{
			value = 0.3,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonOver", var_8_54)

	local var_8_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonOver", var_8_55)

	local var_8_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("ButtonOver", var_8_56)

	local var_8_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonOver", var_8_57)

	local var_8_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_19:RegisterAnimationSequence("ButtonOver", var_8_58)

	local var_8_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("ButtonOver", var_8_59)

	local var_8_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_25:RegisterAnimationSequence("ButtonOver", var_8_60)

	local var_8_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_32:RegisterAnimationSequence("ButtonOver", var_8_61)

	local var_8_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_34:RegisterAnimationSequence("ButtonOver", var_8_62)

	local var_8_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_42:RegisterAnimationSequence("ButtonOver", var_8_63)

	local function var_8_64()
		var_8_4:AnimateSequence("ButtonOver")
		var_8_6:AnimateSequence("ButtonOver")
		var_8_8:AnimateSequence("ButtonOver")
		var_8_10:AnimateSequence("ButtonOver")
		var_8_13:AnimateSequence("ButtonOver")
		var_8_16:AnimateSequence("ButtonOver")
		var_8_19:AnimateSequence("ButtonOver")
		var_8_22:AnimateSequence("ButtonOver")
		var_8_25:AnimateSequence("ButtonOver")
		var_8_32:AnimateSequence("ButtonOver")
		var_8_34:AnimateSequence("ButtonOver")
		var_8_42:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_64

	local var_8_65 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ButtonUp", var_8_65)

	local var_8_66 = {
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

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_66)

	local var_8_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ButtonUp", var_8_67)

	local var_8_68 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ButtonUp", var_8_68)

	local var_8_69 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_13:RegisterAnimationSequence("ButtonUp", var_8_69)

	local var_8_70 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ButtonUp", var_8_70)

	local var_8_71 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_19:RegisterAnimationSequence("ButtonUp", var_8_71)

	local var_8_72 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("ButtonUp", var_8_72)

	local var_8_73 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_25:RegisterAnimationSequence("ButtonUp", var_8_73)

	local var_8_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_32:RegisterAnimationSequence("ButtonUp", var_8_74)

	local var_8_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_34:RegisterAnimationSequence("ButtonUp", var_8_75)

	local var_8_76 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_42:RegisterAnimationSequence("ButtonUp", var_8_76)

	local function var_8_77()
		var_8_4:AnimateSequence("ButtonUp")
		var_8_6:AnimateSequence("ButtonUp")
		var_8_8:AnimateSequence("ButtonUp")
		var_8_10:AnimateSequence("ButtonUp")
		var_8_13:AnimateSequence("ButtonUp")
		var_8_16:AnimateSequence("ButtonUp")
		var_8_19:AnimateSequence("ButtonUp")
		var_8_22:AnimateSequence("ButtonUp")
		var_8_25:AnimateSequence("ButtonUp")
		var_8_32:AnimateSequence("ButtonUp")
		var_8_34:AnimateSequence("ButtonUp")
		var_8_42:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_77

	local var_8_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.friendlyTeam
		}
	}

	var_8_4:RegisterAnimationSequence("Friendly", var_8_78)

	local function var_8_79()
		var_8_4:AnimateSequence("Friendly")
	end

	var_8_0._sequences.Friendly = var_8_79

	local var_8_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.enemyTeam
		}
	}

	var_8_4:RegisterAnimationSequence("Enemy", var_8_80)

	local function var_8_81()
		var_8_4:AnimateSequence("Enemy")
	end

	var_8_0._sequences.Enemy = var_8_81

	local var_8_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_8_16:RegisterAnimationSequence("ElderRank", var_8_82)

	local function var_8_83()
		var_8_16:AnimateSequence("ElderRank")
	end

	var_8_0._sequences.ElderRank = var_8_83

	local var_8_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Lobby.Default
		}
	}

	var_8_16:RegisterAnimationSequence("StandardRank", var_8_84)

	local function var_8_85()
		var_8_16:AnimateSequence("StandardRank")
	end

	var_8_0._sequences.StandardRank = var_8_85

	var_0_1(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("LobbyGamertagPlayer", LobbyGamertagPlayer)
LockTable(_M)
