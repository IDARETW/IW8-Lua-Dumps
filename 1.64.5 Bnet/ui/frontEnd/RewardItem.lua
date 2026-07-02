module(..., package.seeall)

function RewardItem(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 300 * _1080p)

	var_1_0.id = "RewardItem"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Icon"

	var_1_4:setImage(RegisterMaterial("currency_parts_icon_large"), 0)
	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -105, _1080p * 105, _1080p * -80, _1080p * 130)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "Name"

	var_1_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_BONUS")), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_6:SetAlignment(LUI.Alignment.Center)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetStartupDelay(1000)
	var_1_6:SetLineHoldTime(500)
	var_1_6:SetAnimMoveTime(250)
	var_1_6:SetAnimMoveSpeed(50)
	var_1_6:SetEndDelay(1000)
	var_1_6:SetCrossfadeTime(500)
	var_1_6:SetFadeInTime(300)
	var_1_6:SetFadeOutTime(300)
	var_1_6:SetMaxVisibleLines(1)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -140, _1080p * -100)
	var_1_0:addElement(var_1_6)

	var_1_0.Name = var_1_6

	local function var_1_7()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_7

	local var_1_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -210
		}
	}

	var_1_4:RegisterAnimationSequence("Icon2x1", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("Icon2x1")
	end

	var_1_0._sequences.Icon2x1 = var_1_9

	local var_1_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		}
	}

	var_1_4:RegisterAnimationSequence("ReverseNameAndIcon", var_1_10)

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		}
	}

	var_1_6:RegisterAnimationSequence("ReverseNameAndIcon", var_1_11)

	local function var_1_12()
		var_1_4:AnimateSequence("ReverseNameAndIcon")
		var_1_6:AnimateSequence("ReverseNameAndIcon")
	end

	var_1_0._sequences.ReverseNameAndIcon = var_1_12

	return var_1_0
end

MenuBuilder.registerType("RewardItem", RewardItem)
LockTable(_M)
