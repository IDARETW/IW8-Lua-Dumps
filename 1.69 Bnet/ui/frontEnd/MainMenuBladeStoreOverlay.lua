module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.PromptButton then
		ACTIONS.AnimateSequence(arg_1_0.PromptButton, "OnSale")
	end
end

local function var_0_1(arg_2_0)
	if not arg_2_0._expanded then
		arg_2_0._expanded = true

		ACTIONS.AnimateSequence(arg_2_0, "Expanded")

		if arg_2_0.PromptButton then
			ACTIONS.AnimateSequence(arg_2_0.PromptButton, "Expanded")
			ACTIONS.AnimateSequence(arg_2_0.PromptButton, "GlowPulse")
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0._expanded then
		arg_3_0._expanded = false

		ACTIONS.AnimateSequence(arg_3_0, "Contracted")

		if arg_3_0.PromptButton then
			if arg_3_1 then
				ACTIONS.AnimateSequence(arg_3_0.PromptButton, "ContractedSmaller")
			else
				ACTIONS.AnimateSequence(arg_3_0.PromptButton, "Contracted")
			end
		end
	elseif arg_3_1 and arg_3_0.PromptButton then
		ACTIONS.AnimateSequence(arg_3_0.PromptButton, "SetContractedSmaller")
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.FlagOnSale = var_0_0
	arg_4_0.FlagExpanded = var_0_1
	arg_4_0.FlagContracted = var_0_2
end

function MainMenuBladeStoreOverlay(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "MainMenuBladeStoreOverlay"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MainMenuBladePromptButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "PromptButton"

	var_5_4.PurchaseText:setText(Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_HERE"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -211, _1080p * 211, _1080p * -220, _1080p * -90)
	var_5_0:addElement(var_5_4)

	var_5_0.PromptButton = var_5_4

	local function var_5_5()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_5

	local var_5_6
	local var_5_7 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Contracted", var_5_7)

	local function var_5_8()
		var_5_4:AnimateSequence("Contracted")
	end

	var_5_0._sequences.Contracted = var_5_8

	local var_5_9
	local var_5_10 = {
		{
			value = 1,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Expanded", var_5_10)

	local function var_5_11()
		var_5_4:AnimateSequence("Expanded")
	end

	var_5_0._sequences.Expanded = var_5_11

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MainMenuBladeStoreOverlay", MainMenuBladeStoreOverlay)
LockTable(_M)
