module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.EmblemIcon:setImage(RegisterMaterial(arg_1_1.emblemImage))
	arg_1_0.Playercard:setImage(RegisterMaterial(arg_1_1.bgImage))
	arg_1_0.Gamertag:setText(arg_1_1.gamerTag)
	arg_1_0.RankIcon:setImage(RegisterMaterial(arg_1_1.rankIcon))
	arg_1_0.RankDisplay:setText(arg_1_1.rankDisplay)
	arg_1_0.RankName:setText(arg_1_1.rankName)
	arg_1_0.SocialPlatformPresence:SetPlatformPresence(ClientPlatformToPresencePlatform[tonumber(arg_1_1.platform)])
	arg_1_0:SetAlpha(1)
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0:SetAlpha(0)

	arg_2_0.SetData = var_0_0
end

function LeaderboardPlayerCard(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 508 * _1080p, 0, 350 * _1080p)

	var_3_0.id = "LeaderboardPlayerCard"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Playercard"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 480, _1080p * 85, _1080p * 175)
	var_3_0:addElement(var_3_6)

	var_3_0.Playercard = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "RankIcon"

	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -50, _1080p * 50, _1080p * 190, _1080p * 280)
	var_3_0:addElement(var_3_8)

	var_3_0.RankIcon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "EmblemIcon"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 118, _1080p * 85, _1080p * 175)
	var_3_0:addElement(var_3_10)

	var_3_0.EmblemIcon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "RankName"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -25, _1080p * 280, _1080p * 304)
	var_3_0:addElement(var_3_12)

	var_3_0.RankName = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "RankDisplay"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_14:setText("999", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 83, _1080p * -83, _1080p * 304, _1080p * 332)
	var_3_0:addElement(var_3_14)

	var_3_0.RankDisplay = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "SocialPlatformPresence"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 458, _1080p * 480, _1080p * 56, _1080p * 78)
	var_3_0:addElement(var_3_16)

	var_3_0.SocialPlatformPresence = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "Gamertag"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_3_18:SetWordWrap(false)
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 480, _1080p * 56, _1080p * 78)
	var_3_0:addElement(var_3_18)

	var_3_0.Gamertag = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "PlayerDetailsTitle"

	var_3_20.Text:setText(Engine.CBBHFCGDIC("MENU/PLAYER_DETAILS"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 495, 0, _1080p * 46)
	var_3_0:addElement(var_3_20)

	var_3_0.PlayerDetailsTitle = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LeaderboardPlayerCard", LeaderboardPlayerCard)
LockTable(_M)
