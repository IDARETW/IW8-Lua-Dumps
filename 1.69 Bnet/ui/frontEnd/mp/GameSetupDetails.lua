module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.MapText)

	local function var_1_0(arg_2_0)
		local var_2_0

		if arg_2_0 then
			local var_2_1 = Dvar.DHEEJCCJBH("NSQLTTMRMP")
			local var_2_2 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, var_2_1, CSV.mpMapTable.cols.name)

			if #var_2_2 == 0 then
				var_2_2 = DataSources.frontEnd.lobby.mapName:GetValue(arg_1_1)
			end

			var_2_0 = Engine.CBBHFCGDIC(var_2_2)
		else
			var_2_0 = DataSources.frontEnd.lobby.mapName:GetValue(arg_1_1)
		end

		if var_2_0 ~= nil then
			arg_1_0.MapText:setText(var_2_0)
		else
			arg_1_0.MapText:setText("")
		end

		local var_2_3 = DataSources.frontEnd.lobby.gameType:GetValue(arg_1_1)

		if MatchRules.EAIEFBHGJ() and MatchRules.BIJEDCBCBH(Lobby.MatchRulesClasses.CommonOption, Lobby.MatchRulesMembers.TacticalModeOn) then
			local var_2_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_3, CSV.gameTypesTable.cols.realismImage)

			if var_2_4 == "" then
				var_2_4 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_3, CSV.gameTypesTable.cols.image)
			end

			arg_1_0.GameModeImage:setImage(RegisterMaterial(var_2_4))
		elseif MLG.IsCDLActive(arg_1_1) then
			local var_2_5 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_2_3, CSV.gameTypesTable.cols.CDLImage)

			arg_1_0.GameModeImage:setImage(RegisterMaterial(var_2_5))
		end
	end

	var_1_0(true)

	if CONDITIONS.IsCoreMultiplayer(arg_1_0) then
		arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.mapRef:GetModel(arg_1_1), var_1_0)
	else
		arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.mapName:GetModel(arg_1_1), var_1_0)
	end
end

function GameSetupDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 80 * _1080p)

	var_3_0.id = "GameSetupDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "GameModeText"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_4:SetStartupDelay(1000)
	var_3_4:SetLineHoldTime(400)
	var_3_4:SetAnimMoveTime(2000)
	var_3_4:SetAnimMoveSpeed(150)
	var_3_4:SetEndDelay(1000)
	var_3_4:SetCrossfadeTime(1000)
	var_3_4:SetFadeInTime(300)
	var_3_4:SetFadeOutTime(300)
	var_3_4:SetMaxVisibleLines(2)
	var_3_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 98, _1080p * 422, _1080p * -72, _1080p * -36)

	local function var_3_5()
		local var_4_0 = DataSources.frontEnd.lobby.gameTypeNameWithModifier:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4:setText(ToUpperCase(var_4_0), 0)
		end
	end

	local var_3_6 = DataSources.frontEnd.lobby.gameTypeNameWithModifier

	var_3_4:SubscribeToModel(var_3_6:GetModel(var_3_1), var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.GameModeText = var_3_4

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "MapText"

	var_3_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 98, _1080p * 452, _1080p * -40, _1080p * -12)
	var_3_0:addElement(var_3_8)

	var_3_0.MapText = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "GameModeImage"

	var_3_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 14, _1080p * 90, _1080p * -76, 0)

	local function var_3_11()
		local var_5_0 = DataSources.frontEnd.lobby.gameTypeImage:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_10:setImage(RegisterMaterial(var_5_0), 0)
		end
	end

	local var_3_12 = DataSources.frontEnd.lobby.gameTypeImage

	var_3_10:SubscribeToModel(var_3_12:GetModel(var_3_1), var_3_11)
	var_3_0:addElement(var_3_10)

	var_3_0.GameModeImage = var_3_10

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "DisabledMessage"

	var_3_14:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_14:SetStartupDelay(2000)
	var_3_14:SetLineHoldTime(2000)
	var_3_14:SetAnimMoveTime(150)
	var_3_14:SetAnimMoveSpeed(50)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(3)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 26)
	var_3_0:addElement(var_3_14)

	var_3_0.DisabledMessage = var_3_14

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameSetupDetails", GameSetupDetails)
LockTable(_M)
