module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.PerkName1)
	assert(arg_1_0.PerkName2)
	assert(arg_1_0.PerkName3)
	assert(arg_1_0.PerkIcon1)
	assert(arg_1_0.PerkIcon2)
	assert(arg_1_0.PerkIcon3)

	local var_1_0 = Loot.DAFIICDBFJ(arg_1_1, LOOT.typeNames[LOOT.itemTypes.PERK])

	arg_1_0.NewItemNotification:UpdateAlpha(var_1_0 and 1 or 0, 0, true)

	if arg_1_2 then
		local var_1_1 = {}
		local var_1_2 = {}
		local var_1_3 = CONDITIONS.IsBRGameType(arg_1_0) and {
			arg_1_0.BRWarning1,
			arg_1_0.BRWarning2,
			arg_1_0.BRWarning3
		} or nil
		local var_1_4 = {
			"RestrictionOnPerk1",
			"RestrictionOnPerk2",
			"RestrictionOnPerk3",
			"RestrictionOnPerk4",
			"RestrictionOnPerk5",
			"RestrictionOnPerk6"
		}

		if #arg_1_2 == 3 or CONDITIONS.IsThirdGameMode() or CONDITIONS.InGameAndBR() then
			var_1_1 = {
				arg_1_0.PerkName1,
				arg_1_0.PerkName2,
				arg_1_0.PerkName3
			}
			var_1_2 = {
				arg_1_0.PerkIcon1,
				arg_1_0.PerkIcon2,
				arg_1_0.PerkIcon3
			}

			ACTIONS.AnimateSequence(arg_1_0, "NoSpecialist")
		elseif #arg_1_2 == 6 then
			var_1_1 = {
				arg_1_0.PerkName1,
				arg_1_0.PerkName2,
				arg_1_0.PerkName3,
				arg_1_0.SpecialPerkName1,
				arg_1_0.SpecialPerkName2,
				arg_1_0.SpecialPerkName3
			}
			var_1_2 = {
				arg_1_0.PerkIcon1,
				arg_1_0.PerkIcon2,
				arg_1_0.PerkIcon3,
				arg_1_0.SpecialPerkIcon1,
				arg_1_0.SpecialPerkIcon2,
				arg_1_0.SpecialPerkIcon3
			}

			ACTIONS.AnimateSequence(arg_1_0, "Specialist")
		end

		local var_1_5 = LOOT.itemTypes.PERK

		for iter_1_0 = 1, #var_1_1 do
			var_1_1[iter_1_0]:setText(LOOT.GetItemName(var_1_5, arg_1_2[iter_1_0]))
			var_1_2[iter_1_0]:setImage(RegisterMaterial(LOOT.GetItemImage(var_1_5, arg_1_2[iter_1_0])))

			if IsLanguageArabic() then
				local var_1_6, var_1_7, var_1_8, var_1_9 = var_1_1[iter_1_0]:getLocalRect()
				local var_1_10 = var_1_9 + 6

				var_1_1[iter_1_0]:SetBottom(var_1_10)
			end

			local var_1_11 = arg_1_2[iter_1_0]

			if CONDITIONS.IsBRGameType(arg_1_0) and var_1_3 then
				local var_1_12 = var_1_3[iter_1_0]

				if var_1_12 then
					var_1_12:SetShowWarningIcon(Cac.GetIsPerkDisabledForBR(var_1_11))
				end
			end

			if Restrictions.IsPerkRestricted(arg_1_2[iter_1_0]) then
				ACTIONS.AnimateSequence(arg_1_0, var_1_4[iter_1_0])
			end
		end

		local var_1_13 = Engine.CBBHFCGDIC("LUA_MENU/TITLE_PERKS")

		arg_1_0.Title:setText(var_1_13)
	end

	if arg_1_0.RarityColorBackground then
		if not Engine.DDJFBBJAIG() and CONDITIONS.IsBRGameType(arg_1_0) then
			arg_1_0.RarityColorBackground:ShowRarityColor(BRLOOT.itemRarities.LEGENDARY)
		else
			arg_1_0.RarityColorBackground:HideRarityColor()
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupButton = var_0_0

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		if not arg_2_0._isInPreviewState then
			ACTIONS.AnimateSequence(arg_4_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
		end
	end)
	THEMES.ApplyRandomMaskRotation(arg_2_0, {
		elementToMask = arg_2_0.background
	})

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "WZWipSetup")
	end
