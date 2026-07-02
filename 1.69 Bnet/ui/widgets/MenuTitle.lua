module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 88 * _1080p
	local var_1_1 = ToUpperCase(arg_1_1)
	local var_1_2, var_1_3, var_1_4, var_1_5 = arg_1_0.MenuTitle:getLocalRect()
	local var_1_6 = math.abs(var_1_5 - var_1_3)
	local var_1_7 = arg_1_0.MenuTitle:GetCurrentFont()
	local var_1_8, var_1_9, var_1_10, var_1_11 = GetTextDimensions(var_1_1, var_1_7, var_1_6)
	local var_1_12 = var_1_0 + (var_1_10 - var_1_8)

	if arg_1_0.maxRightEdge ~= nil and var_1_12 > arg_1_0.maxRightEdge then
		var_1_12 = arg_1_0.maxRightEdge

		arg_1_0.MenuTitle:SetRight(arg_1_0.maxRightEdge)
	end

	arg_1_0.Line:SetRight(var_1_12)
	arg_1_0.MenuTitle:setText(var_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "ShowMenuTitle")

	if not arg_1_2 then
		ACTIONS.PlaySoundSetSound(arg_1_0, "menuDecode", false)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.maxRightEdge = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.Line:SetRight(300 * _1080p)
	ACTIONS.AnimateSequence(arg_3_0, "ShowMWLogo")

	if not arg_3_1 then
		ACTIONS.PlaySoundSetSound(arg_3_0, "menuDecode", false)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.Line:SetRight(300 * _1080p)
	ACTIONS.AnimateSequence(arg_4_0, "ShowWZLogo")

	if not arg_4_1 then
		ACTIONS.PlaySoundSetSound(arg_4_0, "menuDecode", false)
	end

	if CONDITIONS.IsVGPremiumPlayer(arg_4_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_4_0, "ShowVGOwnerShip")
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	if IsLanguageChinese() or IsLanguageKorean() then
		ACTIONS.AnimateSequence(arg_5_0, "KORZH")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	elseif IsLanguageRussian() or IsLanguageSpanish() then
		ACTIONS.AnimateSequence(arg_5_0, "RU")
	end

	arg_5_0.SetTitle = var_0_0
	arg_5_0.SetMaxRightEdge = var_0_1
	arg_5_0.SetMWTitle = var_0_2
	arg_5_0.SetWarzoneTitle = var_0_3
	arg_5_0._controllerIndex = arg_5_1

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_5_0, "WZWipSetup")
	end
end

