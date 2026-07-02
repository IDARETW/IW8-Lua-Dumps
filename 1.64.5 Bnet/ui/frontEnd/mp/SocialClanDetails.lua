module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ClanInfoDetailsLayout:SetClanData(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._controllerIndex = arg_2_1
	arg_2_0.RefreshClanData = var_0_0
end

function SocialClanDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 826 * _1080p, 0, 610 * _1080p)

	var_3_0.id = "SocialClanDetails"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("ClanInfoDetailsLayout", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "ClanInfoDetailsLayout"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 826, 0, _1080p * 610)
	var_3_0:addElement(var_3_4)

	var_3_0.ClanInfoDetailsLayout = var_3_4

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialClanDetails", SocialClanDetails)
LockTable(_M)
