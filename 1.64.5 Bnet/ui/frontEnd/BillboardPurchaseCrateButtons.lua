module(..., package.seeall)

function BillboardPurchaseCrateButtons(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalList.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 120 * _1080p)

	var_1_0.id = "BillboardPurchaseCrateButtons"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(10 * _1080p)

	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericCurrencyButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "PriceButton"

	var_1_4.Text:setText("", 0)
	var_1_4.Text:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 40)
	var_1_0:addElement(var_1_4)

	var_1_0.PriceButton = var_1_4

	return var_1_0
end

MenuBuilder.registerType("BillboardPurchaseCrateButtons", BillboardPurchaseCrateButtons)
LockTable(_M)
