module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.WeaponAndLevel)
	assert(arg_1_0.NextUnlockItems)

	if Engine.BHICADFIHA() then
		if not arg_1_2.weaponRef then
			DebugPrint("WARNING: Missing \"weaponRef\" option for NextUnlocksPopup menu. Only OK after a MyChanges.")

			arg_1_2.weaponRef = WEAPON.DefaultPrimary
		end

		if not arg_1_2.bucketItems then
			DebugPrint("WARNING: Missing \"bucketItems\" option for NextUnlocksPopup menu. Only OK after a MyChanges.")

			arg_1_2.bucketItems = {}
		end
	end

	local var_1_0 = WEAPON.GetName(arg_1_2.weaponRef)
	local var_1_1 = PROGRESSION.GetWeaponLevel(arg_1_1, arg_1_2.weaponRef)

	arg_1_0.WeaponAndLevel:setText(Engine.CBBHFCGDIC("CAS/WEAPON_AND_LEVEL", var_1_0, Engine.JCBDICCAH(var_1_1)))
	arg_1_0.NextUnlockItems:Setup(arg_1_2.bucketItems, arg_1_2.weaponRef)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	assert(arg_1_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function NextUnlocksPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "NextUnlocksPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "Darkener"

	var_2_4:SetRGBFromInt(0, 0)
	var_2_4:SetAlpha(0.95, 0)
	var_2_4:SetScale(1, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_2_0:addElement(var_2_4)

	var_2_0.Darkener = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "GenericPopupWindow"

	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -235, _1080p * 225)
	var_2_0:addElement(var_2_6)

	var_2_0.GenericPopupWindow = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "Title"

	var_2_8:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_2_8:setText(Engine.CBBHFCGDIC("CAS/NEXT_UNLOCKS"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_2_8:SetAlignment(LUI.Alignment.Center)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -580, _1080p * 580, _1080p * -227, _1080p * -167)
	var_2_0:addElement(var_2_8)

	var_2_0.Title = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "WeaponAndLevel"

	var_2_10:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt, 0)
	var_2_10:setText("", 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Center)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -258, _1080p * 258, _1080p * -164, _1080p * -138)
	var_2_0:addElement(var_2_10)

	var_2_0.WeaponAndLevel = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "ButtonHelperBar"

	var_2_12.Background:SetAlpha(0, 0)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 228, _1080p * 288)
	var_2_0:addElement(var_2_12)

	var_2_0.ButtonHelperBar = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("NextUnlockItems", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "NextUnlockItems"

	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -679, _1080p * 855, _1080p * -50, _1080p * 78)
	var_2_0:addElement(var_2_14)

	var_2_0.NextUnlockItems = var_2_14

	function var_2_0.addButtonHelperFunction(arg_3_0, arg_3_1)
		arg_3_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_2_0:addEventHandler("menu_create", var_2_0.addButtonHelperFunction)

	local var_2_15 = LUI.UIBindButton.new()

	var_2_15.id = "selfBindButton"

	var_2_0:addElement(var_2_15)

	var_2_0.bindButton = var_2_15

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NextUnlocksPopup", NextUnlocksPopup)
LockTable(_M)
