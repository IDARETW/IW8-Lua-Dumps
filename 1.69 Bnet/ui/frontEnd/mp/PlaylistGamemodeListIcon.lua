module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().image:GetValue(arg_1_1)

		if var_2_0 ~= nil then
			arg_1_0.GamemodeImage:setImage(RegisterMaterial(var_2_0))
		end
	end

	arg_1_0.GamemodeImage:SubscribeToModelThroughElement(arg_1_0, "image", var_1_0)
end

function PlaylistGamemodeListIcon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "PlaylistGamemodeListIcon"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "GamemodeImage"

	var_3_0:addElement(var_3_4)

	var_3_0.GamemodeImage = var_3_4

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PlaylistGamemodeListIcon", PlaylistGamemodeListIcon)
LockTable(_M)
