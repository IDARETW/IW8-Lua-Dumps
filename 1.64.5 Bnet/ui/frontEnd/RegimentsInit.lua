module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("RegimentsCreatePopup", arg_1_1)
	local var_1_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_1_1.controllerIndex,
		widget = var_1_0
	})

	var_1_1.id = "RegimentsCreationPopup"

	return var_1_1
end

MenuBuilder.registerType("RegimentsCreationPopup", var_0_0)

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = MenuBuilder.BuildRegisteredType("SocialRegimentsInvitationsPopup", arg_2_1)
	local var_2_1 = MenuBuilder.BuildRegisteredType("FlyInPopup", {
		controllerIndex = arg_2_1.controllerIndex,
		widget = var_2_0
	})

	var_2_1.id = "RegimentsManagementPopup"

	if var_2_1 and var_2_1.ButtonHelperBar then
		var_2_1.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("REGIMENTS/BLOCK_INVITES")
		})
	end

	return var_2_1
end

MenuBuilder.registerType("RegimentsManagementPopup", var_0_1)

local var_0_2

local function var_0_3(arg_3_0)
	arg_3_0:Wait(1000, true).onComplete = function()
		return var_0_3(arg_3_0)
	end

	local var_3_0 = #Clans.EBDFICHCEJ(arg_3_0._controllerIndex)

	arg_3_0.PendingInvites:setText(var_3_0)
	ACTIONS.AnimateSequence(arg_3_0, var_3_0 > 0 and "SomeInvites" or "NoInvites")
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1

	var_0_3(arg_5_0)

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_5_0, "JP")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_5_0, "AR")
	end

	if not arg_5_2.disableAllButtons then
		arg_5_0.CreateButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsCreationPopup", true, arg_5_1, false, {
				init = true,
				controllerIndex = arg_5_1
			})
		end)
		arg_5_0.InvitationsButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsManagementPopup", true, arg_5_1, false, {
				clanID = -1,
				init = true,
				controllerIndex = arg_5_1
			})
		end)
	else
		ACTIONS.AnimateSequence(arg_5_0, "ShowGroupsFailedLoad")
	end
end

