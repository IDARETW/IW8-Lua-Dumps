module(..., package.seeall)

local var_0_0 = false
local var_0_1 = 20 * _1080p
local var_0_2 = 760 * _1080p

local function var_0_3(arg_1_0, arg_1_1)
	arg_1_0.CRMTextDetails.Prompt:SetText("")

	if arg_1_1.actionFunction then
		local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW")
		local var_1_1 = arg_1_1[CRM.keys.ACTION_TITLE]

		if var_1_1 ~= nil and #var_1_1 > 0 then
			var_1_0 = var_1_1
		end

		arg_1_0.CRMTextDetails.Prompt:SetText(Engine.CBBHFCGDIC("LUA_MENU/PAD_PRIMARY_BUTTON") .. " " .. var_1_0)
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0()
		local var_3_0 = arg_2_2[CRM.keys.POPUP_IMAGE]

		if var_3_0 and #var_3_0 > 0 then
			arg_2_0.Image:setImage(RegisterMaterial(var_3_0))
			arg_2_0.Image:SetAlpha(1)
		else
			arg_2_0.Image:SetAlpha(0)
		end
	end

	local var_2_1 = arg_2_2[CRM.keys.STORE_ITEM]
	local var_2_2 = arg_2_2[CRM.keys.CONTENT_LONG]

	if var_2_1 then
		local var_2_3 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_1, CSV.bundleIDs.cols.image)
		local var_2_4 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_1, CSV.bundleIDs.cols.titleImage)
		local var_2_5 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_1, CSV.bundleIDs.cols.description)

		if var_2_3 and #var_2_3 > 0 then
			arg_2_0.Image:setImage(RegisterMaterial(var_2_3))
			arg_2_0.Image:SetAlpha(1)
		else
			var_2_0()
		end

		if var_2_4 and #var_2_4 > 0 then
			arg_2_0.BillboardName:setImage(RegisterMaterial(var_2_4))
			arg_2_0.BillboardName:SetAlpha(1)
		else
			arg_2_0.BillboardName:SetAlpha(0)
		end

		if var_2_5 and #var_2_5 > 0 then
			var_2_2 = Engine.CBBHFCGDIC(var_2_5)
		end

		if not IsLanguageEnglish() then
			local var_2_6 = StringTable.DIFCHIGDFB(CSV.bundleIDs.file, CSV.bundleIDs.cols.id, var_2_1, CSV.bundleIDs.cols.name)

			arg_2_0.LocalizedTitle:setText(Engine.CBBHFCGDIC(var_2_6))

			if var_0_0 then
				ACTIONS.AnimateSequence(arg_2_0, "ShowLocalization")
			else
				ACTIONS.AnimateSequence(arg_2_0, "ShowLocalizationNoTitle")
			end
		elseif var_0_0 then
			ACTIONS.AnimateSequence(arg_2_0, "EN")
		else
			ACTIONS.AnimateSequence(arg_2_0, "NoTitle")
		end

		if arg_2_0._promotedItems[tostring(var_2_1)] then
			arg_2_0.HotItem:SetAlpha(1)
		end
	else
		var_2_0()

		if var_0_0 == false then
			ACTIONS.AnimateSequence(arg_2_0, "NoTitle")
		end

		ACTIONS.AnimateSequence(arg_2_0, "Failsafe")
	end

	arg_2_0.CRMTextDetails:InitializeDimensions(arg_2_0.CRMTextDetails:GetCurrentAnchorsAndPositions())
	arg_2_0.Title:setText(arg_2_2[CRM.keys.CONTENT_SHORT])

	local var_2_7 = arg_2_0.Title:GetCurrentAnchorsAndPositions().left
	local var_2_8 = LAYOUT.GetTextWidth(arg_2_0.Title)

	var_2_8 = var_2_8 > var_0_2 and var_0_2 or var_2_8

	if var_0_0 then
		arg_2_0.HotItem:SetLeft(var_2_7 + var_2_8 + var_0_1)
		arg_2_0.HotItem:SetRight(var_2_7 + var_2_8 + var_0_1 + arg_2_0._hotItemWidth)
	end

	var_0_3(arg_2_0, arg_2_2)
	arg_2_0.CRMTextDetails:UpdateDetails(var_2_2, true)

	if IsLanguageArabic() then
		if var_0_0 then
			ACTIONS.AnimateSequence(arg_2_0, "AR")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ARNoTitle")
		end

		ACTIONS.AnimateSequence(arg_2_0.CRMTextDetails, "HideTitleAR")
	else
		ACTIONS.AnimateSequence(arg_2_0.CRMTextDetails, "HideTitle")
	end
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupContent = var_0_4
	arg_4_0._hotItemWidth = LAYOUT.GetElementWidth(arg_4_0.HotItem)
	arg_4_0._promotedItems = STORE.ParsePromotedItems(arg_4_1)

	arg_4_0.CRMTextDetails:InitializeDimensions(arg_4_0.CRMTextDetails:GetCurrentAnchorsAndPositions())
	arg_4_0:setPriority(-1)
