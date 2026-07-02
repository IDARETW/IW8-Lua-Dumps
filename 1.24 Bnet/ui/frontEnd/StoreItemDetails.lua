module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isFirstParty then
		ACTIONS.AnimateSequence(arg_1_0, "isFirstParty")
	else
		ACTIONS.AnimateSequence(arg_1_0, "isNotFirstParty")
	end

	arg_1_0.Icon:SetAlpha(arg_1_1.isFirstParty and 0 or 1)
	arg_1_0.Description:setText(arg_1_1.contentLong)
	arg_1_0.Price:setText(arg_1_1.price)
	arg_1_0.Name:setText(arg_1_1.title)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Icon and arg_2_0.Name and arg_2_0.Price and arg_2_0.Description, "WARNING: Elements missing from StoreItemDetails...")

	if IsLanguageArabic() then
		arg_2_0.Description:SetMaxVisibleLines(20)
		arg_2_0.Description:SetFontSize(30 * _1080p)
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	arg_2_0.SetItemDetails = var_0_0
end

function StoreItemDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p)

	var_3_0.id = "StoreItemDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "Description"

	var_3_4:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_4:SetStartupDelay(2000)
	var_3_4:SetLineHoldTime(400)
	var_3_4:SetAnimMoveTime(2000)
	var_3_4:SetAnimMoveSpeed(150)
	var_3_4:SetEndDelay(2000)
	var_3_4:SetCrossfadeTime(250)
	var_3_4:SetFadeInTime(300)
	var_3_4:SetFadeOutTime(300)
	var_3_4:SetMaxVisibleLines(33)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 300, _1080p * 95, _1080p * 113)
	var_3_0:addElement(var_3_4)

	var_3_0.Description = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Price"

	var_3_6:SetRGBFromTable(SWATCHES.Store.Description, 0)
	var_3_6:setText("$5.00", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 37, _1080p * 310, _1080p * 60, _1080p * 82)
	var_3_0:addElement(var_3_6)

	var_3_0.Price = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Name"

	var_3_8:SetRGBFromTable(SWATCHES.Store.Header, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(500)
	var_3_8:SetAnimMoveTime(750)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(2)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 320, 0, _1080p * 28)
	var_3_0:addElement(var_3_8)

	var_3_0.Name = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Icon"

	var_3_10:setImage(RegisterMaterial("currency_cod_points_icon"), 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 32, _1080p * 60, _1080p * 82)
	var_3_0:addElement(var_3_10)

	var_3_0.Icon = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Divider"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.border, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 1, 0, 0)
	var_3_0:addElement(var_3_12)

	var_3_0.Divider = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 10
		}
	}

	var_3_6:RegisterAnimationSequence("isFirstParty", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("isFirstParty", var_3_15)

	local function var_3_16()
		var_3_6:AnimateSequence("isFirstParty")
		var_3_10:AnimateSequence("isFirstParty")
	end

	var_3_0._sequences.isFirstParty = var_3_16

	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 310
		}
	}

	var_3_6:RegisterAnimationSequence("isNotFirstParty", var_3_17)

	local var_3_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("isNotFirstParty", var_3_18)

	local function var_3_19()
		var_3_6:AnimateSequence("isNotFirstParty")
		var_3_10:AnimateSequence("isNotFirstParty")
	end

	var_3_0._sequences.isNotFirstParty = var_3_19

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 125
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_20)

	local function var_3_21()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_21

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("StoreItemDetails", StoreItemDetails)
LockTable(_M)
