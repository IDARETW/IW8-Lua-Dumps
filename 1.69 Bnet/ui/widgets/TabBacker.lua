module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function TabBacker(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 160 * _1080p)

	var_2_0.id = "TabBacker"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3

	if not CONDITIONS.IsWZWipFlowEnabled() then
		var_2_3 = LUI.UIImage.new()
		var_2_3.id = "TabBacker"

		var_2_3:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
		var_2_3:SetAlpha(0.8, 0)
		var_2_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
		var_2_0:addElement(var_2_3)

		var_2_0.TabBacker = var_2_3
	end

	local var_2_4

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_2_5 = LUI.UIImage.new()

		var_2_5.id = "WZWipBanner"

		var_2_5:setImage(RegisterMaterial("ui_mp_wz_bkg_tabmenu"), 0)
		var_2_0:addElement(var_2_5)

		var_2_0.WZWipBanner = var_2_5
	end

	local function var_2_6()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_6

	local var_2_7

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_2_8 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_2_3:RegisterAnimationSequence("WZWipSetup", var_2_8)
	end

	local function var_2_9()
		if not CONDITIONS.IsWZWipFlowEnabled() then
			var_2_3:AnimateSequence("WZWipSetup")
		end
	end

	var_2_0._sequences.WZWipSetup = var_2_9

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("TabBacker", TabBacker)
LockTable(_M)
