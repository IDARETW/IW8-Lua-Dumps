module(..., package.seeall)

local var_0_0 = 12

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, arg_1_8)
	if arg_1_2.isClassified then
		local var_1_0 = Engine.CBBHFCGDIC("CAS/CLASSIFIED")

		arg_1_0.Name:setText(var_1_0)
		arg_1_0.Desc:setText(var_1_0)
	else
		arg_1_0.Name:setText(Engine.CBBHFCGDIC(arg_1_2.name))

		local var_1_1 = arg_1_2.desc

		if arg_1_8 > WEAPON.baseVariant then
			local var_1_2 = ATTACHMENT.GetOverrideDesc(arg_1_2.baseRef, arg_1_4.weapon, arg_1_4.variantID)

			var_1_1 = var_1_2 and #var_1_2 > 0 and var_1_2 or var_1_1
		end

		if not Engine.CIDEADAABH() and ATTACHMENT.IsDismembermentEnabled(arg_1_2.ref) then
			arg_1_0.Desc:setText(Engine.CBBHFCGDIC(var_1_1) .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMEMBERMENT_REGION_LOCK_WARNING"))
		else
			arg_1_0.Desc:setText(Engine.CBBHFCGDIC(var_1_1))
		end
	end

	arg_1_0.WeaponAttributes:Setup(arg_1_5, nil, arg_1_4, arg_1_3)

	local var_1_3 = arg_1_2.isClassified and {} or ATTACHMENT.GetModifierInfo(arg_1_2.ref)

	arg_1_0.ModifiersList:SetupMods(var_1_3)

	local var_1_4 = GUNSMITH.IsAttachVariantCategoryBlacklisted(arg_1_4.weapon, ATTACHMENT.GetCategory(arg_1_2.ref))
	local var_1_5 = ATTACHMENT.AreVariantsEnabled() and not var_1_4 and arg_1_8 > WEAPON.baseVariant and arg_1_2.unlocked and Engine.DDJFBBJAIG() and Engine.CJJAFGIFAC(arg_1_1)
	local var_1_6 = arg_1_2.unlocked

	if arg_1_3 then
		ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
		ACTIONS.AnimateSequence(arg_1_0, "EquippedorBlocked")
	end

	arg_1_0.EquippedWidget:SetAlpha(arg_1_3 and 1 or 0)

	for iter_1_0 = 1, #arg_1_0._optionalMessageWidgets do
		arg_1_0._optionalMessageWidgets[iter_1_0]:SetAlpha(0)
		arg_1_0.OptionalMessages:RemoveElement(arg_1_0._optionalMessageWidgets[iter_1_0])
	end

	arg_1_0._optionalMessageWidgets = {}

	local var_1_7 = #arg_1_2.gunsmithAttach.challengeID > 0

	if not var_1_6 then
		arg_1_0.UnlockRequirements:Setup(arg_1_2.gunsmithAttach)
		table.insert(arg_1_0._optionalMessageWidgets, arg_1_0.UnlockRequirements)

		if var_1_7 then
			arg_1_0.UnlockRequirements:SetupChallenge(arg_1_2.gunsmithAttach)
		end
	end

	local var_1_8 = false

	if var_1_7 and var_1_6 then
		ACTIONS.AnimateSequence(arg_1_0.UnlockRequirements, "Challenge")
	elseif LAYOUT.GetElementHeight(arg_1_0.UnlockRequirements.UnlockCriteria) < LAYOUT.GetTextHeightWithWrapping(arg_1_0.UnlockRequirements.UnlockCriteria, arg_1_0.UnlockRequirements.UnlockCriteria:getText()) then
		ACTIONS.AnimateSequence(arg_1_0.UnlockRequirements, "UnlockTwoLines")
		arg_1_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(2)

		var_1_8 = true
	else
		ACTIONS.AnimateSequence(arg_1_0.UnlockRequirements, "Unlock")
		arg_1_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(1)
	end

	if var_1_5 then
		table.insert(arg_1_0._optionalMessageWidgets, arg_1_0.BlueprintTag)
	end

	if arg_1_7 then
		table.insert(arg_1_0._optionalMessageWidgets, arg_1_0.BlockWarning)
		arg_1_0.BlockWarning:setText(GUNSMITH.GetBlockedCategoryWarning(arg_1_4, arg_1_7))
	end

	arg_1_0._cdlWarningHeight = 0

	if MatchRules.EBCADBGDHB(arg_1_2.baseRef, arg_1_4.weapon) and MLG.IsCDLActive(arg_1_1) then
		ACTIONS.AnimateSequence(arg_1_0, "CDL")

		arg_1_0._cdlWarningHeight = LAYOUT.GetElementHeight(arg_1_0.CDLRestricted) + var_0_0

		arg_1_0.CDLRestricted:SetAlpha(1)
	else
		if CONDITIONS.IsSplitscreen(arg_1_0) and CONDITIONS.InGame(arg_1_0) then
			ACTIONS.AnimateSequence(arg_1_0, "Splitscreen")
		else
			ACTIONS.AnimateSequence(arg_1_0, "StandardLayout")
		end

		arg_1_0.CDLRestricted:SetAlpha(0)
	end

	local var_1_9 = 0

	for iter_1_1 = 1, #arg_1_0._optionalMessageWidgets do
		local var_1_10 = 0

		if arg_1_0._optionalMessageWidgets[iter_1_1] == arg_1_0.UnlockRequirements or arg_1_0._optionalMessageWidgets[iter_1_1] == arg_1_0.BlueprintTag then
			local var_1_11, var_1_12, var_1_13, var_1_14 = arg_1_0._optionalMessageWidgets[iter_1_1]:getLocalRect()

			var_1_10 = var_1_14 - var_1_12
		else
			var_1_10 = LAYOUT.GetTextHeightWithWrapping(arg_1_0._optionalMessageWidgets[iter_1_1], arg_1_0._optionalMessageWidgets[iter_1_1]:getText())
		end

		var_1_9 = var_1_9 + var_1_10 + (var_1_8 and 20 * _1080p or 0)

		local var_1_15, var_1_16, var_1_17, var_1_18 = arg_1_0.OptionalMessages:getLocalRect()

		arg_1_0.OptionalMessages:SetBottom(var_1_16 + var_1_9)
		arg_1_0.OptionalMessages:addElement(arg_1_0._optionalMessageWidgets[iter_1_1])
		arg_1_0._optionalMessageWidgets[iter_1_1]:SetAlpha(1, 200)

		arg_1_0._prevOptionalMessageWidgets = arg_1_0._optionalMessageWidgets
	end

	local var_1_19 = #arg_1_0._optionalMessageWidgets > 0 and var_0_0 * #arg_1_0._optionalMessageWidgets * _1080p or 0

	arg_1_0.Background:SetBottom(arg_1_0._bgBot + var_1_9 + var_1_19 + arg_1_0._cdlWarningHeight, #arg_1_0._optionalMessageWidgets > 0 and 150 or 100)

	if IsLanguageFrench() then
		ACTIONS.AnimateSequence(arg_1_0, "FR")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	local var_1_20 = arg_1_2.gunsmithAttach.lootID

	if arg_1_0.NewItemNotification and not arg_1_3 then
		arg_1_0.NewItemNotification:UpdateBreadcrumbByID(arg_1_1, var_1_20, true)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Name)
	assert(arg_2_0.Desc)
	assert(arg_2_0.WeaponAttributes)
	assert(arg_2_0.EquippedWidget)

	arg_2_0.Setup = var_0_1

	arg_2_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	ACTIONS.AnimateSequence(arg_2_0.WeaponAttributes, "Gunsmith")

	local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0.Background:getLocalRect()

	arg_2_0._bgBot = var_2_3
	arg_2_0._optionalMessageWidgets = {}
	arg_2_0._prevOptionalMessageWidgets = nil

	local var_2_4 = LUI.UIVerticalStackedLayout.new()

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 575, _1080p * 585)
	var_2_4:SetSpacing(var_0_0 * _1080p)

	arg_2_0.OptionalMessages = var_2_4

	arg_2_0:addElement(arg_2_0.OptionalMessages)

	local var_2_5 = MenuBuilder.BuildRegisteredType("UnlockRequirements", {
		controllerIndex = arg_2_1
	})

	var_2_5.id = "UnlockRequirements"

	var_2_5:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_5:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -28, _1080p * 0, _1080p * 0, _1080p * 130)

	arg_2_0.UnlockRequirements = var_2_5

	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "ChooseAppearance"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.description)
	var_2_6:SetAlpha(0, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("CAS/CHOOSE_APPEARANCE"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(true)
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetTintFontIcons(true)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 356, _1080p * 0, _1080p * 24)

	arg_2_0.ChooseAppearance = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = arg_2_1
	})

	var_2_8.id = "BlueprintTag"

	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 300, _1080p * 0, _1080p * 30)

	arg_2_0.BlueprintTag = var_2_8

	arg_2_0.BlueprintTag:SetBlueprintText(Engine.CBBHFCGDIC("CAS/BLUEPRINT_ATTACHMENT"))

	local var_2_9 = LUI.UIText.new()

	var_2_9.id = "BlockWarning"

	var_2_9:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_9:SetAlpha(0, 0)
	var_2_9:setText(Engine.CBBHFCGDIC("CAS/BLOCKED_CATEGORY_WARNING"), 0)
	var_2_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_9:SetWordWrap(true)
	var_2_9:SetAlignment(LUI.Alignment.Left)
	var_2_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 356, _1080p * 0, _1080p * 20)

	arg_2_0.BlockWarning = var_2_9

	if not IsLanguageArabic() and NewItemNotification then
		arg_2_0.NewItemNotification:SetupLeftAlignment()
	end