end

function CRMLayoutBundle(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "CRMLayoutBundle"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "GenericPopupWindow"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 173, _1080p * 925)
	var_5_0:addElement(var_5_4)

	var_5_0.GenericPopupWindow = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "DarkFill"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 120, _1080p * -120, _1080p * 641, _1080p * -183)
	var_5_0:addElement(var_5_6)

	var_5_0.DarkFill = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Image"

	var_5_8:setImage(RegisterMaterial("mw_store_billboard_night_stalker"), 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 120, _1080p * -120, _1080p * 197, _1080p * -375)
	var_5_0:addElement(var_5_8)

	var_5_0.Image = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "DarkGradient"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_10:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 120, _1080p * -120, _1080p * 641, _1080p * -375)
	var_5_0:addElement(var_5_10)

	var_5_0.DarkGradient = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Backer"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 120, _1080p * 1800, _1080p * 718, _1080p * 897)
	var_5_0:addElement(var_5_12)

	var_5_0.Backer = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "TopDownVignette"

	var_5_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 96, _1080p * -96, _1080p * 170, _1080p * 409)
	var_5_0:addElement(var_5_14)

	var_5_0.TopDownVignette = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "Title"

	var_5_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_16:SetWordWrap(false)
	var_5_16:SetLeading(-5 * _1080p, 0)
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_16:SetStartupDelay(1000)
	var_5_16:SetLineHoldTime(400)
	var_5_16:SetAnimMoveTime(1000)
	var_5_16:SetAnimMoveSpeed(150)
	var_5_16:SetEndDelay(1000)
	var_5_16:SetCrossfadeTime(1000)
	var_5_16:SetFadeInTime(300)
	var_5_16:SetFadeOutTime(300)
	var_5_16:SetMaxVisibleLines(1)
	var_5_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 157, _1080p * -980, _1080p * 230, _1080p * 300)
	var_5_0:addElement(var_5_16)

	var_5_0.Title = var_5_16

	local var_5_17
	local var_5_18 = MenuBuilder.BuildRegisteredType("HotItem", {
		controllerIndex = var_5_1
	})

	var_5_18.id = "HotItem"

	var_5_18:SetAlpha(0, 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 960, _1080p * 1060, _1080p * 211, _1080p * 311)
	var_5_0:addElement(var_5_18)

	var_5_0.HotItem = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "BillboardName"

	var_5_20:setImage(RegisterMaterial("mw_store_title_night_stalker"), 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 441, _1080p * 325, _1080p * 467)
	var_5_0:addElement(var_5_20)

	var_5_0.BillboardName = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "LocalizedTitle"

	var_5_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_22:setText("", 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetWordWrap(false)
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_22:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_22:SetStartupDelay(2000)
	var_5_22:SetLineHoldTime(400)
	var_5_22:SetAnimMoveTime(2000)
	var_5_22:SetAnimMoveSpeed(150)
	var_5_22:SetEndDelay(2000)
	var_5_22:SetCrossfadeTime(250)
	var_5_22:SetFadeInTime(300)
	var_5_22:SetFadeOutTime(300)
	var_5_22:SetMaxVisibleLines(1)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 669, _1080p * 295, _1080p * 319)
	var_5_0:addElement(var_5_22)

	var_5_0.LocalizedTitle = var_5_22

	local var_5_23
	local var_5_24 = MenuBuilder.BuildRegisteredType("CRMTextDetails", {
		controllerIndex = var_5_1
	})

	var_5_24.id = "CRMTextDetails"

	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 157, _1080p * 687, _1080p * 430, _1080p * 500)
	var_5_0:addElement(var_5_24)

	var_5_0.CRMTextDetails = var_5_24

	local function var_5_25()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_25

	local var_5_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 472
		}
	}

	var_5_20:RegisterAnimationSequence("AR", var_5_26)

	local var_5_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 328
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 296
		}
	}

	var_5_22:RegisterAnimationSequence("AR", var_5_27)

	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 440
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 510
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_28)

	local function var_5_29()
		var_5_20:AnimateSequence("AR")
		var_5_22:AnimateSequence("AR")
		var_5_24:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_29

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 300
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 442
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 441
		}
	}

	var_5_20:RegisterAnimationSequence("EN", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("EN", var_5_31)

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 475
		}
	}

	var_5_24:RegisterAnimationSequence("EN", var_5_32)

	local function var_5_33()
		var_5_20:AnimateSequence("EN")
		var_5_22:AnimateSequence("EN")
		var_5_24:AnimateSequence("EN")
	end

	var_5_0._sequences.EN = var_5_33

	local var_5_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 325
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 467
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 441
		}
	}

	var_5_20:RegisterAnimationSequence("ShowLocalization", var_5_34)

	local var_5_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("ShowLocalization", var_5_35)

	local var_5_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 430
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 500
		}
	}

	var_5_24:RegisterAnimationSequence("ShowLocalization", var_5_36)

	local function var_5_37()
		var_5_20:AnimateSequence("ShowLocalization")
		var_5_22:AnimateSequence("ShowLocalization")
		var_5_24:AnimateSequence("ShowLocalization")
	end

	var_5_0._sequences.ShowLocalization = var_5_37

	local var_5_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("Failsafe", var_5_38)

	local var_5_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("Failsafe", var_5_39)

	local var_5_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 265
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 335
		}
	}

	var_5_24:RegisterAnimationSequence("Failsafe", var_5_40)

	local function var_5_41()
		var_5_20:AnimateSequence("Failsafe")
		var_5_22:AnimateSequence("Failsafe")
		var_5_24:AnimateSequence("Failsafe")
	end

	var_5_0._sequences.Failsafe = var_5_41

	local var_5_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("NoTitle", var_5_42)

	local var_5_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 307
		}
	}

	var_5_18:RegisterAnimationSequence("NoTitle", var_5_43)

	local var_5_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 591
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 495
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 303
		}
	}

	var_5_20:RegisterAnimationSequence("NoTitle", var_5_44)

	local var_5_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("NoTitle", var_5_45)

	local var_5_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 460
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 530
		}
	}

	var_5_24:RegisterAnimationSequence("NoTitle", var_5_46)

	local function var_5_47()
		var_5_16:AnimateSequence("NoTitle")
		var_5_18:AnimateSequence("NoTitle")
		var_5_20:AnimateSequence("NoTitle")
		var_5_22:AnimateSequence("NoTitle")
		var_5_24:AnimateSequence("NoTitle")
	end

	var_5_0._sequences.NoTitle = var_5_47

	local var_5_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 330
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		}
	}

	var_5_20:RegisterAnimationSequence("ARNoTitle", var_5_48)

	local var_5_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		}
	}

	var_5_22:RegisterAnimationSequence("ARNoTitle", var_5_49)

	local var_5_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 479
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 549
		}
	}

	var_5_24:RegisterAnimationSequence("ARNoTitle", var_5_50)

	local function var_5_51()
		var_5_20:AnimateSequence("ARNoTitle")
		var_5_22:AnimateSequence("ARNoTitle")
		var_5_24:AnimateSequence("ARNoTitle")
	end

	var_5_0._sequences.ARNoTitle = var_5_51

	local var_5_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ShowLocalizationNoTitle", var_5_52)

	local var_5_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 307
		}
	}

	var_5_18:RegisterAnimationSequence("ShowLocalizationNoTitle", var_5_53)

	local var_5_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 591
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 517
		}
	}

	var_5_20:RegisterAnimationSequence("ShowLocalizationNoTitle", var_5_54)

	local var_5_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("ShowLocalizationNoTitle", var_5_55)

	local var_5_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 482
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 552
		}
	}

	var_5_24:RegisterAnimationSequence("ShowLocalizationNoTitle", var_5_56)

	local function var_5_57()
		var_5_16:AnimateSequence("ShowLocalizationNoTitle")
		var_5_18:AnimateSequence("ShowLocalizationNoTitle")
		var_5_20:AnimateSequence("ShowLocalizationNoTitle")
		var_5_22:AnimateSequence("ShowLocalizationNoTitle")
		var_5_24:AnimateSequence("ShowLocalizationNoTitle")
	end

	var_5_0._sequences.ShowLocalizationNoTitle = var_5_57

	var_0_5(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CRMLayoutBundle", CRMLayoutBundle)
LockTable(_M)
