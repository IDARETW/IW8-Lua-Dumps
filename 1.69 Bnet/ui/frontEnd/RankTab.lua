module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = tonumber(arg_1_1) or 0
	local var_1_1 = PROGRESSION.ValidatePrestigeLevel(tonumber(arg_1_2) or 0, {
		_isBackendPrestigeLevel = true
	})
	local var_1_2 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = var_1_0,
		_prestigeLevel = var_1_1
	})

	arg_1_0.RankIcon:setImage(RegisterMaterial(var_1_2._rankIcon))
	arg_1_0.RankNumber:setText(var_1_2._rankDisplay)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.InitializeRankDisplay = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
		arg_2_0.RankNumber:SetAlignment(LUI.Alignment.Center)
	end
end

function RankTab(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 70 * _1080p, 0, 36 * _1080p)

	var_3_0.id = "RankTab"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_3_3 = LUI.UIImage.new()
		var_3_3.id = "WZWipBacking"

		var_3_3:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
		var_3_3:SetAlpha(0, 0)
		var_3_3:Setup9SliceImage(_1080p * 6, _1080p * 6, 0.3, 0.3)
		var_3_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 14, _1080p * 58, _1080p * 3, _1080p * 31)
		var_3_0:addElement(var_3_3)

		var_3_0.WZWipBacking = var_3_3
	end

	local var_3_4
	local var_3_5 = LUI.UIText.new()

	var_3_5.id = "RankNumber"

	var_3_5:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_5:setText("999", 0)
	var_3_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_5:SetAlignment(LUI.Alignment.Left)
	var_3_5:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 70, _1080p * 8, _1080p * 26)
	var_3_0:addElement(var_3_5)

	var_3_0.RankNumber = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "RankIcon"

	var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 36, 0, _1080p * 36)
	var_3_0:addElement(var_3_7)

	var_3_0.RankIcon = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_8

	local function var_3_9()
		return
	end

	var_3_0._sequences.Icon1x1 = var_3_9

	local function var_3_10()
		return
	end

	var_3_0._sequences.Icon2x1 = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.Intro = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 34
		}
	}

	var_3_5:RegisterAnimationSequence("AR", var_3_13)

	local function var_3_14()
		var_3_5:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_14

	local var_3_15

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_3_16 = {
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZGlobalSwatches.WZLineSeperator
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 13
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 57
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Material,
				value = RegisterMaterial("ui_mp_wz_border_square")
			}
		}

		var_3_3:RegisterAnimationSequence("WZWipSetup", var_3_16)
	end

	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTitle
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainBold.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 30
		}
	}

	var_3_5:RegisterAnimationSequence("WZWipSetup", var_3_17)

	local var_3_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_3_7:RegisterAnimationSequence("WZWipSetup", var_3_18)

	local function var_3_19()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_3_3:AnimateSequence("WZWipSetup")
		end

		var_3_5:AnimateSequence("WZWipSetup")
		var_3_7:AnimateSequence("WZWipSetup")
	end

	var_3_0._sequences.WZWipSetup = var_3_19

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("RankTab", RankTab)
LockTable(_M)