end

function LoadoutItemPerkButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 116 * _1080p)

	var_5_0.id = "LoadoutItemPerkButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0, 0)
	var_5_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "ButtonDarkener"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.ButtonDarkener = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "background"

	var_5_8:SetAlpha(0.8, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.background = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "RarityColorBackground"

	var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_10)

	var_5_0.RarityColorBackground = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "PerkName3"

	var_5_12:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_12:SetAlignment(LUI.Alignment.Center)
	var_5_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_12:SetStartupDelay(1000)
	var_5_12:SetLineHoldTime(400)
	var_5_12:SetAnimMoveTime(150)
	var_5_12:SetAnimMoveSpeed(50)
	var_5_12:SetEndDelay(1000)
	var_5_12:SetCrossfadeTime(400)
	var_5_12:SetFadeInTime(300)
	var_5_12:SetFadeOutTime(300)
	var_5_12:SetMaxVisibleLines(1)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 366, _1080p * 87, _1080p * 105)
	var_5_0:addElement(var_5_12)

	var_5_0.PerkName3 = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "PerkName2"

	var_5_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_14:setText("", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_14:SetAlignment(LUI.Alignment.Center)
	var_5_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_14:SetStartupDelay(1000)
	var_5_14:SetLineHoldTime(400)
	var_5_14:SetAnimMoveTime(150)
	var_5_14:SetAnimMoveSpeed(50)
	var_5_14:SetEndDelay(1000)
	var_5_14:SetCrossfadeTime(400)
	var_5_14:SetFadeInTime(300)
	var_5_14:SetFadeOutTime(300)
	var_5_14:SetMaxVisibleLines(1)
	var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 152, _1080p * 252, _1080p * 87, _1080p * 105)
	var_5_0:addElement(var_5_14)

	var_5_0.PerkName2 = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIStyledText.new()

	var_5_16.id = "PerkName1"

	var_5_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Center)
	var_5_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_16:SetStartupDelay(1000)
	var_5_16:SetLineHoldTime(400)
	var_5_16:SetAnimMoveTime(150)
	var_5_16:SetAnimMoveSpeed(50)
	var_5_16:SetEndDelay(1000)
	var_5_16:SetCrossfadeTime(400)
	var_5_16:SetFadeInTime(300)
	var_5_16:SetFadeOutTime(300)
	var_5_16:SetMaxVisibleLines(1)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 138, _1080p * 87, _1080p * 105)
	var_5_0:addElement(var_5_16)

	var_5_0.PerkName1 = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "PerkIcon3"

	var_5_18:SetRGBFromTable(SWATCHES.CAC.perkSlotThreeDisabled, 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 338, _1080p * 41, _1080p * 86)
	var_5_0:addElement(var_5_18)

	var_5_0.PerkIcon3 = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "PerkIcon2"

	var_5_20:SetRGBFromTable(SWATCHES.CAC.perkSlotTwoDisabled, 0)
	var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 180, _1080p * 224, _1080p * 41, _1080p * 86)
	var_5_0:addElement(var_5_20)

	var_5_0.PerkIcon2 = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIImage.new()

	var_5_22.id = "PerkIcon1"

	var_5_22:SetRGBFromTable(SWATCHES.CAC.perkSlotOneDisabled, 0)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 110, _1080p * 41, _1080p * 86)
	var_5_0:addElement(var_5_22)

	var_5_0.PerkIcon1 = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIText.new()

	var_5_24.id = "Title"

	var_5_24:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_24:SetAlpha(0.8, 0)
	var_5_24:setText("", 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Left)
	var_5_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 374, _1080p * 10, _1080p * 34)
	var_5_0:addElement(var_5_24)

	var_5_0.Title = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIStyledText.new()

	var_5_26.id = "SpecialPerkName3"

	var_5_26:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_26:setText("", 0)
	var_5_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_26:SetAlignment(LUI.Alignment.Center)
	var_5_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_26:SetStartupDelay(1000)
	var_5_26:SetLineHoldTime(400)
	var_5_26:SetAnimMoveTime(150)
	var_5_26:SetAnimMoveSpeed(50)
	var_5_26:SetEndDelay(1000)
	var_5_26:SetCrossfadeTime(400)
	var_5_26:SetFadeInTime(300)
	var_5_26:SetFadeOutTime(300)
	var_5_26:SetMaxVisibleLines(1)
	var_5_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 366, _1080p * 162, _1080p * 180)
	var_5_0:addElement(var_5_26)

	var_5_0.SpecialPerkName3 = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIStyledText.new()

	var_5_28.id = "SpecialPerkName2"

	var_5_28:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_28:setText("", 0)
	var_5_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_28:SetAlignment(LUI.Alignment.Center)
	var_5_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_28:SetStartupDelay(1000)
	var_5_28:SetLineHoldTime(400)
	var_5_28:SetAnimMoveTime(150)
	var_5_28:SetAnimMoveSpeed(50)
	var_5_28:SetEndDelay(1000)
	var_5_28:SetCrossfadeTime(400)
	var_5_28:SetFadeInTime(300)
	var_5_28:SetFadeOutTime(300)
	var_5_28:SetMaxVisibleLines(1)
	var_5_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 152, _1080p * 252, _1080p * 162, _1080p * 180)
	var_5_0:addElement(var_5_28)

	var_5_0.SpecialPerkName2 = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIStyledText.new()

	var_5_30.id = "SpecialPerkName1"

	var_5_30:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_30:setText("", 0)
	var_5_30:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_30:SetAlignment(LUI.Alignment.Center)
	var_5_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_30:SetStartupDelay(1000)
	var_5_30:SetLineHoldTime(400)
	var_5_30:SetAnimMoveTime(150)
	var_5_30:SetAnimMoveSpeed(50)
	var_5_30:SetEndDelay(1000)
	var_5_30:SetCrossfadeTime(400)
	var_5_30:SetFadeInTime(300)
	var_5_30:SetFadeOutTime(300)
	var_5_30:SetMaxVisibleLines(1)
	var_5_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 138, _1080p * 162, _1080p * 180)
	var_5_0:addElement(var_5_30)

	var_5_0.SpecialPerkName1 = var_5_30

	local var_5_31
	local var_5_32 = LUI.UIImage.new()

	var_5_32.id = "SpecialPerkIcon3"

	var_5_32:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_5_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 338, _1080p * 116, _1080p * 161)
	var_5_0:addElement(var_5_32)

	var_5_0.SpecialPerkIcon3 = var_5_32

	local var_5_33
	local var_5_34 = LUI.UIImage.new()

	var_5_34.id = "SpecialPerkIcon2"

	var_5_34:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_5_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 180, _1080p * 224, _1080p * 116, _1080p * 161)
	var_5_0:addElement(var_5_34)

	var_5_0.SpecialPerkIcon2 = var_5_34

	local var_5_35
	local var_5_36 = LUI.UIImage.new()

	var_5_36.id = "SpecialPerkIcon1"

	var_5_36:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_5_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 110, _1080p * 116, _1080p * 161)
	var_5_0:addElement(var_5_36)

	var_5_0.SpecialPerkIcon1 = var_5_36

	local var_5_37
	local var_5_38 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_5_1
	})

	var_5_38.id = "NewItemNotification"

	var_5_38:SetAlpha(0, 0)
	var_5_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_5_0:addElement(var_5_38)

	var_5_0.NewItemNotification = var_5_38

	local var_5_39

	if CONDITIONS.IsBRGameType() then
		local var_5_40 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_5_1
		})

		var_5_40.id = "BRWarning3"

		var_5_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 345, _1080p * 366, _1080p * 30, _1080p * 52)
		var_5_0:addElement(var_5_40)

		var_5_0.BRWarning3 = var_5_40
	end

	local var_5_41

	if CONDITIONS.IsBRGameType() then
		local var_5_42 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_5_1
		})

		var_5_42.id = "BRWarning2"

		var_5_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 252, _1080p * 30, _1080p * 52)
		var_5_0:addElement(var_5_42)

		var_5_0.BRWarning2 = var_5_42
	end

	local var_5_43

	if CONDITIONS.IsBRGameType() then
		local var_5_44 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_5_1
		})

		var_5_44.id = "BRWarning1"

		var_5_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 138, _1080p * 30, _1080p * 52)
		var_5_0:addElement(var_5_44)

		var_5_0.BRWarning1 = var_5_44
	end

	local var_5_45
	local var_5_46 = LUI.UIImage.new()

	var_5_46.id = "RestrictionWarning1"

	var_5_46:SetAlpha(0, 0)
	var_5_46:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_46:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -291, _1080p * -261, _1080p * 24, _1080p * 54)
	var_5_0:addElement(var_5_46)

	var_5_0.RestrictionWarning1 = var_5_46

	local var_5_47
	local var_5_48 = LUI.UIImage.new()

	var_5_48.id = "RestrictionWarning2"

	var_5_48:SetAlpha(0, 0)
	var_5_48:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_48:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -177, _1080p * -147, _1080p * 24, _1080p * 54)
	var_5_0:addElement(var_5_48)

	var_5_0.RestrictionWarning2 = var_5_48

	local var_5_49
	local var_5_50 = LUI.UIImage.new()

	var_5_50.id = "RestrictionWarning3"

	var_5_50:SetAlpha(0, 0)
	var_5_50:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_50:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -63, _1080p * -33, _1080p * 24, _1080p * 54)
	var_5_0:addElement(var_5_50)

	var_5_0.RestrictionWarning3 = var_5_50

	local var_5_51
	local var_5_52 = LUI.UIImage.new()

	var_5_52.id = "RestrictionWarning4"

	var_5_52:SetAlpha(0, 0)
	var_5_52:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_52:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -291, _1080p * -261, _1080p * 98, _1080p * 128)
	var_5_0:addElement(var_5_52)

	var_5_0.RestrictionWarning4 = var_5_52

	local var_5_53
	local var_5_54 = LUI.UIImage.new()

	var_5_54.id = "RestrictionWarning5"

	var_5_54:SetAlpha(0, 0)
	var_5_54:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_54:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -177, _1080p * -147, _1080p * 98, _1080p * 128)
	var_5_0:addElement(var_5_54)

	var_5_0.RestrictionWarning5 = var_5_54

	local var_5_55
	local var_5_56 = LUI.UIImage.new()

	var_5_56.id = "RestrictionWarning6"

	var_5_56:SetAlpha(0, 0)
	var_5_56:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_56:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -63, _1080p * -33, _1080p * 98, _1080p * 128)
	var_5_0:addElement(var_5_56)

	var_5_0.RestrictionWarning6 = var_5_56

	local var_5_57

	if CONDITIONS.IsVanguardRevealed() then
		var_5_57 = LUI.UIImage.new()
		var_5_57.id = "Mask"

		var_5_57:SetAlpha(0, 0)
		var_5_57:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_5_0:addElement(var_5_57)

		var_5_0.Mask = var_5_57
	end

	local function var_5_58()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_58

	local var_5_59
	local var_5_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_60)

	local var_5_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_61)

	local var_5_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_62)

	local var_5_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_63)

	local var_5_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotThree
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonOver", var_5_64)

	local var_5_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotTwo
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonOver", var_5_65)

	local var_5_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotOne
		}
	}

	var_5_22:RegisterAnimationSequence("ButtonOver", var_5_66)

	local var_5_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("ButtonOver", var_5_67)

	local var_5_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_26:RegisterAnimationSequence("ButtonOver", var_5_68)

	local var_5_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_28:RegisterAnimationSequence("ButtonOver", var_5_69)

	local var_5_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_30:RegisterAnimationSequence("ButtonOver", var_5_70)

	local var_5_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_5_32:RegisterAnimationSequence("ButtonOver", var_5_71)

	local var_5_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_5_34:RegisterAnimationSequence("ButtonOver", var_5_72)

	local var_5_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_5_36:RegisterAnimationSequence("ButtonOver", var_5_73)

	local function var_5_74()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
		var_5_18:AnimateSequence("ButtonOver")
		var_5_20:AnimateSequence("ButtonOver")
		var_5_22:AnimateSequence("ButtonOver")
		var_5_24:AnimateSequence("ButtonOver")
		var_5_26:AnimateSequence("ButtonOver")
		var_5_28:AnimateSequence("ButtonOver")
		var_5_30:AnimateSequence("ButtonOver")
		var_5_32:AnimateSequence("ButtonOver")
		var_5_34:AnimateSequence("ButtonOver")
		var_5_36:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_74

	local var_5_75
	local var_5_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_76)

	local var_5_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_77)

	local var_5_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_78)

	local var_5_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_79)

	local var_5_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotThreeDisabled
		}
	}

	var_5_18:RegisterAnimationSequence("ButtonUp", var_5_80)

	local var_5_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotTwoDisabled
		}
	}

	var_5_20:RegisterAnimationSequence("ButtonUp", var_5_81)

	local var_5_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotOneDisabled
		}
	}

	var_5_22:RegisterAnimationSequence("ButtonUp", var_5_82)

	local var_5_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_24:RegisterAnimationSequence("ButtonUp", var_5_83)

	local var_5_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_26:RegisterAnimationSequence("ButtonUp", var_5_84)

	local var_5_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_28:RegisterAnimationSequence("ButtonUp", var_5_85)

	local var_5_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_30:RegisterAnimationSequence("ButtonUp", var_5_86)

	local var_5_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_5_32:RegisterAnimationSequence("ButtonUp", var_5_87)

	local var_5_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_5_34:RegisterAnimationSequence("ButtonUp", var_5_88)

	local var_5_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_5_36:RegisterAnimationSequence("ButtonUp", var_5_89)

	local function var_5_90()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
		var_5_18:AnimateSequence("ButtonUp")
		var_5_20:AnimateSequence("ButtonUp")
		var_5_22:AnimateSequence("ButtonUp")
		var_5_24:AnimateSequence("ButtonUp")
		var_5_26:AnimateSequence("ButtonUp")
		var_5_28:AnimateSequence("ButtonUp")
		var_5_30:AnimateSequence("ButtonUp")
		var_5_32:AnimateSequence("ButtonUp")
		var_5_34:AnimateSequence("ButtonUp")
		var_5_36:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_90

	local var_5_91
	local var_5_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutEdit", var_5_92)

	local var_5_93 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutEdit", var_5_93)

	local var_5_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutEdit", var_5_94)

	local var_5_95 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_12:RegisterAnimationSequence("LoadoutEdit", var_5_95)

	local var_5_96 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_14:RegisterAnimationSequence("LoadoutEdit", var_5_96)

	local var_5_97 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_16:RegisterAnimationSequence("LoadoutEdit", var_5_97)

	local var_5_98 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_24:RegisterAnimationSequence("LoadoutEdit", var_5_98)

	local function var_5_99()
		var_5_4:AnimateSequence("LoadoutEdit")
		var_5_6:AnimateSequence("LoadoutEdit")
		var_5_8:AnimateSequence("LoadoutEdit")
		var_5_12:AnimateSequence("LoadoutEdit")
		var_5_14:AnimateSequence("LoadoutEdit")
		var_5_16:AnimateSequence("LoadoutEdit")
		var_5_24:AnimateSequence("LoadoutEdit")
	end

	var_5_0._sequences.LoadoutEdit = var_5_99

	local var_5_100
	local var_5_101 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutPreview", var_5_101)

	local var_5_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutPreview", var_5_102)

	local var_5_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutPreview", var_5_103)

	local var_5_104 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_12:RegisterAnimationSequence("LoadoutPreview", var_5_104)

	local var_5_105 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_14:RegisterAnimationSequence("LoadoutPreview", var_5_105)

	local var_5_106 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_16:RegisterAnimationSequence("LoadoutPreview", var_5_106)

	local var_5_107 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_24:RegisterAnimationSequence("LoadoutPreview", var_5_107)

	local function var_5_108()
		var_5_4:AnimateSequence("LoadoutPreview")
		var_5_6:AnimateSequence("LoadoutPreview")
		var_5_8:AnimateSequence("LoadoutPreview")
		var_5_12:AnimateSequence("LoadoutPreview")
		var_5_14:AnimateSequence("LoadoutPreview")
		var_5_16:AnimateSequence("LoadoutPreview")
		var_5_24:AnimateSequence("LoadoutPreview")
	end

	var_5_0._sequences.LoadoutPreview = var_5_108

	local var_5_109
	local var_5_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_110)

	local var_5_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		}
	}

	var_5_14:RegisterAnimationSequence("AR", var_5_111)

	local var_5_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		}
	}

	var_5_16:RegisterAnimationSequence("AR", var_5_112)

	local var_5_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_5_18:RegisterAnimationSequence("AR", var_5_113)

	local var_5_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_5_20:RegisterAnimationSequence("AR", var_5_114)

	local var_5_115 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 82
		}
	}

	var_5_22:RegisterAnimationSequence("AR", var_5_115)

	local var_5_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_5_24:RegisterAnimationSequence("AR", var_5_116)

	local var_5_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_5_26:RegisterAnimationSequence("AR", var_5_117)

	local var_5_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_5_28:RegisterAnimationSequence("AR", var_5_118)

	local var_5_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 193
		}
	}

	var_5_30:RegisterAnimationSequence("AR", var_5_119)

	local function var_5_120()
		var_5_12:AnimateSequence("AR")
		var_5_14:AnimateSequence("AR")
		var_5_16:AnimateSequence("AR")
		var_5_18:AnimateSequence("AR")
		var_5_20:AnimateSequence("AR")
		var_5_22:AnimateSequence("AR")
		var_5_24:AnimateSequence("AR")
		var_5_26:AnimateSequence("AR")
		var_5_28:AnimateSequence("AR")
		var_5_30:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_120

	local var_5_121
	local var_5_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_5_12:RegisterAnimationSequence("NoSpecialist", var_5_122)

	local var_5_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_5_14:RegisterAnimationSequence("NoSpecialist", var_5_123)

	local var_5_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_5_16:RegisterAnimationSequence("NoSpecialist", var_5_124)

	local var_5_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_18:RegisterAnimationSequence("NoSpecialist", var_5_125)

	local var_5_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_20:RegisterAnimationSequence("NoSpecialist", var_5_126)

	local var_5_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 41
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 86
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_22:RegisterAnimationSequence("NoSpecialist", var_5_127)

	local var_5_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_5_26:RegisterAnimationSequence("NoSpecialist", var_5_128)

	local var_5_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_5_28:RegisterAnimationSequence("NoSpecialist", var_5_129)

	local var_5_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 162
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 180
		}
	}

	var_5_30:RegisterAnimationSequence("NoSpecialist", var_5_130)

	local var_5_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_32:RegisterAnimationSequence("NoSpecialist", var_5_131)

	local var_5_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_34:RegisterAnimationSequence("NoSpecialist", var_5_132)

	local var_5_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_36:RegisterAnimationSequence("NoSpecialist", var_5_133)

	local function var_5_134()
		var_5_12:AnimateSequence("NoSpecialist")
		var_5_14:AnimateSequence("NoSpecialist")
		var_5_16:AnimateSequence("NoSpecialist")
		var_5_18:AnimateSequence("NoSpecialist")
		var_5_20:AnimateSequence("NoSpecialist")
		var_5_22:AnimateSequence("NoSpecialist")
		var_5_26:AnimateSequence("NoSpecialist")
		var_5_28:AnimateSequence("NoSpecialist")
		var_5_30:AnimateSequence("NoSpecialist")
		var_5_32:AnimateSequence("NoSpecialist")
		var_5_34:AnimateSequence("NoSpecialist")
		var_5_36:AnimateSequence("NoSpecialist")
	end

	var_5_0._sequences.NoSpecialist = var_5_134

	local var_5_135
	local var_5_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_5_12:RegisterAnimationSequence("Specialist", var_5_136)

	local var_5_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_5_14:RegisterAnimationSequence("Specialist", var_5_137)

	local var_5_138 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 98
		}
	}

	var_5_16:RegisterAnimationSequence("Specialist", var_5_138)

	local var_5_139 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_18:RegisterAnimationSequence("Specialist", var_5_139)

	local var_5_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_20:RegisterAnimationSequence("Specialist", var_5_140)

	local var_5_141 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 79
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_22:RegisterAnimationSequence("Specialist", var_5_141)

	local var_5_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		}
	}

	var_5_26:RegisterAnimationSequence("Specialist", var_5_142)

	local var_5_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		}
	}

	var_5_28:RegisterAnimationSequence("Specialist", var_5_143)

	local var_5_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 147
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 165
		}
	}

	var_5_30:RegisterAnimationSequence("Specialist", var_5_144)

	local var_5_145 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_32:RegisterAnimationSequence("Specialist", var_5_145)

	local var_5_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_34:RegisterAnimationSequence("Specialist", var_5_146)

	local var_5_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 146
		},
		{
			value = -0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_36:RegisterAnimationSequence("Specialist", var_5_147)

	local function var_5_148()
		var_5_12:AnimateSequence("Specialist")
		var_5_14:AnimateSequence("Specialist")
		var_5_16:AnimateSequence("Specialist")
		var_5_18:AnimateSequence("Specialist")
		var_5_20:AnimateSequence("Specialist")
		var_5_22:AnimateSequence("Specialist")
		var_5_26:AnimateSequence("Specialist")
		var_5_28:AnimateSequence("Specialist")
		var_5_30:AnimateSequence("Specialist")
		var_5_32:AnimateSequence("Specialist")
		var_5_34:AnimateSequence("Specialist")
		var_5_36:AnimateSequence("Specialist")
	end

	var_5_0._sequences.Specialist = var_5_148

	local var_5_149
	local var_5_150 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_46:RegisterAnimationSequence("RestrictionOnPerk1", var_5_150)

	local function var_5_151()
		var_5_46:AnimateSequence("RestrictionOnPerk1")
	end

	var_5_0._sequences.RestrictionOnPerk1 = var_5_151

	local var_5_152
	local var_5_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_46:RegisterAnimationSequence("RestrictionOffPerk1", var_5_153)

	local function var_5_154()
		var_5_46:AnimateSequence("RestrictionOffPerk1")
	end

	var_5_0._sequences.RestrictionOffPerk1 = var_5_154

	local var_5_155
	local var_5_156 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_48:RegisterAnimationSequence("RestrictionOnPerk2", var_5_156)

	local function var_5_157()
		var_5_48:AnimateSequence("RestrictionOnPerk2")
	end

	var_5_0._sequences.RestrictionOnPerk2 = var_5_157

	local var_5_158
	local var_5_159 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_48:RegisterAnimationSequence("RestrictionOffPerk2", var_5_159)

	local function var_5_160()
		var_5_48:AnimateSequence("RestrictionOffPerk2")
	end

	var_5_0._sequences.RestrictionOffPerk2 = var_5_160

	local var_5_161
	local var_5_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_50:RegisterAnimationSequence("RestrictionOnPerk3", var_5_162)

	local function var_5_163()
		var_5_50:AnimateSequence("RestrictionOnPerk3")
	end

	var_5_0._sequences.RestrictionOnPerk3 = var_5_163

	local var_5_164
	local var_5_165 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_50:RegisterAnimationSequence("RestrictionOffPerk3", var_5_165)

	local function var_5_166()
		var_5_50:AnimateSequence("RestrictionOffPerk3")
	end

	var_5_0._sequences.RestrictionOffPerk3 = var_5_166

	local var_5_167
	local var_5_168 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_52:RegisterAnimationSequence("RestrictionOnPerk4", var_5_168)

	local function var_5_169()
		var_5_52:AnimateSequence("RestrictionOnPerk4")
	end

	var_5_0._sequences.RestrictionOnPerk4 = var_5_169

	local var_5_170
	local var_5_171 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_54:RegisterAnimationSequence("RestrictionOnPerk5", var_5_171)

	local function var_5_172()
		var_5_54:AnimateSequence("RestrictionOnPerk5")
	end

	var_5_0._sequences.RestrictionOnPerk5 = var_5_172

	local var_5_173
	local var_5_174 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_56:RegisterAnimationSequence("RestrictionOnPerk6", var_5_174)

	local function var_5_175()
		var_5_56:AnimateSequence("RestrictionOnPerk6")
	end

	var_5_0._sequences.RestrictionOnPerk6 = var_5_175

	local var_5_176
	local var_5_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_52:RegisterAnimationSequence("RestrictionOffPerk4", var_5_177)

	local function var_5_178()
		var_5_52:AnimateSequence("RestrictionOffPerk4")
	end

	var_5_0._sequences.RestrictionOffPerk4 = var_5_178

	local var_5_179
	local var_5_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_54:RegisterAnimationSequence("RestrictionOffPerk5", var_5_180)

	local function var_5_181()
		var_5_54:AnimateSequence("RestrictionOffPerk5")
	end

	var_5_0._sequences.RestrictionOffPerk5 = var_5_181

	local var_5_182
	local var_5_183 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_56:RegisterAnimationSequence("RestrictionOffPerk6", var_5_183)

	local function var_5_184()
		var_5_56:AnimateSequence("RestrictionOffPerk6")
	end

	var_5_0._sequences.RestrictionOffPerk6 = var_5_184

	local var_5_185
	local var_5_186 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipSetup", var_5_186)

	local var_5_187 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_187)

	local var_5_188 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_188)

	local var_5_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipSetup", var_5_189)

	local var_5_190 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipSetup", var_5_190)

	local var_5_191 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipSetup", var_5_191)

	local var_5_192 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("WZWipSetup", var_5_192)

	local var_5_193 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_26:RegisterAnimationSequence("WZWipSetup", var_5_193)

	local var_5_194 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_28:RegisterAnimationSequence("WZWipSetup", var_5_194)

	local var_5_195 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_5_30:RegisterAnimationSequence("WZWipSetup", var_5_195)

	if CONDITIONS.IsVanguardRevealed() then
		local var_5_196 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_57:RegisterAnimationSequence("WZWipSetup", var_5_196)
	end

	local function var_5_197()
		var_5_4:AnimateSequence("WZWipSetup")
		var_5_6:AnimateSequence("WZWipSetup")
		var_5_8:AnimateSequence("WZWipSetup")
		var_5_12:AnimateSequence("WZWipSetup")
		var_5_14:AnimateSequence("WZWipSetup")
		var_5_16:AnimateSequence("WZWipSetup")
		var_5_24:AnimateSequence("WZWipSetup")
		var_5_26:AnimateSequence("WZWipSetup")
		var_5_28:AnimateSequence("WZWipSetup")
		var_5_30:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_5_57:AnimateSequence("WZWipSetup")
		end
	end

	var_5_0._sequences.WZWipSetup = var_5_197

	local var_5_198
	local var_5_199 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipButtonOver", var_5_199)

	local var_5_200 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonOver", var_5_200)

	local var_5_201 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonOver", var_5_201)

	local var_5_202 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotThree
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipButtonOver", var_5_202)

	local var_5_203 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotTwo
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipButtonOver", var_5_203)

	local var_5_204 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotOne
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipButtonOver", var_5_204)

	local var_5_205 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("WZWipButtonOver", var_5_205)

	local function var_5_206()
		var_5_12:AnimateSequence("WZWipButtonOver")
		var_5_14:AnimateSequence("WZWipButtonOver")
		var_5_16:AnimateSequence("WZWipButtonOver")
		var_5_18:AnimateSequence("WZWipButtonOver")
		var_5_20:AnimateSequence("WZWipButtonOver")
		var_5_22:AnimateSequence("WZWipButtonOver")
		var_5_24:AnimateSequence("WZWipButtonOver")
	end

	var_5_0._sequences.WZWipButtonOver = var_5_206

	local var_5_207
	local var_5_208 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipButtonUp", var_5_208)

	local var_5_209 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonUp", var_5_209)

	local var_5_210 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonUp", var_5_210)

	local var_5_211 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotThreeDisabled
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipButtonUp", var_5_211)

	local var_5_212 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotTwoDisabled
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipButtonUp", var_5_212)

	local var_5_213 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotOneDisabled
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipButtonUp", var_5_213)

	local var_5_214 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("WZWipButtonUp", var_5_214)

	local function var_5_215()
		var_5_12:AnimateSequence("WZWipButtonUp")
		var_5_14:AnimateSequence("WZWipButtonUp")
		var_5_16:AnimateSequence("WZWipButtonUp")
		var_5_18:AnimateSequence("WZWipButtonUp")
		var_5_20:AnimateSequence("WZWipButtonUp")
		var_5_22:AnimateSequence("WZWipButtonUp")
		var_5_24:AnimateSequence("WZWipButtonUp")
	end

	var_5_0._sequences.WZWipButtonUp = var_5_215

	local var_5_216
	local var_5_217 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_217)

	local var_5_218 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_218)

	local var_5_219 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_219)

	local function var_5_220()
		var_5_4:AnimateSequence("WZWipLoadoutEdit")
		var_5_8:AnimateSequence("WZWipLoadoutEdit")
		var_5_24:AnimateSequence("WZWipLoadoutEdit")
	end

	var_5_0._sequences.WZWipLoadoutEdit = var_5_220

	local var_5_221
	local var_5_222 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_222)

	local var_5_223 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_223)

	local var_5_224 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_24:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_224)

	local function var_5_225()
		var_5_4:AnimateSequence("WZWipLoadoutPreview")
		var_5_8:AnimateSequence("WZWipLoadoutPreview")
		var_5_24:AnimateSequence("WZWipLoadoutPreview")
	end

	var_5_0._sequences.WZWipLoadoutPreview = var_5_225

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LoadoutItemPerkButton", LoadoutItemPerkButton)
LockTable(_M)
