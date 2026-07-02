module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.Icon:ClearMask()
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.ClearIconMask = var_0_0

	arg_2_0.Icon:SetMask(arg_2_0.IconMask)

	local var_2_0 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.maxClientCount")

	arg_2_0:SubscribeToModel(var_2_0:GetModel(arg_2_1), function()
		if var_2_0:GetValue(arg_2_1) ~= nil then
			arg_2_0._maxPlayerCount = var_2_0:GetValue(arg_2_1)
		end
	end, false)

	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_2_0, "KORZHJP")
	end
end

function TeamBase(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -75 * _1080p, 75 * _1080p, -75 * _1080p, 75 * _1080p)

	var_4_0.id = "TeamBase"
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

	var_4_4.id = "DarkIcon"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.7, 0)
	var_4_4:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -183, _1080p * 97, _1080p * -140, _1080p * 140)
	var_4_0:addElement(var_4_4)

	var_4_0.DarkIcon = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Icon"

	var_4_6:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -183, _1080p * 97, _1080p * -140, _1080p * 140)
	var_4_0:addElement(var_4_6)

	var_4_0.Icon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "NameBacker"

	var_4_8:SetRGBFromInt(0, 0)
	var_4_8:SetAlpha(0.3, 0)
	var_4_8:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_4_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -213, _1080p * 30, _1080p * 16, _1080p * 54)
	var_4_0:addElement(var_4_8)

	var_4_0.NameBacker = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Score"

	var_4_10:setText("0000", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Right)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_10:SetStartupDelay(1000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(150)
	var_4_10:SetAnimMoveSpeed(50)
	var_4_10:SetEndDelay(1000)
	var_4_10:SetCrossfadeTime(400)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(1)
	var_4_10:SetOutlineMinDistance(-0.2, 0)
	var_4_10:SetOutlineMaxDistance(0.2, 0)
	var_4_10:SetOutlineRGBFromInt(0, 0)
	var_4_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -208, _1080p * 32, _1080p * 32, _1080p * 152)
	var_4_0:addElement(var_4_10)

	var_4_0.Score = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Name"

	var_4_12:setText(ToUpperCase(""), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_12:SetAlignment(LUI.Alignment.Right)
	var_4_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_12:SetStartupDelay(1000)
	var_4_12:SetLineHoldTime(400)
	var_4_12:SetAnimMoveTime(150)
	var_4_12:SetAnimMoveSpeed(50)
	var_4_12:SetEndDelay(1000)
	var_4_12:SetCrossfadeTime(400)
	var_4_12:SetFadeInTime(300)
	var_4_12:SetFadeOutTime(300)
	var_4_12:SetMaxVisibleLines(1)
	var_4_12:SetOutlineRGBFromInt(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -58, _1080p * 328, _1080p * 4, _1080p * 64)
	var_4_0:addElement(var_4_12)

	var_4_0.Name = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "IconMask"

	var_4_14:SetAlpha(0, 0)
	var_4_14:SetZRotation(-45, 0)
	var_4_14:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -107, _1080p * 383, _1080p * -18, _1080p * 318)
	var_4_0:addElement(var_4_14)

	var_4_0.IconMask = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Underline"

	var_4_16:SetAlpha(0, 0)
	var_4_16:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -282, _1080p * 28, _1080p * -16, _1080p * -6)
	var_4_0:addElement(var_4_16)

	var_4_0.Underline = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIStyledText.new()

	var_4_18.id = "TeamCount"

	var_4_18:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_4_18:setText("", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_18:SetAlignment(LUI.Alignment.Right)
	var_4_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 12, _1080p * 324, _1080p * -24, _1080p * 12)
	var_4_0:addElement(var_4_18)

	var_4_0.TeamCount = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("DefaultSequence", var_4_20)

	local function var_4_21()
		var_4_14:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.offwhite
		}
	}

	var_4_10:RegisterAnimationSequence("DisplayWin", var_4_23)

	local var_4_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("DisplayWin", var_4_24)

	local function var_4_25()
		var_4_10:AnimateSequence("DisplayWin")
		var_4_16:AnimateSequence("DisplayWin")
	end

	var_4_0._sequences.DisplayWin = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_4_10:RegisterAnimationSequence("DisplayLoss", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("DisplayLoss", var_4_28)

	local function var_4_29()
		var_4_10:AnimateSequence("DisplayLoss")
		var_4_16:AnimateSequence("DisplayLoss")
	end

	var_4_0._sequences.DisplayLoss = var_4_29

	local var_4_30
	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 94
		}
	}

	var_4_4:RegisterAnimationSequence("Spitscreen", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -95
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 93
		}
	}

	var_4_6:RegisterAnimationSequence("Spitscreen", var_4_32)

	local var_4_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -241
		}
	}

	var_4_8:RegisterAnimationSequence("Spitscreen", var_4_33)

	local var_4_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 117
		}
	}

	var_4_10:RegisterAnimationSequence("Spitscreen", var_4_34)

	local var_4_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 55
		}
	}

	var_4_12:RegisterAnimationSequence("Spitscreen", var_4_35)

	local var_4_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_4_16:RegisterAnimationSequence("Spitscreen", var_4_36)

	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -9
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 184
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_4_18:RegisterAnimationSequence("Spitscreen", var_4_37)

	local function var_4_38()
		var_4_4:AnimateSequence("Spitscreen")
		var_4_6:AnimateSequence("Spitscreen")
		var_4_8:AnimateSequence("Spitscreen")
		var_4_10:AnimateSequence("Spitscreen")
		var_4_12:AnimateSequence("Spitscreen")
		var_4_16:AnimateSequence("Spitscreen")
		var_4_18:AnimateSequence("Spitscreen")
	end

	var_4_0._sequences.Spitscreen = var_4_38

	local var_4_39
	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 162
		}
	}

	var_4_10:RegisterAnimationSequence("KORZHJP", var_4_40)

	local function var_4_41()
		var_4_10:AnimateSequence("KORZHJP")
	end

	var_4_0._sequences.KORZHJP = var_4_41

	var_0_1(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	if CONDITIONS.IsSplitscreen() then
		ACTIONS.AnimateSequence(var_4_0, "Spitscreen")
	end

	return var_4_0
end

MenuBuilder.registerType("TeamBase", TeamBase)
LockTable(_M)
