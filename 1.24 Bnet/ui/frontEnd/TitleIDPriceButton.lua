module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = IsLanguageChinese() or IsLanguageJapanese() or IsLanguageKorean()

		if Engine.GGFCHCDDE(arg_2_1.controllerIndex) and not Engine.HDGDBCJFG() then
			if var_2_0 then
				arg_2_0.Prompt:setImage(RegisterMaterial("button_secondary_ps4"))
			else
				arg_2_0.Prompt:setImage(RegisterMaterial("button_primary_ps4"))
			end
		elseif var_2_0 then
			arg_2_0.Prompt:setImage(RegisterMaterial("button_secondary"))
		else
			arg_2_0.Prompt:setImage(RegisterMaterial("button_primary"))
		end
	end

	local function var_1_1(arg_3_0, arg_3_1)
		if LUI.IsLastInputKeyboardMouse(arg_3_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_3_0, "KBM")
		else
			ACTIONS.AnimateSequence(arg_3_0, "Gamepad")
			var_1_0(arg_3_0, arg_3_1)
		end
	end

	if IsLanguageFrench() then
		ACTIONS.AnimateSequence(arg_1_0, "LongButton")
	end

	arg_1_0:registerAndCallEventHandler("update_input_type", var_1_1, {
		controllerIndex = arg_1_1
	})
	var_1_1(arg_1_0, {
		controllerIndex = arg_1_1
	})
end

function TitleIDPriceButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 50 * _1080p)

	var_4_0.id = "TitleIDPriceButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_4_4:SetAlpha(0.2, 0)
	var_4_4:SetPixelGridEnabled(true)
	var_4_4:SetPixelGridContrast(0.5, 0)
	var_4_4:SetPixelGridBlockWidth(2, 0)
	var_4_4:SetPixelGridBlockHeight(2, 0)
	var_4_4:SetPixelGridGutterWidth(1, 0)
	var_4_4:SetPixelGridGutterHeight(1, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Amount"

	var_4_6:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_4_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_PRICE")), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetWordWrap(false)
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 29, 0, _1080p * -15, _1080p * 15)
	var_4_0:addElement(var_4_6)

	var_4_0.Amount = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Tab"

	var_4_8:SetRGBFromTable(SWATCHES.Store.BundleText, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 6, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Tab = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Prompt"

	var_4_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_4_10:setImage(RegisterMaterial("button_primary"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 20, _1080p * 52, _1080p * -16, _1080p * 16)
	var_4_0:addElement(var_4_10)

	var_4_0.Prompt = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 66
		}
	}

	var_4_6:RegisterAnimationSequence("Gamepad", var_4_13)

	local var_4_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Gamepad", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("Gamepad")
		var_4_10:AnimateSequence("Gamepad")
	end

	var_4_0._sequences.Gamepad = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 29
		}
	}

	var_4_6:RegisterAnimationSequence("KBM", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("KBM", var_4_18)

	local function var_4_19()
		var_4_6:AnimateSequence("KBM")
		var_4_10:AnimateSequence("KBM")
	end

	var_4_0._sequences.KBM = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 110
		}
	}

	var_4_4:RegisterAnimationSequence("LongButton", var_4_21)

	local function var_4_22()
		var_4_4:AnimateSequence("LongButton")
	end

	var_4_0._sequences.LongButton = var_4_22

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TitleIDPriceButton", TitleIDPriceButton)
LockTable(_M)
