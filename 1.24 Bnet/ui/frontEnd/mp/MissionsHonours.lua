module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0.BonusIcon1 and arg_1_0.BonusIcon2 and arg_1_0.BonusIcon3 and arg_1_0.BonusText1 and arg_1_0.BonusText2 and arg_1_0.BonusText3, "Warning: Mission Honors Items Missing...")

	local var_1_0 = arg_1_0.BonusText1:GetCurrentFont()
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0.BonusText1:getLocalRect()
	local var_1_5 = math.abs(var_1_2 - var_1_4)
	local var_1_6 = {
		arg_1_1,
		arg_1_2,
		arg_1_3
	}
	local var_1_7 = {
		arg_1_0.BonusText1,
		arg_1_0.BonusText2,
		arg_1_0.BonusText3
	}

	for iter_1_0 = 1, 3 do
		local var_1_8 = var_1_6[iter_1_0]
		local var_1_9 = var_1_7[iter_1_0]
		local var_1_10, var_1_11, var_1_12, var_1_13 = GetTextDimensions(var_1_8, var_1_0, var_1_5)
		local var_1_14 = var_1_12 - var_1_10

		if var_1_9:getText() == Engine.JCBDICCAH(var_1_8) then
			return
		end

		var_1_9:setText(Engine.JCBDICCAH(var_1_8))
		var_1_9:SetLeftAnchor(1)
		var_1_9:SetRightAnchor(0)
		var_1_9:SetLeft(0)
		var_1_9:SetRight(var_1_14)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetAlignment(LUI.Alignment.Center)

	arg_2_0.UpdateHonors = var_0_0

	local var_2_0 = {
		arg_2_0.BonusIcon1,
		arg_2_0.BonusIcon2,
		arg_2_0.BonusIcon3
	}

	for iter_2_0 = 1, 3 do
		local var_2_1 = var_2_0[iter_2_0]

		var_2_1:SetLeftAnchor(1)
		var_2_1:SetRightAnchor(0)
		var_2_1:SetLeft(0)
		var_2_1:SetRight(20 * _1080p)
	end
end

function MissionsHonours(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 180 * _1080p, 0, 20 * _1080p)

	var_3_0.id = "MissionsHonours"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "BonusIcon1"

	var_3_4:SetRGBFromTable(SWATCHES.Rank.thirdPlace, 0)
	var_3_4:setImage(RegisterMaterial("mission_medal_bronze"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 20, 0, _1080p * 20)
	var_3_0:addElement(var_3_4)

	var_3_0.BonusIcon1 = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "BonusText1"

	var_3_6:setText(ToUpperCase("9999"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetOutlineRGBFromInt(0, 0)
	var_3_6:SetDecodeLetterLength(20)
	var_3_6:SetDecodeMaxRandChars(3)
	var_3_6:SetDecodeUpdatesPerLetter(4)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -120, 0, _1080p * 20)
	var_3_0:addElement(var_3_6)

	var_3_0.BonusText1 = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "BonusIcon2"

	var_3_8:SetRGBFromTable(SWATCHES.Rank.secondPlace, 0)
	var_3_8:setImage(RegisterMaterial("mission_medal_silver"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -120, _1080p * -100, 0, _1080p * 20)
	var_3_0:addElement(var_3_8)

	var_3_0.BonusIcon2 = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "BonusText2"

	var_3_10:setText(ToUpperCase("9999"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetDecodeLetterLength(20)
	var_3_10:SetDecodeMaxRandChars(3)
	var_3_10:SetDecodeUpdatesPerLetter(4)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 87, _1080p * 127, 0, _1080p * 20)
	var_3_0:addElement(var_3_10)

	var_3_0.BonusText2 = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "BonusIcon3"

	var_3_12:SetRGBFromInt(14860562, 0)
	var_3_12:setImage(RegisterMaterial("mission_medal_gold"), 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -60, _1080p * -40, 0, _1080p * 20)
	var_3_0:addElement(var_3_12)

	var_3_0.BonusIcon3 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "BonusText3"

	var_3_14:setText(ToUpperCase("9999"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetOutlineRGBFromInt(0, 0)
	var_3_14:SetDecodeLetterLength(20)
	var_3_14:SetDecodeMaxRandChars(3)
	var_3_14:SetDecodeUpdatesPerLetter(4)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -40, 0, 0, _1080p * 20)
	var_3_0:addElement(var_3_14)

	var_3_0.BonusText3 = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("MissionsHonours", MissionsHonours)
LockTable(_M)
