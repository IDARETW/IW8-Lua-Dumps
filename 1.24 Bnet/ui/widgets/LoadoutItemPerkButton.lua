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

			if MatchRules.CJBJJHJCI(arg_1_2[iter_1_0]) then
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

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function LoadoutItemPerkButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 116 * _1080p)

	var_3_0.id = "LoadoutItemPerkButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:setUseStencil(true)

	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "DoubleNotchedBacker"

	var_3_4:SetAlpha(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.DoubleNotchedBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ButtonDarkener"

	var_3_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_6:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.ButtonDarkener = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "background"

	var_3_8:SetAlpha(0.8, 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.background = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "RarityColorBackground"

	var_3_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_10)

	var_3_0.RarityColorBackground = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "PerkName3"

	var_3_12:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_12:SetStartupDelay(1000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(150)
	var_3_12:SetAnimMoveSpeed(50)
	var_3_12:SetEndDelay(1000)
	var_3_12:SetCrossfadeTime(400)
	var_3_12:SetFadeInTime(300)
	var_3_12:SetFadeOutTime(300)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 366, _1080p * 87, _1080p * 105)
	var_3_0:addElement(var_3_12)

	var_3_0.PerkName3 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "PerkName2"

	var_3_14:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetStartupDelay(1000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(150)
	var_3_14:SetAnimMoveSpeed(50)
	var_3_14:SetEndDelay(1000)
	var_3_14:SetCrossfadeTime(400)
	var_3_14:SetFadeInTime(300)
	var_3_14:SetFadeOutTime(300)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 152, _1080p * 252, _1080p * 87, _1080p * 105)
	var_3_0:addElement(var_3_14)

	var_3_0.PerkName2 = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "PerkName1"

	var_3_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Center)
	var_3_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_16:SetStartupDelay(1000)
	var_3_16:SetLineHoldTime(400)
	var_3_16:SetAnimMoveTime(150)
	var_3_16:SetAnimMoveSpeed(50)
	var_3_16:SetEndDelay(1000)
	var_3_16:SetCrossfadeTime(400)
	var_3_16:SetFadeInTime(300)
	var_3_16:SetFadeOutTime(300)
	var_3_16:SetMaxVisibleLines(1)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 138, _1080p * 87, _1080p * 105)
	var_3_0:addElement(var_3_16)

	var_3_0.PerkName1 = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "PerkIcon3"

	var_3_18:SetRGBFromTable(SWATCHES.CAC.perkSlotThreeDisabled, 0)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 338, _1080p * 41, _1080p * 86)
	var_3_0:addElement(var_3_18)

	var_3_0.PerkIcon3 = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "PerkIcon2"

	var_3_20:SetRGBFromTable(SWATCHES.CAC.perkSlotTwoDisabled, 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 180, _1080p * 224, _1080p * 41, _1080p * 86)
	var_3_0:addElement(var_3_20)

	var_3_0.PerkIcon2 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIImage.new()

	var_3_22.id = "PerkIcon1"

	var_3_22:SetRGBFromTable(SWATCHES.CAC.perkSlotOneDisabled, 0)
	var_3_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 110, _1080p * 41, _1080p * 86)
	var_3_0:addElement(var_3_22)

	var_3_0.PerkIcon1 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIText.new()

	var_3_24.id = "Title"

	var_3_24:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_24:SetAlpha(0.8, 0)
	var_3_24:setText("", 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Left)
	var_3_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 374, _1080p * 10, _1080p * 34)
	var_3_0:addElement(var_3_24)

	var_3_0.Title = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIStyledText.new()

	var_3_26.id = "SpecialPerkName3"

	var_3_26:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_26:setText("", 0)
	var_3_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_26:SetAlignment(LUI.Alignment.Center)
	var_3_26:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_26:SetStartupDelay(1000)
	var_3_26:SetLineHoldTime(400)
	var_3_26:SetAnimMoveTime(150)
	var_3_26:SetAnimMoveSpeed(50)
	var_3_26:SetEndDelay(1000)
	var_3_26:SetCrossfadeTime(400)
	var_3_26:SetFadeInTime(300)
	var_3_26:SetFadeOutTime(300)
	var_3_26:SetMaxVisibleLines(1)
	var_3_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 266, _1080p * 366, _1080p * 162, _1080p * 180)
	var_3_0:addElement(var_3_26)

	var_3_0.SpecialPerkName3 = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIStyledText.new()

	var_3_28.id = "SpecialPerkName2"

	var_3_28:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_28:setText("", 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_28:SetAlignment(LUI.Alignment.Center)
	var_3_28:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_28:SetStartupDelay(1000)
	var_3_28:SetLineHoldTime(400)
	var_3_28:SetAnimMoveTime(150)
	var_3_28:SetAnimMoveSpeed(50)
	var_3_28:SetEndDelay(1000)
	var_3_28:SetCrossfadeTime(400)
	var_3_28:SetFadeInTime(300)
	var_3_28:SetFadeOutTime(300)
	var_3_28:SetMaxVisibleLines(1)
	var_3_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 152, _1080p * 252, _1080p * 162, _1080p * 180)
	var_3_0:addElement(var_3_28)

	var_3_0.SpecialPerkName2 = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIStyledText.new()

	var_3_30.id = "SpecialPerkName1"

	var_3_30:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_30:setText("", 0)
	var_3_30:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_30:SetAlignment(LUI.Alignment.Center)
	var_3_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_30:SetStartupDelay(1000)
	var_3_30:SetLineHoldTime(400)
	var_3_30:SetAnimMoveTime(150)
	var_3_30:SetAnimMoveSpeed(50)
	var_3_30:SetEndDelay(1000)
	var_3_30:SetCrossfadeTime(400)
	var_3_30:SetFadeInTime(300)
	var_3_30:SetFadeOutTime(300)
	var_3_30:SetMaxVisibleLines(1)
	var_3_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 138, _1080p * 162, _1080p * 180)
	var_3_0:addElement(var_3_30)

	var_3_0.SpecialPerkName1 = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIImage.new()

	var_3_32.id = "SpecialPerkIcon3"

	var_3_32:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_3_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 294, _1080p * 338, _1080p * 116, _1080p * 161)
	var_3_0:addElement(var_3_32)

	var_3_0.SpecialPerkIcon3 = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIImage.new()

	var_3_34.id = "SpecialPerkIcon2"

	var_3_34:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_3_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 180, _1080p * 224, _1080p * 116, _1080p * 161)
	var_3_0:addElement(var_3_34)

	var_3_0.SpecialPerkIcon2 = var_3_34

	local var_3_35
	local var_3_36 = LUI.UIImage.new()

	var_3_36.id = "SpecialPerkIcon1"

	var_3_36:SetRGBFromTable(SWATCHES.CAC.perkSlotSpecialistDisabled, 0)
	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 110, _1080p * 116, _1080p * 161)
	var_3_0:addElement(var_3_36)

	var_3_0.SpecialPerkIcon1 = var_3_36

	local var_3_37
	local var_3_38 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_3_1
	})

	var_3_38.id = "NewItemNotification"

	var_3_38:SetAlpha(0, 0)
	var_3_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -11, _1080p * 11, _1080p * 19)
	var_3_0:addElement(var_3_38)

	var_3_0.NewItemNotification = var_3_38

	local var_3_39

	if CONDITIONS.IsBRGameType(var_3_0) then
		local var_3_40 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_3_1
		})

		var_3_40.id = "BRWarning3"

		var_3_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 345, _1080p * 366, _1080p * 30, _1080p * 52)
		var_3_0:addElement(var_3_40)

		var_3_0.BRWarning3 = var_3_40
	end

	local var_3_41

	if CONDITIONS.IsBRGameType(var_3_0) then
		local var_3_42 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_3_1
		})

		var_3_42.id = "BRWarning2"

		var_3_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 252, _1080p * 30, _1080p * 52)
		var_3_0:addElement(var_3_42)

		var_3_0.BRWarning2 = var_3_42
	end

	local var_3_43

	if CONDITIONS.IsBRGameType(var_3_0) then
		local var_3_44 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_3_1
		})

		var_3_44.id = "BRWarning1"

		var_3_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 138, _1080p * 30, _1080p * 52)
		var_3_0:addElement(var_3_44)

		var_3_0.BRWarning1 = var_3_44
	end

	local var_3_45
	local var_3_46 = LUI.UIImage.new()

	var_3_46.id = "RestrictionWarning1"

	var_3_46:SetAlpha(0, 0)
	var_3_46:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_46:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -291, _1080p * -261, _1080p * 24, _1080p * 54)
	var_3_0:addElement(var_3_46)

	var_3_0.RestrictionWarning1 = var_3_46

	local var_3_47
	local var_3_48 = LUI.UIImage.new()

	var_3_48.id = "RestrictionWarning2"

	var_3_48:SetAlpha(0, 0)
	var_3_48:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_48:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -177, _1080p * -147, _1080p * 24, _1080p * 54)
	var_3_0:addElement(var_3_48)

	var_3_0.RestrictionWarning2 = var_3_48

	local var_3_49
	local var_3_50 = LUI.UIImage.new()

	var_3_50.id = "RestrictionWarning3"

	var_3_50:SetAlpha(0, 0)
	var_3_50:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_50:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -63, _1080p * -33, _1080p * 24, _1080p * 54)
	var_3_0:addElement(var_3_50)

	var_3_0.RestrictionWarning3 = var_3_50

	local var_3_51
	local var_3_52 = LUI.UIImage.new()

	var_3_52.id = "RestrictionWarning4"

	var_3_52:SetAlpha(0, 0)
	var_3_52:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_52:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -291, _1080p * -261, _1080p * 98, _1080p * 128)
	var_3_0:addElement(var_3_52)

	var_3_0.RestrictionWarning4 = var_3_52

	local var_3_53
	local var_3_54 = LUI.UIImage.new()

	var_3_54.id = "RestrictionWarning5"

	var_3_54:SetAlpha(0, 0)
	var_3_54:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_54:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -177, _1080p * -147, _1080p * 98, _1080p * 128)
	var_3_0:addElement(var_3_54)

	var_3_0.RestrictionWarning5 = var_3_54

	local var_3_55
	local var_3_56 = LUI.UIImage.new()

	var_3_56.id = "RestrictionWarning6"

	var_3_56:SetAlpha(0, 0)
	var_3_56:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_3_56:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -63, _1080p * -33, _1080p * 98, _1080p * 128)
	var_3_0:addElement(var_3_56)

	var_3_0.RestrictionWarning6 = var_3_56

	local function var_3_57()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_57

	local var_3_58
	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_59)

	local var_3_60 = {
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

	var_3_12:RegisterAnimationSequence("ButtonOver", var_3_60)

	local var_3_61 = {
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

	var_3_14:RegisterAnimationSequence("ButtonOver", var_3_61)

	local var_3_62 = {
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

	var_3_16:RegisterAnimationSequence("ButtonOver", var_3_62)

	local var_3_63 = {
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

	var_3_18:RegisterAnimationSequence("ButtonOver", var_3_63)

	local var_3_64 = {
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

	var_3_20:RegisterAnimationSequence("ButtonOver", var_3_64)

	local var_3_65 = {
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

	var_3_22:RegisterAnimationSequence("ButtonOver", var_3_65)

	local var_3_66 = {
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

	var_3_24:RegisterAnimationSequence("ButtonOver", var_3_66)

	local var_3_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_26:RegisterAnimationSequence("ButtonOver", var_3_67)

	local var_3_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_28:RegisterAnimationSequence("ButtonOver", var_3_68)

	local var_3_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_3_30:RegisterAnimationSequence("ButtonOver", var_3_69)

	local var_3_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_3_32:RegisterAnimationSequence("ButtonOver", var_3_70)

	local var_3_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_3_34:RegisterAnimationSequence("ButtonOver", var_3_71)

	local var_3_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialist
		}
	}

	var_3_36:RegisterAnimationSequence("ButtonOver", var_3_72)

	local function var_3_73()
		var_3_8:AnimateSequence("ButtonOver")
		var_3_12:AnimateSequence("ButtonOver")
		var_3_14:AnimateSequence("ButtonOver")
		var_3_16:AnimateSequence("ButtonOver")
		var_3_18:AnimateSequence("ButtonOver")
		var_3_20:AnimateSequence("ButtonOver")
		var_3_22:AnimateSequence("ButtonOver")
		var_3_24:AnimateSequence("ButtonOver")
		var_3_26:AnimateSequence("ButtonOver")
		var_3_28:AnimateSequence("ButtonOver")
		var_3_30:AnimateSequence("ButtonOver")
		var_3_32:AnimateSequence("ButtonOver")
		var_3_34:AnimateSequence("ButtonOver")
		var_3_36:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_73

	local var_3_74
	local var_3_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_75)

	local var_3_76 = {
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

	var_3_12:RegisterAnimationSequence("ButtonUp", var_3_76)

	local var_3_77 = {
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

	var_3_14:RegisterAnimationSequence("ButtonUp", var_3_77)

	local var_3_78 = {
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

	var_3_16:RegisterAnimationSequence("ButtonUp", var_3_78)

	local var_3_79 = {
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

	var_3_18:RegisterAnimationSequence("ButtonUp", var_3_79)

	local var_3_80 = {
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

	var_3_20:RegisterAnimationSequence("ButtonUp", var_3_80)

	local var_3_81 = {
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

	var_3_22:RegisterAnimationSequence("ButtonUp", var_3_81)

	local var_3_82 = {
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

	var_3_24:RegisterAnimationSequence("ButtonUp", var_3_82)

	local var_3_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_26:RegisterAnimationSequence("ButtonUp", var_3_83)

	local var_3_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_28:RegisterAnimationSequence("ButtonUp", var_3_84)

	local var_3_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_30:RegisterAnimationSequence("ButtonUp", var_3_85)

	local var_3_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_3_32:RegisterAnimationSequence("ButtonUp", var_3_86)

	local var_3_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_3_34:RegisterAnimationSequence("ButtonUp", var_3_87)

	local var_3_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.perkSlotSpecialistDisabled
		}
	}

	var_3_36:RegisterAnimationSequence("ButtonUp", var_3_88)

	local function var_3_89()
		var_3_8:AnimateSequence("ButtonUp")
		var_3_12:AnimateSequence("ButtonUp")
		var_3_14:AnimateSequence("ButtonUp")
		var_3_16:AnimateSequence("ButtonUp")
		var_3_18:AnimateSequence("ButtonUp")
		var_3_20:AnimateSequence("ButtonUp")
		var_3_22:AnimateSequence("ButtonUp")
		var_3_24:AnimateSequence("ButtonUp")
		var_3_26:AnimateSequence("ButtonUp")
		var_3_28:AnimateSequence("ButtonUp")
		var_3_30:AnimateSequence("ButtonUp")
		var_3_32:AnimateSequence("ButtonUp")
		var_3_34:AnimateSequence("ButtonUp")
		var_3_36:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_89

	local var_3_90
	local var_3_91 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("LoadoutEdit", var_3_91)

	local var_3_92 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LoadoutEdit", var_3_92)

	local var_3_93 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LoadoutEdit", var_3_93)

	local var_3_94 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_12:RegisterAnimationSequence("LoadoutEdit", var_3_94)

	local var_3_95 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_14:RegisterAnimationSequence("LoadoutEdit", var_3_95)

	local var_3_96 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_16:RegisterAnimationSequence("LoadoutEdit", var_3_96)

	local var_3_97 = {
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

	var_3_24:RegisterAnimationSequence("LoadoutEdit", var_3_97)

	local function var_3_98()
		var_3_4:AnimateSequence("LoadoutEdit")
		var_3_6:AnimateSequence("LoadoutEdit")
		var_3_8:AnimateSequence("LoadoutEdit")
		var_3_12:AnimateSequence("LoadoutEdit")
		var_3_14:AnimateSequence("LoadoutEdit")
		var_3_16:AnimateSequence("LoadoutEdit")
		var_3_24:AnimateSequence("LoadoutEdit")
	end

	var_3_0._sequences.LoadoutEdit = var_3_98

	local var_3_99
	local var_3_100 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("LoadoutPreview", var_3_100)

	local var_3_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("LoadoutPreview", var_3_101)

	local var_3_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("LoadoutPreview", var_3_102)

	local var_3_103 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_12:RegisterAnimationSequence("LoadoutPreview", var_3_103)

	local var_3_104 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_14:RegisterAnimationSequence("LoadoutPreview", var_3_104)

	local var_3_105 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_3_16:RegisterAnimationSequence("LoadoutPreview", var_3_105)

	local var_3_106 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_3_24:RegisterAnimationSequence("LoadoutPreview", var_3_106)

	local function var_3_107()
		var_3_4:AnimateSequence("LoadoutPreview")
		var_3_6:AnimateSequence("LoadoutPreview")
		var_3_8:AnimateSequence("LoadoutPreview")
		var_3_12:AnimateSequence("LoadoutPreview")
		var_3_14:AnimateSequence("LoadoutPreview")
		var_3_16:AnimateSequence("LoadoutPreview")
		var_3_24:AnimateSequence("LoadoutPreview")
	end

	var_3_0._sequences.LoadoutPreview = var_3_107

	local var_3_108
	local var_3_109 = {
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

	var_3_12:RegisterAnimationSequence("AR", var_3_109)

	local var_3_110 = {
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

	var_3_14:RegisterAnimationSequence("AR", var_3_110)

	local var_3_111 = {
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

	var_3_16:RegisterAnimationSequence("AR", var_3_111)

	local var_3_112 = {
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

	var_3_18:RegisterAnimationSequence("AR", var_3_112)

	local var_3_113 = {
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

	var_3_20:RegisterAnimationSequence("AR", var_3_113)

	local var_3_114 = {
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

	var_3_22:RegisterAnimationSequence("AR", var_3_114)

	local var_3_115 = {
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

	var_3_24:RegisterAnimationSequence("AR", var_3_115)

	local var_3_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_3_26:RegisterAnimationSequence("AR", var_3_116)

	local var_3_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 194
		}
	}

	var_3_28:RegisterAnimationSequence("AR", var_3_117)

	local var_3_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 193
		}
	}

	var_3_30:RegisterAnimationSequence("AR", var_3_118)

	local function var_3_119()
		var_3_12:AnimateSequence("AR")
		var_3_14:AnimateSequence("AR")
		var_3_16:AnimateSequence("AR")
		var_3_18:AnimateSequence("AR")
		var_3_20:AnimateSequence("AR")
		var_3_22:AnimateSequence("AR")
		var_3_24:AnimateSequence("AR")
		var_3_26:AnimateSequence("AR")
		var_3_28:AnimateSequence("AR")
		var_3_30:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_119

	local var_3_120
	local var_3_121 = {
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

	var_3_12:RegisterAnimationSequence("NoSpecialist", var_3_121)

	local var_3_122 = {
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

	var_3_14:RegisterAnimationSequence("NoSpecialist", var_3_122)

	local var_3_123 = {
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

	var_3_16:RegisterAnimationSequence("NoSpecialist", var_3_123)

	local var_3_124 = {
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

	var_3_18:RegisterAnimationSequence("NoSpecialist", var_3_124)

	local var_3_125 = {
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

	var_3_20:RegisterAnimationSequence("NoSpecialist", var_3_125)

	local var_3_126 = {
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

	var_3_22:RegisterAnimationSequence("NoSpecialist", var_3_126)

	local var_3_127 = {
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

	var_3_26:RegisterAnimationSequence("NoSpecialist", var_3_127)

	local var_3_128 = {
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

	var_3_28:RegisterAnimationSequence("NoSpecialist", var_3_128)

	local var_3_129 = {
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

	var_3_30:RegisterAnimationSequence("NoSpecialist", var_3_129)

	local var_3_130 = {
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

	var_3_32:RegisterAnimationSequence("NoSpecialist", var_3_130)

	local var_3_131 = {
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

	var_3_34:RegisterAnimationSequence("NoSpecialist", var_3_131)

	local var_3_132 = {
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

	var_3_36:RegisterAnimationSequence("NoSpecialist", var_3_132)

	local function var_3_133()
		var_3_12:AnimateSequence("NoSpecialist")
		var_3_14:AnimateSequence("NoSpecialist")
		var_3_16:AnimateSequence("NoSpecialist")
		var_3_18:AnimateSequence("NoSpecialist")
		var_3_20:AnimateSequence("NoSpecialist")
		var_3_22:AnimateSequence("NoSpecialist")
		var_3_26:AnimateSequence("NoSpecialist")
		var_3_28:AnimateSequence("NoSpecialist")
		var_3_30:AnimateSequence("NoSpecialist")
		var_3_32:AnimateSequence("NoSpecialist")
		var_3_34:AnimateSequence("NoSpecialist")
		var_3_36:AnimateSequence("NoSpecialist")
	end

	var_3_0._sequences.NoSpecialist = var_3_133

	local var_3_134
	local var_3_135 = {
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

	var_3_12:RegisterAnimationSequence("Specialist", var_3_135)

	local var_3_136 = {
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

	var_3_14:RegisterAnimationSequence("Specialist", var_3_136)

	local var_3_137 = {
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

	var_3_16:RegisterAnimationSequence("Specialist", var_3_137)

	local var_3_138 = {
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

	var_3_18:RegisterAnimationSequence("Specialist", var_3_138)

	local var_3_139 = {
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

	var_3_20:RegisterAnimationSequence("Specialist", var_3_139)

	local var_3_140 = {
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

	var_3_22:RegisterAnimationSequence("Specialist", var_3_140)

	local var_3_141 = {
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

	var_3_26:RegisterAnimationSequence("Specialist", var_3_141)

	local var_3_142 = {
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

	var_3_28:RegisterAnimationSequence("Specialist", var_3_142)

	local var_3_143 = {
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

	var_3_30:RegisterAnimationSequence("Specialist", var_3_143)

	local var_3_144 = {
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

	var_3_32:RegisterAnimationSequence("Specialist", var_3_144)

	local var_3_145 = {
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

	var_3_34:RegisterAnimationSequence("Specialist", var_3_145)

	local var_3_146 = {
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

	var_3_36:RegisterAnimationSequence("Specialist", var_3_146)

	local function var_3_147()
		var_3_12:AnimateSequence("Specialist")
		var_3_14:AnimateSequence("Specialist")
		var_3_16:AnimateSequence("Specialist")
		var_3_18:AnimateSequence("Specialist")
		var_3_20:AnimateSequence("Specialist")
		var_3_22:AnimateSequence("Specialist")
		var_3_26:AnimateSequence("Specialist")
		var_3_28:AnimateSequence("Specialist")
		var_3_30:AnimateSequence("Specialist")
		var_3_32:AnimateSequence("Specialist")
		var_3_34:AnimateSequence("Specialist")
		var_3_36:AnimateSequence("Specialist")
	end

	var_3_0._sequences.Specialist = var_3_147

	local var_3_148
	local var_3_149 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("RestrictionOnPerk1", var_3_149)

	local function var_3_150()
		var_3_46:AnimateSequence("RestrictionOnPerk1")
	end

	var_3_0._sequences.RestrictionOnPerk1 = var_3_150

	local var_3_151
	local var_3_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("RestrictionOffPerk1", var_3_152)

	local function var_3_153()
		var_3_46:AnimateSequence("RestrictionOffPerk1")
	end

	var_3_0._sequences.RestrictionOffPerk1 = var_3_153

	local var_3_154
	local var_3_155 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("RestrictionOnPerk2", var_3_155)

	local function var_3_156()
		var_3_48:AnimateSequence("RestrictionOnPerk2")
	end

	var_3_0._sequences.RestrictionOnPerk2 = var_3_156

	local var_3_157
	local var_3_158 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_48:RegisterAnimationSequence("RestrictionOffPerk2", var_3_158)

	local function var_3_159()
		var_3_48:AnimateSequence("RestrictionOffPerk2")
	end

	var_3_0._sequences.RestrictionOffPerk2 = var_3_159

	local var_3_160
	local var_3_161 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("RestrictionOnPerk3", var_3_161)

	local function var_3_162()
		var_3_50:AnimateSequence("RestrictionOnPerk3")
	end

	var_3_0._sequences.RestrictionOnPerk3 = var_3_162

	local var_3_163
	local var_3_164 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_50:RegisterAnimationSequence("RestrictionOffPerk3", var_3_164)

	local function var_3_165()
		var_3_50:AnimateSequence("RestrictionOffPerk3")
	end

	var_3_0._sequences.RestrictionOffPerk3 = var_3_165

	local var_3_166
	local var_3_167 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_52:RegisterAnimationSequence("RestrictionOnPerk4", var_3_167)

	local function var_3_168()
		var_3_52:AnimateSequence("RestrictionOnPerk4")
	end

	var_3_0._sequences.RestrictionOnPerk4 = var_3_168

	local var_3_169
	local var_3_170 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_54:RegisterAnimationSequence("RestrictionOnPerk5", var_3_170)

	local function var_3_171()
		var_3_54:AnimateSequence("RestrictionOnPerk5")
	end

	var_3_0._sequences.RestrictionOnPerk5 = var_3_171

	local var_3_172
	local var_3_173 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_56:RegisterAnimationSequence("RestrictionOnPerk6", var_3_173)

	local function var_3_174()
		var_3_56:AnimateSequence("RestrictionOnPerk6")
	end

	var_3_0._sequences.RestrictionOnPerk6 = var_3_174

	local var_3_175
	local var_3_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_52:RegisterAnimationSequence("RestrictionOffPerk4", var_3_176)

	local function var_3_177()
		var_3_52:AnimateSequence("RestrictionOffPerk4")
	end

	var_3_0._sequences.RestrictionOffPerk4 = var_3_177

	local var_3_178
	local var_3_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_54:RegisterAnimationSequence("RestrictionOffPerk5", var_3_179)

	local function var_3_180()
		var_3_54:AnimateSequence("RestrictionOffPerk5")
	end

	var_3_0._sequences.RestrictionOffPerk5 = var_3_180

	local var_3_181
	local var_3_182 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_56:RegisterAnimationSequence("RestrictionOffPerk6", var_3_182)

	local function var_3_183()
		var_3_56:AnimateSequence("RestrictionOffPerk6")
	end

	var_3_0._sequences.RestrictionOffPerk6 = var_3_183

	var_3_0:addEventHandler("button_over", function(arg_24_0, arg_24_1)
		if not arg_24_1.controller then
			local var_24_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LoadoutItemPerkButton", LoadoutItemPerkButton)
LockTable(_M)
