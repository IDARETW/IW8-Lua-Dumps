module(..., package.seeall)

function StoreButtonHighlightBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 2 * _1080p)

	var_1_0.id = "StoreButtonHighlightBar"
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

	var_1_4.id = "Bar"

	var_1_4:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Bar = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "ButtonGlowTop"

	var_1_6:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_1_6:SetAlpha(0.5, 0)
	var_1_6.Glow:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8)
	var_1_0:addElement(var_1_6)

	var_1_0.ButtonGlowTop = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 230,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			value = 0.75,
			duration = 850,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutCubic
		},
		{
			value = 0.88,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0.8,
			duration = 610,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inOutBack
		}
	}

	var_1_6:RegisterAnimationSequence("Glow", var_1_8)

	local function var_1_9()
		var_1_6:AnimateLoop("Glow")
	end

	var_1_0._sequences.Glow = var_1_9

	local var_1_10 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("GlowOff", var_1_10)

	local function var_1_11()
		var_1_6:AnimateSequence("GlowOff")
	end

	var_1_0._sequences.GlowOff = var_1_11

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.notificationHighlight
		}
	}

	var_1_4:RegisterAnimationSequence("Enabled", var_1_12)

	local var_1_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.equipped,
			child = var_1_0.ButtonGlowTop.Glow
		}
	}

	var_1_6:RegisterAnimationSequence("Enabled", var_1_13)

	local function var_1_14()
		var_1_4:AnimateSequence("Enabled")
		var_1_6:AnimateSequence("Enabled")
	end

	var_1_0._sequences.Enabled = var_1_14

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_1_4:RegisterAnimationSequence("Disabled", var_1_15)

	local var_1_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled,
			child = var_1_0.ButtonGlowTop.Glow
		}
	}

	var_1_6:RegisterAnimationSequence("Disabled", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("Disabled")
		var_1_6:AnimateSequence("Disabled")
	end

	var_1_0._sequences.Disabled = var_1_17

	var_1_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "On")
		ACTIONS.AnimateSequence(var_1_0, "Glow")
		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)
	var_1_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Off")
		ACTIONS.AnimateSequence(var_1_0, "GlowOff")
		ACTIONS.AnimateSequence(var_1_0, "Enabled")
	end)
	var_1_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
		ACTIONS.AnimateSequence(var_1_0, "Glow")
		ACTIONS.AnimateSequence(var_1_0, "On")
	end)
	var_1_0:addEventHandler("button_disable", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "Disabled")
		ACTIONS.AnimateSequence(var_1_0, "GlowOff")
		ACTIONS.AnimateSequence(var_1_0, "Off")
	end)

	return var_1_0
end

MenuBuilder.registerType("StoreButtonHighlightBar", StoreButtonHighlightBar)
LockTable(_M)
