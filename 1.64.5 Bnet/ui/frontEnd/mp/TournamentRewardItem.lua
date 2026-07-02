module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.rarity
	local var_1_1 = arg_1_1.image
	local var_1_2 = arg_1_1.class
	local var_1_3 = arg_1_1.name
	local var_1_4 = arg_1_1.value

	if var_1_1 then
		arg_1_0.Image:setImage(RegisterMaterial(var_1_1))
	else
		arg_1_0.Image:SetRGBFromTable(SWATCHES.CAC.greenDark)
	end

	if var_1_4 then
		arg_1_0.PointsText:setText(var_1_4)
		arg_1_0.PointsText:SetAlpha(1)
	end

	if var_1_0 then
		arg_1_0.Rarity:SetRGBFromTable(LOOT.GetRarityColor(var_1_0))
	else
		arg_1_0.Rarity:SetAlpha(0)
	end

	arg_1_0.RewardName:setText(var_1_3)
	arg_1_0.RewardClass:setText(var_1_2)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Image)
	assert(arg_2_0.PointsText)
	assert(arg_2_0.Rarity)
	assert(arg_2_0.Image)
	assert(arg_2_0.RewardClass)

	arg_2_0.SetRewardData = var_0_0
end

function TournamentRewardItem(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 256 * _1080p, 0, 158 * _1080p)

	var_3_0.id = "TournamentRewardItem"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Image"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 255, 0, _1080p * 158)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Rarity"

	var_3_6:SetRGBFromTable(SWATCHES.itemRarity.quality1, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 7, 0, _1080p * 158)
	var_3_0:addElement(var_3_6)

	var_3_0.Rarity = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "RewardName"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 231, _1080p * 127, _1080p * 151)
	var_3_0:addElement(var_3_8)

	var_3_0.RewardName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "RewardClass"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 13, _1080p * 231, _1080p * 97, _1080p * 121)
	var_3_0:addElement(var_3_10)

	var_3_0.RewardClass = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "PointsText"

	var_3_12:SetAlpha(0, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 64, _1080p * 134)
	var_3_0:addElement(var_3_12)

	var_3_0.PointsText = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_8:RegisterAnimationSequence("Result", var_3_14)

	local var_3_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 240
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_10:RegisterAnimationSequence("Result", var_3_15)

	local function var_3_16()
		var_3_8:AnimateSequence("Result")
		var_3_10:AnimateSequence("Result")
	end

	var_3_0._sequences.Result = var_3_16

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentRewardItem", TournamentRewardItem)
LockTable(_M)
