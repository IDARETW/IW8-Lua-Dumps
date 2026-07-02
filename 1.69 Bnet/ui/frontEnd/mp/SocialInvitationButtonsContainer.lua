module(..., package.seeall)

local function var_0_0(arg_1_0)
	return arg_1_0.SocialInvitationButtons and arg_1_0.SocialInvitationButtons.Buttons or nil
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0
	local var_2_1 = MenuBuilder.BuildRegisteredType(arg_2_1, {
		controllerIndex = arg_2_0._controllerIndex
	})

	var_2_1.id = arg_2_1

	var_2_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 460, 0, _1080p * 218)
	arg_2_0:addElement(var_2_1)

	arg_2_0.SocialInvitationButtons = var_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 ~= nil then
		var_0_1(arg_3_0, arg_3_1)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.GetInvitationButtons = var_0_0
	arg_4_0.SetupInvitationButtons = var_0_2
end

function SocialInvitationButtonsContainer(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 218 * _1080p)

	var_5_0.id = "SocialInvitationButtonsContainer"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("SocialInvitationButtonsContainer", SocialInvitationButtonsContainer)
LockTable(_M)
