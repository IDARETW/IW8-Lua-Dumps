module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAnchorsAndPosition(0, 1, 0, 1, arg_1_0._curDim.left, arg_1_0._curDim.right, arg_1_0._curDim.top, arg_1_0._curDim.bottom + arg_1_1, 200)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 ~= "" and Engine.DDJFBBJAIG() and CONDITIONS.IsCoreMultiplayerNotBr() then
		if not arg_2_0.PerkUpdateDesc then
			local var_2_0 = MenuBuilder.BuildRegisteredType("PerkUpdateDesc", {
				controllerIndex = arg_2_1
			})

			var_2_0.id = "PerkUpdateDesc"

			var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 527, _1080p * 111, _1080p * 183)
			arg_2_0:addElement(var_2_0)

			arg_2_0.PerkUpdateDesc = var_2_0
			arg_2_0._seenPatchNotes = false
		end

		arg_2_0.PerkUpdateDesc.Desc:setText(Engine.CBBHFCGDIC(arg_2_2))
	elseif arg_2_0.PerkUpdateDesc then
		arg_2_0.PerkUpdateDesc:closeTree()

		arg_2_0.PerkUpdateDesc = nil
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_1 = arg_3_1 or {}

	if arg_3_1.newDesc ~= arg_3_0.ItemDesc:getText() then
		arg_3_0.ItemDesc:SetAlpha(0)
		arg_3_0.ItemDesc:setText(arg_3_1.newDesc)
		arg_3_0.ItemDesc:SetAlpha(1, 300)
	end

	if arg_3_1.isUnlocked then
		arg_3_0.UnlockCriteria:SetAlpha(0)
		arg_3_0.UnlockRequirements:SetAlpha(0)
	elseif arg_3_1.challengeInfo then
		arg_3_0.UnlockRequirements:SetAlpha(1, 300)
		arg_3_0.UnlockRequirements:Setup(arg_3_1.challengeInfo)
		arg_3_0.UnlockCriteria:SetAlpha(0)

		if LAYOUT.GetElementHeight(arg_3_0.UnlockRequirements.UnlockCriteria) < LAYOUT.GetTextHeightWithWrapping(arg_3_0.UnlockRequirements.UnlockCriteria, arg_3_0.UnlockRequirements.UnlockCriteria:getText()) then
			ACTIONS.AnimateSequence(arg_3_0.UnlockRequirements, "UnlockTwoLines")
			arg_3_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(2)
		else
			ACTIONS.AnimateSequence(arg_3_0.UnlockRequirements, "Unlock")
			arg_3_0.UnlockRequirements.UnlockCriteria:SetMaxVisibleLines(1)
		end
	else
		assert(arg_3_1.unlockText)
		arg_3_0.UnlockCriteria:SetAlpha(1, 300)
		ACTIONS.AnimateSequence(arg_3_0.UnlockCriteria, "LockState")

		if CONDITIONS.IsBRGameType(arg_3_0) and arg_3_0._shouldShowDisabledInfoBR then
			arg_3_0.UnlockCriteria.UnlockDesc:setText(Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE_WARZONE_LOCKED", arg_3_1.unlockRank))
		elseif arg_3_1.isOverkill then
			ACTIONS.AnimateSequence(arg_3_0.UnlockCriteria, "Overkill")
			arg_3_0.UnlockCriteria.UnlockDesc:setText(arg_3_1.unlockText)
		else
			arg_3_0.UnlockCriteria.UnlockDesc:setText(arg_3_1.unlockText)
		end

		arg_3_0.UnlockRequirements:SetAlpha(0)
	end

	local var_3_0 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.ItemDesc, arg_3_1.newDesc)
	local var_3_1
	local var_3_2 = LAYOUT.GetElementHeight(arg_3_0.EquippedWidget)
	local var_3_3 = arg_3_0.UnlockCriteria:GetCurrentAnchorsAndPositions()

	if arg_3_0._isEquipped and not arg_3_1.isUnlocked and arg_3_1.challengeInfo == nil then
		var_3_1 = (var_3_2 + 10 * _1080p) * 2

		local var_3_4 = 10 * _1080p

		arg_3_0.EquippedWidget:SetBottom(var_3_3.top - var_3_4)
		arg_3_0.EquippedWidget:SetTop(var_3_3.top - var_3_2 - var_3_4)
	elseif arg_3_0._isEquipped or not arg_3_1.isUnlocked and arg_3_1.challengeInfo == nil or arg_3_1.isNew or arg_3_0._isEquipped and arg_3_1.challengeInfo then
		var_3_1 = LAYOUT.GetElementHeight(arg_3_0.EquippedWidget) + 10 * _1080p

		arg_3_0.EquippedWidget:SetTop(var_3_3.bottom - var_3_2)
		arg_3_0.EquippedWidget:SetBottom(var_3_3.bottom)
	else
		var_3_1 = 0
	end

	local var_3_5 = 6 * _1080p
	local var_3_6 = 0
	local var_3_7 = 16 * _1080p

	if arg_3_1.extraDesc and #arg_3_1.extraDesc > 0 and arg_3_0._showExtraDesc == true then
		arg_3_0.ExtraDesc:setText(arg_3_1.extraDesc)

		var_3_6 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.ExtraDesc, arg_3_1.extraDesc) + var_3_7

		local var_3_8 = LAYOUT.GetElementHeight(arg_3_0.ExtraDesc)
		local var_3_9 = arg_3_0.ItemDesc:GetCurrentAnchorsAndPositions().top + var_3_0 + var_3_7

		arg_3_0.ExtraDesc:SetTop(var_3_9)
		arg_3_0.ExtraDesc:SetBottom(var_3_9 + var_3_8)
		arg_3_0.ExtraDesc:SetAlpha(0)
		arg_3_0.ExtraDesc:SetAlpha(1, 300)
	else
		arg_3_0.ExtraDesc:SetAlpha(0, 200)
	end

	local var_3_10 = 0

	if arg_3_0.PerkUpdateDesc then
		local var_3_11 = LAYOUT.GetElementHeight(arg_3_0.PerkUpdateDesc)
		local var_3_12 = arg_3_0.ItemDesc:GetCurrentAnchorsAndPositions().top + var_3_0 + var_3_6 + var_3_7

		arg_3_0.PerkUpdateDesc:SetTop(var_3_12, arg_3_0._seenPatchNotes and 200 or 0)
		arg_3_0.PerkUpdateDesc:SetBottom(var_3_12 + var_3_11, arg_3_0._seenPatchNotes and 200 or 0)

		var_3_10 = LAYOUT.GetTextHeightWithWrapping(arg_3_0.PerkUpdateDesc.Desc, arg_3_0.PerkUpdateDesc.Desc:getText()) + var_3_11

		if arg_3_0._seenPatchNotes == false then
			arg_3_0.PerkUpdateDesc:SetAlpha(0)
			arg_3_0.PerkUpdateDesc:SetAlpha(1, 300)
		end

		arg_3_0._seenPatchNotes = true
	end

	local var_3_13 = 0
	local var_3_14 = 8 * _1080p

	if arg_3_0.BRWarningInfo then
		if CONDITIONS.IsBRGameType(arg_3_0) and arg_3_0._shouldShowDisabledInfoBR then
			local var_3_15 = LAYOUT.GetElementHeight(arg_3_0.BRWarningInfo)
			local var_3_16 = arg_3_0.ItemDesc:GetCurrentAnchorsAndPositions().top + var_3_0 + var_3_6 + var_3_10 + var_3_13 + var_3_7

			arg_3_0.BRWarningInfo:SetTop(var_3_16, arg_3_0._seenBRWarning and 200 or 0)
			arg_3_0.BRWarningInfo:SetBottom(var_3_16 + var_3_15, arg_3_0._seenBRWarning and 200 or 0)

			var_3_13 = var_3_13 + var_3_15 + var_3_14

			if arg_3_0._seenBRWarning == false then
				arg_3_0.BRWarningInfo:SetAlpha(1, 300)
			end

			arg_3_0._seenBRWarning = true
		else
			arg_3_0.BRWarningInfo:SetAlpha(0)

			arg_3_0._seenBRWarning = false
		end
	end

	local var_3_17 = 0

	if arg_3_1.isRestricted then
		local var_3_18 = LAYOUT.GetElementHeight(arg_3_0.Restricted)
		local var_3_19 = arg_3_0.ItemDesc:GetCurrentAnchorsAndPositions().top + var_3_0 + var_3_6 + var_3_10 + var_3_13 + var_3_7

		arg_3_0.Restricted:SetTop(var_3_19, arg_3_0._seenCDL and 200 or 0)
		arg_3_0.Restricted:SetBottom(var_3_19 + var_3_18, arg_3_0._seenCDL and 200 or 0)

		var_3_13 = var_3_13 + var_3_18 + var_3_14

		if arg_3_0._seenCDL == false then
			arg_3_0.Restricted:SetAlpha(1, 300)
		end

		arg_3_0._seenCDL = true
	else
		arg_3_0.Restricted:SetAlpha(0)

		arg_3_0._seenCDL = false
	end

	local var_3_20 = 0

	if arg_3_1.challengeInfo and not arg_3_1.isUnlocked then
		local var_3_21 = LAYOUT.GetElementHeight(arg_3_0.UnlockRequirements)
		local var_3_22 = arg_3_0.ItemDesc:GetCurrentAnchorsAndPositions().top + var_3_0 + var_3_6 + var_3_10 + var_3_13 + var_3_7

		arg_3_0.UnlockRequirements:SetTop(var_3_22)
		arg_3_0.UnlockRequirements:SetBottom(var_3_22 + var_3_21)

		var_3_20 = var_3_21 + var_3_7
	end

	local var_3_23 = var_3_0 + var_3_1 + var_3_6 + var_3_10 + var_3_13 + var_3_20

	var_0_0(arg_3_0, var_3_23)

	return var_3_23
