module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = ""

	for iter_1_0 = 1, #arg_1_0 do
		local var_1_1 = arg_1_0[iter_1_0]
		local var_1_2 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_1_1, CSV.gameTypesTable.cols.hideInUI)

		if #var_1_2 > 0 and var_1_2 ~= "1" then
			if var_1_0 ~= "" then
				var_1_0 = var_1_0 .. ", "
			end

			local var_1_3 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_1_1, CSV.gameTypesTable.cols.name)

			var_1_0 = var_1_0 .. Engine.CBBHFCGDIC(var_1_3)
		end
	end

	return Engine.CBBHFCGDIC("LUA_MENU_MP/MAP_DOES_NOT_SUPPORT_GAME_MODE", arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "ref", function()
		local var_3_0 = arg_2_0:GetDataSource().ref:GetValue(arg_2_1)
		local var_3_1 = arg_2_0:GetDataSource().name:GetValue(arg_2_1)

		if arg_2_0:GetDataSource().disabled:GetValue(arg_2_1) then
			local var_3_2 = arg_2_0:GetDataSource().gameTypes:GetValue(arg_2_1)
			local var_3_3 = split(var_3_2, " ")

			arg_2_0.DisabledMessage:setText(var_0_0(var_3_3, var_3_1))
		else
			arg_2_0.DisabledMessage:setText("")
		end

		if var_3_1 ~= nil then
			arg_2_0.MapText:setText(var_3_1)
		else
			arg_2_0.MapText:setText("")
		end
	end)
	assert(arg_2_0.Vignette)
	assert(arg_2_0.MapImage)

	local function var_2_0()
		local var_4_0 = CoD.GetAspectRatioScaleAdjust(0.25)

		arg_2_0.Vignette:SetScale(var_4_0)
		arg_2_0.MapImage:SetScale(var_4_0)
		arg_2_0.Gradient:SetScale(var_4_0)
	end

	arg_2_0:addAndCallEventHandler("onVideoChange", var_2_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)

	local var_2_1 = LUI.FlowManager.GetScopedData(arg_2_0)
	local var_2_2
	local var_2_3
	local var_2_4

	if var_2_1.isTournament then
		var_2_2 = var_2_1.matchmakerSettings.gameType
		var_2_4 = false
	else
		var_2_2 = DataSources.frontEnd.lobby.gameType:GetValue(arg_2_1)
		var_2_4 = DataSources.frontEnd.lobby.isHardcoreGameType:GetValue(arg_2_1)
	end

	arg_2_0.GameModeImage:setImage(RegisterMaterial(PRIVATE_MATCH.GetGameTypeImage(var_2_2, var_2_4, arg_2_1)))
	arg_2_0.GameModeText:setText(PRIVATE_MATCH.GetGameTypeName(var_2_2, var_2_4, arg_2_1))
end

function MapDetails(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "MapDetails"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "MapImage"

	local function var_5_5()
		local var_6_0 = var_5_0:GetDataSource().image:GetValue(var_5_1)

		if var_6_0 ~= nil then
			var_5_4:setImage(RegisterMaterial(var_6_0), 0)
		end
	end

	var_5_4:SubscribeToModelThroughElement(var_5_0, "image", var_5_5)
	var_5_0:addElement(var_5_4)

	var_5_0.MapImage = var_5_4

	local var_5_6
	local var_5_7 = LUI.UIImage.new()

	var_5_7.id = "Gradient"

	var_5_7:SetRGBFromInt(0, 0)
	var_5_7:SetAlpha(0.75, 0)
	var_5_7:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_7:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1386, _1080p * 1, 0)
	var_5_0:addElement(var_5_7)

	var_5_0.Gradient = var_5_7

	local var_5_8
	local var_5_9 = LUI.UIImage.new()

	var_5_9.id = "Vignette"

	var_5_9:setImage(RegisterMaterial("menu_vignette_corner"), 0)
	var_5_0:addElement(var_5_9)

	var_5_0.Vignette = var_5_9

	local var_5_10
	local var_5_11 = LUI.UIStyledText.new()

	var_5_11.id = "GameModeText"

	var_5_11:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_11:setText(ToUpperCase(""), 0)
	var_5_11:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_11:SetAlignment(LUI.Alignment.Left)
	var_5_11:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_11:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_11:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_11:SetStartupDelay(1000)
	var_5_11:SetLineHoldTime(400)
	var_5_11:SetAnimMoveTime(2000)
	var_5_11:SetAnimMoveSpeed(150)
	var_5_11:SetEndDelay(1000)
	var_5_11:SetCrossfadeTime(1000)
	var_5_11:SetFadeInTime(300)
	var_5_11:SetFadeOutTime(300)
	var_5_11:SetMaxVisibleLines(2)
	var_5_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 194, _1080p * 518, _1080p * -203, _1080p * -167)
	var_5_0:addElement(var_5_11)

	var_5_0.GameModeText = var_5_11

	local var_5_12
	local var_5_13 = LUI.UIText.new()

	var_5_13.id = "MapText"

	var_5_13:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_13:setText("", 0)
	var_5_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_13:SetAlignment(LUI.Alignment.Left)
	var_5_13:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_13:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 194, _1080p * 548, _1080p * -171, _1080p * -143)
	var_5_0:addElement(var_5_13)

	var_5_0.MapText = var_5_13

	local var_5_14
	local var_5_15 = LUI.UIImage.new()

	var_5_15.id = "GameModeImage"

	var_5_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 110, _1080p * 186, _1080p * -207, _1080p * -131)
	var_5_0:addElement(var_5_15)

	var_5_0.GameModeImage = var_5_15

	local var_5_16
	local var_5_17 = LUI.UIStyledText.new()

	var_5_17.id = "DisabledMessage"

	var_5_17:SetRGBFromTable(SWATCHES.genericButton.textDisabled, 0)
	var_5_17:setText("", 0)
	var_5_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_17:SetAlignment(LUI.Alignment.Left)
	var_5_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_5_17:SetStartupDelay(2000)
	var_5_17:SetLineHoldTime(2000)
	var_5_17:SetAnimMoveTime(150)
	var_5_17:SetAnimMoveSpeed(50)
	var_5_17:SetEndDelay(1000)
	var_5_17:SetCrossfadeTime(400)
	var_5_17:SetFadeInTime(300)
	var_5_17:SetFadeOutTime(300)
	var_5_17:SetMaxVisibleLines(3)
	var_5_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 138, _1080p * 638, _1080p * 790, _1080p * 816)
	var_5_0:addElement(var_5_17)

	var_5_0.DisabledMessage = var_5_17

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MapDetails", MapDetails)
LockTable(_M)
