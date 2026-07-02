module(..., package.seeall)

function BillboardPurchaseConfirmButton(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "BillboardPurchaseConfirmButton"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Button"

	var_1_4.Text:SetLeft(_1080p * 20, 0)
	var_1_4.Text:SetAlignment(LUI.Alignment.Left)
	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_1_5()
		local var_2_0 = var_1_0:GetDataSource().DataSources.frontEnd.store.categories.name:GetValue(var_1_1)

		if var_2_0 ~= nil then
			var_1_4.Text:setText(ToUpperCase(var_2_0), 0)
		end
	end

	var_1_4:SubscribeToModelThroughElement(var_1_0, "DataSources.frontEnd.store.categories.name", var_1_5)
	var_1_0:addElement(var_1_4)

	var_1_0.Button = var_1_4

	local var_1_6
	local var_1_7 = MenuBuilder.BuildRegisteredType("CurrencyWidget", {
		controllerIndex = var_1_1
	})

	var_1_7.id = "Cost"

	var_1_7:SetAlpha(0, 0)
	var_1_7.CurrencyIcon:setImage(RegisterMaterial("currency_keys_icon"), 0)
	var_1_7.CurrencyCount:setText("0000", 0)
	var_1_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -85, 0, _1080p * -20, _1080p * 20)
	var_1_0:addElement(var_1_7)

	var_1_0.Cost = var_1_7

	return var_1_0
end

MenuBuilder.registerType("BillboardPurchaseConfirmButton", BillboardPurchaseConfirmButton)
LockTable(_M)
