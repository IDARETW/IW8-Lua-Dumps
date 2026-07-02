module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not CONDITIONS.IsThirdGameMode() then
		assert(arg_1_1 >= 0)
	end

	if arg_1_1 < 0 then
		return
	end

	local var_1_0 = Game.DEAIDCJCEH(arg_1_1)

	assert(arg_1_0.Name)

	if MLG.FBFGBEC() then
		local var_1_1 = CODCASTER_PLAYERLIST.GetCompetitiveName(var_1_0, arg_1_1, true)

		if var_1_1 then
			var_1_0 = var_1_1
		end
	end

	arg_1_0.Name:setText(var_1_0 or "")

	if arg_1_0.Name:getText() == "" then
		arg_1_0.isValidData = false
	else
		arg_1_0.isValidData = true
	end

	local var_1_2
	local var_1_3 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()
	local var_1_4, var_1_5 = Game.BEGGGADCJB(arg_1_1)

	assert(arg_1_0.PlayerCardImage)

	if var_1_3 then
		local var_1_6 = CODCASTER.GetMLGTeamInfo(var_1_4)

		if var_1_6 then
			var_1_2 = CODCASTER.GetCDLTeamPlayerCardIndex(var_1_6.teamUniformName)
		end
	end

	var_1_2 = var_1_2 or CallingCardUtils.GetCardTexture(Game.BABEFDCDIG(arg_1_1))

	arg_1_0.PlayerCardImage:setImage(RegisterMaterial(var_1_2))

	if arg_1_0.Rank then
		local var_1_7 = Game.BAJEAFFCGG(arg_1_1)

		if var_1_7 and #var_1_7 > 0 then
			arg_1_0.Rank:setText(var_1_7)
			ACTIONS.AnimateSequence(arg_1_0, PROGRESSION.IsElderRank(tonumber(var_1_7)) and "ElderRank" or "StandardRank")
		else
			arg_1_0.Rank:setText("")
		end
	end

	if arg_1_0.RankIcon then
		local var_1_8 = Game.HGEFIIJID(arg_1_1)

		if var_1_8 and #var_1_8 > 0 then
			arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_8))
			arg_1_0.RankIcon:SetAlpha(1)
		else
			arg_1_0.RankIcon:SetAlpha(0)
		end
	end

	assert(arg_1_0._controllerIndex)

	local var_1_9 = Game.BBCDHAEBHD(arg_1_1)
	local var_1_10 = var_1_9 and #var_1_9 > 0 and not Engine.EBCDCFCBE(var_1_9)
	local var_1_11 = Dvar.IBEGCHEFE("MNNLTTPSN") == true
	local var_1_12 = var_1_10 and not var_1_11 and Engine.DAGCEEFBBI(arg_1_0._controllerIndex, var_1_9)
	local var_1_13 = var_1_12 and Game.DFIJAJICCC(arg_1_1)

	if var_1_3 then
		CODCASTER.SetTeamColorLogo(arg_1_0.Emblem, arg_1_0._controllerIndex, var_1_4, false)
	elseif var_1_12 and var_1_13 then
		arg_1_0.Emblem:SetupUserEmblem({
			xuid = var_1_9
		})
	else
		arg_1_0.Emblem:setupUIImage()

		local var_1_14 = Game.BDEDHJGEGI(arg_1_1)

		if var_1_14 == nil or #var_1_14 == 0 then
			var_1_14 = EmblemEditorUtils.GetEmblemImageFromID(EmblemEditorUtils.DefaultEmblemIndex)
		end

		arg_1_0.Emblem:setImage(RegisterMaterial(var_1_14))
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.FillWithClientNum = var_0_0

	local var_2_0 = MLG.DBIBHEAEGD() and CODCASTER_CONDITIONS.IsMPCODCaster()

	if not var_2_0 then
		local function var_2_1()
			local var_3_0 = arg_2_0:GetDataSource().xuid

			assert(var_3_0 and type(var_3_0) == "table")

			local var_3_1 = var_3_0:GetValue(arg_2_1)
			local var_3_2 = var_3_1 and #var_3_1 > 0 and not Engine.EBCDCFCBE(var_3_1)
			local var_3_3 = arg_2_0:GetDataSource().customEmblemEquipped
			local var_3_4 = Dvar.IBEGCHEFE("MNNLTTPSN") ~= true
			local var_3_5 = arg_2_0:GetDataSource().emblem:GetValue(arg_2_1)

			if var_3_4 and var_3_3 and var_3_2 and var_3_3:GetValue(arg_2_1) then
				if Engine.DAGCEEFBBI(arg_2_1, var_3_1) then
					arg_2_0.Emblem:SetupUserEmblem({
						xuid = var_3_1
					})
				else
					arg_2_0.Emblem:setupUIImage()
					arg_2_0.Emblem:setImage(RegisterMaterial("ui_emblem_207"), 0)
				end
			else
				arg_2_0.Emblem:setupUIImage()

				if var_3_5 ~= nil and var_3_5 ~= "" then
					arg_2_0.Emblem:setImage(RegisterMaterial(var_3_5), 0)
				end
			end
		end

		arg_2_0:SubscribeToModelThroughElement(arg_2_0, "fullName", var_2_1, true)
		arg_2_0:SubscribeToModelThroughElement(arg_2_0, "customEmblemEquipped", var_2_1, true)
		arg_2_0:SubscribeToModelThroughElement(arg_2_0, "emblem", var_2_1)
		arg_2_0:SubscribeToModelThroughElement(arg_2_0, "xuid", var_2_1)
	end

	if Engine.DDJFBBJAIG() then
		if arg_2_0.RankIcon then
			arg_2_0.RankIcon:SetAlpha(0)

			local function var_2_2()
				local var_4_0 = arg_2_0:GetDataSource().rankIcon:GetValue(arg_2_1)

				if var_4_0 ~= nil then
					arg_2_0.RankIcon:SetAlpha(1)
					arg_2_0.RankIcon:setImage(RegisterMaterial(var_4_0))
				end
			end

			arg_2_0.RankIcon:SubscribeToModelThroughElement(arg_2_0, "rankIcon", var_2_2)
		end

		if arg_2_0.Rank then
			arg_2_0.Rank:SetAlpha(0)

			local function var_2_3()
				local var_5_0 = arg_2_0:GetDataSource().displayRank:GetValue(arg_2_1)

				if var_5_0 ~= nil then
					arg_2_0.Rank:setText(var_5_0, 0)
					arg_2_0.Rank:SetAlpha(1)
				end
			end

			arg_2_0.Rank:SubscribeToModelThroughElement(arg_2_0, "displayRank", var_2_3)
		end
	end

	if arg_2_0.PlayerCardImage and not var_2_0 then
		local function var_2_4()
			local var_6_0 = arg_2_0:GetDataSource().background:GetValue(arg_2_1)

			if var_6_0 and #var_6_0 > 0 and var_6_0 ~= "ui_default_white" then
				arg_2_0.PlayerCardImage:SetAlpha(1)
				arg_2_0.PlayerCardImage:setImage(RegisterMaterial(var_6_0), 0)
			else
				arg_2_0.PlayerCardImage:SetAlpha(0)
			end
		end

		arg_2_0.PlayerCardImage:SubscribeToModelThroughElement(arg_2_0, "background", var_2_4)
	end

	if arg_2_0.Emblem and not var_2_0 then
		local function var_2_5()
			local var_7_0 = arg_2_0:GetDataSource().emblem:GetValue(arg_2_1)

			if var_7_0 and #var_7_0 > 0 and var_7_0 ~= "ui_default_white" then
				arg_2_0.Emblem:SetAlpha(1)
				arg_2_0.Emblem:setImage(RegisterMaterial(var_7_0), 0)
			else
				arg_2_0.Emblem:SetAlpha(0)
			end
		end

		arg_2_0.Emblem:SubscribeToModelThroughElement(arg_2_0, "emblem", var_2_5)
	end
