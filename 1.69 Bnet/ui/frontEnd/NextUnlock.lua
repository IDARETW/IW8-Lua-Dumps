module(..., package.seeall)

function NextUnlock(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 111 * _1080p, 0, 111 * _1080p)

	var_1_0.id = "NextUnlock"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "UnlockImage"

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().alpha:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:SetAlpha(var_2_0, 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "alpha", var_1_5)

	local function var_1_6()
		local var_3_0 = var_1_0:GetDataSource().image:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_4:setImage(RegisterMaterial(var_3_0), 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "image", var_1_6)
	var_1_0:addElement(var_1_4)

	var_1_0.UnlockImage = var_1_4

	return var_1_0
end

MenuBuilder.registerType("NextUnlock", NextUnlock)
LockTable(_M)
