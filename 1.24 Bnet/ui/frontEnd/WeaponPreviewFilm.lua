module(..., package.seeall)

local var_0_0 = 700

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.BG:SetAlpha(1, 30)

	arg_1_0:Wait(arg_1_2).onComplete = function()
		arg_1_0.BG:SetAlpha(0, var_0_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if arg_3_3 then
		arg_3_2:SetAlpha(arg_3_4, 500)
		arg_3_2:SetDecodeLetterLength(60)
		arg_3_2:SetDecodeMaxRandChars(10)
		arg_3_2:SetDecodeUpdatesPerLetter(5)
	else
		arg_3_2:SetAlpha(0)
		arg_3_2:SetDecodeLetterLength(0)
		arg_3_2:SetDecodeMaxRandChars(0)
		arg_3_2:SetDecodeUpdatesPerLetter(0)
		arg_3_2:SetDecodeParams(0, 0, 0)
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0.categoryIndex < #arg_4_0._availableAttachmentCategoryTable then
		local var_4_0 = arg_4_0._availableAttachmentCategoryTable[arg_4_0.categoryIndex + 1]
		local var_4_1 = GUNSMITH.GetAttachmentCategoryScene(arg_4_0.weaponRef, arg_4_0.weaponTable.variantID, var_4_0)

		if var_4_1 then
			if arg_4_0.isWeaponTextAnimationFinished == false then
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponName, true, 0.6)
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponClassName, true, 0.4)

				arg_4_0.isWeaponTextAnimationFinished = true
			else
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponName, false)
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponClassName, false)
			end

			Engine.DHFCHIIJCA(var_4_1)
			var_0_1(arg_4_0, arg_4_1, 200)
		end

		arg_4_0.categoryIndex = arg_4_0.categoryIndex + 1

		if arg_4_0.categoryIndex >= #arg_4_0._availableAttachmentCategoryTable then
			arg_4_0.categoryIndex = 0
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.categoryIndex = 0
	arg_5_0.previewTimer = LUI.UITimer.new({
		interval = 4500,
		event = "preview_animation"
	})
	arg_5_0.previewTimer.id = "previewTimer"

	arg_5_0:addElement(arg_5_0.previewTimer)
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0.WeaponPreviewCamera = MenuBuilder.BuildRegisteredType("FrontendCameraMover", {
		disableInput = true,
		enableZoom = false,
		controllerIndex = arg_6_1
	})
	arg_6_0.WeaponPreviewCamera.id = "WeaponPreviewCamera"

	arg_6_0.WeaponPreviewCamera:SetLimits(-0.3, 0.3, -0.3, 0.3)
	arg_6_0.WeaponPreviewCamera:SetSwayValues(1000, 0.03, 0.05)
	arg_6_0:addElement(arg_6_0.WeaponPreviewCamera)
	arg_6_0.WeaponPreviewCamera:SetMaxZoom(0)
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0.bindButton = LUI.UIBindButton.new()
	arg_7_0.bindButton.id = "selfBindButton"

	arg_7_0:addElement(arg_7_0.bindButton)

	arg_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_7_1
	})
	arg_7_0.HelperBar.id = "HelperBar"

	arg_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_7_0.HelperBar:setPriority(10)
	arg_7_0:addElement(arg_7_0.HelperBar)
	arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if arg_7_0.WeaponPreviewCamera then
			arg_7_0.WeaponPreviewCamera:ResetCamera()
		end

		ACTIONS.LeaveMenu(arg_7_0)
	end)
	arg_7_0:registerEventHandler("preview_animation", function(arg_9_0, arg_9_1)
		var_0_3(arg_7_0, arg_7_1)
	end)
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
end

local function var_0_7(arg_10_0, arg_10_1)
	if not Engine.DDJFBBJAIG() or not arg_10_0._weaponModel then
		return
	end

	WEAPON.LoadAndSetModel(arg_10_1, arg_10_0._weaponModel, arg_10_0.weaponTable, {
		forceOffsetsAndRotations = true
	})
