module(..., package.seeall)

local var_0_0 = 700

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.BG:SetAlpha(1, 30)

	arg_1_0:Wait(arg_1_2).onComplete = function()
		arg_1_0.BG:SetAlpha(0, var_0_0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_2:SetAlpha(arg_3_3, 500)
	arg_3_2:SetDecodeLetterLength(60)
	arg_3_2:SetDecodeMaxRandChars(10)
	arg_3_2:SetDecodeUpdatesPerLetter(5)
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0.categoryIndex < #arg_4_0._availableCameraPositions then
		local var_4_0 = arg_4_0._availableCameraPositions[arg_4_0.categoryIndex + 1]

		if var_4_0 then
			if arg_4_0.isWeaponTextAnimationFinished == false then
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponName, 1)
				var_0_2(arg_4_0, arg_4_1, arg_4_0.WeaponClassName, 1)

				arg_4_0.isWeaponTextAnimationFinished = true

				ACTIONS.AnimateSequence(arg_4_0, "Show")
			else
				ACTIONS.AnimateSequence(arg_4_0, "Hide")
			end

			Engine.DHFCHIIJCA(var_4_0)
			var_0_1(arg_4_0, arg_4_1, 200)
		end

		arg_4_0.categoryIndex = arg_4_0.categoryIndex + 1

		if arg_4_0.categoryIndex >= #arg_4_0._availableCameraPositions then
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

		DebugPrint("Weapon Preview Film: secondary button pressed")
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
	DebugPrint("Weapon Preview Film: bind button set")
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

local function var_0_9(arg_13_0, arg_13_1)
	for iter_13_0 = 1, #arg_13_0._availableCameraPositions do
		if arg_13_0._availableCameraPositions[iter_13_0] == arg_13_1 then
			return true
		end
	end

	return false
end

local function var_0_10(arg_14_0, arg_14_1)
	arg_14_0._availableCameraPositions = {}

	if arg_14_0._availableAttachmentCategoryTable then
		for iter_14_0 = 1, #arg_14_0._availableAttachmentCategoryTable do
			local var_14_0 = arg_14_0._availableAttachmentCategoryTable[iter_14_0]
			local var_14_1 = GUNSMITH.GetAttachmentCategoryScene(arg_14_0.weaponRef, arg_14_0.weaponTable.variantID, var_14_0)

			if not var_0_9(arg_14_0, var_14_1) then
				table.insert(arg_14_0._availableCameraPositions, var_14_1)
			end
		end
	end
end

local function var_0_11(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.weaponRef = arg_15_2.weaponTable.weapon
	arg_15_0.weaponTable = arg_15_2.weaponTable

	local var_15_0 = arg_15_0.weaponRef

	if var_15_0 then
		arg_15_0.WeaponName:setText(WEAPON.GetName(var_15_0, {
			dataTable = arg_15_0.weaponTable
		}))
		arg_15_0.WeaponClassName:setText(WEAPON.GetSubClass(var_15_0))

		local var_15_1 = LOOT.GetBaseWeaponItemID(arg_15_0.weaponRef)

		if var_15_1 then
			local var_15_2 = LUI.GetAnimForGameSource(LOOT.GetGameSourceIDFromItemID(var_15_1))

			ACTIONS.AnimateSequence(arg_15_0, var_15_2)
			ACTIONS.AnimateSequence(arg_15_0.SnipeIcon, var_15_2)
		end
	end

	arg_15_0.isWeaponTextAnimationFinished = false
	arg_15_0._availableAttachmentCategoryTable = GUNSMITH.GetWeaponAvailableCategoryPreviewTable(var_15_0)

	var_0_1(arg_15_0, arg_15_1, 500)
	var_0_6(arg_15_0, arg_15_1)
	var_0_4(arg_15_0, arg_15_1)
	var_0_5(arg_15_0, arg_15_1)
	var_0_10(arg_15_0, arg_15_1)
	var_0_3(arg_15_0, arg_15_1)
	ClientWeapon.BHDGACCFEF(FrontEndScene.ClientWeapons.Preview, false)
	MenuUtils.SetupSceneChangeCallback(arg_15_0, var_0_8(arg_15_0, arg_15_1))
	ACTIONS.ScaleFullscreen(arg_15_0.BG)
	LAYOUT.AddAspectRatioFadeFrame(arg_15_0, arg_15_1)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_15_0, "WZSetup")
	end
