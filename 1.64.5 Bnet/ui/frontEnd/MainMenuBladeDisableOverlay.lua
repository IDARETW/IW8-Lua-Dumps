module(..., package.seeall)

local var_0_0 = 120
local var_0_1 = 2
local var_0_2 = {
	[MAIN_MENU.BladeStates.Installing] = {
		refreshCondition = function(arg_1_0)
			local var_1_0 = type(arg_1_0._stateParameters.progress) ~= type(arg_1_0._lastStateParameters.progress)
			local var_1_1 = arg_1_0._stateParameters.suspended ~= arg_1_0._lastStateParameters.suspended

			return var_1_0 or var_1_1
		end,
		refreshAction = function(arg_2_0)
			ACTIONS.AnimateSequence(arg_2_0, "DefaultSequence")

			if arg_2_0._stateParameters.suspended then
				WZWIP.AnimateThemeElement(arg_2_0, "InstallingSuspended")
			elseif arg_2_0._stateParameters.progress and type(arg_2_0._stateParameters.progress) == "number" then
				WZWIP.AnimateThemeElement(arg_2_0, "InstallingProgress")
			else
				WZWIP.AnimateThemeElement(arg_2_0, "Installing")
			end
		end
	},
	[MAIN_MENU.BladeStates.Blocked] = {
		refreshCondition = function(arg_3_0)
			return type(arg_3_0._stateParameters.label) ~= type(arg_3_0._lastStateParameters.label) or arg_3_0._expanded ~= arg_3_0._lastExpanded
		end,
		refreshAction = function(arg_4_0)
			ACTIONS.AnimateSequence(arg_4_0, "DefaultSequence")

			if arg_4_0._stateParameters.label and type(arg_4_0._stateParameters.label) == "string" then
				if arg_4_0._expanded then
					ACTIONS.AnimateSequence(arg_4_0, "BlockedExpanded")
				else
					ACTIONS.AnimateSequence(arg_4_0, "BlockedContracted")
				end
			end
		end
	},
	[MAIN_MENU.BladeStates.New] = {
		refreshCondition = function(arg_5_0)
			return arg_5_0._expanded ~= arg_5_0._lastExpanded
		end,
		refreshAction = function(arg_6_0)
			if arg_6_0._expanded and arg_6_0._expandedCount == 1 then
				ACTIONS.AnimateSequence(arg_6_0, "DefaultSequence")
				WZWIP.AnimateThemeElement(arg_6_0, "New")
			end
		end
	},
	[MAIN_MENU.BladeStates.Neutral] = {
		refreshCondition = function(arg_7_0)
			return false
		end,
		refreshAction = function(arg_8_0)
			ACTIONS.AnimateSequence(arg_8_0, "DefaultSequence")
		end
	}
}

local function var_0_3(arg_9_0)
	if arg_9_0._currentState ~= arg_9_0._lastState then
		arg_9_0._expandedCount = arg_9_0._expanded and 1 or 0
	end

	local var_9_0 = var_0_2[arg_9_0._currentState]

	if var_9_0 and (arg_9_0._currentState ~= arg_9_0._lastState or var_9_0.refreshCondition(arg_9_0)) then
		var_9_0.refreshAction(arg_9_0)
	end
end

local function var_0_4(arg_10_0)
	if arg_10_0._stateParameters.label and type(arg_10_0._stateParameters.label) == "string" then
		arg_10_0.Label:setText(arg_10_0._stateParameters.label)
	end

	if arg_10_0._stateParameters.progress and type(arg_10_0._stateParameters.progress) == "number" then
		arg_10_0.InstallProgressBar:SetProgress(arg_10_0._stateParameters.progress, var_0_0, var_0_1)
	end
end

