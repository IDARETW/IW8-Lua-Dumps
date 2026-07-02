module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = tostring(arg_1_2.gamertag)
	local var_1_1 = tostring(arg_1_2.gamertagWithHash)

	DebugPrint("WZSmallPlayerCard -> FillWithPlayerData -> gamerTagWithHashStr = " .. var_1_1)

	if var_1_1 and var_1_1 ~= "" then
		var_1_0 = var_1_1
	end

	assert(arg_1_0.Name)
	arg_1_0.Name:setText(var_1_0 or "")

	if arg_1_0.Name:getText() == "" then
		arg_1_0.isValidData = false
	else
		arg_1_0.isValidData = true
	end

	if arg_1_2.backgroundIndex then
		local var_1_2 = CallingCardUtils.GetCardTexture(arg_1_2.backgroundIndex)

		arg_1_0.PlayerCardImage:setImage(RegisterMaterial(var_1_2))
	end

	if arg_1_0.Rank and arg_1_0.RankIcon then
		local var_1_3 = PROGRESSION.ValidatePrestigeLevel(arg_1_2.prestige, {
			_isBackendPrestigeLevel = true
		})
		local var_1_4 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = arg_1_2.rank,
			_prestigeLevel = var_1_3
		})

		arg_1_0.Rank:setText(var_1_4._rankDisplay)

		local var_1_5 = var_1_4._rankIcon

		if var_1_5 and #var_1_5 > 0 then
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_5))
			arg_1_0.RankIcon:SetAlpha(1)
		else
			arg_1_0.RankIcon:SetAlpha(0)
		end

		arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_5))
	end

	if arg_1_2.emblemIndex then
		if EmblemEditorUtils.IsClanEmblem(arg_1_2.emblemIndex) then
			local var_1_6 = EmblemEditorUtils.GetClanEmblemImages(arg_1_1)

			arg_1_0.ClanEmblem:SetAlpha(1)
			arg_1_0.Emblem:SetAlpha(0)
			arg_1_0.ClanEmblem:SetEmblem(var_1_6, false)
		else
			arg_1_0.ClanEmblem:SetAlpha(0)
			arg_1_0.Emblem:SetAlpha(1)

			local var_1_7 = EmblemEditorUtils.GetEmblemImageFromID(arg_1_2.emblemIndex)

			if var_1_7 == nil or #var_1_7 == 0 then
				var_1_7 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
			end

			arg_1_0.Emblem:setImage(RegisterMaterial(var_1_7))
		end
	end

	if arg_1_2.frameIndex == nil or arg_1_2.frameIndex == CallingCardUtils.DefaultFrameIndex then
		arg_1_0.PlayerCardFrameImage:SetAlpha(0)
	else
		local var_1_8 = CallingCardFramesUtils.GetFrameTexture(arg_1_2.frameIndex)

		arg_1_0.PlayerCardFrameImage:setImage(RegisterMaterial(var_1_8))
		arg_1_0.PlayerCardFrameImage:SetAlpha(1)
	end

	if arg_1_2.titleIndex then
		if arg_1_2.titleIndex == PlayerTitleUtils.DefaultTitleID then
			arg_1_0.PlayerTitle:SetAlpha(0)
			arg_1_0.TitleBacker:SetAlpha(0)
		else
			arg_1_0.PlayerTitle:SetAlpha(1)
			arg_1_0.TitleBacker:SetAlpha(0.5)

			local var_1_9 = PlayerTitleUtils.GetTitleNameFromID(arg_1_2.titleIndex)

			if var_1_9 ~= "" then
				arg_1_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_1_9)))
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if not CONDITIONS.IsThirdGameMode() then
		assert(arg_2_1 >= 0)
	end

	if arg_2_1 < 0 then
		return
	end

	local var_2_0 = Game.DEAIDCJCEH(arg_2_1)
	local var_2_1 = tostring(Game.BHJIEAICAH(arg_2_1))

	DebugPrint("SmallPlayerCard -> FillWithClientNum -> fullNameWithHash = " .. var_2_1)

	if var_2_1 and var_2_1 ~= "" then
		var_2_0 = var_2_1
	end

	assert(arg_2_0.Name)

	if MLG.FBFGBEC() then
		local var_2_2 = CODCASTER_PLAYERLIST.GetCompetitiveName(var_2_0, arg_2_1, true)

		if var_2_2 then
			var_2_0 = var_2_2
		end
	end

	arg_2_0.Name:setText(var_2_0 or "")

	if arg_2_0.Name:getText() == "" then
		arg_2_0.isValidData = false
	else
		arg_2_0.isValidData = true
	end

	local var_2_3
	local var_2_4 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()
	local var_2_5, var_2_6 = Game.BEGGGADCJB(arg_2_1)

	assert(arg_2_0.PlayerCardImage)

	if var_2_4 then
		local var_2_7 = CODCASTER.GetMLGTeamInfo(var_2_5)

		if var_2_7 then
			var_2_3 = CODCASTER.GetCDLTeamPlayerCardIndex(var_2_7.teamUniformName)
		end
	end

	if not var_2_3 then
		local var_2_8 = Game.BABEFDCDIG(arg_2_1)

		var_2_3 = CallingCardUtils.GetCardTexture(var_2_8)
	end

	arg_2_0.PlayerCardImage:setImage(RegisterMaterial(var_2_3))

	if arg_2_0.Rank and arg_2_0.RankIcon then
		local var_2_9 = Game.BDHJABHDDC(arg_2_1)
		local var_2_10 = Game.DJEIFEHACJ(arg_2_1)

		if var_2_9 and var_2_10 then
			local var_2_11 = PROGRESSION.ValidatePrestigeLevel(var_2_10, {
				_isBackendPrestigeLevel = true
			})
			local var_2_12 = PROGRESSION.GetPlayerProgressionData({
				_combinedRankNum = var_2_9,
				_prestigeLevel = var_2_11
			})

			arg_2_0.Rank:setText(var_2_12._rankDisplay)
			arg_2_0.RankIcon:setImage(RegisterMaterial(var_2_12._rankIcon))
			arg_2_0.RankIcon:SetAlpha(1)
			ACTIONS.AnimateSequence(arg_2_0, var_2_12._isUsingSeasonalRank and "ElderRank" or "StandardRank")
		else
			arg_2_0.Rank:setText("")
			arg_2_0.RankIcon:SetAlpha(0)
		end
	end

	assert(arg_2_0._controllerIndex)

	local var_2_13 = Game.BBCDHAEBHD(arg_2_1)
	local var_2_14 = var_2_13 and #var_2_13 > 0 and not Engine.EBCDCFCBE(var_2_13)
	local var_2_15 = Dvar.IBEGCHEFE("MNNLTTPSN")
	local var_2_16 = var_2_14 and not var_2_15 and Engine.DAGCEEFBBI(arg_2_0._controllerIndex, var_2_13)
	local var_2_17 = var_2_16 and Game.DFIJAJICCC(arg_2_1)
	local var_2_18 = EmblemEditorUtils.IsClanEmblemEnabled(arg_2_2) and EmblemEditorUtils.GetClanEmblemData(arg_2_2, {
		itemType = LOOT.itemTypes.EMBLEM
	}) or nil

	if var_2_4 then
		CODCASTER.SetTeamColorLogo(arg_2_0.Emblem, arg_2_0._controllerIndex, var_2_5, false)
	elseif var_2_16 and var_2_17 then
		arg_2_0.Emblem:SetupUserEmblem({
			xuid = var_2_13
		})
	elseif var_2_18 then
		local var_2_19 = var_2_18.clanEmblemData

		if var_2_19 then
			arg_2_0:SetClanEmblem(var_2_19)
		end
	else
		arg_2_0.Emblem:setupUIImage()

		local var_2_20 = Game.BDEDHJGEGI(arg_2_1)

		if var_2_20 == nil or #var_2_20 == 0 then
			var_2_20 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end

		arg_2_0.Emblem:setImage(RegisterMaterial(var_2_20))
	end

	local var_2_21 = Game.JACHDAGB(arg_2_1)

	if var_2_21 == CallingCardUtils.DefaultFrameIndex then
		arg_2_0.PlayerCardFrameImage:SetAlpha(0)
	else
		local var_2_22 = CallingCardFramesUtils.GetFrameTexture(var_2_21)

		arg_2_0.PlayerCardFrameImage:setImage(RegisterMaterial(var_2_22))
		arg_2_0.PlayerCardFrameImage:SetAlpha(1)
	end

	local var_2_23 = Game.JECHIHCAA(arg_2_1)

	if var_2_23 == PlayerTitleUtils.DefaultTitleID then
		arg_2_0.PlayerTitle:SetAlpha(0)
		arg_2_0.TitleBacker:SetAlpha(0)
	else
		arg_2_0.PlayerTitle:SetAlpha(1)
		arg_2_0.TitleBacker:SetAlpha(0.5)

		local var_2_24 = PlayerTitleUtils.GetTitleNameFromID(var_2_23)

		if var_2_24 ~= "" then
			arg_2_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_2_24)))
		end
	end

	arg_2_0.GradientBacker:SetAlpha(0.3)
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0
	local var_3_1
	local var_3_2
	local var_3_3
	local var_3_4
	local var_3_5 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.PLAYERCARD)
	local var_3_6 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.PLAYERCARD, {
		isFav = true
	})

	if var_3_5 then
		var_3_0 = RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.PLAYERCARD
		}).image
	elseif var_3_6 then
		var_3_0 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.PLAYERCARD
		}).image
	end

	local var_3_7 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.EMBLEM)
	local var_3_8 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.EMBLEM, {
		isFav = true
	})

	if var_3_7 then
		var_3_1 = RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.EMBLEM
		}).image
	elseif var_3_8 then
		var_3_1 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.EMBLEM
		}).image
	end

	local var_3_9 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.FRAME)
	local var_3_10 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.FRAME, {
		isFav = true
	})

	if var_3_9 then
		var_3_2 = RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.FRAME
		}).image
	elseif var_3_10 then
		var_3_2 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.FRAME
		}).image
	end

	local var_3_11 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.TITLE)
	local var_3_12 = RANDOM.IsEnabled(arg_3_1, LOOT.itemTypes.TITLE, {
		isFav = true
	})

	if var_3_11 then
		local var_3_13 = RANDOM.GetItemData(arg_3_1, {
			itemType = LOOT.itemTypes.TITLE
		})

		var_3_3 = var_3_13.name
		var_3_4 = var_3_13.index
	elseif var_3_12 then
		local var_3_14 = RANDOM.GetItemData(arg_3_1, {
			isFav = true,
			itemType = LOOT.itemTypes.TITLE
		})

		var_3_3 = var_3_14.name
		var_3_4 = var_3_14.index
	end

	if var_3_0 ~= nil then
		arg_3_0.PlayerCardImage:setImage(RegisterMaterial(var_3_0))
	end

	if var_3_1 ~= nil then
		arg_3_0.Emblem:setImage(RegisterMaterial(var_3_1))
	end

	if var_3_2 ~= nil then
		arg_3_0.PlayerCardFrameImage:setImage(RegisterMaterial(var_3_2))
	end

	if var_3_3 ~= nil and var_3_3 ~= "" then
		if var_3_4 == PlayerTitleUtils.DefaultTitleID then
			arg_3_0.PlayerTitle:SetAlpha(0)
			arg_3_0.TitleBacker:SetAlpha(0)
		else
			arg_3_0.PlayerTitle:SetAlpha(1)
			arg_3_0.TitleBacker:SetAlpha(0.5)
			arg_3_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_3_3)))
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.ClanEmblem:SetAlpha(1)
	arg_4_0.Emblem:SetAlpha(0)
	arg_4_0.ClanEmblem:SetEmblem(arg_4_1, false)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.ClanEmblem:SetAlpha(0)
	arg_5_0.Emblem:SetAlpha(1)
	arg_5_0.Emblem:setImage(RegisterMaterial(arg_5_1))
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1
	arg_6_0.UpdateWithRandom = var_0_2
	arg_6_0.FillWithClientNum = var_0_1
	arg_6_0.FillWithPlayerData = var_0_0
	arg_6_0.SetClanEmblem = var_0_3
	arg_6_0.SetEmblem = var_0_4

	local var_6_0 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()

	if not var_6_0 then
		local function var_6_1()
			local var_7_0 = arg_6_0:GetDataSource().xuid

			assert(var_7_0 and type(var_7_0) == "table")

			local var_7_1 = var_7_0:GetValue(arg_6_1)
			local var_7_2 = var_7_1 and #var_7_1 > 0 and not Engine.EBCDCFCBE(var_7_1)
			local var_7_3 = arg_6_0:GetDataSource().customEmblemEquipped
			local var_7_4 = Dvar.IBEGCHEFE("MNNLTTPSN") ~= true
			local var_7_5 = arg_6_0:GetDataSource().emblem:GetValue(arg_6_1)

			if var_7_4 and var_7_3 and var_7_2 and var_7_3:GetValue(arg_6_1) then
				if Engine.DAGCEEFBBI(arg_6_1, var_7_1) then
					arg_6_0.Emblem:SetupUserEmblem({
						xuid = var_7_1
					})
				else
					arg_6_0.Emblem:setupUIImage()
					arg_6_0.Emblem:setImage(RegisterMaterial("ui_emblem_207"), 0)
				end
			else
				arg_6_0.Emblem:setupUIImage()

				if var_7_5 ~= nil and var_7_5 ~= "" then
					arg_6_0.Emblem:setImage(RegisterMaterial(var_7_5), 0)
				end
			end
		end

		arg_6_0:SubscribeToModelThroughElement(arg_6_0, "fullName", var_6_1, true)
		arg_6_0:SubscribeToModelThroughElement(arg_6_0, "customEmblemEquipped", var_6_1, true)
		arg_6_0:SubscribeToModelThroughElement(arg_6_0, "emblem", var_6_1)
		arg_6_0:SubscribeToModelThroughElement(arg_6_0, "xuid", var_6_1)
	end

	if Engine.DDJFBBJAIG() and arg_6_0.Rank and arg_6_0.RankIcon then
		arg_6_0.Rank:SetAlpha(0)
		arg_6_0.RankIcon:SetAlpha(0)

		local function var_6_2()
			local var_8_0 = arg_6_0:GetDataSource().rank:GetValue(arg_6_1)
			local var_8_1 = arg_6_0:GetDataSource().prestige:GetValue(arg_6_1)

			if var_8_0 ~= nil and var_8_1 ~= nil then
				local var_8_2 = PROGRESSION.ValidatePrestigeLevel(var_8_1, {
					_isBackendPrestigeLevel = true
				})
				local var_8_3 = PROGRESSION.GetPlayerProgressionData({
					_combinedRankNum = var_8_0,
					_prestigeLevel = var_8_2
				})

				arg_6_0.Rank:setText(var_8_3._rankDisplay)
				arg_6_0.Rank:SetAlpha(1)
				arg_6_0.RankIcon:setImage(RegisterMaterial(var_8_3._rankIcon))
				arg_6_0.RankIcon:SetAlpha(1)
			end
		end

		arg_6_0.Rank:SubscribeToModelThroughElement(arg_6_0, "displayRank", var_6_2)
	end

	if arg_6_0.PlayerCardImage and not var_6_0 then
		local function var_6_3()
			local var_9_0 = arg_6_0:GetDataSource().background:GetValue(arg_6_1)

			if var_9_0 and #var_9_0 > 0 and var_9_0 ~= "ui_default_white" then
				arg_6_0.PlayerCardImage:SetAlpha(1)
				arg_6_0.PlayerCardImage:setImage(RegisterMaterial(var_9_0), 0)
			else
				arg_6_0.PlayerCardImage:SetAlpha(0)
			end
		end

		arg_6_0.PlayerCardImage:SubscribeToModelThroughElement(arg_6_0, "background", var_6_3)
	end

	if arg_6_0.Emblem and not var_6_0 then
		local function var_6_4()
			if EmblemEditorUtils.IsClanEmblemEnabled(arg_6_0._controllerIndex) then
				arg_6_0.Emblem:SetAlpha(0)
				arg_6_0.ClanEmblem:SetAlpha(1)

				local var_10_0 = EmblemEditorUtils.GetClanEmblemImages(arg_6_0._controllerIndex)

				arg_6_0.ClanEmblem:SetEmblem(var_10_0, false)
			else
				local var_10_1 = arg_6_0:GetDataSource().emblem:GetValue(arg_6_1)

				if var_10_1 and #var_10_1 > 0 and var_10_1 ~= "ui_default_white" then
					arg_6_0.Emblem:SetAlpha(1)
					arg_6_0.ClanEmblem:SetAlpha(0)
					arg_6_0.Emblem:setImage(RegisterMaterial(var_10_1), 0)
				else
					arg_6_0.Emblem:SetAlpha(0)
					arg_6_0.ClanEmblem:SetAlpha(0)
				end
			end
		end

		arg_6_0.Emblem:SubscribeToModelThroughElement(arg_6_0, "emblem", var_6_4)
	end

	if arg_6_0.PlayerCardFrameImage and not var_6_0 then
		local function var_6_5()
			local var_11_0 = arg_6_0:GetDataSource().frame:GetValue(arg_6_1)

			if var_11_0 and #var_11_0 > 0 and var_11_0 ~= "ui_default_white" then
				arg_6_0.PlayerCardFrameImage:SetAlpha(1)
				arg_6_0.PlayerCardFrameImage:setImage(RegisterMaterial(var_11_0), 0)
			else
				arg_6_0.PlayerCardFrameImage:SetAlpha(0)
			end
		end

		arg_6_0.PlayerCardFrameImage:SubscribeToModelThroughElement(arg_6_0, "frame", var_6_5)
	end

	if arg_6_0.PlayerTitle and not var_6_0 then
		local function var_6_6()
			local var_12_0 = arg_6_0:GetDataSource().title:GetValue(arg_6_1)

			if var_12_0 then
				local var_12_1 = PlayerTitleUtils.GetTitleName(var_12_0)

				if var_12_1 == PlayerTitleUtils.GetTitleNameFromID(PlayerTitleUtils.DefaultTitleID) then
					arg_6_0.PlayerTitle:SetAlpha(0)
					arg_6_0.TitleBacker:SetAlpha(0)
				elseif var_12_1 ~= "" then
					arg_6_0.PlayerTitle:SetAlpha(1)
					arg_6_0.TitleBacker:SetAlpha(0.5)
					arg_6_0.PlayerTitle:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(var_12_1)))
				end
			else
				arg_6_0.PlayerTitle:SetAlpha(0)
				arg_6_0.TitleBacker:SetAlpha(0)
			end
		end

		arg_6_0.PlayerTitle:SubscribeToModelThroughElement(arg_6_0, "title", var_6_6)
	end
