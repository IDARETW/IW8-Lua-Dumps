module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:setText(arg_1_1._rankDisplay)

	if arg_1_1._prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
		arg_1_0:SetRGBFromTable(arg_1_1._prestigeMasterColor)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = tostring(arg_2_2.gamertag)
	local var_2_1 = tostring(arg_2_2.gamertagWithHash)

	DebugPrint("SmallPlayerCard -> FillWithPlayerData -> gamerTagWithHashStr = " .. var_2_1)

	if var_2_1 and var_2_1 ~= "" then
		var_2_0 = var_2_1
	end

	assert(arg_2_0.Name)
	arg_2_0.Name:setText(var_2_0 or "")

	if arg_2_0.Name:getText() == "" then
		arg_2_0.isValidData = false
	else
		arg_2_0.isValidData = true
	end

	if arg_2_2.backgroundIndex then
		local var_2_2 = CallingCardUtils.GetCardTexture(arg_2_2.backgroundIndex)

		arg_2_0.PlayerCardImage:setImage(RegisterMaterial(var_2_2))
	end

	if arg_2_0.Rank and arg_2_0.RankIcon then
		local var_2_3 = PROGRESSION.ValidatePrestigeLevel(arg_2_2.prestige, {
			_isBackendPrestigeLevel = true
		})
		local var_2_4 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = arg_2_2.rank,
			_prestigeLevel = var_2_3
		})

		var_0_0(arg_2_0.Rank, var_2_4)

		local var_2_5 = var_2_4._rankIcon

		if var_2_5 and #var_2_5 > 0 then
			arg_2_0.RankIcon:setImage(RegisterMaterial(var_2_5))
			arg_2_0.RankIcon:SetAlpha(1)
		else
			arg_2_0.RankIcon:SetAlpha(0)
		end

		arg_2_0.RankIcon:setImage(RegisterMaterial(var_2_5))
	end

	if arg_2_2.emblemIndex then
		local var_2_6 = EmblemEditorUtils.GetEmblemImageFromID(arg_2_2.emblemIndex)

		if var_2_6 == nil or #var_2_6 == 0 then
			var_2_6 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end

		arg_2_0.Emblem:setImage(RegisterMaterial(var_2_6))
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if not CONDITIONS.IsThirdGameMode() then
		assert(arg_3_1 >= 0)
	end

	if arg_3_1 < 0 then
		return
	end

	local var_3_0 = Game.DEAIDCJCEH(arg_3_1)
	local var_3_1 = tostring(Game.BHJIEAICAH(arg_3_1))

	DebugPrint("SmallPlayerCard -> FillWithClientNum -> fullNameWithHash = " .. var_3_1)

	if var_3_1 and var_3_1 ~= "" then
		var_3_0 = var_3_1
	end

	assert(arg_3_0.Name)

	if MLG.FBFGBEC() then
		local var_3_2 = CODCASTER_PLAYERLIST.GetCompetitiveName(var_3_0, arg_3_1, true)

		if var_3_2 then
			var_3_0 = var_3_2
		end
	end

	arg_3_0.Name:setText(var_3_0 or "")

	if arg_3_0.Name:getText() == "" then
		arg_3_0.isValidData = false
	else
		arg_3_0.isValidData = true
	end

	local var_3_3
	local var_3_4 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()
	local var_3_5, var_3_6 = Game.BEGGGADCJB(arg_3_1)

	assert(arg_3_0.PlayerCardImage)

	if var_3_4 then
		local var_3_7 = CODCASTER.GetMLGTeamInfo(var_3_5)

		if var_3_7 then
			var_3_3 = CODCASTER.GetCDLTeamPlayerCardIndex(var_3_7.teamUniformName)
		end
	end

	if not var_3_3 then
		local var_3_8 = Game.BABEFDCDIG(arg_3_1)

		var_3_3 = CallingCardUtils.GetCardTexture(var_3_8)
	end

	arg_3_0.PlayerCardImage:setImage(RegisterMaterial(var_3_3))

	if arg_3_0.Rank and arg_3_0.RankIcon then
		local var_3_9 = Game.BDHJABHDDC(arg_3_1)
		local var_3_10 = Game.DJEIFEHACJ(arg_3_1)

		if var_3_9 and var_3_10 then
			local var_3_11 = PROGRESSION.ValidatePrestigeLevel(var_3_10, {
				_isBackendPrestigeLevel = true
			})
			local var_3_12 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_3_9,
				_prestigeLevel = var_3_11
			})

			var_0_0(arg_3_0.Rank, var_3_12)
			arg_3_0.RankIcon:setImage(RegisterMaterial(var_3_12._rankIcon))
			arg_3_0.RankIcon:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_3_0, var_3_12._isUsingSeasonalRank and "ElderRank" or "StandardRank")
		else
			arg_3_0.Rank:setText("")
			arg_3_0.RankIcon:SetAlpha(0)
		end
	end

	assert(arg_3_0._controllerIndex)

	local var_3_13 = Game.BBCDHAEBHD(arg_3_1)
	local var_3_14 = var_3_13 and #var_3_13 > 0 and not Engine.EBCDCFCBE(var_3_13)
	local var_3_15 = Dvar.IBEGCHEFE("MNNLTTPSN")
	local var_3_16 = var_3_14 and not var_3_15 and Engine.DAGCEEFBBI(arg_3_0._controllerIndex, var_3_13)
	local var_3_17 = var_3_16 and Game.DFIJAJICCC(arg_3_1)

	if var_3_4 then
		CODCASTER.SetTeamColorLogo(arg_3_0.Emblem, arg_3_0._controllerIndex, var_3_5, false)
	elseif var_3_16 and var_3_17 then
		arg_3_0.Emblem:SetupUserEmblem({
			xuid = var_3_13
		})
	else
		arg_3_0.Emblem:setupUIImage()

		local var_3_18 = Game.BDEDHJGEGI(arg_3_1)

		if var_3_18 == nil or #var_3_18 == 0 then
			var_3_18 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end

		arg_3_0.Emblem:setImage(RegisterMaterial(var_3_18))
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0
	local var_4_1
	local var_4_2 = RANDOM.IsEnabled(arg_4_1, LOOT.itemTypes.PLAYERCARD)
	local var_4_3 = RANDOM.IsEnabled(arg_4_1, LOOT.itemTypes.PLAYERCARD, {
		isFav = true
	})

	if var_4_2 then
		var_4_0 = RANDOM.GetItemData(arg_4_1, {
			itemType = LOOT.itemTypes.PLAYERCARD
		}).image
	elseif var_4_3 then
		var_4_0 = RANDOM.GetItemData(arg_4_1, {
			isFav = true,
			itemType = LOOT.itemTypes.PLAYERCARD
		}).image
	end

	local var_4_4 = RANDOM.IsEnabled(arg_4_1, LOOT.itemTypes.EMBLEM)
	local var_4_5 = RANDOM.IsEnabled(arg_4_1, LOOT.itemTypes.EMBLEM, {
		isFav = true
	})

	if var_4_4 then
		var_4_1 = RANDOM.GetItemData(arg_4_1, {
			itemType = LOOT.itemTypes.EMBLEM
		}).image
	elseif var_4_5 then
		var_4_1 = RANDOM.GetItemData(arg_4_1, {
			isFav = true,
			itemType = LOOT.itemTypes.EMBLEM
		}).image
	end

	if var_4_0 ~= nil then
		arg_4_0.PlayerCardImage:setImage(RegisterMaterial(var_4_0))
	end

	if var_4_1 ~= nil then
		arg_4_0.Emblem:setImage(RegisterMaterial(var_4_1))
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.UpdateWithRandom = var_0_3
	arg_5_0.FillWithClientNum = var_0_2
	arg_5_0.FillWithPlayerData = var_0_1

	local var_5_0 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()

	if not var_5_0 then
		local function var_5_1()
			local var_6_0 = arg_5_0:GetDataSource().xuid

			assert(var_6_0 and type(var_6_0) == "table")

			local var_6_1 = var_6_0:GetValue(arg_5_1)
			local var_6_2 = var_6_1 and #var_6_1 > 0 and not Engine.EBCDCFCBE(var_6_1)
			local var_6_3 = arg_5_0:GetDataSource().customEmblemEquipped
			local var_6_4 = Dvar.IBEGCHEFE("MNNLTTPSN") ~= true
			local var_6_5 = arg_5_0:GetDataSource().emblem:GetValue(arg_5_1)

			if var_6_4 and var_6_3 and var_6_2 and var_6_3:GetValue(arg_5_1) then
				if Engine.DAGCEEFBBI(arg_5_1, var_6_1) then
					arg_5_0.Emblem:SetupUserEmblem({
						xuid = var_6_1
					})
				else
					arg_5_0.Emblem:setupUIImage()
					arg_5_0.Emblem:setImage(RegisterMaterial("ui_emblem_207"), 0)
				end
			else
				arg_5_0.Emblem:setupUIImage()

				if var_6_5 ~= nil and var_6_5 ~= "" then
					arg_5_0.Emblem:setImage(RegisterMaterial(var_6_5), 0)
				end
			end
		end

		arg_5_0:SubscribeToModelThroughElement(arg_5_0, "fullName", var_5_1, true)
		arg_5_0:SubscribeToModelThroughElement(arg_5_0, "customEmblemEquipped", var_5_1, true)
		arg_5_0:SubscribeToModelThroughElement(arg_5_0, "emblem", var_5_1)
		arg_5_0:SubscribeToModelThroughElement(arg_5_0, "xuid", var_5_1)
	end

	if Engine.DDJFBBJAIG() and arg_5_0.Rank and arg_5_0.RankIcon then
		arg_5_0.Rank:SetAlpha(0)
		arg_5_0.RankIcon:SetAlpha(0)

		local function var_5_2()
			local var_7_0 = arg_5_0:GetDataSource().rank:GetValue(arg_5_1)
			local var_7_1 = arg_5_0:GetDataSource().prestige:GetValue(arg_5_1)

			if var_7_0 ~= nil and var_7_1 ~= nil then
				local var_7_2 = PROGRESSION.ValidatePrestigeLevel(var_7_1, {
					_isBackendPrestigeLevel = true
				})
				local var_7_3 = PROGRESSION.GetPlayerProgressionData({
					_combinedRankNum = var_7_0,
					_prestigeLevel = var_7_2
				})

				var_0_0(arg_5_0.Rank, var_7_3)
				arg_5_0.Rank:SetAlpha(1)
				arg_5_0.RankIcon:setImage(RegisterMaterial(var_7_3._rankIcon))
				arg_5_0.RankIcon:SetAlpha(1)
			end
		end

		arg_5_0.Rank:SubscribeToModelThroughElement(arg_5_0, "displayRank", var_5_2)
	end

	if arg_5_0.PlayerCardImage and not var_5_0 then
		local function var_5_3()
			local var_8_0 = arg_5_0:GetDataSource().background:GetValue(arg_5_1)

			if var_8_0 and #var_8_0 > 0 and var_8_0 ~= "ui_default_white" then
				arg_5_0.PlayerCardImage:SetAlpha(1)
				arg_5_0.PlayerCardImage:setImage(RegisterMaterial(var_8_0), 0)
			else
				arg_5_0.PlayerCardImage:SetAlpha(0)
			end
		end

		arg_5_0.PlayerCardImage:SubscribeToModelThroughElement(arg_5_0, "background", var_5_3)
	end

	if arg_5_0.Emblem and not var_5_0 then
		local function var_5_4()
			local var_9_0 = arg_5_0:GetDataSource().emblem:GetValue(arg_5_1)

			if var_9_0 and #var_9_0 > 0 and var_9_0 ~= "ui_default_white" then
				arg_5_0.Emblem:SetAlpha(1)
				arg_5_0.Emblem:setImage(RegisterMaterial(var_9_0), 0)
			else
				arg_5_0.Emblem:SetAlpha(0)
			end
		end

		arg_5_0.Emblem:SubscribeToModelThroughElement(arg_5_0, "emblem", var_5_4)
	end
