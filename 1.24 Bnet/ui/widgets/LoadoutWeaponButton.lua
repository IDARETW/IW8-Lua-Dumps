module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6, arg_1_7, arg_1_8)
	assert(arg_1_0.WeaponName)
	assert(arg_1_0.WeaponLevel)

	local var_1_0 = WEAPON.GetWeaponClass(arg_1_2)
	local var_1_1 = WEAPON.GetWeaponClassName(arg_1_2)

	if CONDITIONS.IsMultiplayer() then
		local var_1_2 = DYN_ATTACHMENT.IsDynamicAttachmentIconsEnabled() and WEAPON.IsBulletWeapon(var_1_0)

		if not arg_1_8 and arg_1_6 == nil then
			var_1_2 = false
		end

		if var_1_2 then
			local var_1_3

			if arg_1_8 then
				var_1_3 = WEAPON.GetWeaponModelName(arg_1_2, arg_1_7, {
					includeStickers = true,
					includeAttachments = true,
					keepAkimbo = true,
					isDefault = true,
					includeCamos = true,
					controllerIndex = arg_1_1
				})
			else
				local var_1_4 = WEAPON.GenerateWeaponTable(arg_1_6)

				var_1_3 = WEAPON.GetWeaponModelName(var_1_4.weapon, var_1_4, {
					includeStickers = true,
					includeAttachments = true,
					keepAkimbo = true,
					includeCamos = true,
					controllerIndex = arg_1_1
				})
			end

			local var_1_5 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_1_3)

			arg_1_0.Image:SetAlpha(0)
			arg_1_0.DynamicWeaponIcon:SetAlpha(1)
			arg_1_0.DynamicWeaponIcon:PerformUpdate(arg_1_1, false, var_1_5, arg_1_2)

			arg_1_0.DisplayIcon = arg_1_0.DynamicWeaponIcon
		else
			local var_1_6 = WEAPON.GetBWImage(arg_1_2)

			if arg_1_6 then
				local var_1_7 = WEAPON.GenerateWeaponTable(arg_1_6)

				if var_1_7 then
					local var_1_8 = WEAPON.GetVariantOverridenIcon(var_1_7.weapon, var_1_7.variantID)

					if var_1_8 and #var_1_8 > 0 then
						var_1_6 = var_1_8
					end
				end
			end

			arg_1_0.DynamicWeaponIcon:SetAlpha(0)
			arg_1_0.Image:SetAlpha(1)
			arg_1_0.Image:setImage(RegisterMaterial(var_1_6))

			arg_1_0.DisplayIcon = arg_1_0.Image
		end
	end

	local var_1_9 = PROGRESSION.GetWeaponXP(arg_1_1, arg_1_2)
	local var_1_10 = PROGRESSION.GetWeaponCurrentLevelXP(arg_1_1, arg_1_2)
	local var_1_11 = PROGRESSION.GetWeaponNextLevelXP(arg_1_1, arg_1_2)

	if PROGRESSION.IsWeaponMaxLevel(arg_1_1, arg_1_2) then
		arg_1_0.XPText:setText("")
	else
		arg_1_0.XPText:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_XP", var_1_9 - var_1_10, var_1_11 - var_1_10))
	end

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarOver")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ProgressBarOver")
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarUp")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ProgressBarUp")
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUp")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarUp")
	else
		ACTIONS.AnimateSequence(arg_1_0, "ProgressBarUp")
	end

	arg_1_0.AttributeIcon:SetAlpha(0)

	arg_1_0._hasAttribute = false

	if #arg_1_3 > 0 then
		arg_1_0._isBlueprint = true

		arg_1_0.BlueprintIcon:setImage(RegisterMaterial("icon_mod"))
		arg_1_0.WeaponName:setText(arg_1_3)
	elseif arg_1_6 and arg_1_6.lootItemID:get() ~= LOOT.emptyID and not arg_1_7 then
		arg_1_0._isBlueprint = true

		arg_1_0.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"))
		arg_1_0.WeaponName:setText(WEAPON.GetLootWeaponName(arg_1_2, arg_1_6.lootItemID:get()))

		local var_1_12 = WEAPON.GetSpecialAttributeIcon(arg_1_6.lootItemID:get())

		if #var_1_12 > 0 then
			arg_1_0._hasAttribute = true

			arg_1_0.AttributeIcon:setImage(RegisterMaterial(var_1_12))
			arg_1_0.AttributeIcon:SetAlpha(1)
		end
	else
		arg_1_0._isBlueprint = false

		local var_1_13 = ""

		if arg_1_6 then
			local var_1_14 = WEAPON.GenerateWeaponTable(arg_1_6)

			for iter_1_0 = 1, #var_1_14.attachments do
				local var_1_15 = var_1_14.attachments[iter_1_0]

				if var_1_15.ref and #var_1_15.ref > 0 and ATTACHMENT.IsDisplayNameAvailable(var_1_15.ref) then
					if var_1_13 == "" then
						var_1_13 = ATTACHMENT.GetName(var_1_15.ref)
					else
						var_1_13 = var_1_13 .. " " .. ATTACHMENT.GetName(var_1_15.ref)
					end
				end
			end
		end

		arg_1_0.WeaponName:setText(WEAPON.GetName(arg_1_2) .. " " .. var_1_13)
	end

	if arg_1_0._isBlueprint then
		local var_1_16 = LAYOUT.GetTextWidth(arg_1_0.WeaponName)
		local var_1_17 = LAYOUT.GetElementWidth(arg_1_0.BlueprintIcon)
		local var_1_18 = 2 * _1080p

		if not IsLanguageArabic() then
			local var_1_19 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().left

			arg_1_0.BlueprintIcon:SetLeft(var_1_19 + var_1_18 + var_1_16)
			arg_1_0.BlueprintIcon:SetRight(var_1_19 + var_1_18 + var_1_16 + var_1_17)
		else
			local var_1_20 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().right
			local var_1_21 = 10 * _1080p

			arg_1_0.BlueprintIcon:SetLeft(var_1_20 - var_1_21 - var_1_16 - var_1_17)
			arg_1_0.BlueprintIcon:SetRight(var_1_20 - var_1_21 - var_1_16)
		end

		if arg_1_0._hasAttribute then
			local var_1_22 = LAYOUT.GetElementWidth(arg_1_0.AttributeIcon)

			if not IsLanguageArabic() then
				local var_1_23 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().left
				local var_1_24 = 4 * _1080p

				arg_1_0.AttributeIcon:SetLeft(var_1_23 + var_1_16 + var_1_24 + var_1_17 + var_1_24)
				arg_1_0.AttributeIcon:SetRight(var_1_23 + var_1_16 + var_1_24 + var_1_17 + var_1_24 + var_1_22)
			else
				local var_1_25 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().right
				local var_1_26 = 10 * _1080p

				arg_1_0.AttributeIcon:SetLeft(var_1_25 - var_1_26 - var_1_16 - var_1_17 - var_1_26 - var_1_22)
				arg_1_0.AttributeIcon:SetRight(var_1_25 - var_1_26 - var_1_16 - var_1_17)
			end
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpBlueprint")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideBlueprint")
	end

	arg_1_0.WeaponClass:setText(Engine.CBBHFCGDIC(var_1_1))
	arg_1_0.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_FACTION_LEVEL", PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)))
	arg_1_0.Title:setText(arg_1_5)
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupButton = var_0_0
	arg_4_0.DisplayIcon = arg_4_0.Image
	arg_4_0._isBlueprint = false

	arg_4_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")

		if arg_4_0._isBlueprint then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOverBlueprint")
		end
	end)
	arg_4_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_4_0, "ButtonUp")

		if arg_4_0._isBlueprint then
			ACTIONS.AnimateSequence(arg_4_0, "ButtonUpBlueprint")
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end
end

