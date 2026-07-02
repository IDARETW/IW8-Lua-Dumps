module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		arg_1_0:SetAlpha(1)

		local var_1_0 = FRIENDS.BnetStatusToColorMap[arg_1_1]

		assert(var_1_0)

		local var_1_1 = FRIENDS.BnetStatusToIconNameMap[arg_1_1]

		assert(var_1_1)
		arg_1_0.PlayerStatusIcon:SetRGBFromTable(var_1_0)
		arg_1_0.PlayerStatusIcon:setImage(RegisterMaterial(var_1_1))
	else
		arg_1_0:SetAlpha(0)
	end
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetOnlineStatus = var_0_0
end

function SocialPlayerStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 24 * _1080p, 0, 24 * _1080p)

	var_3_0.id = "SocialPlayerStatus"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "PlayerStatusIcon"

	var_3_4:SetRGBFromTable(SWATCHES.BattleNetChat.onlineStatusAvailable, 0)
	var_3_4:setImage(RegisterMaterial("icon_bnet_available"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.PlayerStatusIcon = var_3_4

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialPlayerStatus", SocialPlayerStatus)
LockTable(_M)