end

function WeaponPreviewFilm(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0.id = "WeaponPreviewFilm"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "BG"

	var_16_4:SetRGBFromInt(0, 0)
	var_16_4:SetAlpha(0.2, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.BG = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIStyledText.new()

	var_16_6.id = "WeaponClassName"

	var_16_6:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_6:SetAlpha(0, 0)
	var_16_6:setText("", 0)
	var_16_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_6:SetAlignment(LUI.Alignment.Left)
	var_16_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 358, _1080p * 1032, _1080p * 476, _1080p * 496)
	var_16_0:addElement(var_16_6)

	var_16_0.WeaponClassName = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "WeaponName"

	var_16_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_8:SetAlpha(0, 0)
	var_16_8:setText("", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_8:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 358, _1080p * 1032, _1080p * 416, _1080p * 476)
	var_16_0:addElement(var_16_8)

	var_16_0.WeaponName = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("WZWeaponButtonSnipeIcon", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "SnipeIcon"

	var_16_10:SetAlpha(0, 0)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 219, _1080p * 333, _1080p * 416, _1080p * 475)
	var_16_0:addElement(var_16_10)

	var_16_0.SnipeIcon = var_16_10

	local function var_16_11()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_11

	local function var_16_12()
		return
	end

	var_16_0._sequences.GridBG = var_16_12

	local var_16_13
	local var_16_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_16_6:RegisterAnimationSequence("WZSetup", var_16_14)

	local var_16_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_16_8:RegisterAnimationSequence("WZSetup", var_16_15)

	local function var_16_16()
		var_16_6:AnimateSequence("WZSetup")
		var_16_8:AnimateSequence("WZSetup")
	end

	var_16_0._sequences.WZSetup = var_16_16

	local var_16_17
	local var_16_18 = {
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 489
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 381
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_16_10:RegisterAnimationSequence("MW", var_16_18)

	local function var_16_19()
		var_16_10:AnimateSequence("MW")
	end

	var_16_0._sequences.MW = var_16_19

	local var_16_20
	local var_16_21 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_16_6:RegisterAnimationSequence("Hide", var_16_21)

	local var_16_22 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_16_8:RegisterAnimationSequence("Hide", var_16_22)

	local var_16_23 = {
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_16_10:RegisterAnimationSequence("Hide", var_16_23)

	local function var_16_24()
		var_16_6:AnimateSequence("Hide")
		var_16_8:AnimateSequence("Hide")
		var_16_10:AnimateSequence("Hide")
	end

	var_16_0._sequences.Hide = var_16_24

	local var_16_25
	local var_16_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_10:RegisterAnimationSequence("Show", var_16_26)

	local function var_16_27()
		var_16_10:AnimateSequence("Show")
	end

	var_16_0._sequences.Show = var_16_27

	local var_16_28
	local var_16_29 = {
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 372
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 522
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1797
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1517
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_16_10:RegisterAnimationSequence("VG", var_16_29)

	local function var_16_30()
		var_16_10:AnimateSequence("VG")
	end

	var_16_0._sequences.VG = var_16_30

	local var_16_31
	local var_16_32 = {
		{
			value = -0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 489
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 213
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 381
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		}
	}

	var_16_10:RegisterAnimationSequence("CW", var_16_32)

	local function var_16_33()
		var_16_10:AnimateSequence("CW")
	end

	var_16_0._sequences.CW = var_16_33

	var_0_11(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("WeaponPreviewFilm", WeaponPreviewFilm)
LockTable(_M)
