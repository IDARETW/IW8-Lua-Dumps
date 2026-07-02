module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Icon)
	assert(arg_1_0.PrivatePrivacySetting)

	if Lobby.DJJCFGDGGC(arg_1_1) then
		arg_1_0.Icon:setImage(RegisterMaterial("icon_private_match"), 0)
		arg_1_0.PrivatePrivacySetting:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PRIVATE"))
	else
		arg_1_0.Icon:setImage(RegisterMaterial("icon_public_match"), 0)
		arg_1_0.PrivatePrivacySetting:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY_PUBLIC"))
	end

	arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.gameType:GetModel(arg_1_1), function(arg_2_0)
		local var_2_0 = DataModel.JJEHAEBDF(arg_2_0):GetValue(arg_1_1)

		if not var_2_0 then
			return
		end

		local var_2_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_0, CSV.gameTypesTable.cols.image)
		local var_2_2 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_0, CSV.gameTypesTable.cols.desc)
		local var_2_3 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_0, CSV.gameTypesTable.cols.name)

		arg_1_0.GameTypeIcon:setImage(RegisterMaterial(var_2_1))
		arg_1_0.GameTypeDesc:setText(var_2_2)
		arg_1_0.GameType:setText(ToUpperCase(var_2_3))
	end)
end

function LobbyMatchDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 240 * _1080p)

	var_3_0.id = "LobbyMatchDetails"

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

	var_3_4.id = "Background"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Divider"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.headerBoarder, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 46, _1080p * 47)
	var_3_0:addElement(var_3_6)

	var_3_0.Divider = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "ChallengesTitle"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("MENU/MATCH_DETAILS"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, 0, _1080p * 17, _1080p * 41)
	var_3_0:addElement(var_3_8)

	var_3_0.ChallengesTitle = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "GameType"

	var_3_10:SetRGBFromTable(SWATCHES.Lobby.Header, 0)
	var_3_10:setText(ToUpperCase(""), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 130, _1080p * -20, _1080p * 60, _1080p * 90)
	var_3_0:addElement(var_3_10)

	var_3_0.GameType = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Icon"

	var_3_12:SetRGBFromTable(SWATCHES.Lobby.Accent, 0)
	var_3_12:setImage(RegisterMaterial("icon_private_match"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 32, _1080p * 96, _1080p * -66, _1080p * -2)
	var_3_0:addElement(var_3_12)

	var_3_0.Icon = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "GameTypeDesc"

	var_3_14:SetRGBFromTable(SWATCHES.Lobby.Header, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 130, _1080p * -50, _1080p * 95, _1080p * 113)
	var_3_0:addElement(var_3_14)

	var_3_0.GameTypeDesc = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "GameTypeIcon"

	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 127, _1080p * 47, _1080p * 174)

	local function var_3_17()
		local var_4_0 = DataSources.frontEnd.lobby.gameTypeImage:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_16:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	local var_3_18 = DataSources.frontEnd.lobby.gameTypeImage

	var_3_16:SubscribeToModel(var_3_18:GetModel(var_3_1), var_3_17)
	var_3_0:addElement(var_3_16)

	var_3_0.GameTypeIcon = var_3_16

	local var_3_19
	local var_3_20 = LUI.UIText.new()

	var_3_20.id = "PrivatePrivacyHeader"

	var_3_20:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_3_20:setText(Engine.CBBHFCGDIC("MENU/PARTY_PRIVACY"), 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Left)
	var_3_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 130, 0, _1080p * 176, _1080p * 200)
	var_3_0:addElement(var_3_20)

	var_3_0.PrivatePrivacyHeader = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "PrivatePrivacySetting"

	var_3_22:SetRGBFromTable(SWATCHES.Lobby.Header, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 130, _1080p * -50, _1080p * 205, _1080p * 223)
	var_3_0:addElement(var_3_22)

	var_3_0.PrivatePrivacySetting = var_3_22

	return var_3_0
end

MenuBuilder.registerType("LobbyMatchDetails", LobbyMatchDetails)
LockTable(_M)