end

function WZSmallPlayerCard(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 124 * _1080p)

	var_13_0.id = "WZSmallPlayerCard"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "GradientBacker"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.3, 0)
	var_13_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 32)
	var_13_0:addElement(var_13_4)

	var_13_0.GradientBacker = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "PlayerCardImage"

	var_13_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 126, _1080p * 429, _1080p * -18, _1080p * 52)
	var_13_0:addElement(var_13_6)

	var_13_0.PlayerCardImage = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIStyledText.new()

	var_13_8.id = "Name"

	var_13_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_13_8:setText("", 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 457, _1080p * 8, _1080p * 30)
	var_13_0:addElement(var_13_8)

	var_13_0.Name = var_13_8

	local var_13_9

	if CONDITIONS.IsPublicMatch() then
		var_13_9 = LUI.UIImage.new()
		var_13_9.id = "RankIcon"

		var_13_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * -28, _1080p * 32)
		var_13_0:addElement(var_13_9)

		var_13_0.RankIcon = var_13_9
	end

	local var_13_10

	if CONDITIONS.IsPublicMatch() then
		var_13_10 = LUI.UIStyledText.new()
		var_13_10.id = "Rank"

		var_13_10:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_13_10:SetAlpha(0.8, 0)
		var_13_10:setText("", 0)
		var_13_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_13_10:SetWordWrap(false)
		var_13_10:SetAlignment(LUI.Alignment.Center)
		var_13_10:SetShadowMinDistance(-0.3, 0)
		var_13_10:SetShadowMaxDistance(0.3, 0)
		var_13_10:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_13_10:SetOutlineMinDistance(-0.4, 0)
		var_13_10:SetOutlineRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_13_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * 32, _1080p * 62)
		var_13_0:addElement(var_13_10)

		var_13_0.Rank = var_13_10
	end

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "Emblem"

	var_13_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -28, _1080p * 62)
	var_13_0:addElement(var_13_12)

	var_13_0.Emblem = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("ClanEmblemWidget", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "ClanEmblem"

	var_13_14:SetAlpha(0, 0)
	var_13_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -28, _1080p * 62)
	var_13_0:addElement(var_13_14)

	var_13_0.ClanEmblem = var_13_14

	local var_13_15
	local var_13_16 = LUI.UIImage.new()

	var_13_16.id = "PlayerCardFrameImage"

	var_13_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 126, _1080p * 429, _1080p * -18, _1080p * 52)
	var_13_0:addElement(var_13_16)

	var_13_0.PlayerCardFrameImage = var_13_16

	local var_13_17
	local var_13_18 = LUI.UIImage.new()

	var_13_18.id = "TitleBacker"

	var_13_18:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_13_18:SetAlpha(0.5, 0)
	var_13_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 126, _1080p * 429, _1080p * 92, _1080p * 114)
	var_13_0:addElement(var_13_18)

	var_13_0.TitleBacker = var_13_18

	local var_13_19
	local var_13_20 = LUI.UIStyledText.new()

	var_13_20.id = "PlayerTitle"

	var_13_20:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_13_20:setText(ToUpperCase(""), 0)
	var_13_20:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_13_20:SetAlignment(LUI.Alignment.Left)
	var_13_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_13_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 131, _1080p * 429, _1080p * 92, _1080p * 114)
	var_13_0:addElement(var_13_20)

	var_13_0.PlayerTitle = var_13_20

	local function var_13_21()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_21

	local var_13_22

	if CONDITIONS.IsPublicMatch() then
		local var_13_23 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.elderRank
			}
		}

		var_13_10:RegisterAnimationSequence("ElderRank", var_13_23)
	end

	local var_13_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("ElderRank", var_13_24)

	local function var_13_25()
		if CONDITIONS.IsPublicMatch() then
			var_13_10:AnimateSequence("ElderRank")
		end

		var_13_20:AnimateSequence("ElderRank")
	end

	var_13_0._sequences.ElderRank = var_13_25

	local var_13_26
	local var_13_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("StandardRank", var_13_27)

	if CONDITIONS.IsPublicMatch() then
		local var_13_28 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.HUDMain
			}
		}

		var_13_10:RegisterAnimationSequence("StandardRank", var_13_28)
	end

	local var_13_29 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("StandardRank", var_13_29)

	local function var_13_30()
		var_13_4:AnimateSequence("StandardRank")

		if CONDITIONS.IsPublicMatch() then
			var_13_10:AnimateSequence("StandardRank")
		end

		var_13_20:AnimateSequence("StandardRank")
	end

	var_13_0._sequences.StandardRank = var_13_30

	local var_13_31
	local var_13_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_4:RegisterAnimationSequence("NoRank", var_13_32)

	if CONDITIONS.IsPublicMatch() then
		local var_13_33 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_9:RegisterAnimationSequence("NoRank", var_13_33)
	end

	if CONDITIONS.IsPublicMatch() then
		local var_13_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_10:RegisterAnimationSequence("NoRank", var_13_34)
	end

	local var_13_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_20:RegisterAnimationSequence("NoRank", var_13_35)

	local function var_13_36()
		var_13_4:AnimateSequence("NoRank")

		if CONDITIONS.IsPublicMatch() then
			var_13_9:AnimateSequence("NoRank")
		end

		if CONDITIONS.IsPublicMatch() then
			var_13_10:AnimateSequence("NoRank")
		end

		var_13_20:AnimateSequence("NoRank")
	end

	var_13_0._sequences.NoRank = var_13_36

	var_0_5(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("WZSmallPlayerCard", WZSmallPlayerCard)
LockTable(_M)
