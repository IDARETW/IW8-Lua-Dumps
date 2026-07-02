module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("gain_focus", function(arg_2_0, arg_2_1)
		if arg_1_0._previewsEnabled then
			arg_1_0.Flare:SetScale(0.05, 150, LUI.EASING.outBack)
		end
	end)
	arg_1_0:addEventHandler("lose_focus", function(arg_3_0, arg_3_1)
		if arg_1_0._previewsEnabled then
			arg_1_0.Flare:SetScale(-0.05, 100)
		end
	end)
end

function LootItemCardWrapper(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 310 * _1080p)

	var_4_0.id = "LootItemCardWrapper"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Card"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -155, _1080p * 125)
	var_4_0:addElement(var_4_4)

	var_4_0.Card = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "Flare"

	var_4_6:SetScale(-0.05, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -151, _1080p * 129)
	var_4_0:addElement(var_4_6)

	var_4_0.Flare = var_4_6

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LootItemCardWrapper", LootItemCardWrapper)
LockTable(_M)
