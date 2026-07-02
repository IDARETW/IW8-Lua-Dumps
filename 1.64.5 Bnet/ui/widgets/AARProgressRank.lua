module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.NextText)
	assert(arg_1_0.CurrentText)
	assert(arg_1_1)

	if arg_1_0.CurrentRank then
		if arg_1_0.CurrentRank ~= arg_1_1 then
			arg_1_0.NextText:setText(arg_1_1)
			arg_1_0.CurrentText:setText(arg_1_0.CurrentRank)
			ACTIONS.AnimateSequence(arg_1_0, "UpdateRank")

			arg_1_0.CurrentRank = arg_1_1
		end
	else
		arg_1_0.CurrentRank = arg_1_1

		arg_1_0.CurrentText:setText(arg_1_0.CurrentRank)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.CurrentRank = nil
	arg_2_0.UpdateRank = var_0_0
end

function AARProgressRank(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 64 * _1080p, 0, 125 * _1080p)

	var_3_0.id = "AARProgressRank"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:SetAlpha(0.85, 0)
	var_3_4:setImage(RegisterMaterial("icon_t9_rank_05"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, 0, _1080p * 64)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "NextText"

	var_3_6:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setText("2", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 100, _1080p * 148)
	var_3_0:addElement(var_3_6)

	var_3_0.NextText = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "CurrentText"

	var_3_8:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_3_8:setText("2", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 64, _1080p * 112)
	var_3_0:addElement(var_3_8)

	var_3_0.CurrentText = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10
	local var_3_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 134
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("UpdateRank", var_3_11)

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 62
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("UpdateRank", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("UpdateRank")
		var_3_8:AnimateSequence("UpdateRank")
	end

	var_3_0._sequences.UpdateRank = var_3_13

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AARProgressRank", AARProgressRank)
LockTable(_M)