function MenuTitle(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1024 * _1080p, 0, 105 * _1080p)

	var_6_0.id = "MenuTitle"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIStyledText.new()

	var_6_4.id = "MenuTitle"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_6_4:SetAlpha(0, 0)
	var_6_4:setText("PRIMARY WEAPON SELECT", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_4:SetStartupDelay(1250)
	var_6_4:SetLineHoldTime(400)
	var_6_4:SetAnimMoveTime(300)
	var_6_4:SetAnimMoveSpeed(50)
	var_6_4:SetEndDelay(1000)
	var_6_4:SetCrossfadeTime(500)
	var_6_4:SetFadeInTime(300)
	var_6_4:SetFadeOutTime(300)
	var_6_4:SetMaxVisibleLines(1)
	var_6_4:SetDecodeLetterLength(20)
	var_6_4:SetDecodeMaxRandChars(6)
	var_6_4:SetDecodeUpdatesPerLetter(4)
	var_6_4:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 91, _1080p * 1024, _1080p * -60, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.MenuTitle = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Line"

	var_6_6:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 1024, _1080p * -4, _1080p * -3)
	var_6_0:addElement(var_6_6)

	var_6_0.Line = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "WZLogo"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setImage(RegisterMaterial("logo_warzone_sm"), 0)
	var_6_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 29, _1080p * 93)
	var_6_0:addElement(var_6_8)

	var_6_0.WZLogo = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "MWLogo"

	var_6_10:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
	var_6_10:setImage(RegisterMaterial("logo_cod_mw_sm"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 300, _1080p * 29, _1080p * 93)
	var_6_0:addElement(var_6_10)

	var_6_0.MWLogo = var_6_10

	local var_6_11

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		var_6_11 = LUI.UIImage.new()
		var_6_11.id = "VGImage"

		var_6_11:SetAlpha(0, 0)
		var_6_11:setImage(RegisterMaterial("v_ui_asset_vanguard_logo_sm"), 0)
		var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 313, _1080p * 366, _1080p * 43, _1080p * 96)
		var_6_0:addElement(var_6_11)

		var_6_0.VGImage = var_6_11
	end

	local function var_6_12()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_12

	local var_6_13
	local var_6_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_6_4:RegisterAnimationSequence("KORZH", var_6_14)

	local function var_6_15()
		var_6_4:AnimateSequence("KORZH")
	end

	var_6_0._sequences.KORZH = var_6_15

	local var_6_16
	local var_6_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_6_4:RegisterAnimationSequence("JP", var_6_17)

	local function var_6_18()
		var_6_4:AnimateSequence("JP")
	end

	var_6_0._sequences.JP = var_6_18

	local var_6_19
	local var_6_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1024
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 81
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -60
		}
	}

	var_6_4:RegisterAnimationSequence("RU", var_6_20)

	local function var_6_21()
		var_6_4:AnimateSequence("RU")
	end

	var_6_0._sequences.RU = var_6_21

	local var_6_22
	local var_6_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ShowWZLogo", var_6_23)

	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.wzTitle
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -7
		}
	}

	var_6_6:RegisterAnimationSequence("ShowWZLogo", var_6_24)

	local var_6_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowWZLogo", var_6_25)

	local var_6_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ShowWZLogo", var_6_26)

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_6_27 = {
			{
				value = 0.75,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.NeutralGray
			}
		}

		var_6_11:RegisterAnimationSequence("ShowWZLogo", var_6_27)
	end

	local function var_6_28()
		var_6_4:AnimateSequence("ShowWZLogo")
		var_6_6:AnimateSequence("ShowWZLogo")
		var_6_8:AnimateSequence("ShowWZLogo")
		var_6_10:AnimateSequence("ShowWZLogo")

		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_6_11:AnimateSequence("ShowWZLogo")
		end
	end

	var_6_0._sequences.ShowWZLogo = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ShowMWLogo", var_6_30)

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.title
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		}
	}

	var_6_6:RegisterAnimationSequence("ShowMWLogo", var_6_31)

	local var_6_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowMWLogo", var_6_32)

	local var_6_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ShowMWLogo", var_6_33)

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_6_34 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("ShowMWLogo", var_6_34)
	end

	local function var_6_35()
		var_6_4:AnimateSequence("ShowMWLogo")
		var_6_6:AnimateSequence("ShowMWLogo")
		var_6_8:AnimateSequence("ShowMWLogo")
		var_6_10:AnimateSequence("ShowMWLogo")

		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_6_11:AnimateSequence("ShowMWLogo")
		end
	end

	var_6_0._sequences.ShowMWLogo = var_6_35

	local var_6_36
	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZTitle
		}
	}

	var_6_4:RegisterAnimationSequence("WZWipSetup", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_sep_menu_title")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -6
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_6_6:RegisterAnimationSequence("WZWipSetup", var_6_38)

	local var_6_39 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_6_8:RegisterAnimationSequence("WZWipSetup", var_6_39)

	local var_6_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_6_10:RegisterAnimationSequence("WZWipSetup", var_6_40)

	local function var_6_41()
		var_6_4:AnimateSequence("WZWipSetup")
		var_6_6:AnimateSequence("WZWipSetup")
		var_6_8:AnimateSequence("WZWipSetup")
		var_6_10:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_41

	local var_6_42
	local var_6_43 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("ShowMenuTitle", var_6_43)

	local var_6_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_6:RegisterAnimationSequence("ShowMenuTitle", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("ShowMenuTitle", var_6_45)

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_10:RegisterAnimationSequence("ShowMenuTitle", var_6_46)

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_6_47 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_6_11:RegisterAnimationSequence("ShowMenuTitle", var_6_47)
	end

	local function var_6_48()
		var_6_4:AnimateSequence("ShowMenuTitle")
		var_6_6:AnimateSequence("ShowMenuTitle")
		var_6_8:AnimateSequence("ShowMenuTitle")
		var_6_10:AnimateSequence("ShowMenuTitle")

		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_6_11:AnimateSequence("ShowMenuTitle")
		end
	end

	var_6_0._sequences.ShowMenuTitle = var_6_48

	local var_6_49
	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 570
		}
	}

	var_6_4:RegisterAnimationSequence("GiftingFlyout", var_6_50)

	local function var_6_51()
		var_6_4:AnimateSequence("GiftingFlyout")
	end

	var_6_0._sequences.GiftingFlyout = var_6_51

	local var_6_52

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		local var_6_53 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold
			}
		}

		var_6_11:RegisterAnimationSequence("ShowVGOwnerShip", var_6_53)
	end

	local function var_6_54()
		if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
			var_6_11:AnimateSequence("ShowVGOwnerShip")
		end
	end

	var_6_0._sequences.ShowVGOwnerShip = var_6_54

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MenuTitle", MenuTitle)
LockTable(_M)
