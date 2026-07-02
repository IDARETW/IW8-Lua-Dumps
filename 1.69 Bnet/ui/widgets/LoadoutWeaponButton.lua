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
			arg_1_0.DynamicWeaponIcon:PerformUpdate(arg_1_1, {
				isInteractive = false,
				attachmentsData = var_1_5,
				weaponRef = arg_1_2,
				weaponFullName = var_1_3
			})

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

	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		if arg_1_0._isBlueprint then
			ACTIONS.AnimateSequence(arg_1_0, "ButtonOverBlueprint")
		end

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarOver")
		end

		ACTIONS.AnimateSequence(arg_1_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		if arg_1_0._isBlueprint then
			ACTIONS.AnimateSequence(arg_1_0, "ButtonUpBlueprint")
		end

		if IsLanguageArabic() then
			ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarUp")
		end

		if not arg_1_0._isInPreviewState then
			ACTIONS.AnimateSequence(arg_1_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "ARProgressBarUp")
	end

	arg_1_0.AttributeIcon:SetAlpha(0)

	arg_1_0._hasAttribute = false

	local var_1_9 = WEAPON.GenerateWeaponTable(arg_1_6)

	if #arg_1_3 > 0 then
		arg_1_0._isBlueprint = true

		arg_1_0.BlueprintIcon:setImage(RegisterMaterial("icon_mod"))
		arg_1_0.WeaponName:setText(arg_1_3)
	elseif arg_1_6 and arg_1_6.lootItemID:get() ~= LOOT.emptyID and not arg_1_7 then
		arg_1_0._isBlueprint = true

		arg_1_0.BlueprintIcon:setImage(RegisterMaterial("icon_blueprint"))
		arg_1_0.WeaponName:setText(WEAPON.GetLootWeaponName(arg_1_2, arg_1_6.lootItemID:get()))
	else
		arg_1_0._isBlueprint = false

		local var_1_10 = ""

		if arg_1_6 then
			for iter_1_0 = 1, #var_1_9.attachments do
				local var_1_11 = var_1_9.attachments[iter_1_0]

				if var_1_11.ref and #var_1_11.ref > 0 and ATTACHMENT.IsDisplayNameAvailable(var_1_11.ref) then
					if var_1_10 == "" then
						var_1_10 = ATTACHMENT.GetName(var_1_11.ref)
					else
						var_1_10 = var_1_10 .. " " .. ATTACHMENT.GetName(var_1_11.ref)
					end
				end
			end
		end

		arg_1_0.WeaponName:setText(WEAPON.GetName(arg_1_2) .. " " .. var_1_10)
	end

	if arg_1_6 and var_1_9 and not arg_1_8 then
		local var_1_12
		local var_1_13 = WEAPON.GetDismembermentType(var_1_9)
		local var_1_14 = WEAPON.GetTracerType(arg_1_6.lootItemID:get())

		if var_1_13 and Loot.DEBEIFJEEG(arg_1_1, arg_1_6.lootItemID:get()) > 0 or var_1_13 and arg_1_6.lootItemID:get() == 0 then
			var_1_12 = var_1_13
		elseif var_1_14 then
			var_1_12 = var_1_14
		end

		if var_1_12 then
			local var_1_15 = WEAPON.GetSpecialAttributeIcon(var_1_12)
			local var_1_16 = WEAPON.GetSpecialAttributeIconColor(var_1_12)

			arg_1_0.AttributeIcon:SetRGBFromTable(var_1_12 == var_1_14 and var_1_16 or COLORS.white)

			arg_1_0._hasAttribute = true

			arg_1_0.AttributeIcon:setImage(RegisterMaterial(var_1_15))
			arg_1_0.AttributeIcon:SetAlpha(1)
		end
	end

	if arg_1_0._isBlueprint then
		local var_1_17 = LAYOUT.GetTextWidth(arg_1_0.WeaponName)
		local var_1_18 = LAYOUT.GetElementWidth(arg_1_0.BlueprintIcon)
		local var_1_19 = 2 * _1080p

		if not IsLanguageArabic() then
			local var_1_20 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().left

			arg_1_0.BlueprintIcon:SetLeft(var_1_20 + var_1_19 + var_1_17)
			arg_1_0.BlueprintIcon:SetRight(var_1_20 + var_1_19 + var_1_17 + var_1_18)
		else
			local var_1_21 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().right
			local var_1_22 = 10 * _1080p

			arg_1_0.BlueprintIcon:SetLeft(var_1_21 - var_1_22 - var_1_17 - var_1_18)
			arg_1_0.BlueprintIcon:SetRight(var_1_21 - var_1_22 - var_1_17)
		end

		if arg_1_0._hasAttribute then
			local var_1_23 = LAYOUT.GetElementWidth(arg_1_0.AttributeIcon)

			if not IsLanguageArabic() then
				local var_1_24 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().left
				local var_1_25 = 4 * _1080p

				arg_1_0.AttributeIcon:SetLeft(var_1_24 + var_1_17 + var_1_25 + var_1_18 + var_1_25)
				arg_1_0.AttributeIcon:SetRight(var_1_24 + var_1_17 + var_1_25 + var_1_18 + var_1_25 + var_1_23)
			else
				local var_1_26 = arg_1_0.WeaponName:GetCurrentAnchorsAndPositions().right
				local var_1_27 = 10 * _1080p

				arg_1_0.AttributeIcon:SetLeft(var_1_26 - var_1_27 - var_1_17 - var_1_18 - var_1_27 - var_1_23)
				arg_1_0.AttributeIcon:SetRight(var_1_26 - var_1_27 - var_1_17 - var_1_18)
			end
		end

		ACTIONS.AnimateSequence(arg_1_0, "ButtonUpBlueprint")
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideBlueprint")
	end

	if arg_1_2 == "none" then
		arg_1_0.Image:SetAlpha(0)
		arg_1_0.WeaponClass:setText(Engine.CBBHFCGDIC("LUA_MENU/RULES_NONE"))
		arg_1_0.WeaponLevel:setText("")
		arg_1_0.Title:setText("")
	else
		arg_1_0.WeaponClass:setText(Engine.CBBHFCGDIC(var_1_1))
		arg_1_0.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_FACTION_LEVEL", PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)))
		arg_1_0.Title:setText(arg_1_5)
	end

	local var_1_28 = PROGRESSION.GetWeaponXP(arg_1_1, arg_1_2)
	local var_1_29 = PROGRESSION.GetWeaponCurrentLevelXP(arg_1_1, arg_1_2)
	local var_1_30 = PROGRESSION.GetWeaponNextLevelXP(arg_1_1, arg_1_2)

	if arg_1_2 == "none" then
		arg_1_0.XPText:setText("")
	elseif PROGRESSION.IsWeaponMaxLevel(arg_1_1, arg_1_2) then
		arg_1_0.XPText:setText("")

		if CONDITIONS.IsWZWipFlowEnabled() then
			arg_1_0.WeaponLevel:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX_LEVEL_NUMBER", PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2)))
		end
	else
		arg_1_0.XPText:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y_XP", var_1_28 - var_1_29, var_1_30 - var_1_29))
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetupButton = var_0_0
	arg_4_0.DisplayIcon = arg_4_0.Image
	arg_4_0._isBlueprint = false

	THEMES.ApplyRandomMaskRotation(arg_4_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_4_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_4_0, "WZWipSetup")
	end
end

function LoadoutWeaponButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 404 * _1080p, 0, 190 * _1080p)

	var_5_0.id = "LoadoutWeaponButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0, 0)
	var_5_4.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
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

	var_5_8.id = "Background"

	var_5_8:SetAlpha(0.8, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.Background = var_5_8

	local var_5_9

	if CONDITIONS.IsMagmaGameMode() then
		local var_5_10 = MenuBuilder.BuildRegisteredType("BRRarityColorBackground", {
			controllerIndex = var_5_1
		})

		var_5_10.id = "RarityColorBackground"

		var_5_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_5_0:addElement(var_5_10)

		var_5_0.RarityColorBackground = var_5_10
	end

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "DynamicWeaponIcon"

	var_5_12:SetRGBFromInt(12566463, 0)
	var_5_12:SetScale(-0.2, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -115, _1080p * 115, _1080p * -57, _1080p * 57)
	var_5_0:addElement(var_5_12)

	var_5_0.DynamicWeaponIcon = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "Image"

	var_5_14:SetRGBFromTable(SWATCHES.CAC.defaultItemHeader, 0)
	var_5_14:SetColorOp(COLOR_OP.saturation, 0)
	var_5_14:SetColorOpParam(1, 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -115, _1080p * 115, _1080p * -53, _1080p * 63)
	var_5_0:addElement(var_5_14)

	var_5_0.Image = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIText.new()

	var_5_16.id = "WeaponName"

	var_5_16:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_16:SetAlpha(0.8, 0)
	var_5_16:setText("", 0)
	var_5_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_16:SetAlignment(LUI.Alignment.Left)
	var_5_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 380, _1080p * 35, _1080p * 57)
	var_5_0:addElement(var_5_16)

	var_5_0.WeaponName = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "WeaponLevel"

	var_5_18:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_18:setText(ToUpperCase(""), 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Left)
	var_5_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_18:SetStartupDelay(2000)
	var_5_18:SetLineHoldTime(400)
	var_5_18:SetAnimMoveTime(300)
	var_5_18:SetAnimMoveSpeed(50)
	var_5_18:SetEndDelay(1500)
	var_5_18:SetCrossfadeTime(750)
	var_5_18:SetFadeInTime(300)
	var_5_18:SetFadeOutTime(300)
	var_5_18:SetMaxVisibleLines(1)
	var_5_18:SetOutlineRGBFromInt(0, 0)
	var_5_18:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -40, _1080p * -22)
	var_5_0:addElement(var_5_18)

	var_5_0.WeaponLevel = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "WeaponClass"

	var_5_20:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_20:setText(ToUpperCase(""), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_20:SetStartupDelay(2000)
	var_5_20:SetLineHoldTime(400)
	var_5_20:SetAnimMoveTime(300)
	var_5_20:SetAnimMoveSpeed(50)
	var_5_20:SetEndDelay(1500)
	var_5_20:SetCrossfadeTime(750)
	var_5_20:SetFadeInTime(300)
	var_5_20:SetFadeOutTime(300)
	var_5_20:SetMaxVisibleLines(1)
	var_5_20:SetOutlineRGBFromInt(0, 0)
	var_5_20:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -58, _1080p * -40)
	var_5_0:addElement(var_5_20)

	var_5_0.WeaponClass = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIText.new()

	var_5_22.id = "Title"

	var_5_22:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_22:SetAlpha(0.8, 0)
	var_5_22:setText("", 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 275, _1080p * 11, _1080p * 35)
	var_5_0:addElement(var_5_22)

	var_5_0.Title = var_5_22

	local var_5_23

	if CONDITIONS.InFrontend() then
		var_5_23 = MenuBuilder.BuildRegisteredType("WeaponLevelBar", {
			controllerIndex = var_5_1
		})
		var_5_23.id = "WeaponLevelBar"

		var_5_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_23:SetAlpha(0.3, 0)
		var_5_23:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -19, _1080p * -11)
		var_5_0:addElement(var_5_23)

		var_5_0.WeaponLevelBar = var_5_23
	end

	local var_5_24

	if not CONDITIONS.IsSplitscreen() then
		local var_5_25 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_5_1
		})

		var_5_25.id = "NewItemSmallIcon"

		var_5_25:SetAlpha(0, 0)
		var_5_25:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -16, _1080p * -8, _1080p * 8, _1080p * 16)
		var_5_0:addElement(var_5_25)

		var_5_0.NewItemSmallIcon = var_5_25
	end

	local var_5_26
	local var_5_27 = LUI.UIStyledText.new()

	var_5_27.id = "XPText"

	var_5_27:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_27:setText(ToUpperCase(""), 0)
	var_5_27:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_5_27:SetWordWrap(false)
	var_5_27:SetAlignment(LUI.Alignment.Right)
	var_5_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_27:SetOutlineRGBFromInt(0, 0)
	var_5_27:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 155, _1080p * -24, _1080p * -40, _1080p * -22)
	var_5_0:addElement(var_5_27)

	var_5_0.XPText = var_5_27

	local var_5_28
	local var_5_29 = LUI.UIImage.new()

	var_5_29.id = "BlueprintIcon"

	var_5_29:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_5_29:SetAlpha(0, 0)
	var_5_29:setImage(RegisterMaterial("icon_blueprint"), 0)
	var_5_29:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 144, _1080p * 160, _1080p * -56, _1080p * -40)
	var_5_0:addElement(var_5_29)

	var_5_0.BlueprintIcon = var_5_29

	local var_5_30
	local var_5_31 = LUI.UIImage.new()

	var_5_31.id = "RestrictionWarning"

	var_5_31:SetAlpha(0, 0)
	var_5_31:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_5_31:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -37, _1080p * -2, _1080p * 74, _1080p * 109)
	var_5_0:addElement(var_5_31)

	var_5_0.RestrictionWarning = var_5_31

	local var_5_32
	local var_5_33 = LUI.UIImage.new()

	var_5_33.id = "AttributeIcon"

	var_5_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 136, _1080p * 176, _1080p * 36, _1080p * 56)
	var_5_0:addElement(var_5_33)

	var_5_0.AttributeIcon = var_5_33

	local var_5_34
	local var_5_35 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BRLootCardCircleToggle", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 2,
		columnWidth = _1080p * 20,
		rowHeight = _1080p * 20,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_36 = LUI.UIGrid.new(var_5_35)

	var_5_36.id = "Grid"

	var_5_36:SetAlpha(0.6, 0)
	var_5_36:SetScale(-0.1, 0)
	var_5_36:setUseStencil(false)
	var_5_36:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -122, _1080p * -14, _1080p * 12, _1080p * 54)
	var_5_0:addElement(var_5_36)

	var_5_0.Grid = var_5_36

	local var_5_37

	if CONDITIONS.IsVanguardRevealed() then
		var_5_37 = LUI.UIImage.new()
		var_5_37.id = "Mask"

		var_5_37:SetAlpha(0, 0)
		var_5_37:setImage(RegisterMaterial("ui_mp_wz_bkg_button_5"), 0)
		var_5_0:addElement(var_5_37)

		var_5_0.Mask = var_5_37
	end

	local function var_5_38()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_38

	local var_5_39
	local var_5_40 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_40)

	local var_5_41 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_41)

	local var_5_42 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_42)

	local var_5_43 = {
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

	var_5_16:RegisterAnimationSequence("ButtonOver", var_5_43)

	local var_5_44 = {
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

	var_5_22:RegisterAnimationSequence("ButtonOver", var_5_44)

	local function var_5_45()
		var_5_8:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
		var_5_16:AnimateSequence("ButtonOver")
		var_5_22:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_47)

	local var_5_48 = {
		{
			value = 12566463,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_48)

	local var_5_49 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.defaultItemHeader
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_49)

	local var_5_50 = {
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

	var_5_16:RegisterAnimationSequence("ButtonUp", var_5_50)

	local var_5_51 = {
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

	var_5_22:RegisterAnimationSequence("ButtonUp", var_5_51)

	local function var_5_52()
		var_5_8:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
		var_5_16:AnimateSequence("ButtonUp")
		var_5_22:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_52

	local function var_5_53()
		return
	end

	var_5_0._sequences.NewNotification = var_5_53

	local var_5_54
	local var_5_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutEdit", var_5_55)

	local var_5_56 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutEdit", var_5_56)

	local var_5_57 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutEdit", var_5_57)

	local var_5_58 = {
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

	var_5_16:RegisterAnimationSequence("LoadoutEdit", var_5_58)

	local var_5_59 = {
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

	var_5_22:RegisterAnimationSequence("LoadoutEdit", var_5_59)

	local function var_5_60()
		var_5_4:AnimateSequence("LoadoutEdit")
		var_5_6:AnimateSequence("LoadoutEdit")
		var_5_8:AnimateSequence("LoadoutEdit")
		var_5_16:AnimateSequence("LoadoutEdit")
		var_5_22:AnimateSequence("LoadoutEdit")
	end

	var_5_0._sequences.LoadoutEdit = var_5_60

	local var_5_61
	local var_5_62 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker,
			child = var_5_0.DoubleNotchedBacker.Background
		}
	}

	var_5_4:RegisterAnimationSequence("LoadoutPreview", var_5_62)

	local var_5_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("LoadoutPreview", var_5_63)

	local var_5_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("LoadoutPreview", var_5_64)

	local var_5_65 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_16:RegisterAnimationSequence("LoadoutPreview", var_5_65)

	local var_5_66 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		}
	}

	var_5_22:RegisterAnimationSequence("LoadoutPreview", var_5_66)

	local var_5_67 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_36:RegisterAnimationSequence("LoadoutPreview", var_5_67)

	local function var_5_68()
		var_5_4:AnimateSequence("LoadoutPreview")
		var_5_6:AnimateSequence("LoadoutPreview")
		var_5_8:AnimateSequence("LoadoutPreview")
		var_5_16:AnimateSequence("LoadoutPreview")
		var_5_22:AnimateSequence("LoadoutPreview")
		var_5_36:AnimateSequence("LoadoutPreview")
	end

	var_5_0._sequences.LoadoutPreview = var_5_68

	local var_5_69
	local var_5_70 = {
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

	var_5_18:RegisterAnimationSequence("ProgressBarUp", var_5_70)

	local var_5_71 = {
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

	var_5_20:RegisterAnimationSequence("ProgressBarUp", var_5_71)

	if CONDITIONS.InFrontend() then
		local var_5_72 = {
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

		var_5_23:RegisterAnimationSequence("ProgressBarUp", var_5_72)
	end

	local var_5_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_5_27:RegisterAnimationSequence("ProgressBarUp", var_5_73)

	local function var_5_74()
		var_5_18:AnimateSequence("ProgressBarUp")
		var_5_20:AnimateSequence("ProgressBarUp")

		if CONDITIONS.InFrontend() then
			var_5_23:AnimateSequence("ProgressBarUp")
		end

		var_5_27:AnimateSequence("ProgressBarUp")
	end

	var_5_0._sequences.ProgressBarUp = var_5_74

	local var_5_75
	local var_5_76 = {
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

	var_5_18:RegisterAnimationSequence("ProgressBarOver", var_5_76)

	local var_5_77 = {
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

	var_5_20:RegisterAnimationSequence("ProgressBarOver", var_5_77)

	if CONDITIONS.InFrontend() then
		local var_5_78 = {
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

		var_5_23:RegisterAnimationSequence("ProgressBarOver", var_5_78)
	end

	local var_5_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_27:RegisterAnimationSequence("ProgressBarOver", var_5_79)

	local function var_5_80()
		var_5_18:AnimateSequence("ProgressBarOver")
		var_5_20:AnimateSequence("ProgressBarOver")

		if CONDITIONS.InFrontend() then
			var_5_23:AnimateSequence("ProgressBarOver")
		end

		var_5_27:AnimateSequence("ProgressBarOver")
	end

	var_5_0._sequences.ProgressBarOver = var_5_80

	local var_5_81
	local var_5_82 = {
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

	var_5_16:RegisterAnimationSequence("AR", var_5_82)

	local var_5_83 = {
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

	var_5_18:RegisterAnimationSequence("AR", var_5_83)

	local var_5_84 = {
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

	var_5_20:RegisterAnimationSequence("AR", var_5_84)

	local var_5_85 = {
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

	var_5_22:RegisterAnimationSequence("AR", var_5_85)

	local var_5_86 = {
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

	var_5_27:RegisterAnimationSequence("AR", var_5_86)

	local var_5_87 = {
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

	var_5_29:RegisterAnimationSequence("AR", var_5_87)

	local function var_5_88()
		var_5_16:AnimateSequence("AR")
		var_5_18:AnimateSequence("AR")
		var_5_20:AnimateSequence("AR")
		var_5_22:AnimateSequence("AR")
		var_5_27:AnimateSequence("AR")
		var_5_29:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_88

	local var_5_89
	local var_5_90 = {
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

	var_5_18:RegisterAnimationSequence("ARProgressBarOver", var_5_90)

	local var_5_91 = {
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

	var_5_20:RegisterAnimationSequence("ARProgressBarOver", var_5_91)

	local var_5_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_5_22:RegisterAnimationSequence("ARProgressBarOver", var_5_92)

	if CONDITIONS.InFrontend() then
		local var_5_93 = {
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

		var_5_23:RegisterAnimationSequence("ARProgressBarOver", var_5_93)
	end

	local var_5_94 = {
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

	var_5_27:RegisterAnimationSequence("ARProgressBarOver", var_5_94)

	local function var_5_95()
		var_5_18:AnimateSequence("ARProgressBarOver")
		var_5_20:AnimateSequence("ARProgressBarOver")
		var_5_22:AnimateSequence("ARProgressBarOver")

		if CONDITIONS.InFrontend() then
			var_5_23:AnimateSequence("ARProgressBarOver")
		end

		var_5_27:AnimateSequence("ARProgressBarOver")
	end

	var_5_0._sequences.ARProgressBarOver = var_5_95

	local var_5_96
	local var_5_97 = {
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

	var_5_18:RegisterAnimationSequence("ARProgressBarUp", var_5_97)

	local var_5_98 = {
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

	var_5_20:RegisterAnimationSequence("ARProgressBarUp", var_5_98)

	local var_5_99 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 380
		}
	}

	var_5_22:RegisterAnimationSequence("ARProgressBarUp", var_5_99)

	if CONDITIONS.InFrontend() then
		local var_5_100 = {
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

		var_5_23:RegisterAnimationSequence("ARProgressBarUp", var_5_100)
	end

	local var_5_101 = {
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

	var_5_27:RegisterAnimationSequence("ARProgressBarUp", var_5_101)

	local function var_5_102()
		var_5_18:AnimateSequence("ARProgressBarUp")
		var_5_20:AnimateSequence("ARProgressBarUp")
		var_5_22:AnimateSequence("ARProgressBarUp")

		if CONDITIONS.InFrontend() then
			var_5_23:AnimateSequence("ARProgressBarUp")
		end

		var_5_27:AnimateSequence("ARProgressBarUp")
	end

	var_5_0._sequences.ARProgressBarUp = var_5_102

	local var_5_103
	local var_5_104 = {
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

	var_5_29:RegisterAnimationSequence("ButtonOverBlueprint", var_5_104)

	local function var_5_105()
		var_5_29:AnimateSequence("ButtonOverBlueprint")
	end

	var_5_0._sequences.ButtonOverBlueprint = var_5_105

	local var_5_106
	local var_5_107 = {
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

	var_5_29:RegisterAnimationSequence("ButtonUpBlueprint", var_5_107)

	local function var_5_108()
		var_5_29:AnimateSequence("ButtonUpBlueprint")
	end

	var_5_0._sequences.ButtonUpBlueprint = var_5_108

	local var_5_109
	local var_5_110 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_29:RegisterAnimationSequence("HideBlueprint", var_5_110)

	local function var_5_111()
		var_5_29:AnimateSequence("HideBlueprint")
	end

	var_5_0._sequences.HideBlueprint = var_5_111

	local var_5_112
	local var_5_113 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_31:RegisterAnimationSequence("RestrictionOn", var_5_113)

	local function var_5_114()
		var_5_31:AnimateSequence("RestrictionOn")
	end

	var_5_0._sequences.RestrictionOn = var_5_114

	local var_5_115
	local var_5_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_31:RegisterAnimationSequence("RestrictionOff", var_5_116)

	local function var_5_117()
		var_5_31:AnimateSequence("RestrictionOff")
	end

	var_5_0._sequences.RestrictionOff = var_5_117

	local var_5_118
	local var_5_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.panelBacker,
			child = var_5_0.DoubleNotchedBacker.Background
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipSetup", var_5_119)

	local var_5_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("WZWipSetup", var_5_120)

	local var_5_121 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipSetup", var_5_121)

	local var_5_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipSetup", var_5_122)

	local var_5_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipSetup", var_5_123)

	local var_5_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipSetup", var_5_124)

	local var_5_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipSetup", var_5_125)

	local var_5_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_27:RegisterAnimationSequence("WZWipSetup", var_5_126)

	if CONDITIONS.IsVanguardRevealed() then
		local var_5_127 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_5_37:RegisterAnimationSequence("WZWipSetup", var_5_127)
	end

	local function var_5_128()
		var_5_4:AnimateSequence("WZWipSetup")
		var_5_6:AnimateSequence("WZWipSetup")
		var_5_8:AnimateSequence("WZWipSetup")
		var_5_16:AnimateSequence("WZWipSetup")
		var_5_18:AnimateSequence("WZWipSetup")
		var_5_20:AnimateSequence("WZWipSetup")
		var_5_22:AnimateSequence("WZWipSetup")
		var_5_27:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsVanguardRevealed() then
			var_5_37:AnimateSequence("WZWipSetup")
		end
	end

	var_5_0._sequences.WZWipSetup = var_5_128

	local var_5_129
	local var_5_130 = {
		{
			value = 12566463,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipButtonUp", var_5_130)

	local var_5_131 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.defaultItemHeader
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonUp", var_5_131)

	local var_5_132 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonUp", var_5_132)

	local var_5_133 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipButtonUp", var_5_133)

	local var_5_134 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipButtonUp", var_5_134)

	local var_5_135 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipButtonUp", var_5_135)

	local var_5_136 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_27:RegisterAnimationSequence("WZWipButtonUp", var_5_136)

	local function var_5_137()
		var_5_12:AnimateSequence("WZWipButtonUp")
		var_5_14:AnimateSequence("WZWipButtonUp")
		var_5_16:AnimateSequence("WZWipButtonUp")
		var_5_18:AnimateSequence("WZWipButtonUp")
		var_5_20:AnimateSequence("WZWipButtonUp")
		var_5_22:AnimateSequence("WZWipButtonUp")
		var_5_27:AnimateSequence("WZWipButtonUp")
	end

	var_5_0._sequences.WZWipButtonUp = var_5_137

	local var_5_138
	local var_5_139 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipButtonOver", var_5_139)

	local var_5_140 = {
		{
			value = 16777215,
			duration = 150,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipButtonOver", var_5_140)

	local var_5_141 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipButtonOver", var_5_141)

	local var_5_142 = {
		{
			value = 0.8,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipButtonOver", var_5_142)

	local var_5_143 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipButtonOver", var_5_143)

	local var_5_144 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipButtonOver", var_5_144)

	local var_5_145 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_27:RegisterAnimationSequence("WZWipButtonOver", var_5_145)

	local function var_5_146()
		var_5_12:AnimateSequence("WZWipButtonOver")
		var_5_14:AnimateSequence("WZWipButtonOver")
		var_5_16:AnimateSequence("WZWipButtonOver")
		var_5_18:AnimateSequence("WZWipButtonOver")
		var_5_20:AnimateSequence("WZWipButtonOver")
		var_5_22:AnimateSequence("WZWipButtonOver")
		var_5_27:AnimateSequence("WZWipButtonOver")
	end

	var_5_0._sequences.WZWipButtonOver = var_5_146

	local var_5_147
	local var_5_148 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_148)

	local var_5_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_149)

	local var_5_150 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_150)

	local var_5_151 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_151)

	local var_5_152 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_152)

	local var_5_153 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_153)

	local var_5_154 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_27:RegisterAnimationSequence("WZWipLoadoutPreview", var_5_154)

	local function var_5_155()
		var_5_4:AnimateSequence("WZWipLoadoutPreview")
		var_5_8:AnimateSequence("WZWipLoadoutPreview")
		var_5_16:AnimateSequence("WZWipLoadoutPreview")
		var_5_18:AnimateSequence("WZWipLoadoutPreview")
		var_5_20:AnimateSequence("WZWipLoadoutPreview")
		var_5_22:AnimateSequence("WZWipLoadoutPreview")
		var_5_27:AnimateSequence("WZWipLoadoutPreview")
	end

	var_5_0._sequences.WZWipLoadoutPreview = var_5_155

	local function var_5_156()
		return
	end

	var_5_0._sequences.WZWipProgressBarUp = var_5_156

	local var_5_157
	local var_5_158 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_158)

	local var_5_159 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_159)

	local var_5_160 = {
		{
			value = 12566463,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_12:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_160)

	local var_5_161 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.defaultItemHeader
		}
	}

	var_5_14:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_161)

	local var_5_162 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_162)

	local var_5_163 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_18:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_163)

	local var_5_164 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_164)

	local var_5_165 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_22:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_165)

	local var_5_166 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_27:RegisterAnimationSequence("WZWipLoadoutEdit", var_5_166)

	local function var_5_167()
		var_5_4:AnimateSequence("WZWipLoadoutEdit")
		var_5_8:AnimateSequence("WZWipLoadoutEdit")
		var_5_12:AnimateSequence("WZWipLoadoutEdit")
		var_5_14:AnimateSequence("WZWipLoadoutEdit")
		var_5_16:AnimateSequence("WZWipLoadoutEdit")
		var_5_18:AnimateSequence("WZWipLoadoutEdit")
		var_5_20:AnimateSequence("WZWipLoadoutEdit")
		var_5_22:AnimateSequence("WZWipLoadoutEdit")
		var_5_27:AnimateSequence("WZWipLoadoutEdit")
	end

	var_5_0._sequences.WZWipLoadoutEdit = var_5_167

	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LoadoutWeaponButton", LoadoutWeaponButton)
LockTable(_M)
