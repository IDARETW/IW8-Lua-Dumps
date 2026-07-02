module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = (arg_1_2.currentKeys - arg_1_2.startKeys) / AAR.KEY_UNIT_CURRENCY
	local var_1_1 = string.format("%d", var_1_0)

	arg_1_0.AmountAwarded:setText(Engine.CBBHFCGDIC("MENU/PLUS", var_1_1))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitKeyReward = var_0_0
end

function AARRewards(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 758 * _1080p)

	var_3_0.id = "AARRewards"
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
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Title"

	var_3_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD_PLURAL"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "AwardedText"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("AAR/KEYS_AWARDED"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -25, _1080p * 176, _1080p * 204)
	var_3_0:addElement(var_3_8)

	var_3_0.AwardedText = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "AmountAwarded"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("MENU/PLUS"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -25, _1080p * 507, _1080p * 543)
	var_3_0:addElement(var_3_10)

	var_3_0.AmountAwarded = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "RewardIcon"

	var_3_12:setImage(RegisterMaterial("icon_currency_keypoints"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 147, _1080p * 403, _1080p * 251, _1080p * 507)
	var_3_0:addElement(var_3_12)

	var_3_0.RewardIcon = var_3_12

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
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Intro", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_12:RegisterAnimationSequence("Intro", var_3_15)

	local function var_3_16()
		var_3_10:AnimateSequence("Intro")
		var_3_12:AnimateSequence("Intro")
	end

	var_3_0._sequences.Intro = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARRewards", AARRewards)
LockTable(_M)
