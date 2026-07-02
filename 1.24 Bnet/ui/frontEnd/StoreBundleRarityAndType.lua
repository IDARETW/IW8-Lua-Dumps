module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_1)

	if arg_1_1.bundleType then
		arg_1_0.BundleRarityType:setText(Engine.CBBHFCGDIC(arg_1_1.bundleType))
		ACTIONS.AnimateSequence(arg_1_0, "ShowType")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Hide")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateInfo = var_0_0
end

function StoreBundleRarityAndType(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "StoreBundleRarityAndType"
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

	var_3_4.id = "RarityIcon"

	var_3_4:setImage(RegisterMaterial("icon_rarity_5"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.RarityIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "BundleRarityType"

	var_3_6:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 42, 0, _1080p * 2, _1080p * 30)
	var_3_0:addElement(var_3_6)

	var_3_0.BundleRarityType = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowRarityAndType", var_3_8)

	local var_3_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 42
		}
	}

	var_3_6:RegisterAnimationSequence("ShowRarityAndType", var_3_9)

	local function var_3_10()
		var_3_4:AnimateSequence("ShowRarityAndType")
		var_3_6:AnimateSequence("ShowRarityAndType")
	end

	var_3_0._sequences.ShowRarityAndType = var_3_10

	local var_3_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_11)

	local var_3_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_12)

	local function var_3_13()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ShowType", var_3_14)

	local var_3_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		}
	}

	var_3_6:RegisterAnimationSequence("ShowType", var_3_15)

	local function var_3_16()
		var_3_4:AnimateSequence("ShowType")
		var_3_6:AnimateSequence("ShowType")
	end

	var_3_0._sequences.ShowType = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StoreBundleRarityAndType", StoreBundleRarityAndType)
LockTable(_M)
