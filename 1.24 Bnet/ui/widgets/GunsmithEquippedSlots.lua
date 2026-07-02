module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0 = 1, #arg_1_0._equipSlots do
		ACTIONS.AnimateSequence(arg_1_0._equipSlots[iter_1_0], "SlotEmpty")
	end

	for iter_1_1 = 1, arg_1_1 do
		ACTIONS.AnimateSequence(arg_1_0._equipSlots[iter_1_1], "SlotFilled")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupCount = var_0_0
	arg_2_0._equipSlots = {
		arg_2_0.Slot1,
		arg_2_0.Slot2,
		arg_2_0.Slot3,
		arg_2_0.Slot4,
		arg_2_0.Slot5
	}

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function GunsmithEquippedSlots(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 332 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "GunsmithEquippedSlots"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIStyledText.new()

	var_3_4.id = "EquippedTxt"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.subtitle, 0)
	var_3_4:setText("Equipped #/#:", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 163, _1080p * -14, _1080p * 14)
	var_3_0:addElement(var_3_4)

	var_3_0.EquippedTxt = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Slot1"

	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 171, _1080p * 195, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_6)

	var_3_0.Slot1 = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "Slot2"

	var_3_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 206, _1080p * 230, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_8)

	var_3_0.Slot2 = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "Slot3"

	var_3_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 240, _1080p * 264, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_10)

	var_3_0.Slot3 = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Slot4"

	var_3_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 274, _1080p * 298, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_12)

	var_3_0.Slot4 = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "Slot5"

	var_3_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 308, _1080p * 332, _1080p * -12, _1080p * 12)
	var_3_0:addElement(var_3_14)

	var_3_0.Slot5 = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 166
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18
		}
	}

	var_3_4:RegisterAnimationSequence("AR", var_3_16)

	local function var_3_17()
		var_3_4:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_17

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GunsmithEquippedSlots", GunsmithEquippedSlots)
LockTable(_M)
