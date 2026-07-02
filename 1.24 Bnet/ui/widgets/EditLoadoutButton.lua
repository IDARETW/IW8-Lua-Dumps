module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Engine.CBBHFCGDIC("CAS/EDIT")
	local var_1_1 = LUI.Alignment.Left

	arg_1_0.Text:setText(var_1_0)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_1_0.Background:SetupButton(arg_1_0.Text, arg_1_0.Text:getText(), var_1_1)
	end)
end

function EditLoadoutButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 170 * _1080p, 0, 60 * _1080p)

	var_3_0.id = "EditLoadoutButton"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	local function var_3_3()
		local var_4_0 = var_3_0:GetDataSource().isLoadoutLocked:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_0:SetButtonDisabled(var_4_0)
		end
	end

	var_3_0:SubscribeToModelThroughElement(var_3_0, "isLoadoutLocked", var_3_3)

	local var_3_4
	local var_3_5 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_5.id = "Background"

	var_3_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_5)

	var_3_0.Background = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIStyledText.new()

	var_3_7.id = "Text"

	var_3_7:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_7:setText(ToUpperCase(""), 0)
	var_3_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_7:SetAlignment(LUI.Alignment.Left)
	var_3_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_7:SetStartupDelay(2000)
	var_3_7:SetLineHoldTime(400)
	var_3_7:SetAnimMoveTime(300)
	var_3_7:SetAnimMoveSpeed(50)
	var_3_7:SetEndDelay(1500)
	var_3_7:SetCrossfadeTime(750)
	var_3_7:SetFadeInTime(300)
	var_3_7:SetFadeOutTime(300)
	var_3_7:SetMaxVisibleLines(1)
	var_3_7:SetOutlineRGBFromInt(0, 0)
	var_3_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 17, _1080p * -17, _1080p * -15, _1080p * 15)
	var_3_0:addElement(var_3_7)

	var_3_0.Text = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_8

	local var_3_9 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonUp", var_3_9)

	local function var_3_10()
		var_3_7:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_10

	local var_3_11 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonOver", var_3_11)

	local function var_3_12()
		var_3_7:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_12

	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonDisabled", var_3_13)

	local function var_3_14()
		var_3_7:AnimateSequence("ButtonDisabled")
	end

	var_3_0._sequences.ButtonDisabled = var_3_14

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_3_7:RegisterAnimationSequence("ButtonOverDisabled", var_3_15)

	local function var_3_16()
		var_3_7:AnimateSequence("ButtonOverDisabled")
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_16

	var_3_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOverDisabled")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonDisabled")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("EditLoadoutButton", EditLoadoutButton)
LockTable(_M)
