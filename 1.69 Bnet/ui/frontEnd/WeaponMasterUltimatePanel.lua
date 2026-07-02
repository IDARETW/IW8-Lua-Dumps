module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ClassifiedChallengeDesc:setText(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE_DESC", WEAPON.UltimateChallengeCounts.MAX))

	arg_1_1 = LUI.clamp(arg_1_1, 0, WEAPON.UltimateChallengeCounts.MAX)

	arg_1_0.ProgressDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1, WEAPON.UltimateChallengeCounts.MAX))

	local var_1_0 = LUI.clamp(arg_1_1 / WEAPON.UltimateChallengeCounts.MAX, 0, 1)

	arg_1_0.ClassifiedProgressBar:SetProgress(var_1_0)
	arg_1_0.ClassifiedStatusCheckBox:SetValue(var_1_0 >= 1, true)

	local var_1_1 = LUI.UIBindButton.new()

	var_1_1:addEventHandler("button_right_stick", function(arg_2_0, arg_2_1)
		local var_2_0 = {
			lootID = WEAPON.UltimateChallengeItemId,
			lootType = LOOT.itemTypes.PLAYERCARD,
			completedChallengeCount = arg_1_1
		}

		LUI.FlowManager.RequestPopupMenu(nil, "ClassifiedChallengePopup", true, controllerIndex, false, var_2_0, nil, false, false)
	end)
	arg_1_0:addElement(var_1_1)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0
end

function WeaponMasterUltimatePanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 930 * _1080p, 0, 170 * _1080p)

	var_4_0.id = "WeaponMasterUltimatePanel"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Description"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:setText(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE_FULL_DESC"), 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 521, _1080p * 53, _1080p * 75)
	var_4_0:addElement(var_4_6)

	var_4_0.Description = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "ClassifiedChallengeTitle"

	var_4_8.Text:setText(Engine.CBBHFCGDIC("CHALLENGE/CLASSIFIED_CHALLENGE"), 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 465, 0, _1080p * 46)
	var_4_0:addElement(var_4_8)

	var_4_0.ClassifiedChallengeTitle = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "ClassifiedChallengeDesc"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_4_10:SetStartupDelay(2000)
	var_4_10:SetLineHoldTime(2000)
	var_4_10:SetAnimMoveTime(2000)
	var_4_10:SetAnimMoveSpeed(150)
	var_4_10:SetEndDelay(1000)
	var_4_10:SetCrossfadeTime(400)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(2)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 53, _1080p * 408, _1080p * 63, _1080p * 85)
	var_4_0:addElement(var_4_10)

	var_4_0.ClassifiedChallengeDesc = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "ProgressDesc"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Right)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 406, _1080p * 521, _1080p * 87, _1080p * 109)
	var_4_0:addElement(var_4_12)

	var_4_0.ProgressDesc = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "ClassifiedStatusCheckBox"

	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 15, _1080p * 37, _1080p * 120, _1080p * 142)
	var_4_0:addElement(var_4_14)

	var_4_0.ClassifiedStatusCheckBox = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "ClassifiedProgressBar"

	var_4_16.Overlay:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_16.Overlay:SetAlpha(0.2, 0)
	var_4_16.Fill:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 53, _1080p * -409, _1080p * 122, _1080p * 140)
	var_4_0:addElement(var_4_16)

	var_4_0.ClassifiedProgressBar = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "ChallengeImage"

	var_4_18:setImage(RegisterMaterial("ui_playercard_1026"), 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 549, _1080p * 909, _1080p * 50, _1080p * 140)
	var_4_0:addElement(var_4_18)

	var_4_0.ChallengeImage = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIText.new()

	var_4_20.id = "Preview"

	var_4_20:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_20:setText(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW_REWARD"), 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_20:SetAlignment(LUI.Alignment.Center)
	var_4_20:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 620, _1080p * 838, _1080p * 145, _1080p * 167)
	var_4_0:addElement(var_4_20)

	var_4_0.Preview = var_4_20

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WeaponMasterUltimatePanel", WeaponMasterUltimatePanel)
LockTable(_M)