function RegimentsInit(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "RegimentsInit"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "CreateButton"

	var_8_4.Text:SetLeft(_1080p * 20, 0)
	var_8_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_CREATE"), 0)
	var_8_4.Text:SetAlignment(LUI.Alignment.Left)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 216, _1080p * 254)
	var_8_0:addElement(var_8_4)

	var_8_0.CreateButton = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "InvitationsButton"

	var_8_6.Text:SetLeft(_1080p * 20, 0)
	var_8_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_INVITATIONS"), 0)
	var_8_6.Text:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 516, _1080p * 264, _1080p * 302)
	var_8_0:addElement(var_8_6)

	var_8_0.InvitationsButton = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "DoubleNotchedBacker"

	var_8_8:SetAlpha(0.5, 0)
	var_8_8.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 657, _1080p * 1790, _1080p * 216, _1080p * 697)
	var_8_0:addElement(var_8_8)

	var_8_0.DoubleNotchedBacker = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "NotInRegimentLabel"

	var_8_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_10:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_IN_REGIMENT"), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Center)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1733, _1080p * 294, _1080p * 330)
	var_8_0:addElement(var_8_10)

	var_8_0.NotInRegimentLabel = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "WhyJoinLabel"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WHY_JOIN_REGIMENT")), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1733, _1080p * 422, _1080p * 452)
	var_8_0:addElement(var_8_12)

	var_8_0.WhyJoinLabel = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "WhyJoinDescLabel"

	var_8_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_14:setText(Engine.CBBHFCGDIC("LUA_MENU/WHY_JOIN_REGIMENT_DESC"), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 764, _1080p * 1683, _1080p * 456, _1080p * 478)
	var_8_0:addElement(var_8_14)

	var_8_0.WhyJoinDescLabel = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIText.new()

	var_8_16.id = "HowToJoinLabel"

	var_8_16:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_16:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/HOW_JOIN_REGIMENT")), 0)
	var_8_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_16:SetAlignment(LUI.Alignment.Center)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1733, _1080p * 540, _1080p * 570)
	var_8_0:addElement(var_8_16)

	var_8_0.HowToJoinLabel = var_8_16

	local var_8_17
	local var_8_18 = LUI.UIText.new()

	var_8_18.id = "HowToJoinDescLabel"

	var_8_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_18:setText(Engine.CBBHFCGDIC("LUA_MENU/HOW_JOIN_REGIMENT_DESC"), 0)
	var_8_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_18:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 764, _1080p * 1683, _1080p * 576, _1080p * 598)
	var_8_0:addElement(var_8_18)

	var_8_0.HowToJoinDescLabel = var_8_18

	local var_8_19
	local var_8_20 = LUI.UIImage.new()

	var_8_20.id = "InvitationsCountBox"

	var_8_20:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_8_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 478, _1080p * 504, _1080p * 275, _1080p * 293)
	var_8_0:addElement(var_8_20)

	var_8_0.InvitationsCountBox = var_8_20

	local var_8_21
	local var_8_22 = LUI.UIText.new()

	var_8_22.id = "PendingInvites"

	var_8_22:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_8_22:setText("99", 0)
	var_8_22:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_22:SetAlignment(LUI.Alignment.Center)
	var_8_22:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 466, _1080p * 516, _1080p * 272, _1080p * 294)
	var_8_0:addElement(var_8_22)

	var_8_0.PendingInvites = var_8_22

	local var_8_23
	local var_8_24 = LUI.UIImage.new()

	var_8_24.id = "GroupsNotLoadedBacker"

	var_8_24:SetRGBFromInt(0, 0)
	var_8_24:SetAlpha(0, 0)
	var_8_24:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
	var_8_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -523, _1080p * 523, _1080p * -64, _1080p * 64)
	var_8_0:addElement(var_8_24)

	var_8_0.GroupsNotLoadedBacker = var_8_24

	local var_8_25
	local var_8_26 = LUI.UIText.new()

	var_8_26.id = "GroupsNotLoadedLabel"

	var_8_26:SetAlpha(0, 0)
	var_8_26:setText(Engine.CBBHFCGDIC("LUA_MENU/GROUPS_NOT_LOADED"), 0)
	var_8_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_26:SetAlignment(LUI.Alignment.Center)
	var_8_26:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -21, _1080p * 15)
	var_8_0:addElement(var_8_26)

	var_8_0.GroupsNotLoadedLabel = var_8_26

	local function var_8_27()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_27

	local var_8_28
	local var_8_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 284
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 332
		}
	}

	var_8_10:RegisterAnimationSequence("AR", var_8_29)

	local var_8_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 386
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 422
		}
	}

	var_8_12:RegisterAnimationSequence("AR", var_8_30)

	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 456
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 426
		}
	}

	var_8_14:RegisterAnimationSequence("AR", var_8_31)

	local var_8_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 556
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 592
		}
	}

	var_8_16:RegisterAnimationSequence("AR", var_8_32)

	local var_8_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 628
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 598
		}
	}

	var_8_18:RegisterAnimationSequence("AR", var_8_33)

	local var_8_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 134
		}
	}

	var_8_20:RegisterAnimationSequence("AR", var_8_34)

	local var_8_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 146
		}
	}

	var_8_22:RegisterAnimationSequence("AR", var_8_35)

	local function var_8_36()
		var_8_10:AnimateSequence("AR")
		var_8_12:AnimateSequence("AR")
		var_8_14:AnimateSequence("AR")
		var_8_16:AnimateSequence("AR")
		var_8_18:AnimateSequence("AR")
		var_8_20:AnimateSequence("AR")
		var_8_22:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_36

	local var_8_37
	local var_8_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Frontend.LimitedTagPrimary
		}
	}

	var_8_20:RegisterAnimationSequence("SomeInvites", var_8_38)

	local function var_8_39()
		var_8_20:AnimateSequence("SomeInvites")
	end

	var_8_0._sequences.SomeInvites = var_8_39

	local var_8_40
	local var_8_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_8_20:RegisterAnimationSequence("NoInvites", var_8_41)

	local function var_8_42()
		var_8_20:AnimateSequence("NoInvites")
	end

	var_8_0._sequences.NoInvites = var_8_42

	local var_8_43
	local var_8_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 275
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 297
		}
	}

	var_8_22:RegisterAnimationSequence("JP", var_8_44)

	local function var_8_45()
		var_8_22:AnimateSequence("JP")
	end

	var_8_0._sequences.JP = var_8_45

	local var_8_46
	local var_8_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_4:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_47)

	local var_8_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_48)

	local var_8_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_49)

	local var_8_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_50)

	local var_8_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_51)

	local var_8_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_52)

	local var_8_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_53)

	local var_8_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_18:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_54)

	local var_8_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_55)

	local var_8_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_22:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_56)

	local var_8_57 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_24:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_57)

	local var_8_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_26:RegisterAnimationSequence("ShowGroupsFailedLoad", var_8_58)

	local function var_8_59()
		var_8_4:AnimateSequence("ShowGroupsFailedLoad")
		var_8_6:AnimateSequence("ShowGroupsFailedLoad")
		var_8_8:AnimateSequence("ShowGroupsFailedLoad")
		var_8_10:AnimateSequence("ShowGroupsFailedLoad")
		var_8_12:AnimateSequence("ShowGroupsFailedLoad")
		var_8_14:AnimateSequence("ShowGroupsFailedLoad")
		var_8_16:AnimateSequence("ShowGroupsFailedLoad")
		var_8_18:AnimateSequence("ShowGroupsFailedLoad")
		var_8_20:AnimateSequence("ShowGroupsFailedLoad")
		var_8_22:AnimateSequence("ShowGroupsFailedLoad")
		var_8_24:AnimateSequence("ShowGroupsFailedLoad")
		var_8_26:AnimateSequence("ShowGroupsFailedLoad")
	end

	var_8_0._sequences.ShowGroupsFailedLoad = var_8_59

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("RegimentsInit", RegimentsInit)
LockTable(_M)
