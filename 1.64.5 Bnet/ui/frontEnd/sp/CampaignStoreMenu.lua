module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	ACTIONS.ScaleFullscreen(arg_1_0.Background)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)

	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_2_0.TabBacker:SetScale(var_2_0)
	end

	arg_1_0:addAndCallEventHandler("onVideoChange", var_1_0)
end

function CampaignStoreMenu(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CampaignStoreMenu"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TabBacker"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_3_0:addElement(var_3_6)

	var_3_0.TabBacker = var_3_6

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CampaignStoreMenu", CampaignStoreMenu)
LockTable(_M)
