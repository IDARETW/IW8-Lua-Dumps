module(..., package.seeall)

local var_0_0 = 5

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = CONDITIONS.InFrontend(arg_1_0) and arg_1_0.Background or arg_1_0.BackgroundMP

	if arg_1_1 and arg_1_1.customScale then
		var_1_0:SetScale(arg_1_1.customScale)
	else
		ACTIONS.ScaleStretchAnchorFullscreen(var_1_0)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	assert(arg_2_1 and (type(arg_2_1) == "number" or type(arg_2_1) == "table"), "You must specifiy a color as an integer or table.")

	local var_2_0 = CONDITIONS.InFrontend(arg_2_0) and arg_2_0.Background or arg_2_0.BackgroundMP

	if type(arg_2_1) == "table" then
		assert(arg_2_1.r, "Your must specify a color property for the red channel.")
		assert(arg_2_1.g, "Your must specify a color property for the green channel.")
		assert(arg_2_1.b, "Your must specify a color property for the blue channel.")
		var_2_0:SetRGBFromTable(arg_2_1)
	else
		var_2_0:SetRGBFromInt(arg_2_1, 0)
	end
end

local function var_0_3(arg_3_0)
	local function var_3_0()
		local var_4_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_3_0:SetBackgroundSize({
			customScale = var_4_0
		})
	end

	arg_3_0:addAndCallEventHandler("onVideoChange", var_3_0)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetBackgroundSize = var_0_1
	arg_5_0.SetBackgroundColor = var_0_2
	arg_5_0.SetVideoSizeUpdateHandler = var_0_3

	local var_5_0 = arg_5_0:getParent()

	ACTIONS.ScaleStretchAnchorFullscreen(CONDITIONS.InFrontend(arg_5_0) and arg_5_0.Background or arg_5_0.BackgroundMP)

	if CONDITIONS.InFrontend(arg_5_0) then
		if CONDITIONS.IsWZWipDvarEnabled() then
			ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
		end
	else
		local var_5_1 = LUI.UIElement.new()

		var_5_1:SetBlurStrength(var_0_0)
		var_5_1:setupWorldBlur()

		var_5_1.id = "blur"

		arg_5_0:addElement(var_5_1)
	end
end

function MenuBackgroundImage(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "MenuBackgroundImage"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3

	if CONDITIONS.InFrontend(var_6_0) then
		var_6_3 = LUI.UIImage.new()
		var_6_3.id = "Background"

		var_6_3:setImage(RegisterMaterial("frontend_option_bg"), 0)
		var_6_0:addElement(var_6_3)

		var_6_0.Background = var_6_3
	end

	local var_6_4

	if not CONDITIONS.InFrontend(var_6_0) then
		local var_6_5 = LUI.UIImage.new()

		var_6_5.id = "BackgroundMP"

		var_6_5:SetRGBFromInt(0, 0)
		var_6_5:SetAlpha(0.7, 0)
		var_6_0:addElement(var_6_5)

		var_6_0.BackgroundMP = var_6_5
	end

	local function var_6_6()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_6

	local var_6_7

	if CONDITIONS.InFrontend(var_6_0) then
		local var_6_8 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_mp_br_frontend_option_bg_ch2")
			}
		}

		var_6_3:RegisterAnimationSequence("WZWipSetup", var_6_8)
	end

	local function var_6_9()
		if CONDITIONS.InFrontend(var_6_0) then
			var_6_3:AnimateSequence("WZWipSetup")
		end
	end

	var_6_0._sequences.WZWipSetup = var_6_9

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MenuBackgroundImage", MenuBackgroundImage)
LockTable(_M)