end

local function var_0_8(arg_11_0, arg_11_1)
	return function()
		FrontEndScene.SetExclusiveWeaponModels({
			FrontEndScene.ClientWeapons.Preview
		})

		arg_11_0._weaponModel = WEAPON.GetWeaponModel(arg_11_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.attachmentFile)

		arg_11_0:addElement(arg_11_0._weaponModel)
		var_0_7(arg_11_0, arg_11_1)
	end
end

local function var_0_9(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.weaponRef = arg_13_2.weaponTable.weapon
	arg_13_0.weaponTable = arg_13_2.weaponTable

	local var_13_0 = arg_13_0.weaponRef

	if var_13_0 then
		local var_13_1 = WEAPON.GetName(var_13_0)
		local var_13_2 = WEAPON.GetSubClass(var_13_0)
		local var_13_3

		arg_13_0._isArmoryWeapon = false

		if arg_13_0.weaponTable.lootName or arg_13_0.weaponTable.isCustom then
			var_13_3 = arg_13_0.weaponTable.blueprintName ~= "" and GUNSMITH.GetCustomModName(arg_13_0.weaponTable.blueprintName) or arg_13_0.weaponTable.lootName
			arg_13_0._isArmoryWeapon = true
		else
			var_13_3 = var_13_1
		end

		arg_13_0.WeaponName:setText(var_13_3)
		arg_13_0.WeaponClassName:setText(var_13_2)
	end

	arg_13_0.isWeaponTextAnimationFinished = false
	arg_13_0._availableAttachmentCategoryTable = GUNSMITH.GetWeaponAvailableCategoryPreviewTable(var_13_0)

	var_0_1(arg_13_0, arg_13_1, 500)
	var_0_6(arg_13_0, arg_13_1)
	var_0_4(arg_13_0, arg_13_1)
	var_0_5(arg_13_0, arg_13_1)
	var_0_3(arg_13_0, arg_13_1)
	ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
	MenuUtils.SetupSceneChangeCallback(arg_13_0, var_0_8(arg_13_0, arg_13_1))
	ACTIONS.ScaleFullscreen(arg_13_0.BG)
	LAYOUT.AddAspectRatioFadeFrame(arg_13_0, arg_13_1)
end

function WeaponPreviewFilm(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIElement.new()

	var_14_0.id = "WeaponPreviewFilm"

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "BG"

	var_14_4:SetRGBFromInt(0, 0)
	var_14_4:SetAlpha(0.2, 0)
	var_14_0:addElement(var_14_4)

	var_14_0.BG = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIStyledText.new()

	var_14_6.id = "WeaponClassName"

	var_14_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_6:SetAlpha(0, 0)
	var_14_6:setText("", 0)
	var_14_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_6:SetAlignment(LUI.Alignment.Left)
	var_14_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 358, _1080p * 1032, _1080p * 476, _1080p * 496)
	var_14_0:addElement(var_14_6)

	var_14_0.WeaponClassName = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIStyledText.new()

	var_14_8.id = "WeaponName"

	var_14_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:SetPixelGridEnabled(true)
	var_14_8:SetPixelGridContrast(0.5, 0)
	var_14_8:SetPixelGridBlockWidth(2, 0)
	var_14_8:SetPixelGridBlockHeight(2, 0)
	var_14_8:SetPixelGridGutterWidth(1, 0)
	var_14_8:SetPixelGridGutterHeight(1, 0)
	var_14_8:setText("", 0)
	var_14_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_8:SetAlignment(LUI.Alignment.Left)
	var_14_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 358, _1080p * 1032, _1080p * 416, _1080p * 476)
	var_14_0:addElement(var_14_8)

	var_14_0.WeaponName = var_14_8

	var_0_9(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("WeaponPreviewFilm", WeaponPreviewFilm)
LockTable(_M)
