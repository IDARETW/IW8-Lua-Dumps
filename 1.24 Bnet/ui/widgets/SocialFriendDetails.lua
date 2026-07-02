module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.background ~= nil then
		local var_1_0 = CallingCardUtils.GetCardTexture(arg_1_1.background)

		arg_1_0.Background:setImage(RegisterMaterial(var_1_0))
	end

	arg_1_0.FullName:setText(arg_1_1.fullName)

	if arg_1_1.emblemIndex ~= nil then
		local var_1_1 = EmblemEditorUtils.GetEmblemImageFromID(arg_1_1.emblemIndex)

		arg_1_0.Emblem:setImage(RegisterMaterial(var_1_1))
	end

	if arg_1_1.baseRank and arg_1_1.prestige then
		local var_1_2 = arg_1_1.baseRank + arg_1_1.prestige
		local var_1_3 = PROGRESSION.GetRankIcon(var_1_2)

		if var_1_3 and #var_1_3 > 0 then
			arg_1_0.RankIcon:SetAlpha(1)
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_3))
		end

		arg_1_0.RankNumber:SetAlpha(1)
		arg_1_0.RankNumber:setText(tostring(var_1_2 + 1))
	else
		arg_1_0.RankIcon:SetAlpha(0)
		arg_1_0.RankNumber:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupPlayerDetails = var_0_0
end

function SocialFriendDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "SocialFriendDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 121, _1080p * 500, _1080p * 82, _1080p * 182)

	local function var_3_5()
		local var_4_0 = var_3_0:GetDataSource().DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.background:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_4:SubscribeToModelThroughElement(var_3_0, "DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.background", var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "Emblem"

	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 110, _1080p * 82, _1080p * 182)

	local function var_3_8()
		local var_5_0 = var_3_0:GetDataSource().DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.emblem:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_7:setImage(RegisterMaterial(var_5_0), 0)
		end
	end

	var_3_7:SubscribeToModelThroughElement(var_3_0, "DataSources.alwaysLoaded.friendArchetype.playerCardArchetype.emblem", var_3_8)
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
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 123, _1080p * 509, _1080p * 32, _1080p * 56)
	var_3_0:addElement(var_3_10)

	var_3_0.FullName = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "RankNumber"

	var_3_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_12:setText("80", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetWordWrap(false)
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -460, _1080p * -397, _1080p * 26, _1080p * 62)
	var_3_0:addElement(var_3_12)

	var_3_0.RankNumber = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "RankIcon"

	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -510, _1080p * -460, _1080p * 20, _1080p * 66)
	var_3_0:addElement(var_3_14)

	var_3_0.RankIcon = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialFriendDetails", SocialFriendDetails)
LockTable(_M)
