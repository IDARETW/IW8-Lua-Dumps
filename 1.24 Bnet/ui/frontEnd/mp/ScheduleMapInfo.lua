module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	arg_1_0.MapName:SubscribeToModelThroughElement(arg_1_0, "name", function()
		local var_2_0 = arg_1_0:GetDataSource().name:GetValue(arg_1_1)

		if var_2_0 then
			arg_1_0.MapName:setText(var_2_0, 0)
		end
	end)
	arg_1_0.MapImage:SubscribeToModelThroughElement(arg_1_0, "image", function()
		local var_3_0 = arg_1_0:GetDataSource().image:GetValue(arg_1_1)

		if var_3_0 then
			arg_1_0.MapImage:setImage(RegisterMaterial(var_3_0), 0)
		end
	end)
	arg_1_0.MapNumber:SubscribeToModelThroughElement(arg_1_0, "number", function()
		local var_4_0 = arg_1_0:GetDataSource().number:GetValue(arg_1_1)

		if var_4_0 then
			arg_1_0.MapNumber:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/SCHEDULE_MAP_NUMBER", var_4_0), 0)
		end
	end)
	arg_1_0.GameType:SubscribeToModelThroughElement(arg_1_0, "gametypeName", function()
		local var_5_0 = arg_1_0:GetDataSource().gametypeName:GetValue(arg_1_1)

		if var_5_0 then
			arg_1_0.GameType:setText(ToUpperCase(var_5_0), 0)
		end
	end)
	arg_1_0.MapImage:SubscribeToModelThroughElement(arg_1_0, "gametypeIcon", function()
		local var_6_0 = arg_1_0:GetDataSource().gametypeIcon:GetValue(arg_1_1)

		if var_6_0 then
			arg_1_0.GametypeIcon:setImage(RegisterMaterial(var_6_0), 0)
		end
	end)
end

function ScheduleMapInfo(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 408 * _1080p, 0, 210 * _1080p)

	var_7_0.id = "ScheduleMapInfo"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:setUseStencil(true)

	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "MapImage"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 408, _1080p * -1, _1080p * 210)
	var_7_0:addElement(var_7_4)

	var_7_0.MapImage = var_7_4

	local var_7_5

	if not CONDITIONS.IsLaunchChunk(var_7_0) then
		local var_7_6 = LUI.UIImage.new()

		var_7_6.id = "GradientBottom"

		var_7_6:SetRGBFromInt(0, 0)
		var_7_6:SetAlpha(0.9, 0)
		var_7_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
		var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -204, _1080p * 204, _1080p * -105, _1080p * 105)
		var_7_0:addElement(var_7_6)

		var_7_0.GradientBottom = var_7_6
	end

	local var_7_7
	local var_7_8 = LUI.UIText.new()

	var_7_8.id = "MapName"

	var_7_8:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_8:setText(ToUpperCase(""), 0)
	var_7_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_8:SetAlignment(LUI.Alignment.Left)
	var_7_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 88, _1080p * -18, _1080p * -46, _1080p * -22)
	var_7_0:addElement(var_7_8)

	var_7_0.MapName = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIStyledText.new()

	var_7_10.id = "GameType"

	var_7_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_10:setText(ToUpperCase(""), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_10:SetStartupDelay(1000)
	var_7_10:SetLineHoldTime(400)
	var_7_10:SetAnimMoveTime(150)
	var_7_10:SetAnimMoveSpeed(50)
	var_7_10:SetEndDelay(1000)
	var_7_10:SetCrossfadeTime(400)
	var_7_10:SetFadeInTime(300)
	var_7_10:SetFadeOutTime(300)
	var_7_10:SetMaxVisibleLines(1)
	var_7_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 88, _1080p * -18, _1080p * -71, _1080p * -41)
	var_7_0:addElement(var_7_10)

	var_7_0.GameType = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIStyledText.new()

	var_7_12.id = "MapNumber"

	var_7_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_7_12:setText("", 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_12:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 88, _1080p * -18, _1080p * -90, _1080p * -66)
	var_7_0:addElement(var_7_12)

	var_7_0.MapNumber = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "GametypeIcon"

	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 82, _1080p * 123, _1080p * 187)
	var_7_0:addElement(var_7_14)

	var_7_0.GametypeIcon = var_7_14

	PostLoadFunc(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ScheduleMapInfo", ScheduleMapInfo)
LockTable(_M)