local function var_0_5(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0._currentState = arg_11_1
	arg_11_0._stateParameters = arg_11_2 or {}

	var_0_3(arg_11_0)
	var_0_4(arg_11_0)

	arg_11_0._lastState = arg_11_1
	arg_11_0._lastStateParameters = arg_11_2
end

local function var_0_6(arg_12_0)
	if not arg_12_0._expanded then
		arg_12_0._expanded = true
		arg_12_0._expandedCount = arg_12_0._expandedCount + 1

		var_0_3(arg_12_0)

		arg_12_0._lastExpanded = arg_12_0._expanded
	end
end

local function var_0_7(arg_13_0)
	if arg_13_0._expanded then
		arg_13_0._expanded = false

		var_0_3(arg_13_0)

		arg_13_0._lastExpanded = arg_13_0._expanded
	end
end

function PostLoadFunc(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0._lastState = MAIN_MENU.BladeStates.Neutral
	arg_14_0._stateParameters = {}
	arg_14_0._lastStateParameters = {}
	arg_14_0._expandedCount = 0
	arg_14_0.RefreshState = var_0_5
	arg_14_0.FlagExpanded = var_0_6
	arg_14_0.FlagContracted = var_0_7

	if IsLanguageArabic() and not CONDITIONS.IsInKoreanIGRPaidSession(arg_14_0) then
		ACTIONS.AnimateSequence(arg_14_0, "AR")
	elseif CONDITIONS.IsInKoreanIGRPaidSession(arg_14_0) then
		ACTIONS.AnimateSequence(arg_14_0, "IGR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_14_0, "WZWipSetup")
	end
end

function MainMenuBladeDisableOverlay(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 1080 * _1080p)

	var_15_0.id = "MainMenuBladeDisableOverlay"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0

	var_15_0:setUseStencil(true)

	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "CinematicOverlayColor"

	var_15_4:SetRGBFromTable(SWATCHES.CAC.nodeFrame, 0)
	var_15_4:SetAlpha(0, 0)
	var_15_4:SetBlendMode(BLEND_MODE.multiply)
	var_15_0:addElement(var_15_4)

	var_15_0.CinematicOverlayColor = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "CinematicOverlay"

	var_15_6:SetRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_15_6:SetAlpha(0, 0)
	var_15_6:SetPixelGridEnabled(true)
	var_15_6:SetPixelGridContrast(0.5, 0)
	var_15_6:SetPixelGridBlockWidth(2, 0)
	var_15_6:SetPixelGridBlockHeight(2, 0)
	var_15_6:SetPixelGridGutterWidth(1, 0)
	var_15_6:SetPixelGridGutterHeight(1, 0)
	var_15_6:SetBlendMode(BLEND_MODE.multiply)
	var_15_0:addElement(var_15_6)

	var_15_0.CinematicOverlay = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "Lock"

	var_15_8:SetAlpha(0, 0)
	var_15_8:setImage(RegisterMaterial("icon_lock"), 0)
	var_15_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 54, _1080p * -376, _1080p * -276)
	var_15_0:addElement(var_15_8)

	var_15_0.Lock = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIImage.new()

	var_15_10.id = "LeftLine"

	var_15_10:SetAlpha(0, 0)
	var_15_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 150, _1080p * -326, _1080p * -323)
	var_15_0:addElement(var_15_10)

	var_15_0.LeftLine = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIImage.new()

	var_15_12.id = "RightLine"

	var_15_12:SetAlpha(0, 0)
	var_15_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -150, 0, _1080p * -326, _1080p * -323)
	var_15_0:addElement(var_15_12)

	var_15_0.RightLine = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIImage.new()

	var_15_14.id = "Corners"

	var_15_14:SetAlpha(0, 0)
	var_15_14:setImage(RegisterMaterial("corners"), 0)
	var_15_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -83, _1080p * 91, _1080p * -410, _1080p * -236)
	var_15_0:addElement(var_15_14)

	var_15_0.Corners = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("BattlePassFreeBanner", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "SaleBanner"

	var_15_16:SetAlpha(0, 0)
	var_15_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 450, _1080p * 528, _1080p * 552)
	var_15_0:addElement(var_15_16)

	var_15_0.SaleBanner = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIImage.new()

	var_15_18.id = "Mask"

	var_15_18:SetAlpha(0, 0)
	var_15_18:setImage(RegisterMaterial("stencil_mask"), 0)
	var_15_18:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 512, 0, 0)
	var_15_0:addElement(var_15_18)

	var_15_0.Mask = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIImage.new()

	var_15_20.id = "GradientBanner"

	var_15_20:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_15_20:SetAlpha(0, 0)
	var_15_20:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_15_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, _1080p * -46, _1080p * 103, _1080p * 176)
	var_15_0:addElement(var_15_20)

	var_15_0.GradientBanner = var_15_20

	local var_15_21
	local var_15_22 = MenuBuilder.BuildRegisteredType("InstallProgressBar", {
		controllerIndex = var_15_1
	})

	var_15_22.id = "InstallProgressBar"

	var_15_22:SetAlpha(0, 0)
	var_15_22:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 29, _1080p * -75, _1080p * 84, _1080p * 100)
	var_15_0:addElement(var_15_22)

	var_15_0.InstallProgressBar = var_15_22

	local var_15_23
	local var_15_24 = LUI.UIImage.new()

	var_15_24.id = "Spinner"

	var_15_24:SetAlpha(0, 0)
	var_15_24:setImage(RegisterMaterial("spinner_loading"), 0)
	var_15_24:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 63, _1080p * -109, _1080p * 155, _1080p * 165)
	var_15_0:addElement(var_15_24)

	var_15_0.Spinner = var_15_24

	local var_15_25
	local var_15_26 = LUI.UIImage.new()

	var_15_26.id = "LabelBackground"

	var_15_26:SetRGBFromInt(0, 0)
	var_15_26:SetAlpha(0, 0)
	var_15_26:SetPixelGridEnabled(true)
	var_15_26:SetPixelGridContrast(0.5, 0)
	var_15_26:SetPixelGridBlockWidth(2, 0)
	var_15_26:SetPixelGridBlockHeight(2, 0)
	var_15_26:SetPixelGridGutterWidth(1, 0)
	var_15_26:SetPixelGridGutterHeight(1, 0)
	var_15_26:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 17, _1080p * -17, _1080p * -236, _1080p * -184)
	var_15_0:addElement(var_15_26)

	var_15_0.LabelBackground = var_15_26

	local var_15_27
	local var_15_28 = LUI.UIStyledText.new()

	var_15_28.id = "Label"

	var_15_28:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_15_28:SetAlpha(0, 0)
	var_15_28:setText(ToUpperCase(""), 0)
	var_15_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_28:SetAlignment(LUI.Alignment.Center)
	var_15_28:SetVerticalAlignment(LUI.Alignment.Center)
	var_15_28:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 25, _1080p * -17, _1080p * -144, _1080p * -126)
	var_15_0:addElement(var_15_28)

	var_15_0.Label = var_15_28

	local var_15_29
	local var_15_30 = LUI.UIImage.new()

	var_15_30.id = "Glow"

	var_15_30:SetRGBFromTable(SWATCHES.genericButton.glow, 0)
	var_15_30:SetAlpha(0, 0)
	var_15_30:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_15_30:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -256, _1080p * 256, 0, 0)
	var_15_0:addElement(var_15_30)

	var_15_0.Glow = var_15_30

	local var_15_31
	local var_15_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("DefaultSequence", var_15_32)

	local var_15_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("DefaultSequence", var_15_33)

	local var_15_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("DefaultSequence", var_15_34)

	local var_15_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("DefaultSequence", var_15_35)

	local var_15_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("DefaultSequence", var_15_36)

	local var_15_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("DefaultSequence", var_15_37)

	local var_15_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_16:RegisterAnimationSequence("DefaultSequence", var_15_38)

	local var_15_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("DefaultSequence", var_15_39)

	local var_15_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("DefaultSequence", var_15_40)

	local var_15_41 = {
		{
			value = 0,
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
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_15_0.InstallProgressBar.Fill
		}
	}

	var_15_22:RegisterAnimationSequence("DefaultSequence", var_15_41)

	local var_15_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("DefaultSequence", var_15_42)

	local var_15_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("DefaultSequence", var_15_43)

	local var_15_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("DefaultSequence", var_15_44)

	local var_15_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_30:RegisterAnimationSequence("DefaultSequence", var_15_45)

	local function var_15_46()
		var_15_4:AnimateSequence("DefaultSequence")
		var_15_6:AnimateSequence("DefaultSequence")
		var_15_8:AnimateSequence("DefaultSequence")
		var_15_10:AnimateSequence("DefaultSequence")
		var_15_12:AnimateSequence("DefaultSequence")
		var_15_14:AnimateSequence("DefaultSequence")
		var_15_16:AnimateSequence("DefaultSequence")
		var_15_18:AnimateSequence("DefaultSequence")
		var_15_20:AnimateSequence("DefaultSequence")
		var_15_22:AnimateSequence("DefaultSequence")
		var_15_24:AnimateSequence("DefaultSequence")
		var_15_26:AnimateSequence("DefaultSequence")
		var_15_28:AnimateSequence("DefaultSequence")
		var_15_30:AnimateSequence("DefaultSequence")
	end

	var_15_0._sequences.DefaultSequence = var_15_46

	local var_15_47
	local var_15_48 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("BlockedExpanded", var_15_48)

	local var_15_49 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("BlockedExpanded", var_15_49)

	local var_15_50 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_lock")
		},
		{
			value = 0.45,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("BlockedExpanded", var_15_50)

	local var_15_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("BlockedExpanded", var_15_51)

	local var_15_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("BlockedExpanded", var_15_52)

	local var_15_53 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("BlockedExpanded", var_15_53)

	local var_15_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("BlockedExpanded", var_15_54)

	local var_15_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -227
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -173
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("BlockedExpanded", var_15_55)

	local var_15_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -46
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("BlockedExpanded", var_15_56)

	local function var_15_57()
		var_15_4:AnimateSequence("BlockedExpanded")
		var_15_6:AnimateSequence("BlockedExpanded")
		var_15_8:AnimateSequence("BlockedExpanded")
		var_15_10:AnimateSequence("BlockedExpanded")
		var_15_12:AnimateSequence("BlockedExpanded")
		var_15_14:AnimateSequence("BlockedExpanded")
		var_15_22:AnimateSequence("BlockedExpanded")
		var_15_26:AnimateSequence("BlockedExpanded")
		var_15_28:AnimateSequence("BlockedExpanded")
	end

	var_15_0._sequences.BlockedExpanded = var_15_57

	local var_15_58
	local var_15_59 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.lockBannerMain
		}
	}

	var_15_4:RegisterAnimationSequence("Installing", var_15_59)

	local var_15_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("Installing", var_15_60)

	local var_15_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("Installing", var_15_61)

	local var_15_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("Installing", var_15_62)

	local var_15_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("Installing", var_15_63)

	local var_15_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("Installing", var_15_64)

	local var_15_65 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("Installing", var_15_65)

	local var_15_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_15_24:RegisterAnimationSequence("Installing", var_15_66)

	local var_15_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 0.25,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("Installing", var_15_67)

	local function var_15_68()
		var_15_4:AnimateLoop("Installing")
		var_15_6:AnimateLoop("Installing")
		var_15_8:AnimateLoop("Installing")
		var_15_10:AnimateLoop("Installing")
		var_15_12:AnimateLoop("Installing")
		var_15_14:AnimateLoop("Installing")
		var_15_20:AnimateLoop("Installing")
		var_15_24:AnimateLoop("Installing")
		var_15_28:AnimateLoop("Installing")
	end

	var_15_0._sequences.Installing = var_15_68

	local var_15_69
	local var_15_70 = {
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("New", var_15_70)

	local var_15_71 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("New", var_15_71)

	local var_15_72 = {
		{
			value = 0,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("New", var_15_72)

	local var_15_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("New", var_15_73)

	local var_15_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 154
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.glow
		},
		{
			value = 1,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("New", var_15_74)

	local var_15_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 360,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -355,
			easing = LUI.EASING.inOutQuintic
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 355,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0,
			duration = 540,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_15_30:RegisterAnimationSequence("New", var_15_75)

	local function var_15_76()
		var_15_4:AnimateSequence("New")
		var_15_20:AnimateSequence("New")
		var_15_22:AnimateSequence("New")
		var_15_24:AnimateSequence("New")
		var_15_28:AnimateSequence("New")
		var_15_30:AnimateSequence("New")
	end

	var_15_0._sequences.New = var_15_76

	local var_15_77
	local var_15_78 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 8092539,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_15_4:RegisterAnimationSequence("InstallingProgress", var_15_78)

	local var_15_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("InstallingProgress", var_15_79)

	local var_15_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("InstallingProgress", var_15_80)

	local var_15_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("InstallingProgress", var_15_81)

	local var_15_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("InstallingProgress", var_15_82)

	local var_15_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("InstallingProgress", var_15_83)

	local var_15_84 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("InstallingProgress", var_15_84)

	local var_15_85 = {
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

	var_15_22:RegisterAnimationSequence("InstallingProgress", var_15_85)

	local var_15_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("InstallingProgress", var_15_86)

	local var_15_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			value = 0.25,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("InstallingProgress", var_15_87)

	local function var_15_88()
		var_15_4:AnimateLoop("InstallingProgress")
		var_15_6:AnimateLoop("InstallingProgress")
		var_15_8:AnimateLoop("InstallingProgress")
		var_15_10:AnimateLoop("InstallingProgress")
		var_15_12:AnimateLoop("InstallingProgress")
		var_15_14:AnimateLoop("InstallingProgress")
		var_15_20:AnimateLoop("InstallingProgress")
		var_15_22:AnimateLoop("InstallingProgress")
		var_15_24:AnimateLoop("InstallingProgress")
		var_15_28:AnimateLoop("InstallingProgress")
	end

	var_15_0._sequences.InstallingProgress = var_15_88

	local var_15_89
	local var_15_90 = {
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_20:RegisterAnimationSequence("AR", var_15_90)

	local var_15_91 = {
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_22:RegisterAnimationSequence("AR", var_15_91)

	local var_15_92 = {
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_24:RegisterAnimationSequence("AR", var_15_92)

	local var_15_93 = {
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_26:RegisterAnimationSequence("AR", var_15_93)

	local var_15_94 = {
		{
			value = 0.53,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.47,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_28:RegisterAnimationSequence("AR", var_15_94)

	local function var_15_95()
		var_15_20:AnimateSequence("AR")
		var_15_22:AnimateSequence("AR")
		var_15_24:AnimateSequence("AR")
		var_15_26:AnimateSequence("AR")
		var_15_28:AnimateSequence("AR")
	end

	var_15_0._sequences.AR = var_15_95

	local var_15_96
	local var_15_97 = {
		{
			value = 0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_20:RegisterAnimationSequence("IGR", var_15_97)

	local var_15_98 = {
		{
			value = 0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_22:RegisterAnimationSequence("IGR", var_15_98)

	local var_15_99 = {
		{
			value = 0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_24:RegisterAnimationSequence("IGR", var_15_99)

	local var_15_100 = {
		{
			value = 0.58,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.42,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		}
	}

	var_15_28:RegisterAnimationSequence("IGR", var_15_100)

	local function var_15_101()
		var_15_20:AnimateSequence("IGR")
		var_15_22:AnimateSequence("IGR")
		var_15_24:AnimateSequence("IGR")
		var_15_28:AnimateSequence("IGR")
	end

	var_15_0._sequences.IGR = var_15_101

	local var_15_102
	local var_15_103 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("BlockedContracted", var_15_103)

	local var_15_104 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("BlockedContracted", var_15_104)

	local var_15_105 = {
		{
			value = 0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_lock")
		}
	}

	var_15_8:RegisterAnimationSequence("BlockedContracted", var_15_105)

	local var_15_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("BlockedContracted", var_15_106)

	local var_15_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("BlockedContracted", var_15_107)

	local var_15_108 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("BlockedContracted", var_15_108)

	local var_15_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("BlockedContracted", var_15_109)

	local var_15_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -227
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -173
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -26
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_26:RegisterAnimationSequence("BlockedContracted", var_15_110)

	local var_15_111 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_15_28:RegisterAnimationSequence("BlockedContracted", var_15_111)

	local function var_15_112()
		var_15_4:AnimateSequence("BlockedContracted")
		var_15_6:AnimateSequence("BlockedContracted")
		var_15_8:AnimateSequence("BlockedContracted")
		var_15_10:AnimateSequence("BlockedContracted")
		var_15_12:AnimateSequence("BlockedContracted")
		var_15_14:AnimateSequence("BlockedContracted")
		var_15_22:AnimateSequence("BlockedContracted")
		var_15_26:AnimateSequence("BlockedContracted")
		var_15_28:AnimateSequence("BlockedContracted")
	end

	var_15_0._sequences.BlockedContracted = var_15_112

	local var_15_113
	local var_15_114 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.lockBannerMain
		}
	}

	var_15_4:RegisterAnimationSequence("InstallingSuspended", var_15_114)

	local var_15_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("InstallingSuspended", var_15_115)

	local var_15_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 103
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 176
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("InstallingSuspended", var_15_116)

	local var_15_117 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.barEmpty,
			child = var_15_0.InstallProgressBar.Fill
		}
	}

	var_15_22:RegisterAnimationSequence("InstallingSuspended", var_15_117)

	local var_15_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 124
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 1290,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.warning
		},
		{
			value = 1,
			duration = 1290,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1210,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			value = 0.51,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("InstallingSuspended", var_15_118)

	local function var_15_119()
		var_15_4:AnimateLoop("InstallingSuspended")
		var_15_6:AnimateLoop("InstallingSuspended")
		var_15_20:AnimateLoop("InstallingSuspended")
		var_15_22:AnimateLoop("InstallingSuspended")
		var_15_28:AnimateLoop("InstallingSuspended")
	end

	var_15_0._sequences.InstallingSuspended = var_15_119

	local var_15_120
	local var_15_121 = {
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipNew", var_15_121)

	local var_15_122 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipNew", var_15_122)

	local var_15_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		},
		{
			value = 0,
			duration = 220,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_22:RegisterAnimationSequence("WZWipNew", var_15_123)

	local var_15_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_15_24:RegisterAnimationSequence("WZWipNew", var_15_124)

	local var_15_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 31
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		},
		{
			duration = 360,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		},
		{
			value = 1,
			duration = 900,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("WZWipNew", var_15_125)

	local var_15_126 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Left
		},
		{
			value = 0,
			duration = 120,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 360,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -355,
			easing = LUI.EASING.inOutQuintic
		},
		{
			duration = 260,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 355,
			easing = LUI.EASING.inOutQuintic
		},
		{
			value = 0,
			duration = 540,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_15_30:RegisterAnimationSequence("WZWipNew", var_15_126)

	local function var_15_127()
		var_15_4:AnimateSequence("WZWipNew")
		var_15_20:AnimateSequence("WZWipNew")
		var_15_22:AnimateSequence("WZWipNew")
		var_15_24:AnimateSequence("WZWipNew")
		var_15_28:AnimateSequence("WZWipNew")
		var_15_30:AnimateSequence("WZWipNew")
	end

	var_15_0._sequences.WZWipNew = var_15_127

	local var_15_128
	local var_15_129 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.lockBannerMain
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_129)

	local var_15_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_130)

	local var_15_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_131)

	local var_15_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.barEmpty,
			child = var_15_0.InstallProgressBar.Fill
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		}
	}

	var_15_22:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_132)

	local var_15_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_15_24:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_133)

	local var_15_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 1290,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.warning
		},
		{
			value = 1,
			duration = 1290,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2_Highlight
		},
		{
			value = 0.51,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		}
	}

	var_15_28:RegisterAnimationSequence("WZWipInstallingSuspended", var_15_134)

	local function var_15_135()
		var_15_4:AnimateLoop("WZWipInstallingSuspended")
		var_15_6:AnimateLoop("WZWipInstallingSuspended")
		var_15_20:AnimateLoop("WZWipInstallingSuspended")
		var_15_22:AnimateLoop("WZWipInstallingSuspended")
		var_15_24:AnimateLoop("WZWipInstallingSuspended")
		var_15_28:AnimateLoop("WZWipInstallingSuspended")
	end

	var_15_0._sequences.WZWipInstallingSuspended = var_15_135

	local var_15_136
	local var_15_137 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 8092539,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipInstallingProgress", var_15_137)

	local var_15_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipInstallingProgress", var_15_138)

	local var_15_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipInstallingProgress", var_15_139)

	local var_15_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipInstallingProgress", var_15_140)

	local var_15_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipInstallingProgress", var_15_141)

	local var_15_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipInstallingProgress", var_15_142)

	local var_15_143 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipInstallingProgress", var_15_143)

	local var_15_144 = {
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
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		}
	}

	var_15_22:RegisterAnimationSequence("WZWipInstallingProgress", var_15_144)

	local var_15_145 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_15_24:RegisterAnimationSequence("WZWipInstallingProgress", var_15_145)

	local var_15_146 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Font,
			value = FONTS.MainRegular.File
		},
		{
			value = 0.25,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("WZWipInstallingProgress", var_15_146)

	local function var_15_147()
		var_15_4:AnimateLoop("WZWipInstallingProgress")
		var_15_6:AnimateLoop("WZWipInstallingProgress")
		var_15_8:AnimateLoop("WZWipInstallingProgress")
		var_15_10:AnimateLoop("WZWipInstallingProgress")
		var_15_12:AnimateLoop("WZWipInstallingProgress")
		var_15_14:AnimateLoop("WZWipInstallingProgress")
		var_15_20:AnimateLoop("WZWipInstallingProgress")
		var_15_22:AnimateLoop("WZWipInstallingProgress")
		var_15_24:AnimateLoop("WZWipInstallingProgress")
		var_15_28:AnimateLoop("WZWipInstallingProgress")
	end

	var_15_0._sequences.WZWipInstallingProgress = var_15_147

	local var_15_148
	local var_15_149 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.lockBannerMain
		}
	}

	var_15_4:RegisterAnimationSequence("WZWipInstalling", var_15_149)

	local var_15_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("WZWipInstalling", var_15_150)

	local var_15_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("WZWipInstalling", var_15_151)

	local var_15_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("WZWipInstalling", var_15_152)

	local var_15_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_12:RegisterAnimationSequence("WZWipInstalling", var_15_153)

	local var_15_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_14:RegisterAnimationSequence("WZWipInstalling", var_15_154)

	local var_15_155 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipInstalling", var_15_155)

	local var_15_156 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 5
		}
	}

	var_15_22:RegisterAnimationSequence("WZWipInstalling", var_15_156)

	local var_15_157 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_15_24:RegisterAnimationSequence("WZWipInstalling", var_15_157)

	local var_15_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -42
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.abilityText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		},
		{
			value = 0.25,
			duration = 1210,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_28:RegisterAnimationSequence("WZWipInstalling", var_15_158)

	local function var_15_159()
		var_15_4:AnimateLoop("WZWipInstalling")
		var_15_6:AnimateLoop("WZWipInstalling")
		var_15_8:AnimateLoop("WZWipInstalling")
		var_15_10:AnimateLoop("WZWipInstalling")
		var_15_12:AnimateLoop("WZWipInstalling")
		var_15_14:AnimateLoop("WZWipInstalling")
		var_15_20:AnimateLoop("WZWipInstalling")
		var_15_22:AnimateLoop("WZWipInstalling")
		var_15_24:AnimateLoop("WZWipInstalling")
		var_15_28:AnimateLoop("WZWipInstalling")
	end

	var_15_0._sequences.WZWipInstalling = var_15_159

	local var_15_160
	local var_15_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZFenceMessage
		}
	}

	var_15_20:RegisterAnimationSequence("WZWipSetup", var_15_161)

	local var_15_162 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_28:RegisterAnimationSequence("WZWipSetup", var_15_162)

	local var_15_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_15_30:RegisterAnimationSequence("WZWipSetup", var_15_163)

	local function var_15_164()
		var_15_20:AnimateSequence("WZWipSetup")
		var_15_28:AnimateSequence("WZWipSetup")
		var_15_30:AnimateSequence("WZWipSetup")
	end

	var_15_0._sequences.WZWipSetup = var_15_164

	PostLoadFunc(var_15_0, var_15_1, arg_15_1)
	ACTIONS.AnimateSequence(var_15_0, "DefaultSequence")

	return var_15_0
end

MenuBuilder.registerType("MainMenuBladeDisableOverlay", MainMenuBladeDisableOverlay)
LockTable(_M)