end

local function var_0_3(arg_4_0)
	if arg_4_0._showExtraDesc then
		arg_4_0._showExtraDesc = false
	else
		arg_4_0._showExtraDesc = true
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0._isEquipped = arg_5_1

	arg_5_0.EquippedWidget:UpdateVisibility(arg_5_1)

	if arg_5_1 then
		arg_5_0:UpdateDescription({
			isUnlocked = true,
			newDesc = arg_5_0.ItemDesc:getText()
		})
		ACTIONS.AnimateSequence(arg_5_0.EquippedWidget, "TurnOn")
		arg_5_0.NewItemNotification:SetAlpha(0)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	if CONDITIONS.IsBRGameType(arg_6_0) and arg_6_0.BRWarningInfo then
		arg_6_0._shouldShowDisabledInfoBR = arg_6_1

		ACTIONS.AnimateSequence(arg_6_0.BRWarningInfo, arg_6_1 and "Show" or "Hide")
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0._curDim = arg_7_1
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.ItemName)
	assert(arg_8_0.ItemDesc)
	assert(arg_8_0.UnlockCriteria)
	assert(arg_8_0.UnlockCriteria.UnlockDesc)

	arg_8_0.SetupPanel = var_0_6
	arg_8_0.UpdateDescription = var_0_2
	arg_8_0.SetEquipped = var_0_4
	arg_8_0.SetShouldShowDisabledInfoBR = var_0_5
	arg_8_0.ToggleExtraDesc = var_0_3
	arg_8_0.SetupPatchNotes = var_0_1

	arg_8_0:SetEquipped(false)

	arg_8_0._curDim = nil
	arg_8_0._showExtraDesc = false
	arg_8_0._shouldShowDisabledInfoBR = false
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0._seenPatchNotes = false
	arg_8_0._seenCDL = false
	arg_8_0._seenBRWarning = false

	arg_8_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	arg_8_0.Restricted:SetAlpha(0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	else
		arg_8_0.NewItemNotification:SetupLeftAlignment()
	end
end

function PerkInfoPanel(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 527 * _1080p, 0, 183 * _1080p)

	var_9_0.id = "PerkInfoPanel"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "ItemDescBacker"

	var_9_4:SetAlpha(0.75, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.ItemDescBacker = var_9_4

	local var_9_5
	local var_9_6 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
		controllerIndex = var_9_1
	})

	var_9_6.id = "UnlockCriteria"

	var_9_6.UnlockDesc:SetRight(_1080p * 475, 0)
	var_9_6.UnlockDesc:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_6.UnlockDesc:setText("", 0)
	var_9_6.UnlockDesc:SetAlignment(LUI.Alignment.Left)
	var_9_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 32, _1080p * -26, _1080p * -54, _1080p * -22)
	var_9_0:addElement(var_9_6)

	var_9_0.UnlockCriteria = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "ItemName"

	var_9_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_8:setText("", 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_8:SetWordWrap(false)
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(1000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(150)
	var_9_8:SetAnimMoveSpeed(50)
	var_9_8:SetEndDelay(1000)
	var_9_8:SetCrossfadeTime(400)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 32, _1080p * -32, _1080p * 9, _1080p * 59)
	var_9_0:addElement(var_9_8)

	var_9_0.ItemName = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIStyledText.new()

	var_9_10.id = "ItemDesc"

	var_9_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_9_10:setText("", 0)
	var_9_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_10:SetAlignment(LUI.Alignment.Left)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 495, _1080p * 59, _1080p * 81)
	var_9_0:addElement(var_9_10)

	var_9_0.ItemDesc = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "EquippedWidget"

	var_9_12:SetAlpha(0.44, 0)
	var_9_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 170, _1080p * -52, _1080p * -22)
	var_9_0:addElement(var_9_12)

	var_9_0.EquippedWidget = var_9_12

	local var_9_13

	if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
		var_9_13 = LUI.UIStyledText.new()
		var_9_13.id = "ActionPrompt"

		var_9_13:SetRGBFromInt(10853781, 0)
		var_9_13:setText(Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_PROMPT"), 0)
		var_9_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_9_13:SetAlignment(LUI.Alignment.Left)
		var_9_13:SetOptOutRightToLeftAlignmentFlip(true)
		var_9_13:SetTintFontIcons(true)
		var_9_13:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 495, _1080p * 8, _1080p * 28)
		var_9_0:addElement(var_9_13)

		var_9_0.ActionPrompt = var_9_13
	end

	local var_9_14
	local var_9_15 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_9_1
	})

	var_9_15.id = "NewItemNotification"

	var_9_15:SetAlpha(0, 0)
	var_9_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 112, _1080p * -52, _1080p * -22)
	var_9_0:addElement(var_9_15)

	var_9_0.NewItemNotification = var_9_15

	local var_9_16
	local var_9_17 = LUI.UIStyledText.new()

	var_9_17.id = "ExtraDesc"

	var_9_17:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_9_17:setText("", 0)
	var_9_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_9_17:SetAlignment(LUI.Alignment.Left)
	var_9_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 495, _1080p * 87, _1080p * 109)
	var_9_0:addElement(var_9_17)

	var_9_0.ExtraDesc = var_9_17

	local var_9_18

	if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
		var_9_18 = LUI.UIStyledText.new()
		var_9_18.id = "SecondActionPrompt"

		var_9_18:SetRGBFromInt(10853781, 0)
		var_9_18:setText("", 0)
		var_9_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_9_18:SetAlignment(LUI.Alignment.Left)
		var_9_18:SetOptOutRightToLeftAlignmentFlip(true)
		var_9_18:SetTintFontIcons(true)
		var_9_18:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 34, _1080p * 495, _1080p * 37, _1080p * 57)
		var_9_0:addElement(var_9_18)

		var_9_0.SecondActionPrompt = var_9_18
	end

	local var_9_19

	if CONDITIONS.IsBRGameType(var_9_0) then
		local var_9_20 = MenuBuilder.BuildRegisteredType("BRWarningInfo", {
			controllerIndex = var_9_1
		})

		var_9_20.id = "BRWarningInfo"

		var_9_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 495, _1080p * 135, _1080p * 165)
		var_9_0:addElement(var_9_20)

		var_9_0.BRWarningInfo = var_9_20
	end

	local var_9_21
	local var_9_22 = MenuBuilder.BuildRegisteredType("CDLRestricted", {
		controllerIndex = var_9_1
	})

	var_9_22.id = "Restricted"

	var_9_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 284, _1080p * 131, _1080p * 161)
	var_9_0:addElement(var_9_22)

	var_9_0.Restricted = var_9_22

	local var_9_23
	local var_9_24 = MenuBuilder.BuildRegisteredType("UnlockRequirements", {
		controllerIndex = var_9_1
	})

	var_9_24.id = "UnlockRequirements"

	var_9_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, _1080p * 131, _1080p * 261)
	var_9_0:addElement(var_9_24)

	var_9_0.UnlockRequirements = var_9_24

	local function var_9_25()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_25

	local var_9_26
	local var_9_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 91
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 59
		}
	}

	var_9_10:RegisterAnimationSequence("AR", var_9_27)

	if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
		local var_9_28 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 5
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 35
			}
		}

		var_9_13:RegisterAnimationSequence("AR", var_9_28)
	end

	local var_9_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 89
		}
	}

	var_9_17:RegisterAnimationSequence("AR", var_9_29)

	if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
		local var_9_30 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 74
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 44
			}
		}

		var_9_18:RegisterAnimationSequence("AR", var_9_30)
	end

	local function var_9_31()
		var_9_10:AnimateSequence("AR")

		if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
			var_9_13:AnimateSequence("AR")
		end

		var_9_17:AnimateSequence("AR")

		if CONDITIONS.InFrontendOrWaveMode(var_9_0) then
			var_9_18:AnimateSequence("AR")
		end
	end

	var_9_0._sequences.AR = var_9_31

	var_0_7(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("PerkInfoPanel", PerkInfoPanel)
LockTable(_M)
