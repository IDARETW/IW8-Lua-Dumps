module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._clanInviteCount = Clans2.CFDIIEAGHB(arg_1_1)
end

local function var_0_1(arg_2_0)
	arg_2_0.InvitesLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_INVITATIONS", arg_2_0._clanInviteCount))
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.InvitesLabel:SetAlpha(arg_3_1 and 0 or 1)
end

local function var_0_3(arg_4_0)
	return arg_4_0._clanInviteCount <= 0 and CONDITIONS.IsClanSearchDisabled()
end

local function var_0_4(arg_5_0, arg_5_1)
	var_0_0(arg_5_0, arg_5_1)
	var_0_1(arg_5_0)
	arg_5_0:SetButtonDisabled(var_0_3(arg_5_0))
end

local function var_0_5(arg_6_0)
	ACTIONS.AnimateSequence(arg_6_0, "ButtonOver")
end

local function var_0_6(arg_7_0)
	ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")
end

local function var_0_7(arg_8_0)
	arg_8_0:SetFocusable(false)
	ACTIONS.AnimateSequence(arg_8_0, "Disabled")
end

local function var_0_8(arg_9_0)
	arg_9_0:SetFocusable(true)
	ACTIONS.AnimateSequence(arg_9_0, "Enabled")
end

local function var_0_9(arg_10_0)
	var_0_1(arg_10_0)
	var_0_2(arg_10_0, true)
end

local function var_0_10(arg_11_0)
	arg_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		var_0_5(arg_11_0)
	end)
	arg_11_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		var_0_6(arg_11_0)
	end)
	arg_11_0:addEventHandler("button_over_disable", function(arg_14_0, arg_14_1)
		var_0_6(arg_11_0)
	end)
	arg_11_0:addEventHandler("disable", function(arg_15_0, arg_15_1)
		var_0_7(arg_11_0)
	end)
	arg_11_0:addEventHandler("enable", function(arg_16_0, arg_16_1)
		var_0_8(arg_11_0)
	end)
end

