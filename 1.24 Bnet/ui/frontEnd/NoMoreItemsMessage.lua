module(..., package.seeall)

function NoMoreItemsMessage(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "NoMoreItemsMessage"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Gradient"

	var_1_4:SetRGBFromTable(SWATCHES.Store.NoItemBG, 0)
	var_1_4:SetAlpha(0, 0)
	var_1_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_1_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_0:addElement(var_1_4)

	var_1_0.Gradient = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "Time"

	var_1_6:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_ITEMS_AVAILABLE"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_6)

	var_1_0.Time = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "Title"

	var_1_8:SetRGBFromTable(SWATCHES.Store.NoItemTitle, 0)
	var_1_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SOLD_OUT")), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * -40, _1080p * 20)
	var_1_0:addElement(var_1_8)

	var_1_0.Title = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("Message", var_1_10)

	local var_1_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Message", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("Message")
		var_1_6:AnimateSequence("Message")
	end

	var_1_0._sequences.Message = var_1_12

	local var_1_13 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("MessageWithTimer", var_1_13)

	local var_1_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("MessageWithTimer", var_1_14)

	local var_1_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_8:RegisterAnimationSequence("MessageWithTimer", var_1_15)

	local function var_1_16()
		var_1_4:AnimateSequence("MessageWithTimer")
		var_1_6:AnimateSequence("MessageWithTimer")
		var_1_8:AnimateSequence("MessageWithTimer")
	end

	var_1_0._sequences.MessageWithTimer = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DualMessage = var_1_17

	return var_1_0
end

MenuBuilder.registerType("NoMoreItemsMessage", NoMoreItemsMessage)
LockTable(_M)