end

function SmallPlayerCard(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 124 * _1080p)

	var_10_0.id = "SmallPlayerCard"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "GradientBacker"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.3, 0)
	var_10_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 32)
	var_10_0:addElement(var_10_4)

	var_10_0.GradientBacker = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "PlayerCardImage"

	var_10_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 97, _1080p * 457, _1080p * -28, _1080p * 62)
	var_10_0:addElement(var_10_6)

	var_10_0.PlayerCardImage = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIStyledText.new()

	var_10_8.id = "Name"

	var_10_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_10_8:setText("", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 457, _1080p * 8, _1080p * 30)
	var_10_0:addElement(var_10_8)

	var_10_0.Name = var_10_8

	local var_10_9

	if CONDITIONS.IsPublicMatch(var_10_0) then
		var_10_9 = LUI.UIImage.new()
		var_10_9.id = "RankIcon"

		var_10_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * -28, _1080p * 32)
		var_10_0:addElement(var_10_9)

		var_10_0.RankIcon = var_10_9
	end

	local var_10_10

	if CONDITIONS.IsPublicMatch(var_10_0) then
		var_10_10 = LUI.UIStyledText.new()
		var_10_10.id = "Rank"

		var_10_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_10_10:SetAlpha(0.8, 0)
		var_10_10:setText("", 0)
		var_10_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_10_10:SetWordWrap(false)
		var_10_10:SetAlignment(LUI.Alignment.Center)
		var_10_10:SetShadowMinDistance(-0.3, 0)
		var_10_10:SetShadowMaxDistance(0.3, 0)
		var_10_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_10_10:SetOutlineMinDistance(-0.4, 0)
		var_10_10:SetOutlineRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_10_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * 32, _1080p * 62)
		var_10_0:addElement(var_10_10)

		var_10_0.Rank = var_10_10
	end

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "Emblem"

	var_10_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -28, _1080p * 62)
	var_10_0:addElement(var_10_12)

	var_10_0.Emblem = var_10_12

	local function var_10_13()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_13

	local var_10_14

	if CONDITIONS.IsPublicMatch(var_10_0) then
		local var_10_15 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.elderRank
			}
		}

		var_10_10:RegisterAnimationSequence("ElderRank", var_10_15)
	end

	local function var_10_16()
		if CONDITIONS.IsPublicMatch(var_10_0) then
			var_10_10:AnimateSequence("ElderRank")
		end
	end

	var_10_0._sequences.ElderRank = var_10_16

	local var_10_17

	if CONDITIONS.IsPublicMatch(var_10_0) then
		local var_10_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.HUDMain
			}
		}

		var_10_10:RegisterAnimationSequence("StandardRank", var_10_18)
	end

	local function var_10_19()
		if CONDITIONS.IsPublicMatch(var_10_0) then
			var_10_10:AnimateSequence("StandardRank")
		end
	end

	var_10_0._sequences.StandardRank = var_10_19

	local var_10_20

	if CONDITIONS.IsPublicMatch(var_10_0) then
		local var_10_21 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_9:RegisterAnimationSequence("NoRank", var_10_21)
	end

	if CONDITIONS.IsPublicMatch(var_10_0) then
		local var_10_22 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_10:RegisterAnimationSequence("NoRank", var_10_22)
	end

	local function var_10_23()
		if CONDITIONS.IsPublicMatch(var_10_0) then
			var_10_9:AnimateSequence("NoRank")
		end

		if CONDITIONS.IsPublicMatch(var_10_0) then
			var_10_10:AnimateSequence("NoRank")
		end
	end

	var_10_0._sequences.NoRank = var_10_23

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("SmallPlayerCard", SmallPlayerCard)
LockTable(_M)