local function var_0_11(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.SetInviteLabelDisabled = var_0_2
	arg_17_0.UpdateClanInvites = var_0_4
	arg_17_0.HandleButtonDisabled = var_0_7
	arg_17_0.HandleButtonEnabled = var_0_8

	var_0_9(arg_17_0)
	var_0_10(arg_17_0)
end

function ClanTileButton(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIButton.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 960 * _1080p, 0, 851 * _1080p)

	var_18_0.id = "ClanTileButton"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Background"

	var_18_4:SetRGBFromTable(SWATCHES.CH2.CH2Neutral, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Background = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "LockedIcon"

	var_18_6:SetRGBFromTable(SWATCHES.genericButton.lockedText, 0)
	var_18_6:SetAlpha(0, 0)
	var_18_6:setImage(RegisterMaterial("hud_lock_large"), 0)
	var_18_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 408, _1080p * -408, _1080p * 162, _1080p * 306)
	var_18_0:addElement(var_18_6)

	var_18_0.LockedIcon = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIStyledText.new()

	var_18_8.id = "LockDescription"

	var_18_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_18_8:SetAlpha(0, 0)
	var_18_8:setText(Engine.CBBHFCGDIC("LUA_MENU/JOIN_A_CLAN_LOCKED_DESC"), 0)
	var_18_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_8:SetLeading(2 * _1080p, 0)
	var_18_8:SetAlignment(LUI.Alignment.Center)
	var_18_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 128, _1080p * -128, _1080p * 80.5, _1080p * 108.5)
	var_18_0:addElement(var_18_8)

	var_18_0.LockDescription = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIStyledText.new()

	var_18_10.id = "InvitesLabel"

	var_18_10:SetAlpha(0, 0)
	var_18_10:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_INVITATIONS"), 0)
	var_18_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_10:SetAlignment(LUI.Alignment.Center)
	var_18_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 230, _1080p * -230, _1080p * 426, _1080p * 456)
	var_18_0:addElement(var_18_10)

	var_18_0.InvitesLabel = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIStyledText.new()

	var_18_12.id = "Description"

	var_18_12:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_18_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_A_CLAN_DESC"), 0)
	var_18_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_12:SetLeading(2 * _1080p, 0)
	var_18_12:SetAlignment(LUI.Alignment.Center)
	var_18_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_18_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 128, _1080p * -128, _1080p * 258, _1080p * 286)
	var_18_0:addElement(var_18_12)

	var_18_0.Description = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIStyledText.new()

	var_18_14.id = "Title"

	var_18_14:setText("", 0)
	var_18_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_14:SetAlignment(LUI.Alignment.Center)
	var_18_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_18_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, _1080p * -32, _1080p * 298, _1080p * 418)
	var_18_0:addElement(var_18_14)

	var_18_0.Title = var_18_14

	local function var_18_15()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_15

	local var_18_16
	local var_18_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonOver", var_18_17)

	local var_18_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("ButtonOver", var_18_18)

	local function var_18_19()
		var_18_4:AnimateSequence("ButtonOver")
		var_18_14:AnimateSequence("ButtonOver")
	end

	var_18_0._sequences.ButtonOver = var_18_19

	local var_18_20
	local var_18_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_18_4:RegisterAnimationSequence("ButtonUp", var_18_21)

	local var_18_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_18_14:RegisterAnimationSequence("ButtonUp", var_18_22)

	local function var_18_23()
		var_18_4:AnimateSequence("ButtonUp")
		var_18_14:AnimateSequence("ButtonUp")
	end

	var_18_0._sequences.ButtonUp = var_18_23

	local var_18_24
	local var_18_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_18_4:RegisterAnimationSequence("Disabled", var_18_25)

	local var_18_26 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -195.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 60.5
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
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
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -128
		}
	}

	var_18_6:RegisterAnimationSequence("Disabled", var_18_26)

	local var_18_27 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 84.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 112.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/JOIN_A_CLAN_LOCKED_DESC")
		}
	}

	var_18_8:RegisterAnimationSequence("Disabled", var_18_27)

	local var_18_28 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_18_10:RegisterAnimationSequence("Disabled", var_18_28)

	local var_18_29 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		}
	}

	var_18_12:RegisterAnimationSequence("Disabled", var_18_29)

	local var_18_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.primaryText
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_14:RegisterAnimationSequence("Disabled", var_18_30)

	local function var_18_31()
		var_18_4:AnimateSequence("Disabled")
		var_18_6:AnimateSequence("Disabled")
		var_18_8:AnimateSequence("Disabled")
		var_18_10:AnimateSequence("Disabled")
		var_18_12:AnimateSequence("Disabled")
		var_18_14:AnimateSequence("Disabled")
	end

	var_18_0._sequences.Disabled = var_18_31

	local var_18_32
	local var_18_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2Neutral
		}
	}

	var_18_4:RegisterAnimationSequence("Enabled", var_18_33)

	local var_18_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_6:RegisterAnimationSequence("Enabled", var_18_34)

	local var_18_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		},
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/JOIN_A_CLAN_DESC_SECONDARY")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 88.5
		}
	}

	var_18_8:RegisterAnimationSequence("Enabled", var_18_35)

	local var_18_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_18_10:RegisterAnimationSequence("Enabled", var_18_36)

	local var_18_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.White
		}
	}

	var_18_12:RegisterAnimationSequence("Enabled", var_18_37)

	local function var_18_38()
		var_18_4:AnimateSequence("Enabled")
		var_18_6:AnimateSequence("Enabled")
		var_18_8:AnimateSequence("Enabled")
		var_18_10:AnimateSequence("Enabled")
		var_18_12:AnimateSequence("Enabled")
	end

	var_18_0._sequences.Enabled = var_18_38

	var_0_11(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("ClanTileButton", ClanTileButton)
LockTable(_M)
