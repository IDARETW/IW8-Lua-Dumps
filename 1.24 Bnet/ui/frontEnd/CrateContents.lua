module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = tonumber(arg_1_1.numSlots)
	local var_1_1 = {
		arg_1_1.slotTypeID1,
		arg_1_1.slotTypeID2,
		arg_1_1.slotTypeID3
	}
	local var_1_2 = {
		arg_1_0.Item1Image,
		arg_1_0.Item2Image,
		arg_1_0.Item3Image
	}
	local var_1_3 = {
		arg_1_0.Item1Label,
		arg_1_0.Item2Label,
		arg_1_0.Item3Label
	}

	for iter_1_0 = 1, var_1_0 do
		local var_1_4 = LOOT.GetItemClassName(tonumber(var_1_1[iter_1_0]))
		local var_1_5 = LOOT.GetItemClassImage(tonumber(var_1_1[iter_1_0]))

		var_1_3[iter_1_0]:setText(var_1_4)
		var_1_2[iter_1_0]:setImage(RegisterMaterial(var_1_5))
		var_1_2[iter_1_0]:SetAlpha(1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupData = var_0_0
end

function CrateContents(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 270 * _1080p)

	var_3_0.id = "CrateContents"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "ContentsLabel"

	var_3_4:setText("May Contain:", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 543, _1080p * 30, _1080p * 48)
	var_3_0:addElement(var_3_4)

	var_3_0.ContentsLabel = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Item1Image"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 158, _1080p * 77, _1080p * 205)
	var_3_0:addElement(var_3_6)

	var_3_0.Item1Image = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Item2Image"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 199, _1080p * 327, _1080p * 77, _1080p * 205)
	var_3_0:addElement(var_3_8)

	var_3_0.Item2Image = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Item3Image"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 371, _1080p * 499, _1080p * 77, _1080p * 205)
	var_3_0:addElement(var_3_10)

	var_3_0.Item3Image = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Item1Label"

	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 30, _1080p * 179, _1080p * 216, _1080p * 234)
	var_3_0:addElement(var_3_12)

	var_3_0.Item1Label = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "Item2Label"

	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 199, _1080p * 349, _1080p * 216, _1080p * 234)
	var_3_0:addElement(var_3_14)

	var_3_0.Item2Label = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "Item3Label"

	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 371, _1080p * 535, _1080p * 216, _1080p * 234)
	var_3_0:addElement(var_3_16)

	var_3_0.Item3Label = var_3_16

	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("DefaultSequence", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("DefaultSequence", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("DefaultSequence", var_3_19)

	local function var_3_20()
		var_3_6:AnimateSequence("DefaultSequence")
		var_3_8:AnimateSequence("DefaultSequence")
		var_3_10:AnimateSequence("DefaultSequence")
	end

	var_3_0._sequences.DefaultSequence = var_3_20

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("CrateContents", CrateContents)
LockTable(_M)
