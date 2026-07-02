module(..., package.seeall)

function CODTvMenuTitle(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 960 * _1080p, 0, 80 * _1080p)

	var_1_0.id = "CODTvMenuTitle"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		var_1_3 = LUI.UIImage.new()
		var_1_3.id = "MPBackerImage"

		var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -19, _1080p * 1005, _1080p * -1.5, _1080p * 126.5)
		var_1_0:addElement(var_1_3)

		var_1_0.MPBackerImage = var_1_3
	end

	local var_1_4

	if not CONDITIONS.IsCoreMultiplayer(var_1_0) then
		local var_1_5 = LUI.UIImage.new()

		var_1_5.id = "Darkener"

		var_1_5:SetRGBFromInt(0, 0)
		var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -105, _1080p * 655, _1080p * -54, _1080p * 326)
		var_1_0:addElement(var_1_5)

		var_1_0.Darkener = var_1_5
	end

	local var_1_6

	if Engine.EAIICIFIFA() and CONDITIONS.IsThirdGameMode(var_1_0) then
		local var_1_7 = LUI.UIImage.new()

		var_1_7.id = "Gradient"

		var_1_7:SetAlpha(0, 0)
		var_1_7:setImage(RegisterMaterial("cp_wepbuild_gradient_banner_1"), 0)
		var_1_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -95, 0, 0, 0)
		var_1_0:addElement(var_1_7)

		var_1_0.Gradient = var_1_7
	end

	local var_1_8
	local var_1_9 = LUI.UIStyledText.new()

	var_1_9.id = "MenuBreadcrumbs"

	var_1_9:setText("", 0)
	var_1_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_9:SetAlignment(LUI.Alignment.Left)
	var_1_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_9:SetDecodeLetterLength(20)
	var_1_9:SetDecodeMaxRandChars(6)
	var_1_9:SetDecodeUpdatesPerLetter(4)
	var_1_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 94, _1080p * -304, 0, _1080p * 16)
	var_1_0:addElement(var_1_9)

	var_1_0.MenuBreadcrumbs = var_1_9

	local var_1_10
	local var_1_11 = LUI.UIImage.new()

	var_1_11.id = "Divider"

	var_1_11:SetAlpha(0.8, 0)
	var_1_11:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 490, _1080p * 16, _1080p * 17)
	var_1_0:addElement(var_1_11)

	var_1_0.Divider = var_1_11

	local var_1_12
	local var_1_13 = LUI.UIImage.new()

	var_1_13.id = "TicBR"

	var_1_13:SetAlpha(0.8, 0)
	var_1_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * 68, _1080p * 70)
	var_1_0:addElement(var_1_13)

	var_1_0.TicBR = var_1_13

	local var_1_14
	local var_1_15 = LUI.UIImage.new()

	var_1_15.id = "TicuR"

	var_1_15:SetAlpha(0.8, 0)
	var_1_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 482, _1080p * 492, _1080p * -4.5, _1080p * -2.5)
	var_1_0:addElement(var_1_15)

	var_1_0.TicuR = var_1_15

	local var_1_16
	local var_1_17 = LUI.UIText.new()

	var_1_17.id = "Title"

	var_1_17:SetAlpha(0.8, 0)
	var_1_17:setText(Engine.CBBHFCGDIC("CODTV/COD_ON_MLGTV"), 0)
	var_1_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_17:SetAlignment(LUI.Alignment.Left)
	var_1_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 949, _1080p * 19, _1080p * 69)
	var_1_0:addElement(var_1_17)

	var_1_0.Title = var_1_17

	local function var_1_18()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_18

	if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
		local var_1_19 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -19
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 1164
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -1.5
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 126.5
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Top_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Bottom_Anchor
			}
		}

		var_1_3:RegisterAnimationSequence("MPSetup", var_1_19)
	end

	local var_1_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -395
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_9:RegisterAnimationSequence("MPSetup", var_1_20)

	local var_1_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_11:RegisterAnimationSequence("MPSetup", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_13:RegisterAnimationSequence("MPSetup", var_1_22)

	local var_1_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_1_15:RegisterAnimationSequence("MPSetup", var_1_23)

	local var_1_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 929
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_1_17:RegisterAnimationSequence("MPSetup", var_1_24)

	local function var_1_25()
		if Engine.EAAHGICFBD() and not Engine.EAIICIFIFA() then
			var_1_3:AnimateSequence("MPSetup")
		end

		var_1_9:AnimateSequence("MPSetup")
		var_1_11:AnimateSequence("MPSetup")
		var_1_13:AnimateSequence("MPSetup")
		var_1_15:AnimateSequence("MPSetup")
		var_1_17:AnimateSequence("MPSetup")
	end

	var_1_0._sequences.MPSetup = var_1_25

	if CONDITIONS.IsMultiplayer(var_1_0) then
		ACTIONS.AnimateSequence(var_1_0, "MPSetup")
		ACTIONS.PlaySoundSetSound(var_1_0, "menuDecode", false)
	end

	return var_1_0
end

MenuBuilder.registerType("CODTvMenuTitle", CODTvMenuTitle)
LockTable(_M)
