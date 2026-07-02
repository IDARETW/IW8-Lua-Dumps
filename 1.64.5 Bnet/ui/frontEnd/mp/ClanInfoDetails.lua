module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ClanInfoDetailsLayout:SetClanData(arg_1_1)
	arg_1_0.ClanProgressionWidget:SetClanProgression(arg_1_0._controllerIndex)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.RefreshClanData = var_0_0
end

function ClanInfoDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "ClanInfoDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3

	if CONDITIONS.AlwaysFalse() then
		local var_3_4 = LUI.UIImage.new()

		var_3_4.id = "DebugBackground"

		var_3_4:SetRGBFromInt(16711896, 0)
		var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 556, _1080p * -96, _1080p * 160, _1080p * -69)
		var_3_0:addElement(var_3_4)

		var_3_0.DebugBackground = var_3_4
	end

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("ClanProgressionWidget", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "ClanProgressionWidget"

	var_3_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -616, _1080p * -96, _1080p * 170, _1080p * 270)
	var_3_0:addElement(var_3_6)

	var_3_0.ClanProgressionWidget = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("ClanInfoDetailsLayout", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ClanInfoDetailsLayout"

	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 777, _1080p * -317, _1080p * 316, _1080p * 926)
	var_3_0:addElement(var_3_8)

	var_3_0.ClanInfoDetailsLayout = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ClanInfoDetails", ClanInfoDetails)
LockTable(_M)
