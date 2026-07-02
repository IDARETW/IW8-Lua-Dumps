module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.BackgroundAngleTop:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundTop:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundMain:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundBottom:SetBlurStrength(arg_1_1)
	arg_1_0.BackgroundAngleBottom:SetBlurStrength(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetPanelBlur = var_0_0

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function DoubleNotchedBacker(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "DoubleNotchedBacker"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_3_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "WZWipPromptBackground"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_3_6:Setup9SliceImage(_1080p * 50, _1080p * 50, 0.3000002, 0.3)
	var_3_0:addElement(var_3_6)

	var_3_0.WZWipPromptBackground = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("WZWipSetup", var_3_9)

	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("WZWipSetup", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("WZWipSetup")
		var_3_6:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_11

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("DoubleNotchedBacker", DoubleNotchedBacker)
LockTable(_M)