end

function SmallPlayerCard(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 520 * _1080p, 0, 124 * _1080p)

	var_8_0.id = "SmallPlayerCard"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "GradientBacker"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.3, 0)
	var_8_4:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, _1080p * 32)
	var_8_0:addElement(var_8_4)

	var_8_0.GradientBacker = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "PlayerCardImage"

	var_8_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 97, _1080p * 457, _1080p * -28, _1080p * 62)
	var_8_0:addElement(var_8_6)

	var_8_0.PlayerCardImage = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "Name"

	var_8_8:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 6, _1080p * 457, _1080p * 8, _1080p * 30)
	var_8_0:addElement(var_8_8)

	var_8_0.Name = var_8_8

	local var_8_9

	if CONDITIONS.IsPublicMatch(var_8_0) then
		local var_8_10 = LUI.UIImage.new()

		var_8_10.id = "RankIcon"

		var_8_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * -28, _1080p * 32)
		var_8_0:addElement(var_8_10)

		var_8_0.RankIcon = var_8_10
	end

	local var_8_11

	if CONDITIONS.IsPublicMatch(var_8_0) then
		var_8_11 = LUI.UIStyledText.new()
		var_8_11.id = "Rank"

		var_8_11:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_8_11:SetAlpha(0.8, 0)
		var_8_11:setText("", 0)
		var_8_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_8_11:SetWordWrap(false)
		var_8_11:SetAlignment(LUI.Alignment.Center)
		var_8_11:SetShadowMinDistance(-0.3, 0)
		var_8_11:SetShadowMaxDistance(0.3, 0)
		var_8_11:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_8_11:SetOutlineMinDistance(-0.4, 0)
		var_8_11:SetOutlineRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
		var_8_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 457, _1080p * 517, _1080p * 32, _1080p * 62)
		var_8_0:addElement(var_8_11)

		var_8_0.Rank = var_8_11
	end

	local var_8_12
	local var_8_13 = LUI.UIImage.new()

	var_8_13.id = "Emblem"

	var_8_13:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 96, _1080p * -28, _1080p * 62)
	var_8_0:addElement(var_8_13)

	var_8_0.Emblem = var_8_13

	local function var_8_14()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_14

	if CONDITIONS.IsPublicMatch(var_8_0) then
		local var_8_15 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.elderRank
			}
		}

		var_8_11:RegisterAnimationSequence("ElderRank", var_8_15)
	end

	local function var_8_16()
		if CONDITIONS.IsPublicMatch(var_8_0) then
			var_8_11:AnimateSequence("ElderRank")
		end
	end

	var_8_0._sequences.ElderRank = var_8_16

	if CONDITIONS.IsPublicMatch(var_8_0) then
		local var_8_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.HUDMain
			}
		}

		var_8_11:RegisterAnimationSequence("StandardRank", var_8_17)
	end

	local function var_8_18()
		if CONDITIONS.IsPublicMatch(var_8_0) then
			var_8_11:AnimateSequence("StandardRank")
		end
	end

	var_8_0._sequences.StandardRank = var_8_18

	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SmallPlayerCard", SmallPlayerCard)
LockTable(_M)
