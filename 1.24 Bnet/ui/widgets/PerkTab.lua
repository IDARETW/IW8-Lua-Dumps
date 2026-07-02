module(..., package.seeall)

local var_0_0 = {
	enabled = 1,
	disabled = 0
}
local var_0_1 = 125

local function var_0_2(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	local var_1_0 = LOADOUT.GetPerkDataByField(arg_1_2, CSV.perks.cols.image)
	local var_1_1 = LOADOUT.GetPerkDataByField(arg_1_2, CSV.perks.cols.name)

	arg_1_0.PerkIcon:setImage(RegisterMaterial(var_1_0))
	arg_1_0.TabText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_1)))

	local var_1_2

	if arg_1_3 then
		local var_1_3 = 2 * (arg_1_0.currentTabIndex + 1) - (arg_1_4 and 1 or 0)

		if arg_1_5 then
			var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/N_POINTS", tostring(var_1_3 * var_0_1))
		else
			var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", tostring(var_1_3))
		end
	else
		var_1_2 = Engine.CBBHFCGDIC("PERKS/PERK_TITLE", tostring(arg_1_0.currentTabIndex + 1))
	end

	arg_1_0.TabTitle:setText(ToUpperCase(var_1_2))

	if CONDITIONS.IsBRGameType(arg_1_0) and arg_1_0.BRWarning then
		arg_1_0.BRWarning:SetShowWarningIcon(Cac.GetIsPerkDisabledForBR(arg_1_2))
	end

	if MatchRules.CJBJJHJCI(arg_1_2) then
		ACTIONS.AnimateSequence(arg_1_0, "RestrictionOn")
	else
		ACTIONS.AnimateSequence(arg_1_0, "RestrictionOff")
	end
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if arg_2_4 then
		arg_2_0.PerkIcon:SetRGBFromTable(arg_2_3 == var_0_0.enabled and SWATCHES.CAC.perkSlotSpecialist or SWATCHES.CAC.perkSlotSpecialistDisabled)

		return
	end

	if arg_2_2 == 0 then
		arg_2_0.PerkIcon:SetRGBFromTable(arg_2_3 == var_0_0.enabled and SWATCHES.CAC.perkSlotOne or SWATCHES.CAC.perkSlotOneDisabled)
	elseif arg_2_2 == 1 then
		arg_2_0.PerkIcon:SetRGBFromTable(arg_2_3 == var_0_0.enabled and SWATCHES.CAC.perkSlotTwo or SWATCHES.CAC.perkSlotTwoDisabled)
	elseif arg_2_2 == 2 then
		arg_2_0.PerkIcon:SetRGBFromTable(arg_2_3 == var_0_0.enabled and SWATCHES.CAC.perkSlotThree or SWATCHES.CAC.perkSlotThreeDisabled)
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupPerkData = var_0_2

	local var_3_0
	local var_3_1 = false

	function arg_3_0.Setup(arg_4_0, arg_4_1)
		local var_4_0 = LOADOUT.GetLoadoutSelectedPerk(arg_3_1, arg_4_1.loadoutIndex, arg_4_1.perkLoadoutIndex, arg_4_1.isSpecialPerk):get()

		if arg_4_1.hasNewItem ~= nil then
			arg_4_0.NewItemSmallIcon:UpdateAlpha(arg_4_1.hasNewItem and 1 or 0, 0, true)
		end

		var_3_0 = arg_4_1.perkLoadoutIndex
		arg_4_0.currentTabIndex = var_3_0
		var_3_1 = arg_4_1.isSpecialPerk

		var_0_3(arg_4_0, arg_3_1, var_3_0, nil, var_3_1)
		var_0_2(arg_4_0, arg_3_1, var_4_0, var_3_1)
	end

	function arg_3_0.Focused(arg_5_0)
		ACTIONS.AnimateSequence(arg_5_0, "Focused")
		var_0_3(arg_5_0, arg_3_1, var_3_0, var_0_0.enabled, var_3_1)
	end

	function arg_3_0.FocusedNoSound(arg_6_0)
		ACTIONS.AnimateSequence(arg_6_0, "FocusedNoSound")
		var_0_3(arg_6_0, arg_3_1, var_3_0, var_0_0.enabled, var_3_1)
	end

	function arg_3_0.UnFocused(arg_7_0)
		ACTIONS.AnimateSequence(arg_7_0, "UnFocused")
		var_0_3(arg_7_0, arg_3_1, var_3_0, var_0_0.disabled, var_3_1)
	end

	function arg_3_0.Enable(arg_8_0)
		arg_8_0._disabled = false

		ACTIONS.AnimateSequence(arg_8_0, "Unfocused")
	end

	function arg_3_0.Disable(arg_9_0)
		arg_9_0._disabled = true

		ACTIONS.AnimateSequence(arg_9_0, "Disabled")
	end

	function arg_3_0.IsEnabled(arg_10_0)
		return not arg_10_0._disabled
	end

	function arg_3_0.Highlighted(arg_11_0)
		ACTIONS.AnimateSequence(arg_11_0, "Highlighted")
	end

	arg_3_0:registerEventHandler("focus_tab", function(arg_12_0, arg_12_1)
		if arg_12_1.index == arg_12_0.index then
			if arg_12_1.playSound then
				arg_12_0:Focused()
			else
				arg_12_0:FocusedNoSound()
			end

			arg_12_0.focused = true
		elseif arg_12_0.focused then
			arg_12_0:UnFocused()

			arg_12_0.focused = false
		end
	end)
	arg_3_0:SetHandleMouse(true)
	arg_3_0:registerEventHandler("mouseenter", function(arg_13_0, arg_13_1)
		if not arg_13_0.focused and not arg_13_0._disabled then
			arg_13_0:Highlighted()
		else
			arg_13_0:Focused()
		end
	end)
	arg_3_0:registerEventHandler("mouseleave", function(arg_14_0, arg_14_1)
		if arg_14_0.focused and not arg_14_0._disabled then
			arg_14_0:FocusedNoSound()
		else
			arg_14_0:UnFocused()
		end
	end)
	arg_3_0:registerEventHandler("leftmousedown", function(arg_15_0, arg_15_1)
		return
	end)
	arg_3_0:registerEventHandler("leftmouseup", function(arg_16_0, arg_16_1)
		if arg_16_1.inside and not arg_16_0._disabled then
			arg_16_0:playSound("menu_open")
			arg_16_0:dispatchEventToCurrentMenu({
				name = "tab_mouse_select",
				index = arg_16_0.index
			})
		end
	end)
	arg_3_0:registerEventHandler("tab_disable_blur", function(arg_17_0, arg_17_1)
		ACTIONS.AnimateSequence(arg_17_0, "NoBlur")
	end)
	arg_3_0:SubscribeToModelThroughElement(arg_3_0, "disabled", function(arg_18_0)
		if DataModel.JJEHAEBDF(arg_18_0) then
			arg_3_0:Disable()
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function PerkTab(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 178 * _1080p, 0, 190 * _1080p)

	var_19_0.id = "PerkTab"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "Backer"

	var_19_4:SetRGBFromInt(0, 0)
	var_19_4:SetAlpha(0.2, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Backer = var_19_4

	local var_19_5
	local var_19_6 = LUI.UIImage.new()

	var_19_6.id = "Gradient"

	var_19_6:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_19_6:SetAlpha(0, 0)
	var_19_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_19_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 42, 0)
	var_19_0:addElement(var_19_6)

	var_19_0.Gradient = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIImage.new()

	var_19_8.id = "PerkIcon"

	var_19_8:SetRGBFromInt(7040103, 0)
	var_19_8:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -48, _1080p * 48, _1080p * -148, _1080p * -52)
	var_19_0:addElement(var_19_8)

	var_19_0.PerkIcon = var_19_8

	local var_19_9
	local var_19_10 = LUI.UIImage.new()

	var_19_10.id = "Highlight"

	var_19_10:SetRGBFromTable(SWATCHES.tabManager.tabFrame, 0)
	var_19_10:SetAlpha(0, 0)
	var_19_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -6, 0)
	var_19_0:addElement(var_19_10)

	var_19_0.Highlight = var_19_10

	local var_19_11
	local var_19_12 = LUI.UIStyledText.new()

	var_19_12.id = "TabText"

	var_19_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_12:setText("", 0)
	var_19_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_19_12:SetAlignment(LUI.Alignment.Center)
	var_19_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_19_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 150, _1080p * 168)
	var_19_0:addElement(var_19_12)

	var_19_0.TabText = var_19_12

	local var_19_13
	local var_19_14 = LUI.UIStyledText.new()

	var_19_14.id = "TabTitle"

	var_19_14:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_19_14:setText("", 0)
	var_19_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_19_14:SetAlignment(LUI.Alignment.Center)
	var_19_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 16, _1080p * 34)
	var_19_0:addElement(var_19_14)

	var_19_0.TabTitle = var_19_14

	local var_19_15
	local var_19_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_19_1
	})

	var_19_16.id = "NewItemSmallIcon"

	var_19_16:SetAlpha(0, 0)
	var_19_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_19_0:addElement(var_19_16)

	var_19_0.NewItemSmallIcon = var_19_16

	local var_19_17

	if CONDITIONS.IsBRGameType(var_19_0) then
		local var_19_18 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_19_1
		})

		var_19_18.id = "BRWarning"

		var_19_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 30, _1080p * 10, _1080p * 30)
		var_19_0:addElement(var_19_18)

		var_19_0.BRWarning = var_19_18
	end

	local var_19_19
	local var_19_20 = LUI.UIImage.new()

	var_19_20.id = "RestrictionWarning"

	var_19_20:SetAlpha(0, 0)
	var_19_20:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_19_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -36, 0, _1080p * 75, _1080p * 105)
	var_19_0:addElement(var_19_20)

	var_19_0.RestrictionWarning = var_19_20

	local function var_19_21()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_21

	local var_19_22
	local var_19_23 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("Focused", var_19_23)

	local var_19_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("Focused", var_19_24)

	local var_19_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_19_8:RegisterAnimationSequence("Focused", var_19_25)

	local var_19_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabFrame
		}
	}

	var_19_10:RegisterAnimationSequence("Focused", var_19_26)

	local var_19_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("Focused", var_19_27)

	local var_19_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_19_14:RegisterAnimationSequence("Focused", var_19_28)

	local function var_19_29()
		var_19_4:AnimateSequence("Focused")
		var_19_6:AnimateSequence("Focused")
		var_19_8:AnimateSequence("Focused")
		var_19_10:AnimateSequence("Focused")
		var_19_12:AnimateSequence("Focused")
		var_19_14:AnimateSequence("Focused")
	end

	var_19_0._sequences.Focused = var_19_29

	local var_19_30
	local var_19_31 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("UnFocused", var_19_31)

	local var_19_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_19_6:RegisterAnimationSequence("UnFocused", var_19_32)

	local var_19_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_8:RegisterAnimationSequence("UnFocused", var_19_33)

	local var_19_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("UnFocused", var_19_34)

	local var_19_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_19_14:RegisterAnimationSequence("UnFocused", var_19_35)

	local function var_19_36()
		var_19_4:AnimateSequence("UnFocused")
		var_19_6:AnimateSequence("UnFocused")
		var_19_8:AnimateSequence("UnFocused")
		var_19_10:AnimateSequence("UnFocused")
		var_19_14:AnimateSequence("UnFocused")
	end

	var_19_0._sequences.UnFocused = var_19_36

	local var_19_37
	local var_19_38 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("FocusedNoSound", var_19_38)

	local var_19_39 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_19_6:RegisterAnimationSequence("FocusedNoSound", var_19_39)

	local var_19_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_19_8:RegisterAnimationSequence("FocusedNoSound", var_19_40)

	local var_19_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_10:RegisterAnimationSequence("FocusedNoSound", var_19_41)

	local var_19_42 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("FocusedNoSound", var_19_42)

	local var_19_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_19_14:RegisterAnimationSequence("FocusedNoSound", var_19_43)

	local function var_19_44()
		var_19_4:AnimateSequence("FocusedNoSound")
		var_19_6:AnimateSequence("FocusedNoSound")
		var_19_8:AnimateSequence("FocusedNoSound")
		var_19_10:AnimateSequence("FocusedNoSound")
		var_19_12:AnimateSequence("FocusedNoSound")
		var_19_14:AnimateSequence("FocusedNoSound")
	end

	var_19_0._sequences.FocusedNoSound = var_19_44

	local function var_19_45()
		return
	end

	var_19_0._sequences.Locked = var_19_45

	local var_19_46
	local var_19_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("Disabled", var_19_47)

	local var_19_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_12:RegisterAnimationSequence("Disabled", var_19_48)

	local var_19_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabText
		}
	}

	var_19_14:RegisterAnimationSequence("Disabled", var_19_49)

	local function var_19_50()
		var_19_6:AnimateSequence("Disabled")
		var_19_12:AnimateSequence("Disabled")
		var_19_14:AnimateSequence("Disabled")
	end

	var_19_0._sequences.Disabled = var_19_50

	local var_19_51
	local var_19_52 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("Highlighted", var_19_52)

	local var_19_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabTextFocused
		}
	}

	var_19_14:RegisterAnimationSequence("Highlighted", var_19_53)

	local function var_19_54()
		var_19_6:AnimateSequence("Highlighted")
		var_19_14:AnimateSequence("Highlighted")
	end

	var_19_0._sequences.Highlighted = var_19_54

	local var_19_55
	local var_19_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_19_12:RegisterAnimationSequence("AR", var_19_56)

	local var_19_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		}
	}

	var_19_14:RegisterAnimationSequence("AR", var_19_57)

	local function var_19_58()
		var_19_12:AnimateSequence("AR")
		var_19_14:AnimateSequence("AR")
	end

	var_19_0._sequences.AR = var_19_58

	local var_19_59
	local var_19_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("RestrictionOn", var_19_60)

	local function var_19_61()
		var_19_20:AnimateSequence("RestrictionOn")
	end

	var_19_0._sequences.RestrictionOn = var_19_61

	local var_19_62
	local var_19_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_20:RegisterAnimationSequence("RestrictionOff", var_19_63)

	local function var_19_64()
		var_19_20:AnimateSequence("RestrictionOff")
	end

	var_19_0._sequences.RestrictionOff = var_19_64

	local var_19_65
	local var_19_66 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_4:RegisterAnimationSequence("SpecialistButton", var_19_66)

	local var_19_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_6:RegisterAnimationSequence("SpecialistButton", var_19_67)

	local var_19_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_perk_slot_specialist_ui")
		}
	}

	var_19_8:RegisterAnimationSequence("SpecialistButton", var_19_68)

	local var_19_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.tabManager.tabFrame
		}
	}

	var_19_10:RegisterAnimationSequence("SpecialistButton", var_19_69)

	local var_19_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("KILLSTREAKS/SPECIALIST_BONUS")
		}
	}

	var_19_12:RegisterAnimationSequence("SpecialistButton", var_19_70)

	local var_19_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_MP/KILLS_7")
		}
	}

	var_19_14:RegisterAnimationSequence("SpecialistButton", var_19_71)

	local function var_19_72()
		var_19_4:AnimateSequence("SpecialistButton")
		var_19_6:AnimateSequence("SpecialistButton")
		var_19_8:AnimateSequence("SpecialistButton")
		var_19_10:AnimateSequence("SpecialistButton")
		var_19_12:AnimateSequence("SpecialistButton")
		var_19_14:AnimateSequence("SpecialistButton")
	end

	var_19_0._sequences.SpecialistButton = var_19_72

	var_0_4(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("PerkTab", PerkTab)
LockTable(_M)