function LoadoutWeaponButton(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIButton.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 190 * _1080p)

	var_7_0.id = "LoadoutWeaponButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "DoubleNotchedBacker"

	var_7_4:SetAlpha(0, 0)
	var_7_4.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.DoubleNotchedBacker = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "ButtonDarkener"

	var_7_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_6:SetAlpha(0.5, 0)
	var_7_0:addElement(var_7_6)

	var_7_0.ButtonDarkener = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "Background"

	var_7_8:SetAlpha(0.8, 0)
	var_7_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_8)

	var_7_0.Background = var_7_8

	local var_7_9

	if CONDITIONS.IsMagmaGameMode(var_7_0) then
		local var_7_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
			controllerIndex = var_7_1
		})

		var_7_10.id = "RarityColorBackground"

		var_7_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_7_0:addElement(var_7_10)

		var_7_0.RarityColorBackground = var_7_10
	end

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "DynamicWeaponIcon"

	var_7_12:SetRGBFromInt(12566463, 0)
	var_7_12:SetScale(-0.2, 0)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -115, _1080p * 115, _1080p * -57, _1080p * 57)
	var_7_0:addElement(var_7_12)

	var_7_0.DynamicWeaponIcon = var_7_12

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "Image"

	var_7_14:SetRGBFromTable(SWATCHES.CAC.defaultItemHeader, 0)
	var_7_14:SetColorOp(COLOR_OP.saturation, 0)
	var_7_14:SetColorOpParam(1, 0)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -115, _1080p * 115, _1080p * -53, _1080p * 63)
	var_7_0:addElement(var_7_14)

	var_7_0.Image = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIText.new()

	var_7_16.id = "WeaponName"

	var_7_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_16:SetAlpha(0.8, 0)
	var_7_16:setText("", 0)
	var_7_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_16:SetAlignment(LUI.Alignment.Left)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 380, _1080p * 35, _1080p * 57)
	var_7_0:addElement(var_7_16)

	var_7_0.WeaponName = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIStyledText.new()

	var_7_18.id = "WeaponLevel"

	var_7_18:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_18:setText(ToUpperCase(""), 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Left)
	var_7_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_18:SetStartupDelay(2000)
	var_7_18:SetLineHoldTime(400)
	var_7_18:SetAnimMoveTime(300)
	var_7_18:SetAnimMoveSpeed(50)
	var_7_18:SetEndDelay(1500)
	var_7_18:SetCrossfadeTime(750)
	var_7_18:SetFadeInTime(300)
	var_7_18:SetFadeOutTime(300)
	var_7_18:SetMaxVisibleLines(1)
	var_7_18:SetOutlineRGBFromInt(0, 0)
	var_7_18:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -40, _1080p * -22)
	var_7_0:addElement(var_7_18)

	var_7_0.WeaponLevel = var_7_18

	local var_7_19
	local var_7_20 = LUI.UIStyledText.new()

	var_7_20.id = "WeaponClass"

	var_7_20:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_20:setText(ToUpperCase(""), 0)
	var_7_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_20:SetAlignment(LUI.Alignment.Left)
	var_7_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_7_20:SetStartupDelay(2000)
	var_7_20:SetLineHoldTime(400)
	var_7_20:SetAnimMoveTime(300)
	var_7_20:SetAnimMoveSpeed(50)
	var_7_20:SetEndDelay(1500)
	var_7_20:SetCrossfadeTime(750)
	var_7_20:SetFadeInTime(300)
	var_7_20:SetFadeOutTime(300)
	var_7_20:SetMaxVisibleLines(1)
	var_7_20:SetOutlineRGBFromInt(0, 0)
	var_7_20:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -58, _1080p * -40)
	var_7_0:addElement(var_7_20)

	var_7_0.WeaponClass = var_7_20

	local var_7_21
	local var_7_22 = LUI.UIText.new()

	var_7_22.id = "Title"

	var_7_22:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_7_22:SetAlpha(0.8, 0)
	var_7_22:setText("", 0)
	var_7_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_7_22:SetAlignment(LUI.Alignment.Left)
	var_7_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 275, _1080p * 11, _1080p * 35)
	var_7_0:addElement(var_7_22)

	var_7_0.Title = var_7_22

	local var_7_23

	if CONDITIONS.InFrontend(var_7_0) then
		var_7_23 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
			controllerIndex = var_7_1
		})
		var_7_23.id = "WeaponLevelBar"

		var_7_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_7_23:SetAlpha(0.3, 0)
		var_7_23:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -19, _1080p * -11)
		var_7_0:addElement(var_7_23)

		var_7_0.WeaponLevelBar = var_7_23
	end

	local var_7_24
	local var_7_25 = MenuBuilder.BuildRegisteredType("MiniAttachments", {
		controllerIndex = var_7_1
	})

	var_7_25.id = "MiniAttachments"

	var_7_25:SetAlpha(0.6, 0)
	var_7_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 282, _1080p * 380, _1080p * 16, _1080p * 32)
	var_7_0:addElement(var_7_25)

	var_7_0.MiniAttachments = var_7_25

	local var_7_26

	if not CONDITIONS.IsSplitscreen(var_7_0) then
		local var_7_27 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_7_1
		})

		var_7_27.id = "NewItemSmallIcon"

		var_7_27:SetAlpha(0, 0)
		var_7_27:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -16, _1080p * -8, _1080p * 8, _1080p * 16)
		var_7_0:addElement(var_7_27)

		var_7_0.NewItemSmallIcon = var_7_27
	end

	local var_7_28
	local var_7_29 = LUI.UIStyledText.new()

	var_7_29.id = "XPText"

	var_7_29:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_29:setText(ToUpperCase(""), 0)
	var_7_29:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_29:SetWordWrap(false)
	var_7_29:SetAlignment(LUI.Alignment.Right)
	var_7_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_7_29:SetOutlineRGBFromInt(0, 0)
	var_7_29:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 155, _1080p * -24, _1080p * -40, _1080p * -22)
	var_7_0:addElement(var_7_29)

	var_7_0.XPText = var_7_29

	local var_7_30
	local var_7_31 = LUI.UIImage.new()

	var_7_31.id = "BlueprintIcon"

	var_7_31:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_7_31:SetAlpha(0, 0)
	var_7_31:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_7_31:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 144, _1080p * 160, _1080p * -56, _1080p * -40)
	var_7_0:addElement(var_7_31)

	var_7_0.BlueprintIcon = var_7_31

	local var_7_32
	local var_7_33 = LUI.UIImage.new()

	var_7_33.id = "RestrictionWarning"

	var_7_33:SetAlpha(0, 0)
	var_7_33:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_7_33:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -2, _1080p * 74, _1080p * 109)
	var_7_0:addElement(var_7_33)

	var_7_0.RestrictionWarning = var_7_33

	local var_7_34
	local var_7_35 = LUI.UIImage.new()

	var_7_35.id = "AttributeIcon"

	var_7_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 136, _1080p * 176, _1080p * 34, _1080p * 54)
	var_7_0:addElement(var_7_35)

	var_7_0.AttributeIcon = var_7_35

	local function var_7_36()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonOver", var_7_38)

	local var_7_39 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonOver", var_7_39)

	local var_7_40 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonOver", var_7_40)

	local var_7_41 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonOver", var_7_41)

	local var_7_42 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_22:RegisterAnimationSequence("ButtonOver", var_7_42)

	local function var_7_43()
		var_7_8:AnimateSequence("ButtonOver")
		var_7_12:AnimateSequence("ButtonOver")
		var_7_14:AnimateSequence("ButtonOver")
		var_7_16:AnimateSequence("ButtonOver")
		var_7_22:AnimateSequence("ButtonOver")
	end

	var_7_0._sequences.ButtonOver = var_7_43

	local var_7_44
	local var_7_45 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("ButtonUp", var_7_45)

	local var_7_46 = {
		{
			value = 12566463,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_12:RegisterAnimationSequence("ButtonUp", var_7_46)

	local var_7_47 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.defaultItemHeader
		}
	}

	var_7_14:RegisterAnimationSequence("ButtonUp", var_7_47)

	local var_7_48 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_7_16:RegisterAnimationSequence("ButtonUp", var_7_48)

	local var_7_49 = {
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

	var_7_22:RegisterAnimationSequence("ButtonUp", var_7_49)

	local function var_7_50()
		var_7_8:AnimateSequence("ButtonUp")
		var_7_12:AnimateSequence("ButtonUp")
		var_7_14:AnimateSequence("ButtonUp")
		var_7_16:AnimateSequence("ButtonUp")
		var_7_22:AnimateSequence("ButtonUp")
	end

	var_7_0._sequences.ButtonUp = var_7_50

	local function var_7_51()
		return
	end

	var_7_0._sequences.NewNotification = var_7_51

	local var_7_52
	local var_7_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("LoadoutEdit", var_7_53)

	local var_7_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LoadoutEdit", var_7_54)

	local var_7_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("LoadoutEdit", var_7_55)

	local var_7_56 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_16:RegisterAnimationSequence("LoadoutEdit", var_7_56)

	local var_7_57 = {
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

	var_7_22:RegisterAnimationSequence("LoadoutEdit", var_7_57)

	local var_7_58 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_7_25:RegisterAnimationSequence("LoadoutEdit", var_7_58)

	local function var_7_59()
		var_7_4:AnimateSequence("LoadoutEdit")
		var_7_6:AnimateSequence("LoadoutEdit")
		var_7_8:AnimateSequence("LoadoutEdit")
		var_7_16:AnimateSequence("LoadoutEdit")
		var_7_22:AnimateSequence("LoadoutEdit")
		var_7_25:AnimateSequence("LoadoutEdit")
	end

	var_7_0._sequences.LoadoutEdit = var_7_59

	local var_7_60
	local var_7_61 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker,
			child = var_7_0.DoubleNotchedBacker.Background
		}
	}

	var_7_4:RegisterAnimationSequence("LoadoutPreview", var_7_61)

	local var_7_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("LoadoutPreview", var_7_62)

	local var_7_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("LoadoutPreview", var_7_63)

	local var_7_64 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_7_16:RegisterAnimationSequence("LoadoutPreview", var_7_64)

	local var_7_65 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_7_22:RegisterAnimationSequence("LoadoutPreview", var_7_65)

	local var_7_66 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_7_25:RegisterAnimationSequence("LoadoutPreview", var_7_66)

	local function var_7_67()
		var_7_4:AnimateSequence("LoadoutPreview")
		var_7_6:AnimateSequence("LoadoutPreview")
		var_7_8:AnimateSequence("LoadoutPreview")
		var_7_16:AnimateSequence("LoadoutPreview")
		var_7_22:AnimateSequence("LoadoutPreview")
		var_7_25:AnimateSequence("LoadoutPreview")
	end

	var_7_0._sequences.LoadoutPreview = var_7_67

	local var_7_68
	local var_7_69 = {
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

	var_7_18:RegisterAnimationSequence("ProgressBarUp", var_7_69)

	local var_7_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -40
		}
	}

	var_7_20:RegisterAnimationSequence("ProgressBarUp", var_7_70)

	if CONDITIONS.InFrontend(var_7_0) then
		local var_7_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			},
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_23:RegisterAnimationSequence("ProgressBarUp", var_7_71)
	end

	local var_7_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_7_29:RegisterAnimationSequence("ProgressBarUp", var_7_72)

	local function var_7_73()
		var_7_18:AnimateSequence("ProgressBarUp")
		var_7_20:AnimateSequence("ProgressBarUp")

		if CONDITIONS.InFrontend(var_7_0) then
			var_7_23:AnimateSequence("ProgressBarUp")
		end

		var_7_29:AnimateSequence("ProgressBarUp")
	end

	var_7_0._sequences.ProgressBarUp = var_7_73

	local var_7_74
	local var_7_75 = {
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

	var_7_18:RegisterAnimationSequence("ProgressBarOver", var_7_75)

	local var_7_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -40
		}
	}

	var_7_20:RegisterAnimationSequence("ProgressBarOver", var_7_76)

	if CONDITIONS.InFrontend(var_7_0) then
		local var_7_77 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_23:RegisterAnimationSequence("ProgressBarOver", var_7_77)
	end

	local var_7_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_7_29:RegisterAnimationSequence("ProgressBarOver", var_7_78)

	local function var_7_79()
		var_7_18:AnimateSequence("ProgressBarOver")
		var_7_20:AnimateSequence("ProgressBarOver")

		if CONDITIONS.InFrontend(var_7_0) then
			var_7_23:AnimateSequence("ProgressBarOver")
		end

		var_7_29:AnimateSequence("ProgressBarOver")
	end

	var_7_0._sequences.ProgressBarOver = var_7_79

	local var_7_80
	local var_7_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		}
	}

	var_7_16:RegisterAnimationSequence("AR", var_7_81)

	local var_7_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -20
		}
	}

	var_7_18:RegisterAnimationSequence("AR", var_7_82)

	local var_7_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -47
		}
	}

	var_7_20:RegisterAnimationSequence("AR", var_7_83)

	local var_7_84 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_7_22:RegisterAnimationSequence("AR", var_7_84)

	local var_7_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 125
		}
	}

	var_7_25:RegisterAnimationSequence("AR", var_7_85)

	local var_7_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -22
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_7_29:RegisterAnimationSequence("AR", var_7_86)

	local var_7_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -45
		}
	}

	var_7_31:RegisterAnimationSequence("AR", var_7_87)

	local function var_7_88()
		var_7_16:AnimateSequence("AR")
		var_7_18:AnimateSequence("AR")
		var_7_20:AnimateSequence("AR")
		var_7_22:AnimateSequence("AR")
		var_7_25:AnimateSequence("AR")
		var_7_29:AnimateSequence("AR")
		var_7_31:AnimateSequence("AR")
	end

	var_7_0._sequences.AR = var_7_88

	local var_7_89
	local var_7_90 = {
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

	var_7_18:RegisterAnimationSequence("ARProgressBarOver", var_7_90)

	local var_7_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_7_20:RegisterAnimationSequence("ARProgressBarOver", var_7_91)

	local var_7_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_7_22:RegisterAnimationSequence("ARProgressBarOver", var_7_92)

	if CONDITIONS.InFrontend(var_7_0) then
		local var_7_93 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.description
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_23:RegisterAnimationSequence("ARProgressBarOver", var_7_93)
	end

	local var_7_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_7_29:RegisterAnimationSequence("ARProgressBarOver", var_7_94)

	local function var_7_95()
		var_7_18:AnimateSequence("ARProgressBarOver")
		var_7_20:AnimateSequence("ARProgressBarOver")
		var_7_22:AnimateSequence("ARProgressBarOver")

		if CONDITIONS.InFrontend(var_7_0) then
			var_7_23:AnimateSequence("ARProgressBarOver")
		end

		var_7_29:AnimateSequence("ARProgressBarOver")
	end

	var_7_0._sequences.ARProgressBarOver = var_7_95

	local var_7_96
	local var_7_97 = {
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

	var_7_18:RegisterAnimationSequence("ARProgressBarUp", var_7_97)

	local var_7_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -42
		}
	}

	var_7_20:RegisterAnimationSequence("ARProgressBarUp", var_7_98)

	local var_7_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_7_22:RegisterAnimationSequence("ARProgressBarUp", var_7_99)

	if CONDITIONS.InFrontend(var_7_0) then
		local var_7_100 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.AAR.AARdescription
			},
			{
				value = 0.3,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_23:RegisterAnimationSequence("ARProgressBarUp", var_7_100)
	end

	local var_7_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -46
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		}
	}

	var_7_29:RegisterAnimationSequence("ARProgressBarUp", var_7_101)

	local function var_7_102()
		var_7_18:AnimateSequence("ARProgressBarUp")
		var_7_20:AnimateSequence("ARProgressBarUp")
		var_7_22:AnimateSequence("ARProgressBarUp")

		if CONDITIONS.InFrontend(var_7_0) then
			var_7_23:AnimateSequence("ARProgressBarUp")
		end

		var_7_29:AnimateSequence("ARProgressBarUp")
	end

	var_7_0._sequences.ARProgressBarUp = var_7_102

	local var_7_103
	local var_7_104 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_7_31:RegisterAnimationSequence("ButtonOverBlueprint", var_7_104)

	local function var_7_105()
		var_7_31:AnimateSequence("ButtonOverBlueprint")
	end

	var_7_0._sequences.ButtonOverBlueprint = var_7_105

	local var_7_106
	local var_7_107 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_7_31:RegisterAnimationSequence("ButtonUpBlueprint", var_7_107)

	local function var_7_108()
		var_7_31:AnimateSequence("ButtonUpBlueprint")
	end

	var_7_0._sequences.ButtonUpBlueprint = var_7_108

	local var_7_109
	local var_7_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_31:RegisterAnimationSequence("HideBlueprint", var_7_110)

	local function var_7_111()
		var_7_31:AnimateSequence("HideBlueprint")
	end

	var_7_0._sequences.HideBlueprint = var_7_111

	local var_7_112
	local var_7_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_33:RegisterAnimationSequence("RestrictionOn", var_7_113)

	local function var_7_114()
		var_7_33:AnimateSequence("RestrictionOn")
	end

	var_7_0._sequences.RestrictionOn = var_7_114

	local var_7_115
	local var_7_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_33:RegisterAnimationSequence("RestrictionOff", var_7_116)

	local function var_7_117()
		var_7_33:AnimateSequence("RestrictionOff")
	end

	var_7_0._sequences.RestrictionOff = var_7_117

	var_0_1(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("LoadoutWeaponButton", LoadoutWeaponButton)
LockTable(_M)
