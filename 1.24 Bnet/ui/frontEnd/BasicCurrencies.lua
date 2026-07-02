module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if not CONDITIONS.AreCODPointsEnabled(arg_1_0) then
		ACTIONS.AnimateSequence(arg_1_0, "CodPointsDisabled")
	end
end

function BasicCurrencies(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIHorizontalNavigator.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 88 * _1080p)

	var_2_0.id = "BasicCurrencies"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIBlur.new()

	var_2_4.id = "CurrencyBacker"

	var_2_4:SetRGBFromInt(11776947, 0)
	var_2_4:SetBlurStrength(1.5, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 4, _1080p * 44)
	var_2_0:addElement(var_2_4)

	var_2_0.CurrencyBacker = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "CurrencyBackerDark"

	var_2_6:SetRGBFromInt(0, 0)
	var_2_6:SetAlpha(0.6, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 4, _1080p * 44)
	var_2_0:addElement(var_2_6)

	var_2_0.CurrencyBackerDark = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "CurrencyBackerGradient"

	var_2_8:SetRGBFromInt(0, 0)
	var_2_8:SetAlpha(0.2, 0)
	var_2_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 14, _1080p * 44)
	var_2_0:addElement(var_2_8)

	var_2_0.CurrencyBackerGradient = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIImage.new()

	var_2_10.id = "Divider"

	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 43, _1080p * 45)
	var_2_0:addElement(var_2_10)

	var_2_0.Divider = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "PartsIcon"

	var_2_12:setImage(RegisterMaterial("currency_parts_icon"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 127, _1080p * 163, _1080p * 4.5, _1080p * 40.5)
	var_2_0:addElement(var_2_12)

	var_2_0.PartsIcon = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "KeysIcon"

	var_2_14:setImage(RegisterMaterial("currency_keys_icon"), 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 246, _1080p * 282, _1080p * 4, _1080p * 40)
	var_2_0:addElement(var_2_14)

	var_2_0.KeysIcon = var_2_14

	local var_2_15

	if CONDITIONS.AreCODPointsEnabled(var_2_0) then
		local var_2_16 = LUI.UIImage.new()

		var_2_16.id = "CODPointsIcon"

		var_2_16:setImage(RegisterMaterial("currency_cod_points_icon"), 0)
		var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 40, _1080p * 4, _1080p * 40)
		var_2_0:addElement(var_2_16)

		var_2_0.CODPointsIcon = var_2_16
	end

	local var_2_17
	local var_2_18 = LUI.UIStyledText.new()

	var_2_18.id = "PartsValue"

	var_2_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_18:SetAlignment(LUI.Alignment.Left)
	var_2_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_18:SetStartupDelay(1250)
	var_2_18:SetLineHoldTime(400)
	var_2_18:SetAnimMoveTime(500)
	var_2_18:SetAnimMoveSpeed(50)
	var_2_18:SetEndDelay(1000)
	var_2_18:SetCrossfadeTime(500)
	var_2_18:SetFadeInTime(300)
	var_2_18:SetFadeOutTime(300)
	var_2_18:SetMaxVisibleLines(1)
	var_2_18:SetShadowMinDistance(-0.2, 0)
	var_2_18:SetShadowMaxDistance(0.2, 0)
	var_2_18:SetShadowRGBFromInt(0, 0)
	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 163, _1080p * 235, _1080p * 11, _1080p * 35)

	local function var_2_19()
		local var_3_0 = DataSources.frontEnd.MP.commerce.craftingCurrency:GetValue(var_2_1)

		if var_3_0 ~= nil then
			var_2_18:setText(var_3_0, 0)
		end
	end

	local var_2_20 = DataSources.frontEnd.MP.commerce.craftingCurrency

	var_2_18:SubscribeToModel(var_2_20:GetModel(var_2_1), var_2_19)
	var_2_0:addElement(var_2_18)

	var_2_0.PartsValue = var_2_18

	local var_2_21
	local var_2_22 = LUI.UIStyledText.new()

	var_2_22.id = "KeysValue"

	var_2_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_22:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_22:SetStartupDelay(1500)
	var_2_22:SetLineHoldTime(400)
	var_2_22:SetAnimMoveTime(300)
	var_2_22:SetAnimMoveSpeed(50)
	var_2_22:SetEndDelay(1000)
	var_2_22:SetCrossfadeTime(500)
	var_2_22:SetFadeInTime(300)
	var_2_22:SetFadeOutTime(300)
	var_2_22:SetMaxVisibleLines(1)
	var_2_22:SetShadowMinDistance(-0.2, 0)
	var_2_22:SetShadowMaxDistance(0.2, 0)
	var_2_22:SetShadowRGBFromInt(0, 0)
	var_2_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 287, _1080p * 359, _1080p * 10, _1080p * 34)

	local function var_2_23()
		local var_4_0 = DataSources.frontEnd.MP.commerce.inGameCurrency:GetValue(var_2_1)

		if var_4_0 ~= nil then
			var_2_22:setText(var_4_0, 0)
		end
	end

	local var_2_24 = DataSources.frontEnd.MP.commerce.inGameCurrency

	var_2_22:SubscribeToModel(var_2_24:GetModel(var_2_1), var_2_23)
	var_2_0:addElement(var_2_22)

	var_2_0.KeysValue = var_2_22

	local var_2_25

	if CONDITIONS.AreCODPointsEnabled(var_2_0) then
		var_2_25 = LUI.UIStyledText.new()
		var_2_25.id = "CODPointsValue"

		var_2_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_2_25:SetAlignment(LUI.Alignment.Left)
		var_2_25:SetOptOutRightToLeftAlignmentFlip(true)
		var_2_25:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_2_25:SetStartupDelay(1500)
		var_2_25:SetLineHoldTime(400)
		var_2_25:SetAnimMoveTime(300)
		var_2_25:SetAnimMoveSpeed(50)
		var_2_25:SetEndDelay(1000)
		var_2_25:SetCrossfadeTime(500)
		var_2_25:SetFadeInTime(300)
		var_2_25:SetFadeOutTime(300)
		var_2_25:SetMaxVisibleLines(1)
		var_2_25:SetShadowMinDistance(-0.2, 0)
		var_2_25:SetShadowMaxDistance(0.2, 0)
		var_2_25:SetShadowRGBFromInt(0, 0)
		var_2_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 45, _1080p * 117, _1080p * 10, _1080p * 34)

		local function var_2_26()
			local var_5_0 = DataSources.frontEnd.MP.commerce.premiumCurrency:GetValue(var_2_1)

			if var_5_0 ~= nil then
				var_2_25:setText(var_5_0, 0)
			end
		end

		local var_2_27 = DataSources.frontEnd.MP.commerce.premiumCurrency

		var_2_25:SubscribeToModel(var_2_27:GetModel(var_2_1), var_2_26)
		var_2_0:addElement(var_2_25)

		var_2_0.CODPointsValue = var_2_25
	end

	local function var_2_28()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_28

	local var_2_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40
		}
	}

	var_2_12:RegisterAnimationSequence("CodPointsDisabled", var_2_29)

	local var_2_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 163
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_2_14:RegisterAnimationSequence("CodPointsDisabled", var_2_30)

	local var_2_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_2_18:RegisterAnimationSequence("CodPointsDisabled", var_2_31)

	local var_2_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 235
		}
	}

	var_2_22:RegisterAnimationSequence("CodPointsDisabled", var_2_32)

	local function var_2_33()
		var_2_12:AnimateSequence("CodPointsDisabled")
		var_2_14:AnimateSequence("CodPointsDisabled")
		var_2_18:AnimateSequence("CodPointsDisabled")
		var_2_22:AnimateSequence("CodPointsDisabled")
	end

	var_2_0._sequences.CodPointsDisabled = var_2_33

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BasicCurrencies", BasicCurrencies)
LockTable(_M)
