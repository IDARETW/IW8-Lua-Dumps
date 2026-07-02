module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_1_0, "JP")
	end
end

function BRPlayMenuPromotedHeader(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 30 * _1080p)

	var_2_0.id = "BRPlayMenuPromotedHeader"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "FeaturedLabel"

	var_2_4:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_4:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MULTIPLAYER_TRIAL"), 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_4:SetStartupDelay(2000)
	var_2_4:SetLineHoldTime(400)
	var_2_4:SetAnimMoveTime(2000)
	var_2_4:SetAnimMoveSpeed(150)
	var_2_4:SetEndDelay(2000)
	var_2_4:SetCrossfadeTime(250)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(1)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 4, _1080p * 290, 0, _1080p * 30)
	var_2_0:addElement(var_2_4)

	var_2_0.FeaturedLabel = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("LimitedTimeNotification", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "LimitedTimeNotification"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 430, 0, _1080p * 30)
	var_2_0:addElement(var_2_6)

	var_2_0.LimitedTimeNotification = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		}
	}

	var_2_4:RegisterAnimationSequence("JP", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("JP")
	end

	var_2_0._sequences.JP = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BRPlayMenuPromotedHeader", BRPlayMenuPromotedHeader)
LockTable(_M)
