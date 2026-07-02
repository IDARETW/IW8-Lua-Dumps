module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function NoMoreItemsMessage(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 80 * _1080p)

	var_2_0.id = "NoMoreItemsMessage"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Gradient"

	var_2_4:SetRGBFromTable(SWATCHES.Store.NoItemBG, 0)
	var_2_4:SetAlpha(0, 0)
	var_2_4:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_2_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_2_0:addElement(var_2_4)

	var_2_0.Gradient = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Time"

	var_2_6:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/NO_ITEMS_AVAILABLE"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 15)
	var_2_0:addElement(var_2_6)

	var_2_0.Time = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "Title"

	var_2_8:SetRGBFromTable(SWATCHES.Store.NoItemTitle, 0)
	var_2_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/SOLD_OUT")), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -500, _1080p * 500, _1080p * -40, _1080p * 20)
	var_2_0:addElement(var_2_8)

	var_2_0.Title = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10
	local var_2_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("Message", var_2_11)

	local var_2_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("Message", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("Message")
		var_2_6:AnimateSequence("Message")
	end

	var_2_0._sequences.Message = var_2_13

	local var_2_14
	local var_2_15 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("MessageWithTimer", var_2_15)

	local var_2_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("MessageWithTimer", var_2_16)

	local var_2_17 = {
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

	var_2_8:RegisterAnimationSequence("MessageWithTimer", var_2_17)

	local function var_2_18()
		var_2_4:AnimateSequence("MessageWithTimer")
		var_2_6:AnimateSequence("MessageWithTimer")
		var_2_8:AnimateSequence("MessageWithTimer")
	end

	var_2_0._sequences.MessageWithTimer = var_2_18

	local function var_2_19()
		return
	end

	var_2_0._sequences.DualMessage = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZFenceMessage
		}
	}

	var_2_6:RegisterAnimationSequence("WZWipSetup", var_2_21)

	local var_2_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_2_8:RegisterAnimationSequence("WZWipSetup", var_2_22)

	local function var_2_23()
		var_2_6:AnimateSequence("WZWipSetup")
		var_2_8:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_23

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NoMoreItemsMessage", NoMoreItemsMessage)
LockTable(_M)
