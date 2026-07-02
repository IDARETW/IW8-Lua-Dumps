module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.NewItemNotification:SetAlpha(arg_1_1)

	if arg_1_1 == 0 then
		arg_1_0.FreeText:SetRight(0)
	else
		arg_1_0.FreeText:SetRight(_1080p * -28)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if arg_2_1.titleImage and #arg_2_1.titleImage > 0 then
		arg_2_0.ItemTitle:SetAlpha(1)
		arg_2_0.ItemTitle:setImage(RegisterMaterial(arg_2_1.titleImage))
	else
		arg_2_0.ItemTitle:SetAlpha(0)
	end

	local var_2_0 = Engine.DGAIDIEIAC()
	local var_2_1 = var_2_0 == 0 or var_2_0 == 1

	if arg_2_1.fetchingDataFailed then
		arg_2_0.ItemName:SetAlpha(1)
		arg_2_0.ItemName:setText(Engine.CBBHFCGDIC("MENU/FETCHING_STORE_DATA_FAILED"))
	elseif arg_2_1.name and not var_2_1 then
		if arg_2_1.emptyCategory then
			arg_2_0.ItemName:SetAlpha(0)
		else
			arg_2_0.ItemName:SetAlpha(1)
			arg_2_0.ItemName:setText(Engine.CBBHFCGDIC(arg_2_1.name))
		end
	else
		arg_2_0.ItemName:SetAlpha(0)
	end

	if arg_2_1.emptyCategory then
		arg_2_0.SoldOutMessage:SetAlpha(1)
	else
		arg_2_0.SoldOutMessage:SetAlpha(0)
	end

	if arg_2_1.asset and #arg_2_1.asset > 0 then
		arg_2_0.ItemImage:SetAlpha(1)
		arg_2_0.ItemImage:setImage(RegisterMaterial(arg_2_1.asset))
	else
		assert(false, "Missing Image Asset for item ID " .. arg_2_1.id)
		arg_2_0.ItemImage:SetAlpha(0)
	end

	if arg_2_2[tostring(arg_2_1.id)] and not arg_2_3 then
		arg_2_0.HotItemNotification:SetAlpha(1)
	else
		arg_2_0.HotItemNotification:SetAlpha(0)
	end

	if arg_2_1.purchaseEnd then
		arg_2_0.TimerClock:SetAlpha(1)
	else
		arg_2_0.TimerClock:SetAlpha(0)
	end

	ACTIONS.AnimateSequence(arg_2_0, "NotFree")

	if arg_2_1.id then
		local var_2_2, var_2_3 = STORE.GetBundleCost(arg_2_0._controllerIndex, arg_2_1.id)
		local var_2_4 = var_2_2

		if var_2_3 and var_2_3 < var_2_2 then
			var_2_4 = var_2_3
		end

		if var_2_4 <= 0 then
			ACTIONS.AnimateSequence(arg_2_0, "Free")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NotFree")
		end
	else
		ACTIONS.AnimateSequence(arg_2_0, "NotFree")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateButton = var_0_1
	arg_3_0.UpdateNewIndicator = var_0_0
	arg_3_0._controllerIndex = arg_3_1

	arg_3_0:addEventHandler("gain_focus", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
		arg_3_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 145, 200, LUI.EASING.outQuadratic)
		arg_3_0.ItemTitle:SetScale(-0.73, 200, LUI.EASING.outQuadratic)
		arg_3_0.ItemImage:SetScale(-0.75, 200, LUI.EASING.outQuadratic)
	end)
	arg_3_0:addEventHandler("lose_focus", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
		arg_3_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -160, _1080p * 160, 0, _1080p * 120, 100, LUI.EASING.outQuadratic)
		arg_3_0.ItemTitle:SetScale(-0.75, 100)
		arg_3_0.ItemImage:SetScale(-0.78, 100)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function MPStoreBillboardButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 120 * _1080p)

	var_6_0.id = "MPStoreBillboardButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_6_0:setUseStencil(true)

	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "ItemImage"

	var_6_4:SetRGBFromInt(5066061, 0)
	var_6_4:SetScale(-0.78, 0)
	var_6_4:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -290, _1080p * 290)
	var_6_0:addElement(var_6_4)

	var_6_0.ItemImage = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "FreeBanner"

	var_6_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_6_6:SetAlpha(0, 0)
	var_6_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top_opaque_dark"), 0)
	var_6_6:SetVMin(0.25, 0)
	var_6_6:SetVMax(0.75, 0)
	var_6_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, 0, 0, _1080p * 28)
	var_6_0:addElement(var_6_6)

	var_6_0.FreeBanner = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "FreeText"

	var_6_8:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COST_FREE")), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetTracking(2 * _1080p, 0)
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_8:SetStartupDelay(2000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(2000)
	var_6_8:SetAnimMoveSpeed(150)
	var_6_8:SetEndDelay(2000)
	var_6_8:SetCrossfadeTime(250)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(1)
	var_6_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -30, _1080p * 5, _1080p * 23)
	var_6_0:addElement(var_6_8)

	var_6_0.FreeText = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "ItemTitle"

	var_6_10:SetScale(-0.75, 0)
	var_6_10:setImage(RegisterMaterial("icon_empty_x"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -177, _1080p * 335, _1080p * -86, _1080p * 170)
	var_6_0:addElement(var_6_10)

	var_6_0.ItemTitle = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "Gradient"

	var_6_12:SetRGBFromInt(0, 0)
	var_6_12:SetAlpha(0.4, 0)
	var_6_12:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -75, 0)
	var_6_0:addElement(var_6_12)

	var_6_0.Gradient = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIStyledText.new()

	var_6_14.id = "ItemName"

	var_6_14:SetRGBFromTable(SWATCHES.Store.TextIdle, 0)
	var_6_14:setText("", 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetWordWrap(false)
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_6_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_14:SetStartupDelay(2000)
	var_6_14:SetLineHoldTime(400)
	var_6_14:SetAnimMoveTime(2000)
	var_6_14:SetAnimMoveSpeed(150)
	var_6_14:SetEndDelay(2000)
	var_6_14:SetCrossfadeTime(250)
	var_6_14:SetFadeInTime(300)
	var_6_14:SetFadeOutTime(300)
	var_6_14:SetMaxVisibleLines(2)
	var_6_14:SetShadowRGBFromInt(0, 0)
	var_6_14:SetOutlineRGBFromInt(0, 0)
	var_6_14:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -34, _1080p * -10)
	var_6_0:addElement(var_6_14)

	var_6_0.ItemName = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "HighlightBarBottom"

	var_6_16:SetAlpha(0, 0)
	var_6_16:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_6_0:addElement(var_6_16)

	var_6_0.HighlightBarBottom = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "NewItemNotification"

	var_6_18:SetAlpha(0, 0)
	var_6_18:SetPixelGridEnabled(true)
	var_6_18:SetPixelGridContrast(0.2, 0)
	var_6_18:SetPixelGridBlockWidth(1, 0)
	var_6_18:SetPixelGridBlockHeight(1, 0)
	var_6_18:SetPixelGridGutterWidth(1, 0)
	var_6_18:SetPixelGridGutterHeight(1, 0)
	var_6_18:setImage(RegisterMaterial("icon_new_store_pulse"), 0)
	var_6_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -28, 0, 0, _1080p * 28)
	var_6_0:addElement(var_6_18)

	var_6_0.NewItemNotification = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIImage.new()

	var_6_20.id = "HotItemNotification"

	var_6_20:SetAlpha(0, 0)
	var_6_20:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_6_20:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -30, 0, _1080p * -35, _1080p * -5)
	var_6_0:addElement(var_6_20)

	var_6_0.HotItemNotification = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIStyledText.new()

	var_6_22.id = "SoldOutMessage"

	var_6_22:SetRGBFromTable(SWATCHES.Store.TextOver, 0)
	var_6_22:SetAlpha(0, 0)
	var_6_22:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_COMING_SOON"), 0)
	var_6_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_22:SetWordWrap(false)
	var_6_22:SetAlignment(LUI.Alignment.Left)
	var_6_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_22:SetStartupDelay(2000)
	var_6_22:SetLineHoldTime(400)
	var_6_22:SetAnimMoveTime(2000)
	var_6_22:SetAnimMoveSpeed(150)
	var_6_22:SetEndDelay(2000)
	var_6_22:SetCrossfadeTime(250)
	var_6_22:SetFadeInTime(300)
	var_6_22:SetFadeOutTime(300)
	var_6_22:SetMaxVisibleLines(1)
	var_6_22:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -38, _1080p * -10)
	var_6_0:addElement(var_6_22)

	var_6_0.SoldOutMessage = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIImage.new()

	var_6_24.id = "TimerClock"

	var_6_24:SetRGBFromTable(SWATCHES.Store.Body, 0)
	var_6_24:SetAlpha(0, 0)
	var_6_24:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_6_24:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -21, _1080p * -5, _1080p * -21, _1080p * -5)
	var_6_0:addElement(var_6_24)

	var_6_0.TimerClock = var_6_24

	local function var_6_25()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonOver", var_6_27)

	local var_6_28 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonOver", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonOver", var_6_29)

	local var_6_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("ButtonOver", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("ButtonOver")
		var_6_12:AnimateSequence("ButtonOver")
		var_6_14:AnimateSequence("ButtonOver")
		var_6_16:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			value = 5000268,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_4:RegisterAnimationSequence("ButtonUp", var_6_33)

	local var_6_34 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonUp", var_6_34)

	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Store.TextIdle
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonUp", var_6_35)

	local var_6_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_16:RegisterAnimationSequence("ButtonUp", var_6_36)

	local function var_6_37()
		var_6_4:AnimateSequence("ButtonUp")
		var_6_12:AnimateSequence("ButtonUp")
		var_6_14:AnimateSequence("ButtonUp")
		var_6_16:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_37

	local function var_6_38()
		return
	end

	var_6_0._sequences.Locked = var_6_38

	local var_6_39
	local var_6_40 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonOverDisabled", var_6_40)

	local function var_6_41()
		var_6_12:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_12:RegisterAnimationSequence("ButtonUpDisabled", var_6_43)

	local function var_6_44()
		var_6_12:AnimateSequence("ButtonUpDisabled")
	end

	var_6_0._sequences.ButtonUpDisabled = var_6_44

	local var_6_45
	local var_6_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -35
		}
	}

	var_6_14:RegisterAnimationSequence("AR", var_6_46)

	local function var_6_47()
		var_6_14:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_47

	local var_6_48
	local var_6_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.saturation
		}
	}

	var_6_4:RegisterAnimationSequence("CategoryEmpty", var_6_49)

	local function var_6_50()
		var_6_4:AnimateSequence("CategoryEmpty")
	end

	var_6_0._sequences.CategoryEmpty = var_6_50

	local var_6_51
	local var_6_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Color_OP,
			value = COLOR_OP.none
		}
	}

	var_6_4:RegisterAnimationSequence("CategoryNotEmpty", var_6_52)

	local function var_6_53()
		var_6_4:AnimateSequence("CategoryNotEmpty")
	end

	var_6_0._sequences.CategoryNotEmpty = var_6_53

	local var_6_54
	local var_6_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("Free", var_6_55)

	local var_6_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("Free", var_6_56)

	local function var_6_57()
		var_6_6:AnimateSequence("Free")
		var_6_8:AnimateSequence("Free")
	end

	var_6_0._sequences.Free = var_6_57

	local var_6_58
	local var_6_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("NotFree", var_6_59)

	local var_6_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("NotFree", var_6_60)

	local function var_6_61()
		var_6_6:AnimateSequence("NotFree")
		var_6_8:AnimateSequence("NotFree")
	end

	var_6_0._sequences.NotFree = var_6_61

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MPStoreBillboardButton", MPStoreBillboardButton)
LockTable(_M)
