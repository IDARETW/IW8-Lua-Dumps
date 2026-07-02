module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.background ~= nil then
		local var_1_0 = CallingCardUtils.GetCardTexture(arg_1_1.background)

		arg_1_0.Background:setImage(RegisterMaterial(var_1_0))
	end

	arg_1_0.FullName:setText(arg_1_1.fullName or arg_1_1.name)

	if arg_1_1.emblemIndex ~= nil then
		local var_1_1 = EmblemEditorUtils.GetEmblemImageFromID(arg_1_1.emblemIndex)

		arg_1_0.Emblem:setImage(RegisterMaterial(var_1_1))
	end

	if arg_1_1.presencePlatform then
		arg_1_0.PlatformPresence:SetPlatformPresence(arg_1_1.presencePlatform)
	end

	if arg_1_1.hideRank == true then
		arg_1_0.RankIcon:SetAlpha(0)
		arg_1_0.RankNumber:SetAlpha(0)
	elseif arg_1_1.baseRank and arg_1_1.prestige then
		local var_1_2 = arg_1_1.baseRank
		local var_1_3 = PROGRESSION.ValidatePrestigeLevel(arg_1_1.prestige, {
			_isBackendPrestigeLevel = true
		})
		local var_1_4 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = var_1_2,
			_prestigeLevel = var_1_3
		})
		local var_1_5 = var_1_4._rankIcon

		if var_1_5 and #var_1_5 > 0 then
			arg_1_0.RankIcon:SetAlpha(1)
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_5))
		end

		arg_1_0.RankNumber:SetAlpha(1)
		arg_1_0.RankNumber:setText(var_1_4._rankDisplay)
	else
		arg_1_0.RankIcon:SetAlpha(0)
		arg_1_0.RankNumber:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupPlayerDetails = var_0_0
end

function SocialPlayerDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 124 * _1080p)

	var_3_0.id = "SocialPlayerDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 411, _1080p * 34, _1080p * 114)

	local function var_3_5()
		local var_4_0 = var_3_0:GetDataSource().playerCardArchetype.background:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_4:SubscribeToModelThroughElement(var_3_0, "playerCardArchetype.background", var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "Emblem"

	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 84, _1080p * 34, _1080p * 114)

	local function var_3_8()
		local var_5_0 = var_3_0:GetDataSource().playerCardArchetype.emblem:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_7:setImage(RegisterMaterial(var_5_0), 0)
		end
	end

	var_3_7:SubscribeToModelThroughElement(var_3_0, "playerCardArchetype.emblem", var_3_8)
	var_3_0:addElement(var_3_7)

	var_3_0.Emblem = var_3_7

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "FullName"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.BattleNetBold.File))
	var_3_10:SetWordWrap(false)
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 472, _1080p * 5, _1080p * 27)
	var_3_0:addElement(var_3_10)

	var_3_0.FullName = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "PlatformPresence"

	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 381, _1080p * 411, _1080p * 1, _1080p * 31)
	var_3_0:addElement(var_3_12)

	var_3_0.PlatformPresence = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "RankNumber"

	var_3_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_14:setText("80", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetWordWrap(false)
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -55, _1080p * -11, _1080p * 90, _1080p * 114)
	var_3_0:addElement(var_3_14)

	var_3_0.RankNumber = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "RankIcon"

	var_3_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -55, _1080p * -11, _1080p * 34, _1080p * 78)
	var_3_0:addElement(var_3_16)

	var_3_0.RankIcon = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialPlayerDetails", SocialPlayerDetails)
LockTable(_M)
