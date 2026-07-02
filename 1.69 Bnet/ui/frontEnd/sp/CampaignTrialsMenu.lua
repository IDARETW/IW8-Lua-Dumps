module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
end

function CampaignTrialsMenu(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "CampaignTrialsMenu"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Background"

	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CampaignTrialsMenu", CampaignTrialsMenu)
LockTable(_M)
