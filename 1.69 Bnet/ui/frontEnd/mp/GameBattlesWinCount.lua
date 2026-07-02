module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0.winWidgets) do
		if iter_1_0 <= arg_1_1 then
			iter_1_1:SetRGBFromTable(SWATCHES.splashNotifications.secondaryText, 0)
		else
			break
		end
	end
end

local function var_0_1(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.winWidgets) do
		iter_2_1:closeTree()
	end

	arg_2_0.winWidgets = {}
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = 0

	if arg_3_1 == 1 then
		var_3_0 = 1
	elseif arg_3_1 == 3 then
		var_3_0 = 2
	elseif arg_3_1 == 5 then
		var_3_0 = 3
	end

	arg_3_0:ClearWinWidgets()

	for iter_3_0 = 1, var_3_0 do
		arg_3_0:AddWinWidget("Win" .. iter_3_0)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIImage.new()

	var_4_0.id = arg_4_1

	var_4_0:SetRGBFromInt(3684408, 0)
	var_4_0:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_4_0:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 61, _1080p * 81, _1080p * -10, _1080p * 10)
	arg_4_0:addElement(var_4_0)
	table.insert(arg_4_0.winWidgets, var_4_0)
end

function PostLoadFunc(arg_5_0)
	arg_5_0.ClearWinWidgets = var_0_1
	arg_5_0.AddWinWidget = var_0_3
	arg_5_0.SetMatchNumber = var_0_2
	arg_5_0.SetTeamWinCount = var_0_0
	arg_5_0.winWidgets = {
		arg_5_0.Win1,
		arg_5_0.Win2,
		arg_5_0.Win3
	}
end

function GameBattlesWinCount(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalStackedLayout.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 150 * _1080p, 0, 30 * _1080p)

	var_6_0.id = "GameBattlesWinCount"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:SetSpacing(5 * _1080p)

	local var_6_3
	local var_6_4 = LUI.UIText.new()

	var_6_4.id = "Maps"

	var_6_4:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_4:setText(Engine.CBBHFCGDIC("LUA_MENU/MAPS_CAPS"), 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_4:SetWordWrap(false)
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 56, _1080p * 3, _1080p * 28)
	var_6_0:addElement(var_6_4)

	var_6_0.Maps = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Win1"

	var_6_6:SetRGBFromTable(SWATCHES.CAC.greenDark, 0)
	var_6_6:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 61, _1080p * 81, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_6)

	var_6_0.Win1 = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "Win2"

	var_6_8:SetRGBFromTable(SWATCHES.CAC.greenDark, 0)
	var_6_8:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 86, _1080p * 106, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_8)

	var_6_0.Win2 = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "Win3"

	var_6_10:SetRGBFromTable(SWATCHES.CAC.greenDark, 0)
	var_6_10:setImage(RegisterMaterial("passive_circle_background"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 111, _1080p * 131, _1080p * -10, _1080p * 10)
	var_6_0:addElement(var_6_10)

	var_6_0.Win3 = var_6_10

	local function var_6_11()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_11

	local var_6_12
	local var_6_13 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("bo3Animation", var_6_13)

	local var_6_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("bo3Animation", var_6_14)

	local var_6_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("bo3Animation", var_6_15)

	local function var_6_16()
		var_6_6:AnimateSequence("bo3Animation")
		var_6_8:AnimateSequence("bo3Animation")
		var_6_10:AnimateSequence("bo3Animation")
	end

	var_6_0._sequences.bo3Animation = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("bo5Animation", var_6_18)

	local var_6_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("bo5Animation", var_6_19)

	local var_6_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("bo5Animation", var_6_20)

	local function var_6_21()
		var_6_6:AnimateSequence("bo5Animation")
		var_6_8:AnimateSequence("bo5Animation")
		var_6_10:AnimateSequence("bo5Animation")
	end

	var_6_0._sequences.bo5Animation = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("bo1Animation", var_6_23)

	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("bo1Animation", var_6_24)

	local var_6_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("bo1Animation", var_6_25)

	local function var_6_26()
		var_6_6:AnimateSequence("bo1Animation")
		var_6_8:AnimateSequence("bo1Animation")
		var_6_10:AnimateSequence("bo1Animation")
	end

	var_6_0._sequences.bo1Animation = var_6_26

	PostLoadFunc(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("GameBattlesWinCount", GameBattlesWinCount)
LockTable(_M)