end

function GunsmithDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 650 * _1080p)

	var_3_0.id = "GunsmithDetails"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 571)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Name"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_6:SetStartupDelay(1000)
	var_3_6:SetLineHoldTime(400)
	var_3_6:SetAnimMoveTime(2000)
	var_3_6:SetAnimMoveSpeed(50)
	var_3_6:SetEndDelay(1000)
	var_3_6:SetCrossfadeTime(400)
	var_3_6:SetFadeInTime(300)
	var_3_6:SetFadeOutTime(300)
	var_3_6:SetMaxVisibleLines(1)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 28, _1080p * -28, _1080p * 14, _1080p * 50)
	var_3_0:addElement(var_3_6)

	var_3_0.Name = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Desc"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetTintFontIcons(true)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(500)
	var_3_8:SetAnimMoveTime(250)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(2000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(4)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 384, _1080p * 50, _1080p * 70)
	var_3_0:addElement(var_3_8)

	var_3_0.Desc = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("GunsmithDetailsModList", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ModifiersList"

	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 30, _1080p * -23, _1080p * 168, _1080p * 415)
	var_3_0:addElement(var_3_10)

	var_3_0.ModifiersList = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "WeaponAttributes"

	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -209, _1080p * 225, _1080p * 426, _1080p * 554)
	var_3_0:addElement(var_3_12)

	var_3_0.WeaponAttributes = var_3_12

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "EquippedWidget"

	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 164, _1080p * 138, _1080p * 168)
	var_3_0:addElement(var_3_14)

	var_3_0.EquippedWidget = var_3_14

	local var_3_15

	if not CONDITIONS.IsSplitscreen(var_3_0) then
		var_3_15 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
			controllerIndex = var_3_1
		})
		var_3_15.id = "NewItemNotification"

		var_3_15:SetAlpha(0, 0)
		var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 106, _1080p * 138, _1080p * 168)
		var_3_0:addElement(var_3_15)

		var_3_0.NewItemNotification = var_3_15
	end

	local var_3_16
	local var_3_17 = MenuBuilder.BuildRegisteredType("CDLRestricted", {
		controllerIndex = var_3_1
	})

	var_3_17.id = "CDLRestricted"

	var_3_17:SetAlpha(0, 0)
	var_3_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 172, _1080p * 422, _1080p * 138, _1080p * 168)
	var_3_0:addElement(var_3_17)

	var_3_0.CDLRestricted = var_3_17

	local var_3_18

	if not CONDITIONS.IsSplitscreen(var_3_0) then
		local var_3_19 = {}

		var_3_15:RegisterAnimationSequence("DefaultSequence", var_3_19)
	end

	local function var_3_20()
		if not CONDITIONS.IsSplitscreen(var_3_0) then
			var_3_15:AnimateSequence("DefaultSequence")
		end
	end

	var_3_0._sequences.DefaultSequence = var_3_20

	local var_3_21
	local var_3_22 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_3_4:RegisterAnimationSequence("EquippedorBlocked", var_3_22)

	local function var_3_23()
		var_3_4:AnimateSequence("EquippedorBlocked")
	end

	var_3_0._sequences.EquippedorBlocked = var_3_23

	local var_3_24
	local var_3_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 711
		}
	}

	var_3_4:RegisterAnimationSequence("Locked", var_3_25)

	local function var_3_26()
		var_3_4:AnimateSequence("Locked")
	end

	var_3_0._sequences.Locked = var_3_26

	local var_3_27
	local var_3_28 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_3_4:RegisterAnimationSequence("Unlocked", var_3_28)

	local function var_3_29()
		var_3_4:AnimateSequence("Unlocked")
	end

	var_3_0._sequences.Unlocked = var_3_29

	local var_3_30
	local var_3_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 558
		}
	}

	var_3_4:RegisterAnimationSequence("EquippedChooseAppearance", var_3_31)

	local function var_3_32()
		var_3_4:AnimateSequence("EquippedChooseAppearance")
	end

	var_3_0._sequences.EquippedChooseAppearance = var_3_32

	local var_3_33
	local var_3_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 70
		}
	}

	var_3_8:RegisterAnimationSequence("NotEquipped", var_3_34)

	local function var_3_35()
		var_3_8:AnimateSequence("NotEquipped")
	end

	var_3_0._sequences.NotEquipped = var_3_35

	local var_3_36
	local var_3_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 47
		}
	}

	var_3_6:RegisterAnimationSequence("FR", var_3_37)

	local var_3_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		}
	}

	var_3_8:RegisterAnimationSequence("FR", var_3_38)

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 414
		}
	}

	var_3_10:RegisterAnimationSequence("FR", var_3_39)

	local var_3_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 137
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 167
		}
	}

	var_3_14:RegisterAnimationSequence("FR", var_3_40)

	local function var_3_41()
		var_3_6:AnimateSequence("FR")
		var_3_8:AnimateSequence("FR")
		var_3_10:AnimateSequence("FR")
		var_3_14:AnimateSequence("FR")
	end

	var_3_0._sequences.FR = var_3_41

	local var_3_42
	local var_3_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 53
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_43)

	local var_3_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		}
	}

	var_3_8:RegisterAnimationSequence("AR", var_3_44)

	local function var_3_45()
		var_3_6:AnimateSequence("AR")
		var_3_8:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_45

	local var_3_46
	local var_3_47 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 754
		}
	}

	var_3_4:RegisterAnimationSequence("Challenge", var_3_47)

	local function var_3_48()
		var_3_4:AnimateSequence("Challenge")
	end

	var_3_0._sequences.Challenge = var_3_48

	local var_3_49
	local var_3_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 449
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 331
		}
	}

	var_3_4:RegisterAnimationSequence("Splitscreen", var_3_50)

	local var_3_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 449
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 393
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 264
		}
	}

	var_3_10:RegisterAnimationSequence("Splitscreen", var_3_51)

	local var_3_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -196
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 222
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 306
		}
	}

	var_3_12:RegisterAnimationSequence("Splitscreen", var_3_52)

	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 134
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 164
		}
	}

	var_3_14:RegisterAnimationSequence("Splitscreen", var_3_53)

	if not CONDITIONS.IsSplitscreen(var_3_0) then
		local var_3_54 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 134
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 164
			}
		}

		var_3_15:RegisterAnimationSequence("Splitscreen", var_3_54)
	end

	local function var_3_55()
		var_3_4:AnimateSequence("Splitscreen")
		var_3_10:AnimateSequence("Splitscreen")
		var_3_12:AnimateSequence("Splitscreen")
		var_3_14:AnimateSequence("Splitscreen")

		if not CONDITIONS.IsSplitscreen(var_3_0) then
			var_3_15:AnimateSequence("Splitscreen")
		end
	end

	var_3_0._sequences.Splitscreen = var_3_55

	local var_3_56
	local var_3_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 459
		}
	}

	var_3_10:RegisterAnimationSequence("CDL", var_3_57)

	local var_3_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 468
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 596
		}
	}

	var_3_12:RegisterAnimationSequence("CDL", var_3_58)

	local var_3_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 182
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 278
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 212
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("CDL", var_3_59)

	local function var_3_60()
		var_3_10:AnimateSequence("CDL")
		var_3_12:AnimateSequence("CDL")
		var_3_17:AnimateSequence("CDL")
	end

	var_3_0._sequences.CDL = var_3_60

	local var_3_61
	local var_3_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 168
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 415
		}
	}

	var_3_10:RegisterAnimationSequence("StandardLayout", var_3_62)

	local var_3_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 426
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 554
		}
	}

	var_3_12:RegisterAnimationSequence("StandardLayout", var_3_63)

	local var_3_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 168
		}
	}

	var_3_17:RegisterAnimationSequence("StandardLayout", var_3_64)

	local function var_3_65()
		var_3_10:AnimateSequence("StandardLayout")
		var_3_12:AnimateSequence("StandardLayout")
		var_3_17:AnimateSequence("StandardLayout")
	end

	var_3_0._sequences.StandardLayout = var_3_65

	var_0_2(var_3_0, var_3_1, arg_3_1)
	ACTIONS.AnimateSequence(var_3_0, "DefaultSequence")

	return var_3_0
end

MenuBuilder.registerType("GunsmithDetails", GunsmithDetails)
LockTable(_M)
