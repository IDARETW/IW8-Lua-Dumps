module(..., package.seeall)

function PrestigeReward(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 25 * _1080p)

	var_1_0.id = "PrestigeReward"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIText.new()

	var_1_4.id = "RewardText"

	var_1_4:SetRGBFromTable(SWATCHES.genericButton.highlight, 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, 0, _1080p * 2, _1080p * 24)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().name:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4:setText(var_2_0, 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "name", var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.RewardText = var_1_4

	local var_1_6
	local var_1_7 = LUI.UIText.new()

	var_1_7.id = "Caret"

	var_1_7:SetRGBFromTable(SWATCHES.genericButton.highlight, 0)
	var_1_7:setText("1", 0)
	var_1_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_7:SetAlignment(LUI.Alignment.Left)
	var_1_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 14, _1080p * 2, _1080p * 24)
	var_1_0:addElement(var_1_7)

	var_1_0.Caret = var_1_7

	return var_1_0
end

MenuBuilder.registerType("PrestigeReward", PrestigeReward)
LockTable(_M)
