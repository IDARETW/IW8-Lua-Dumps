module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._codWidth = nil
	arg_1_0._keyWidth = nil

	local function var_1_0()
		if arg_1_0.Keys and arg_1_0._keyWidth then
			arg_1_0.Keys:SetLeft(-arg_1_0._keyWidth)
		end

		if arg_1_0.CoDPoints and arg_1_0._codWidth then
			if arg_1_0.Keys and arg_1_0._keyWidth then
				local var_2_0 = 10 * _1080p
				local var_2_1 = arg_1_0._keyWidth + var_2_0
				local var_2_2 = var_2_1 + arg_1_0._codWidth

				arg_1_0.CoDPoints:SetLeft(-var_2_2)
				arg_1_0.CoDPoints:SetRight(-var_2_1)
			else
				arg_1_0.CoDPoints:SetLeft(-arg_1_0._codWidth)
				arg_1_0.CoDPoints:SetRight(0)
			end
		end
	end

	if arg_1_0.CoDPoints then
		arg_1_0:SubscribeToModel(DataSources.frontEnd.MP.commerce.premiumCurrency:GetModel(arg_1_1), function(arg_3_0)
			local var_3_0 = DataModel.JJEHAEBDF(arg_3_0)

			if var_3_0 then
				local var_3_1 = arg_1_0.CoDPoints:UpdateCurrencyCount(var_3_0)

				arg_1_0._codWidth = var_3_1

				var_1_0()
			end
		end)
	end

	if arg_1_0.Keys then
		arg_1_0:SubscribeToModel(DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel(arg_1_1), function(arg_4_0)
			local var_4_0 = DataModel.JJEHAEBDF(arg_4_0)

			if var_4_0 then
				local var_4_1 = arg_1_0.Keys:UpdateCurrencyCount(var_4_0)

				arg_1_0._keyWidth = var_4_1

				var_1_0()
			end
		end)
	end
end

function Wallet(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 170 * _1080p, 0, 40 * _1080p)

	var_5_0.id = "Wallet"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3

	if CONDITIONS.AreCODPointsEnabled(var_5_0) then
		local var_5_4 = MenuBuilder.BuildRegisteredType("CurrencyWidget", {
			controllerIndex = var_5_1
		})

		var_5_4.id = "CoDPoints"

		var_5_4.CurrencyIcon:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
		var_5_4.CurrencyCount:setText("0000", 0)
		var_5_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -170, _1080p * -85, 0, _1080p * 40)
		var_5_0:addElement(var_5_4)

		var_5_0.CoDPoints = var_5_4
	end

	local var_5_5

	if CONDITIONS.AreKeysEnabled(var_5_0) then
		local var_5_6 = MenuBuilder.BuildRegisteredType("CurrencyWidget", {
			controllerIndex = var_5_1
		})

		var_5_6.id = "Keys"

		var_5_6.CurrencyIcon:setImage(RegisterMaterial("icon_currency_key"), 0)
		var_5_6.CurrencyCount:setText("0000", 0)
		var_5_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -85, 0, 0, _1080p * 40)
		var_5_0:addElement(var_5_6)

		var_5_0.Keys = var_5_6
	end

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("Wallet", Wallet)
LockTable(_M)
