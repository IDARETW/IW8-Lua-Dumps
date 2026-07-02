module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.RewardImage)
	assert(arg_1_0.RewardDesc)
	assert(arg_1_0.RewardType)

	if arg_1_2.teamIndex ~= -1 then
		assert(arg_1_2.color)
		arg_1_0.Title:SetRGBFromTable(COLORS.white)
		arg_1_0.Header:SetRGBFromInt(arg_1_2.color, 0)
		arg_1_0.Border:SetRGBFromInt(arg_1_2.color, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupRewardBox = var_0_0
end

function ContractRewardBox(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 660 * _1080p, 0, 200 * _1080p)

	var_3_0.id = "ContractRewardBox"
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

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.6, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_7 = LUI.UIBorder.new(var_3_6)

	var_3_7.id = "Border"

	var_3_7:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_7:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_7:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_7:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_0:addElement(var_3_7)

	var_3_0.Border = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIImage.new()

	var_3_9.id = "DropShadow"

	var_3_9:SetRGBFromInt(0, 0)
	var_3_9:SetAlpha(0.3, 0)
	var_3_9:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_3_9:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_3_0:addElement(var_3_9)

	var_3_0.DropShadow = var_3_9

	local var_3_10
	local var_3_11 = LUI.UIImage.new()

	var_3_11.id = "Header"

	var_3_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 36)
	var_3_0:addElement(var_3_11)

	var_3_0.Header = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIText.new()

	var_3_13.id = "Title"

	var_3_13:SetRGBFromInt(0, 0)
	var_3_13:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REWARD")), 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_13:SetAlignment(LUI.Alignment.Left)
	var_3_13:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 6, _1080p * 30)
	var_3_0:addElement(var_3_13)

	var_3_0.Title = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIImage.new()

	var_3_15.id = "Flare2"

	var_3_15:SetRGBFromTable(SWATCHES.CashPlacement.PlatinumBody, 0)
	var_3_15:SetAlpha(0.1, 0)
	var_3_15:SetScale(-0.2, 0)
	var_3_15:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_15:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -52, _1080p * 240, _1080p * -45, _1080p * 47)
	var_3_0:addElement(var_3_15)

	var_3_0.Flare2 = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIImage.new()

	var_3_17.id = "Flare"

	var_3_17:SetRGBFromTable(SWATCHES.Reticles.Highlight, 0)
	var_3_17:SetAlpha(0.5, 0)
	var_3_17:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_3_17:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -52, _1080p * 240, _1080p * -45, _1080p * 47)
	var_3_0:addElement(var_3_17)

	var_3_0.Flare = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "RewardImage"

	var_3_19:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -90, _1080p * 278, _1080p * 9, _1080p * -7)
	var_3_0:addElement(var_3_19)

	var_3_0.RewardImage = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIStyledText.new()

	var_3_21.id = "RewardType"

	var_3_21:setText("", 0)
	var_3_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_21:SetAlignment(LUI.Alignment.Left)
	var_3_21:SetStartupDelay(1500)
	var_3_21:SetLineHoldTime(400)
	var_3_21:SetAnimMoveTime(300)
	var_3_21:SetEndDelay(1000)
	var_3_21:SetCrossfadeTime(500)
	var_3_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_21:SetMaxVisibleLines(1)
	var_3_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 46, _1080p * 64)
	var_3_0:addElement(var_3_21)

	var_3_0.RewardType = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIStyledText.new()

	var_3_23.id = "RewardDesc"

	var_3_23:setText("", 0)
	var_3_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_23:SetAlignment(LUI.Alignment.Left)
	var_3_23:SetDecodeLetterLength(12)
	var_3_23:SetDecodeMaxRandChars(3)
	var_3_23:SetDecodeUpdatesPerLetter(4)
	var_3_23:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 250, _1080p * -10, _1080p * 70, _1080p * 88)
	var_3_0:addElement(var_3_23)

	var_3_0.RewardDesc = var_3_23

	local function var_3_24()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_24

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_3_15:RegisterAnimationSequence("FlareRotate", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -360,
			duration = 20000,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 2010,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 1990,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_17:RegisterAnimationSequence("FlareRotate", var_3_26)

	local function var_3_27()
		var_3_15:AnimateLoop("FlareRotate")
		var_3_17:AnimateLoop("FlareRotate")
	end

	var_3_0._sequences.FlareRotate = var_3_27

	var_0_1(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "FlareRotate")

	return var_3_0
end

MenuBuilder.registerType("ContractRewardBox", ContractRewardBox)
LockTable(_M)
