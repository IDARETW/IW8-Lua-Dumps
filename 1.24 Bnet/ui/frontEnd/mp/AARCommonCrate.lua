module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0, var_1_1, var_1_2, var_1_3 = arg_1_0.CommonCrateProgressFill:getLocalRect()
	local var_1_4, var_1_5, var_1_6, var_1_7 = arg_1_0.CommonCrateProgressBG:getLocalRect()
	local var_1_8 = (arg_1_2 - arg_1_3) / AAR.COMMONCRATE_MAX_GAP
	local var_1_9 = LUI.clamp(var_1_8, 0, 1)
	local var_1_10 = (var_1_6 - var_1_4) * var_1_9

	arg_1_0.CommonCrateProgressFill:SetAnchorsAndPosition(0, 1, 0, 1, var_1_0, var_1_0 + var_1_10, var_1_1, var_1_3, 500)
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitCommonCrate = var_0_0
end

function AARCommonCrate(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 360 * _1080p)

	var_3_0.id = "AARCommonCrate"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "CommonCrateImage"

	var_3_6:SetAlpha(0, 0)
	var_3_6:setImage(RegisterMaterial("placeholder_x"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 475, _1080p * 80, _1080p * 280)
	var_3_0:addElement(var_3_6)

	var_3_0.CommonCrateImage = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "CommonCrateProgressBG"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.progressBackground, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 437, _1080p * 301, _1080p * 317)
	var_3_0:addElement(var_3_8)

	var_3_0.CommonCrateProgressBG = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "CommonCrateProgressFill"

	var_3_10:SetRGBFromTable(SWATCHES.AAR.AARprogressFill, 0)
	var_3_10:SetAlpha(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 113, _1080p * 113, _1080p * 317, _1080p * 333)
	var_3_0:addElement(var_3_10)

	var_3_0.CommonCrateProgressFill = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Title"

	var_3_12.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/COMMON_CRATE")), 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_3_0:addElement(var_3_12)

	var_3_0.Title = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Intro", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Intro", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 290,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Intro", var_3_16)

	local function var_3_17()
		var_3_6:AnimateSequence("Intro")
		var_3_8:AnimateSequence("Intro")
		var_3_10:AnimateSequence("Intro")
	end

	var_3_0._sequences.Intro = var_3_17

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARCommonCrate", AARCommonCrate)
LockTable(_M)
