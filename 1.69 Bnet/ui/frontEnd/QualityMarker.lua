module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1) or 0
	local var_1_1 = CONDITIONS.IsWZWipFlowEnabled() and arg_1_0.WZWipImage or arg_1_0.Image

	if var_1_0 > 0 then
		var_1_1:SetRGBFromTable(LOOT.GetRarityColor(var_1_0))
		var_1_1:SetAlpha(1)
	else
		var_1_1:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end

	arg_2_0.SetRarityColor = var_0_0
end

function QualityMarker(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 5 * _1080p, 0, 128 * _1080p)

	var_3_0.id = "QualityMarker"
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

	var_3_4.id = "Image"

	var_3_4:SetPixelGridEnabled(true)
	var_3_4:SetPixelGridContrast(0.5, 0)
	var_3_4:SetPixelGridBlockWidth(2, 0)
	var_3_4:SetPixelGridBlockHeight(2, 0)
	var_3_4:SetPixelGridGutterWidth(1, 0)
	var_3_4:SetPixelGridGutterHeight(1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	local var_3_5

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_3_6 = LUI.UIImage.new()

		var_3_6.id = "WZWipImage"

		var_3_0:addElement(var_3_6)

		var_3_0.WZWipImage = var_3_6
	end

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.ButtonOver = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.ButtonUp = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.Disabled = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.Enabled = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("WZWipSetup", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("QualityMarker", QualityMarker)
LockTable(_M)
