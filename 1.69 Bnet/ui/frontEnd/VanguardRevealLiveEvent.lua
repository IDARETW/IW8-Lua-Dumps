module(..., package.seeall)

function VanguardRevealLiveEvent(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 740 * _1080p, 0, 64 * _1080p)

	var_1_0.id = "VanguardRevealLiveEvent"
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

	var_1_4.id = "BackingGlow"

	var_1_4:SetRGBFromTable(SWATCHES.WZCH3.WZCH3EventRevealColor, 0)
	var_1_4:SetAlpha(0.4, 0)
	var_1_4:setImage(RegisterMaterial("ui_generic_glow"), 0)
	var_1_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_1_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 90, _1080p * -90, _1080p * -32, _1080p * 104)
	var_1_0:addElement(var_1_4)

	var_1_0.BackingGlow = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Background"

	var_1_6:SetRGBFromTable(SWATCHES.WZCH3.WZCH3EventRevealColor, 0)
	var_1_6:SetAlpha(0.6, 0)
	var_1_6:setImage(RegisterMaterial("main_event_banner_vg"), 0)
	var_1_0:addElement(var_1_6)

	var_1_0.Background = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "TitleGlow"

	var_1_8:SetRGBFromTable(SWATCHES.WZCH3.WZCH3EventRevealColor, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_8:SetTracking(2 * _1080p, 0)
	var_1_8:SetAlignment(LUI.Alignment.Center)
	var_1_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 2, _1080p * 2, _1080p * -18, _1080p * 18)
	var_1_0:addElement(var_1_8)

	var_1_0.TitleGlow = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Title"

	var_1_10:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/VG_REVEAL_BOV"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_10:SetTracking(2 * _1080p, 0)
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -19, _1080p * 17)
	var_1_0:addElement(var_1_10)

	var_1_0.Title = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Triangle"

	var_1_12:setImage(RegisterMaterial("ui_mp_br_shared_triangle"), 0)
	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 74, _1080p * 90)
	var_1_0:addElement(var_1_12)

	var_1_0.Triangle = var_1_12

	local function var_1_13()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_13

	local var_1_14
	local var_1_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Hide", var_1_15)

	local var_1_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Hide", var_1_16)

	local function var_1_17()
		var_1_6:AnimateSequence("Hide")
		var_1_10:AnimateSequence("Hide")
	end

	var_1_0._sequences.Hide = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_6:RegisterAnimationSequence("Show", var_1_19)

	local var_1_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("Show", var_1_20)

	local function var_1_21()
		var_1_6:AnimateSequence("Show")
		var_1_10:AnimateSequence("Show")
	end

	var_1_0._sequences.Show = var_1_21

	local function var_1_22()
		return
	end

	var_1_0._sequences.EventLive = var_1_22

	local function var_1_23()
		return
	end

	var_1_0._sequences.EventCountdown = var_1_23

	return var_1_0
end

MenuBuilder.registerType("VanguardRevealLiveEvent", VanguardRevealLiveEvent)
LockTable(_M)
