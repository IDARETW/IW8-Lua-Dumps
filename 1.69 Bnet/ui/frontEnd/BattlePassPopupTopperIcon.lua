module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.TopperBackground:SetMask(arg_1_0.TopperMask)

	if CONDITIONS.IsBattlePassBundleTopperActive() then
		local var_1_0 = Dvar.CFHDGABACF("LKOKTLQSPT")

		arg_1_0.BattlePassBundleTopperTimer:SetBattlePassTopperTimer(var_1_0, {
			hideBanner = true
		})
	end
end

function BattlePassPopupTopperIcon(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 408 * _1080p, 0, 720 * _1080p)

	var_2_0.id = "BattlePassPopupTopperIcon"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "TopperBackground"

	var_2_4:SetScale(-0.1, 0)
	var_2_4:setImage(RegisterMaterial("ui_preview_battlepass_bundle_topper"), 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -15, _1080p * -15, _1080p * 36, _1080p * 36)
	var_2_0:addElement(var_2_4)

	var_2_0.TopperBackground = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "TopperMask"

	var_2_6:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 324, _1080p * 472, 0, _1080p * 720)
	var_2_0:addElement(var_2_6)

	var_2_0.TopperMask = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIImage.new()

	var_2_8.id = "DescriptionBacking"

	var_2_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_2_8:setImage(RegisterMaterial("ui_mp_wz_bkg_button_5"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 389, _1080p * 517, _1080p * 645)
	var_2_0:addElement(var_2_8)

	var_2_0.DescriptionBacking = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "TopperDetailsText"

	var_2_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_TOPPER_LIMITED_15"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -162, _1080p * 172, _1080p * -159, _1080p * -135)
	var_2_0:addElement(var_2_10)

	var_2_0.TopperDetailsText = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "BundleBonusSkinBG"

	var_2_12:SetRGBFromTable(SWATCHES.CH2.CH2BattlePassTopper, 0)
	var_2_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -175, _1080p * 185, _1080p * -203, _1080p * -165)
	var_2_0:addElement(var_2_12)

	var_2_0.BundleBonusSkinBG = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("BattlePassTopperSingleImage", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "BundleTopperIcon"

	var_2_14.SingleImage:setImage(RegisterMaterial("ui_icon_battlepass_bundle_topper"), 0)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -168, _1080p * -124, _1080p * -206, _1080p * -162)
	var_2_0:addElement(var_2_14)

	var_2_0.BundleTopperIcon = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIStyledText.new()

	var_2_16.id = "BundleBonusSkinLabel"

	var_2_16:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_2_16:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BUNDLE_BONUS_SKIN")), 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -125, _1080p * 125, _1080p * -199, _1080p * -169)
	var_2_0:addElement(var_2_16)

	var_2_0.BundleBonusSkinLabel = var_2_16

	local var_2_17
	local var_2_18 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_2_1
	})

	var_2_18.id = "BattlePassBundleTopperTimer"

	var_2_18:SetAlpha(0, 0)
	var_2_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 17, _1080p * 44)
	var_2_0:addElement(var_2_18)

	var_2_0.BattlePassBundleTopperTimer = var_2_18

	local function var_2_19()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("DisabledTopperIcon", var_2_21)

	local var_2_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("DisabledTopperIcon", var_2_22)

	local var_2_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("DisabledTopperIcon", var_2_23)

	local var_2_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("DisabledTopperIcon", var_2_24)

	local var_2_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("DisabledTopperIcon", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("DisabledTopperIcon", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("DisabledTopperIcon", var_2_27)

	local function var_2_28()
		var_2_4:AnimateSequence("DisabledTopperIcon")
		var_2_8:AnimateSequence("DisabledTopperIcon")
		var_2_10:AnimateSequence("DisabledTopperIcon")
		var_2_12:AnimateSequence("DisabledTopperIcon")
		var_2_14:AnimateSequence("DisabledTopperIcon")
		var_2_16:AnimateSequence("DisabledTopperIcon")
		var_2_18:AnimateSequence("DisabledTopperIcon")
	end

	var_2_0._sequences.DisabledTopperIcon = var_2_28

	local var_2_29
	local var_2_30 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_4:RegisterAnimationSequence("VisibleTopperIcon", var_2_30)

	local var_2_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("VisibleTopperIcon", var_2_31)

	local var_2_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("VisibleTopperIcon", var_2_32)

	local var_2_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_12:RegisterAnimationSequence("VisibleTopperIcon", var_2_33)

	local var_2_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_14:RegisterAnimationSequence("VisibleTopperIcon", var_2_34)

	local var_2_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_16:RegisterAnimationSequence("VisibleTopperIcon", var_2_35)

	local var_2_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_18:RegisterAnimationSequence("VisibleTopperIcon", var_2_36)

	local function var_2_37()
		var_2_4:AnimateSequence("VisibleTopperIcon")
		var_2_8:AnimateSequence("VisibleTopperIcon")
		var_2_10:AnimateSequence("VisibleTopperIcon")
		var_2_12:AnimateSequence("VisibleTopperIcon")
		var_2_14:AnimateSequence("VisibleTopperIcon")
		var_2_16:AnimateSequence("VisibleTopperIcon")
		var_2_18:AnimateSequence("VisibleTopperIcon")
	end

	var_2_0._sequences.VisibleTopperIcon = var_2_37

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("BattlePassPopupTopperIcon", BattlePassPopupTopperIcon)
LockTable(_M)
