module(..., package.seeall)

function LANPlayerMP(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 363 * _1080p, 0, 30 * _1080p)

	var_1_0.id = "LANPlayerMP"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.6, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "FullName"

	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetShadowMinDistance(-0.2, 0)
	var_1_6:SetShadowMaxDistance(0.2, 0)
	var_1_6:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -7, _1080p * 11)

	local function var_1_7()
		local var_2_0 = var_1_0:GetDataSource().fullName:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_6:setText(var_2_0, 0)
		end
	end

	var_1_6:SubscribeToModelThroughElement(var_1_0, "fullName", var_1_7)
	var_1_0:addElement(var_1_6)

	var_1_0.FullName = var_1_6

	return var_1_0
end

MenuBuilder.registerType("LANPlayerMP", LANPlayerMP)
LockTable(_M)
