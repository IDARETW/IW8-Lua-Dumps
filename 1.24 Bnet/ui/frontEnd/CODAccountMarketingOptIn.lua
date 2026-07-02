module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.isChecked = false

	arg_1_0:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		arg_2_0.isChecked = not arg_2_0.isChecked

		arg_2_0.CheckBox:SetValue(arg_2_0.isChecked)
	end)

	if Engine.DDHFCGHJEA() then
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("CODACCOUNT/KR_MARKETING_OPT_IN"), 0)
		arg_1_0.Message:SetAnimMoveTime(15000)
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CODAccountMarketingOptIn(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "CODAccountMarketingOptIn"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Message"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("CODACCOUNT/SIGNUP_FOR_EMAILS"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetUseEllipses(ELLIPSES.enabled)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(3000)
	var_3_6:SetAnimMoveSpeed(100)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 37, _1080p * -28, _1080p * -11.5, _1080p * 10.5)
	var_3_0:addElement(var_3_6)

	var_3_0.Message = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "CheckBox"

	var_3_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 7, _1080p * 27, _1080p * -10, _1080p * 10)
	var_3_0:addElement(var_3_8)

	var_3_0.CheckBox = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_14)

	local function var_3_15()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_15

	var_3_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CODAccountMarketingOptIn", CODAccountMarketingOptIn)
LockTable(_M)
