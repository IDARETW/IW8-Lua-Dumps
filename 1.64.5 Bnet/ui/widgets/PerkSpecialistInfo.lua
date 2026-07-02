module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 and 7 or 8

	arg_1_0.TabTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tostring(var_1_0))))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateKillRequirement = var_0_0

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function PerkSpecialistInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 190 * _1080p)

	var_3_0.id = "PerkSpecialistInfo"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 178, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Gradient"

	var_3_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_3_6:SetAlpha(0.3, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -372, _1080p * 42, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Gradient = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "PerkIcon"

	var_3_8:setImage(RegisterMaterial("icon_perk_slot_specialist_ui"), 0)
	var_3_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 45, _1080p * 141, _1080p * -53, _1080p * 43)
	var_3_0:addElement(var_3_8)

	var_3_0.PerkIcon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Highlight"

	var_3_10:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 178, _1080p * -6, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.Highlight = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "TabText"

	var_3_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_12:setText(ToUpperCase(Engine.CBBHFCGDIC("KILLSTREAKS/SPECIALIST_BONUS")), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 10, _1080p * 168, _1080p * -40, _1080p * -22)
	var_3_0:addElement(var_3_12)

	var_3_0.TabText = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "TabTitle"

	var_3_14:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_3_14:setText(ToUpperCase(""), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 168, _1080p * 16, _1080p * 34)
	var_3_0:addElement(var_3_14)

	var_3_0.TabTitle = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "SpecialistBacker"

	var_3_16:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_3_16:SetAlpha(0.6, 0)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 178, 0, 0, 0)
	var_3_0:addElement(var_3_16)

	var_3_0.SpecialistBacker = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "SpecialPerkButtonText"

	var_3_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU/DEACTIVIATE_SPECIAL_PERKS"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetTintFontIcons(true)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -17, _1080p * 130, _1080p * 150)
	var_3_0:addElement(var_3_18)

	var_3_0.SpecialPerkButtonText = var_3_18

	local var_3_19

	if CONDITIONS.IsMagmaGameMode(var_3_0) then
		var_3_19 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_3_1
		})
		var_3_19.id = "BRWarning"

		var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 193, _1080p * 257, _1080p * 16, _1080p * 54)
		var_3_0:addElement(var_3_19)

		var_3_0.BRWarning = var_3_19
	end

	local var_3_20
	local var_3_21 = LUI.UIStyledText.new()

	var_3_21.id = "Info"

	var_3_21:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_3_21:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SPECIALIST_INFO"), 0)
	var_3_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_21:SetAlignment(LUI.Alignment.Left)
	var_3_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 200, _1080p * -17, _1080p * 54, _1080p * 72)
	var_3_0:addElement(var_3_21)

	var_3_0.Info = var_3_21

	local function var_3_22()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -44
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_24)

	local var_3_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_3_14:RegisterAnimationSequence("AR", var_3_25)

	local var_3_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_26)

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 78
		}
	}

	var_3_21:RegisterAnimationSequence("AR", var_3_27)

	local function var_3_28()
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_18:AnimateSequence("AR")
		var_3_21:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_28

	local var_3_29
	local var_3_30 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("SpecialPerkEnabled", var_3_30)

	local var_3_31 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("SpecialPerkEnabled", var_3_31)

	local var_3_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SpecialPerkEnabled", var_3_32)

	local var_3_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SpecialPerkEnabled", var_3_33)

	local var_3_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("SpecialPerkEnabled", var_3_34)

	local var_3_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("SpecialPerkEnabled", var_3_35)

	local var_3_36 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("SpecialPerkEnabled", var_3_36)

	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 200
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/DEACTIVIATE_SPECIAL_PERKS")
		}
	}

	var_3_18:RegisterAnimationSequence("SpecialPerkEnabled", var_3_37)

	if CONDITIONS.IsMagmaGameMode(var_3_0) then
		local var_3_38 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 193
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 257
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 16
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 54
			}
		}

		var_3_19:RegisterAnimationSequence("SpecialPerkEnabled", var_3_38)
	end

	local var_3_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("SpecialPerkEnabled", var_3_39)

	local function var_3_40()
		var_3_4:AnimateSequence("SpecialPerkEnabled")
		var_3_6:AnimateSequence("SpecialPerkEnabled")
		var_3_8:AnimateSequence("SpecialPerkEnabled")
		var_3_10:AnimateSequence("SpecialPerkEnabled")
		var_3_12:AnimateSequence("SpecialPerkEnabled")
		var_3_14:AnimateSequence("SpecialPerkEnabled")
		var_3_16:AnimateSequence("SpecialPerkEnabled")
		var_3_18:AnimateSequence("SpecialPerkEnabled")

		if CONDITIONS.IsMagmaGameMode(var_3_0) then
			var_3_19:AnimateSequence("SpecialPerkEnabled")
		end

		var_3_21:AnimateSequence("SpecialPerkEnabled")
	end

	var_3_0._sequences.SpecialPerkEnabled = var_3_40

	local var_3_41
	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("SpecialPerkDisabled", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("SpecialPerkDisabled", var_3_43)

	local var_3_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("SpecialPerkDisabled", var_3_44)

	local var_3_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("SpecialPerkDisabled", var_3_45)

	local var_3_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("SpecialPerkDisabled", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("SpecialPerkDisabled", var_3_47)

	local var_3_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("SpecialPerkDisabled", var_3_48)

	local var_3_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/ACTIVIATE_SPECIAL_PERKS")
		}
	}

	var_3_18:RegisterAnimationSequence("SpecialPerkDisabled", var_3_49)

	if CONDITIONS.IsMagmaGameMode(var_3_0) then
		local var_3_50 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 84
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 122
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 25
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 89
			}
		}

		var_3_19:RegisterAnimationSequence("SpecialPerkDisabled", var_3_50)
	end

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("SpecialPerkDisabled", var_3_51)

	local function var_3_52()
		var_3_4:AnimateSequence("SpecialPerkDisabled")
		var_3_6:AnimateSequence("SpecialPerkDisabled")
		var_3_8:AnimateSequence("SpecialPerkDisabled")
		var_3_10:AnimateSequence("SpecialPerkDisabled")
		var_3_12:AnimateSequence("SpecialPerkDisabled")
		var_3_14:AnimateSequence("SpecialPerkDisabled")
		var_3_16:AnimateSequence("SpecialPerkDisabled")
		var_3_18:AnimateSequence("SpecialPerkDisabled")

		if CONDITIONS.IsMagmaGameMode(var_3_0) then
			var_3_19:AnimateSequence("SpecialPerkDisabled")
		end

		var_3_21:AnimateSequence("SpecialPerkDisabled")
	end

	var_3_0._sequences.SpecialPerkDisabled = var_3_52

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PerkSpecialistInfo", PerkSpecialistInfo)
LockTable(_M)
