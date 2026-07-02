module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, "Glow")
		ACTIONS.AnimateSequence(arg_2_0, "Enabled")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, "GlowOff")
		ACTIONS.AnimateSequence(arg_3_0, "Enabled")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_4_0, "Disabled")
		ACTIONS.AnimateSequence(arg_4_0, "Glow")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_5_0, "Disabled")
		ACTIONS.AnimateSequence(arg_5_0, "GlowOff")
	end)
end

function StoreButtonHighlightBar(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 250 * _1080p, 0, 2 * _1080p)

	var_6_0.id = "StoreButtonHighlightBar"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Bar"

	var_6_4:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Bar = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "ButtonGlowTop"

	var_6_6:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_6_6:SetAlpha(0.5, 0)
	var_6_6.Glow:SetRGBFromTable(SWATCHES.Store.BundleTextHighlight, 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8)
	var_6_0:addElement(var_6_6)

	var_6_0.ButtonGlowTop = var_6_6

	local function var_6_7()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_7

	local var_6_8
	local var_6_9 = {
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

	var_6_6:RegisterAnimationSequence("Glow", var_6_9)

	local function var_6_10()
		var_6_6:AnimateLoop("Glow")
	end

	var_6_0._sequences.Glow = var_6_10

	local var_6_11
	local var_6_12 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("GlowOff", var_6_12)

	local function var_6_13()
		var_6_6:AnimateSequence("GlowOff")
	end

	var_6_0._sequences.GlowOff = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Enabled", var_6_15)

	local var_6_16 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Enabled", var_6_16)

	local function var_6_17()
		var_6_4:AnimateSequence("Enabled")
		var_6_6:AnimateSequence("Enabled")
	end

	var_6_0._sequences.Enabled = var_6_17

	local var_6_18
	local var_6_19 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Disabled", var_6_19)

	local var_6_20 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Disabled", var_6_20)

	local function var_6_21()
		var_6_4:AnimateSequence("Disabled")
		var_6_6:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_21

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("StoreButtonHighlightBar", StoreButtonHighlightBar)
LockTable(_M)
