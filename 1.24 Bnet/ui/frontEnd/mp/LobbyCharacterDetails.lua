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

	local var_1_5 = LAYOUT.GetElementWidth(arg_1_0.InputIcon)

	arg_1_0.InputIcon:SetLeft(var_1_2 + var_1_4)
	arg_1_0.InputIcon:SetRight(var_1_2 + var_1_4 + var_1_5)

	local var_1_6 = LAYOUT.GetElementWidth(arg_1_0.MicIcon)

	arg_1_0.MicIcon:SetLeft(var_1_2 + var_1_4 + var_1_5)
	arg_1_0.MicIcon:SetRight(var_1_2 + var_1_4 + var_1_5 + var_1_6)

	local var_1_7 = LAYOUT.GetElementWidth(arg_1_0.RankIcon)

	arg_1_0.RankIcon:SetRight(var_1_3)
	arg_1_0.RankIcon:SetLeft(var_1_3 - var_1_7)
	arg_1_0.Rank:SetRight(var_1_3 - var_1_7)
	arg_1_0.Rank:SetLeft(var_1_3 - var_1_7 - 50 * _1080p)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Gamertag:setText(arg_2_1.gamerTag)

	if arg_2_1.micAlpha then
		arg_2_0.MicIcon:SetAlpha(arg_2_1.micAlpha)
	end

	if arg_2_1.micIcon and #arg_2_1.micIcon > 0 then
		arg_2_0.MicIcon:setImage(RegisterMaterial(arg_2_1.micIcon))
	end

	if arg_2_1.rankIcon then
		arg_2_0.RankIcon:setImage(RegisterMaterial(arg_2_1.rankIcon))
	end

	if arg_2_1.displayRank then
		arg_2_0.Rank:setText(arg_2_1.displayRank)
		ACTIONS.AnimateSequence(arg_2_0, PROGRESSION.IsElderRank(tonumber(arg_2_1.displayRank)) and "ElderRank" or "StandardRank")
	end

	if arg_2_1.isPrivatePartyHost then
		arg_2_0.PartyLeader:SetAlpha(1)
	else
		arg_2_0.PartyLeader:SetAlpha(0)
	end

	local var_2_0 = arg_2_1.presencePlatform ~= nil and arg_2_1.presencePlatform > 0

	if var_2_0 then
		arg_2_0.PlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[arg_2_1.presencePlatform])
	end

	if arg_2_1.isMyPlayer then
		ACTIONS.AnimateSequence(arg_2_0, "IsMyPlayer")
	else
		ACTIONS.AnimateSequence(arg_2_0, "IsNotMyPlayer")
	end

	if arg_2_1.usingGamepad then
		arg_2_0.InputIcon:setImage(RegisterMaterial("icon_platform_controller"))
	else
		arg_2_0.InputIcon:setImage(RegisterMaterial("icon_platform_mousekeyboard"))
	end

	var_0_0(arg_2_0, var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Gamertag)
	arg_3_0.Gamertag:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	arg_3_0.Gamertag:SetFontSize(22 * _1080p)

	arg_3_0.Setup = var_0_1

	arg_3_0.MicIcon:SetAlpha(0)
	arg_3_0.PartyLeader:SetAlpha(0)
	arg_3_0.PlatformPresence:SetAlpha(0)
end

function LobbyCharacterDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 34 * _1080p)

	var_4_0.id = "LobbyCharacterDetails"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "Gamertag"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetWordWrap(false)
	var_4_4:SetAlignment(LUI.Alignment.Center)
	var_4_4:SetShadowMinDistance(-0.2, 0)
	var_4_4:SetShadowMaxDistance(0.2, 0)
	var_4_4:SetShadowUOffset(-0.002, 0)
	var_4_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -118, _1080p * 122, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_4)

	var_4_0.Gamertag = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "MicIcon"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_6:setImage(RegisterMaterial("icon_mic_talking"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 95, _1080p * 125, _1080p * -15, _1080p * 15)
	var_4_0:addElement(var_4_6)

	var_4_0.MicIcon = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "PlatformPresence"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 44, _1080p * 66, _1080p * -11, _1080p * 11)
	var_4_0:addElement(var_4_8)

	var_4_0.PlatformPresence = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "RankIcon"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_10:setImage(RegisterMaterial("icon_rank_sm_01"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -85, _1080p * -55, _1080p * -15, _1080p * 15)
	var_4_0:addElement(var_4_10)

	var_4_0.RankIcon = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Rank"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetWordWrap(false)
	var_4_12:SetAlignment(LUI.Alignment.Right)
	var_4_12:SetShadowMinDistance(-0.2, 0)
	var_4_12:SetShadowMaxDistance(0.2, 0)
	var_4_12:SetShadowUOffset(-0.002, 0)
	var_4_12:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -125, _1080p * -87, _1080p * -10, _1080p * 10)
	var_4_0:addElement(var_4_12)

	var_4_0.Rank = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "PartyLeader"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 13, _1080p * -43, _1080p * -21)
	var_4_0:addElement(var_4_14)

	var_4_0.PartyLeader = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "InputIcon"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_4_16:setImage(RegisterMaterial("icon_platform_controller"), 0)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 66, _1080p * 96, _1080p * -15, _1080p * 15)
	var_4_0:addElement(var_4_16)

	var_4_0.InputIcon = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_4_4:RegisterAnimationSequence("IsNotMyPlayer", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("IsNotMyPlayer")
	end

	var_4_0._sequences.IsNotMyPlayer = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_4_4:RegisterAnimationSequence("IsMyPlayer", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("IsMyPlayer")
	end

	var_4_0._sequences.IsMyPlayer = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.elderRank
		}
	}

	var_4_12:RegisterAnimationSequence("ElderRank", var_4_25)

	local function var_4_26()
		var_4_12:AnimateSequence("ElderRank")
	end

	var_4_0._sequences.ElderRank = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.default
		}
	}

	var_4_12:RegisterAnimationSequence("StandardRank", var_4_28)

	local function var_4_29()
		var_4_12:AnimateSequence("StandardRank")
	end

	var_4_0._sequences.StandardRank = var_4_29

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyCharacterDetails", LobbyCharacterDetails)
LockTable(_M)
