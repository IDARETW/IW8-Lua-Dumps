module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		local var_2_0 = "icon_chat"
		local var_2_1 = Engine.CBCJDCHCCD(arg_2_1.controllerIndex) == LUI.INPUT_TYPE.gamepad

		if var_2_1 then
			var_2_0 = "button_select"

			if Engine.GGFCHCDDE(arg_1_1) and not Engine.HDGDBCJFG() then
				var_2_0 = var_2_0 .. "_ps4"
			end
		end

		if not Engine.BECCFCBIAA("textChatEnabled", arg_2_1.controllerIndex) and not var_2_1 then
			var_2_0 = var_2_0 .. "_disabled"
		end

		arg_2_0.ChatButton:setImage(RegisterMaterial(var_2_0), 0)
	end

	arg_1_0:registerAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})

	arg_1_0.UpdateInputType = var_1_0
end

function TextChatButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "TextChatButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "ChatButton"

	var_3_4:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_3_4:setImage(RegisterMaterial("icon_chat"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.ChatButton = var_3_4

	local var_3_5
	local var_3_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("DefaultSequence", var_3_6)

	local function var_3_7()
		var_3_4:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	var_0_0(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("TextChatButton", TextChatButton)
LockTable(_M)
