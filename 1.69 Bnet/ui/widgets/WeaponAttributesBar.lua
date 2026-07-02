module(..., package.seeall)

local var_0_0 = 25
local var_0_1 = 100
local var_0_2 = 450

local function var_0_3(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = arg_1_3 and 0 or 200
	local var_1_1 = (tonumber(arg_1_1) or 0) / var_0_1
	local var_1_2 = 1 - var_1_1
	local var_1_3
	local var_1_4

	if arg_1_2 then
		local var_1_5
		local var_1_6
		local var_1_7 = 200
		local var_1_8 = 200

		arg_1_0.ModBar:SetAlpha(1)

		if not arg_1_3 then
			var_1_3 = var_1_1
			var_1_4 = var_1_3 - arg_1_2 / var_0_1

			if arg_1_2 > 0 then
				var_1_4 = var_1_1
				var_1_3 = var_1_4 - arg_1_2 / var_0_1
				var_1_0 = 0
				var_1_8 = 0
				var_1_2 = 1 - var_1_1 + (arg_1_2 and (arg_1_2 / var_0_1 or 0))
			elseif arg_1_2 < 0 then
				var_1_3 = var_1_1
				var_1_4 = var_1_3 - arg_1_2 / var_0_1
				var_1_7 = 0
			end
		else
			var_1_3 = var_1_1
			var_1_4 = var_1_3 + arg_1_2 / var_0_1 * (arg_1_3 and 1 or -1)

			if arg_1_2 > 0 then
				var_1_3 = var_1_1
				var_1_4 = var_1_3 + arg_1_2 / var_0_1 * (arg_1_3 and 1 or -1)
				var_1_8 = 0
			elseif arg_1_2 < 0 then
				var_1_4 = var_1_1
				var_1_3 = var_1_4 + arg_1_2 / var_0_1 * (arg_1_3 and 1 or -1)
				var_1_0 = 0
				var_1_7 = 0
			else
				var_1_8 = 0
				var_1_7 = 0
			end
		end

		if arg_1_2 > 0 then
			arg_1_0.ModBar:SetRGBFromTable(SWATCHES.CAC.weaponMeterBetter)
		elseif arg_1_2 < 0 then
			arg_1_0.ModBar:SetRGBFromTable(SWATCHES.CAC.weaponMeterWorse)
		end

		arg_1_0.ModBar:SetLeftAnchor(var_1_3, arg_1_0._barInitialized and var_1_8 or 0)
		arg_1_0.ModBar:SetRightAnchor(1 - var_1_4, arg_1_0._barInitialized and var_1_7 or 0)
	else
		arg_1_0.ModBar:SetAlpha(0)
	end

	if arg_1_4 then
		local var_1_9 = arg_1_4 / var_0_1

		arg_1_0.BaseStatTic:SetAlpha(1)
		arg_1_0.BaseStatTic:SetLeftAnchor(var_1_9)
		arg_1_0.BaseStatTic:SetLeft(-1 * _1080p)
		arg_1_0.BaseStatTic:SetRightAnchor(1 - var_1_9)
	else
		arg_1_0.BaseStatTic:SetAlpha(0)
	end

	arg_1_0.BaseBar:SetRightAnchor(var_1_2, arg_1_0._barInitialized and var_1_0 or 0)

	if not arg_1_0._barInitialized then
		arg_1_0._barInitialized = true
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.BaseBar)
	assert(arg_2_0.ModBar)

	arg_2_0.UpdateAttributes = var_0_3
	arg_2_0._barInitialized = false

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_2_0, "WZSetup")
	end
end

function WeaponAttributesBar(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 286 * _1080p, 0, 4 * _1080p)

	var_3_0.id = "WeaponAttributesBar"
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

	var_3_4.id = "BackerBar"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_3_4:SetAlpha(0.4, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -2, _1080p * 2)
	var_3_0:addElement(var_3_4)

	var_3_0.BackerBar = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "BaseBar"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.weaponMeterMain, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -2, _1080p * 2)
	var_3_0:addElement(var_3_6)

	var_3_0.BaseBar = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "ModBar"

	var_3_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -2, _1080p * 2)
	var_3_0:addElement(var_3_8)

	var_3_0.ModBar = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "BaseStatTic"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1, _1080p * -4, _1080p * 4)
	var_3_0:addElement(var_3_10)

	var_3_0.BaseStatTic = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder
		}
	}

	var_3_4:RegisterAnimationSequence("WZSetup", var_3_13)

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_3_6:RegisterAnimationSequence("WZSetup", var_3_14)

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_3_8:RegisterAnimationSequence("WZSetup", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("WZSetup")
		var_3_6:AnimateSequence("WZSetup")
		var_3_8:AnimateSequence("WZSetup")
	end

	var_3_0._sequences.WZSetup = var_3_16

	var_0_4(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeaponAttributesBar", WeaponAttributesBar)
LockTable(_M)
