module(..., package.seeall)

function FireMode(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 229 * _1080p, 0, 39 * _1080p)

	var_1_0.id = "FireMode"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIBlur.new()

	var_1_4.id = "Backer"

	var_1_4:SetRGBFromInt(11250336, 0)
	var_1_4:setImage(RegisterMaterial("fire_rate_backer"), 0)
	var_1_4:SetBlurStrength(2.75, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 42, _1080p * -21, _1080p * 21)
	var_1_0:addElement(var_1_4)

	var_1_0.Backer = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Icon"

	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1.5, _1080p * 40.5, _1080p * -19.5, _1080p * 19.5)

	local function var_1_7()
		local var_2_0 = var_1_0:GetDataSource().fireMode.icon:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_6:setImage(RegisterMaterial(var_2_0), 0)
		end
	end

	var_1_6:SubscribeToModelThroughElement(var_1_0, "fireMode.icon", var_1_7)
	var_1_0:addElement(var_1_6)

	var_1_0.Icon = var_1_6

	local var_1_8
	local var_1_9 = LUI.UIText.new()

	var_1_9.id = "Name"

	var_1_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_9:SetAlignment(LUI.Alignment.Left)
	var_1_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 44, _1080p * 322, _1080p * -9, _1080p * 9)

	local function var_1_10()
		local var_3_0 = var_1_0:GetDataSource().fireMode.name:GetValue(var_1_1)

		if var_3_0 ~= nil then
			var_1_9:setText(ToUpperCase(var_3_0), 0)
		end
	end

	var_1_9:SubscribeToModelThroughElement(var_1_0, "fireMode.name", var_1_10)
	var_1_0:addElement(var_1_9)

	var_1_0.Name = var_1_9

	return var_1_0
end

MenuBuilder.registerType("FireMode", FireMode)
LockTable(_M)
