module(..., package.seeall)

local var_0_0 = 59 * _1080p
local var_0_1 = 20 * _1080p

local function var_0_2(arg_1_0)
	local var_1_0 = LAYOUT.GetTextWidth(arg_1_0.YouText) + var_0_1

	if var_1_0 > var_0_0 then
		var_1_0 = var_0_0
	end

	arg_1_0.Point:SetRight(arg_1_0.Point:GetCurrentAnchorsAndPositions().left + var_1_0)
end

local function var_0_3(arg_2_0, arg_2_1)
	if Engine.JEDFGECDJ() > 1 then
		if Engine.BBHAECABBD(arg_2_1) then
			if Engine.BFDACIJIAD(arg_2_1) then
				arg_2_0.YouText:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU_P1"))
			else
				arg_2_0.YouText:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU_P2"))
			end
		end
	else
		arg_2_0.YouText:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU"))
	end

	var_0_2(arg_2_0)
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateForSplitscreen = var_0_3

	var_0_2(arg_3_0)

	if IsLanguageJapanese() or IsLanguageKorean() then
		ACTIONS.AnimateSequence(arg_3_0, "JA")
	end
end

function YouIndicatorLeft(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 75 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "YouIndicatorLeft"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Point"

	var_4_4:SetRGBFromTable(SWATCHES.Scoreboard.highlight, 0)
	var_4_4:SetZRotation(180, 0)
	var_4_4:setImage(RegisterMaterial("wdg_button_arrow_indicator"), 0)
	var_4_4:Setup3SliceHorizontalImage(_1080p * 24, 0.46)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 48, _1080p * -12, _1080p * 12)
	var_4_0:addElement(var_4_4)

	var_4_0.Point = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "YouText"

	var_4_6:SetRGBFromInt(0, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("LUA_MENU/YOU"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_6:SetStartupDelay(1000)
	var_4_6:SetLineHoldTime(400)
	var_4_6:SetAnimMoveTime(150)
	var_4_6:SetAnimMoveSpeed(50)
	var_4_6:SetEndDelay(1000)
	var_4_6:SetCrossfadeTime(400)
	var_4_6:SetFadeInTime(300)
	var_4_6:SetFadeOutTime(300)
	var_4_6:SetMaxVisibleLines(1)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 17, _1080p * 47, _1080p * 3, _1080p * 25)
	var_4_0:addElement(var_4_6)

	var_4_0.YouText = var_4_6

	local function var_4_7()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_7

	local var_4_8
	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 48
		}
	}

	var_4_4:RegisterAnimationSequence("JA", var_4_9)

	local var_4_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.BattleNetRegular.File
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		}
	}

	var_4_6:RegisterAnimationSequence("JA", var_4_10)

	local function var_4_11()
		var_4_4:AnimateSequence("JA")
		var_4_6:AnimateSequence("JA")
	end

	var_4_0._sequences.JA = var_4_11

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("YouIndicatorLeft", YouIndicatorLeft)
LockTable(_M)
