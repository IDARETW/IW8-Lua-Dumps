module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().name:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			arg_1_0.Name:setText(var_2_0, 0)
		end
	end

	arg_1_0.Name:SubscribeToModelThroughElement(arg_1_0, "name", var_1_0)
end

function MLGScheduleTeamMember(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "MLGScheduleTeamMember"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Name"

	var_3_6:SetRGBFromTable(SWATCHES.Lobby.memberText, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 11, _1080p * 550, _1080p * 3, _1080p * 27)
	var_3_0:addElement(var_3_6)

	var_3_0.Name = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Divider"

	var_3_8:SetRGBFromTable(SWATCHES.Lobby.memberClanText, 0)
	var_3_8:SetAlpha(0.6, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 4, 0, 0, _1080p * -1)
	var_3_0:addElement(var_3_8)

	var_3_0.Divider = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "DropShadow"

	var_3_10:SetRGBFromInt(0, 0)
	var_3_10:SetAlpha(0.3, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_3_0:addElement(var_3_10)

	var_3_0.DropShadow = var_3_10

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MLGScheduleTeamMember", MLGScheduleTeamMember)
LockTable(_M)
