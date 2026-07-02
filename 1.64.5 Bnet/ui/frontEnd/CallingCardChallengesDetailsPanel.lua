module(..., package.seeall)

local var_0_0 = "frontEnd.MP.conquest.Headquarters.callingCardEditors.smallPlayerCard"
local var_0_1 = LUI.DataSourceInControllerModel.new(var_0_0 .. ".backgroundIndex")

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.numTiers and arg_1_1.numTiers > 1

	arg_1_0.LeftTrigger:SetAlpha(var_1_0 and 1 or 0)
	arg_1_0.RightTrigger:SetAlpha(var_1_0 and 1 or 0)
	arg_1_0.Pips:SetAlpha(var_1_0 and 1 or 0)
end

local function var_0_3(arg_2_0)
	if not arg_2_0._challengeData.isChallengeActive or arg_2_0._challengeData.isChallengeActive and arg_2_0._objIndex < arg_2_0._challengeData.currentTier then
		return true
	end

	return false
end

local function var_0_4(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0._challengeData

	if var_0_3(arg_3_0) then
		local var_3_1 = split(var_3_0.loot, "|")[arg_3_0._objIndex]
		local var_3_2 = LOOT.GetItemRef(LOOT.itemTypes.PLAYERCARD, var_3_1)
		local var_3_3 = tonumber(StringTable.DIFCHIGDFB(CSV.callingCards.file, CSV.callingCards.cols.ref, var_3_2, CSV.callingCards.cols.index))
		local var_3_4 = CallingCardUtils.GetCardImage(var_3_2)
		local var_3_5 = CallingCardUtils.GetCardName(var_3_2)

		Playercard.CGGBAHFGAF(arg_3_1, var_3_3)

		arg_3_0._selectedPlayerCardIndex = var_3_3

		local var_3_6 = "hud_cmd_active_backer"

		if var_3_4 ~= "" then
			var_3_6 = var_3_4
		end

		local var_3_7 = {
			displayTime = 2000,
			icon = var_3_6,
			header = Engine.CBBHFCGDIC("LUA_MENU/PLAYERCARD_EQUIPPED"),
			description = Engine.CBBHFCGDIC(var_3_5),
			type = LUI.ToastManager.NotificationType.PlayerCardEquipped,
			controllerIndex = arg_3_1
		}

		arg_3_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_3_7
		})
	end
end

local function var_0_5(arg_4_0)
	arg_4_0.Pips:MoveSelectedPip(arg_4_0._objIndex)

	local var_4_0 = arg_4_0._challengeData

	if var_4_0.challengeName then
		arg_4_0.ChallengeName:setText(Engine.CBBHFCGDIC(var_4_0.challengeName))
	end

	if var_4_0.tierDesc and #var_4_0.tierDesc > 0 then
		local var_4_1 = var_4_0.tierDesc and Engine.CBBHFCGDIC(var_4_0.tierDesc) or ""
		local var_4_2 = split(var_4_0.amounts, "|")

		if var_4_0.numTiers > 1 then
			var_4_1 = var_4_0.tierDesc and Engine.CBBHFCGDIC(var_4_0.tierDesc, var_4_2[arg_4_0._objIndex]) or ""
		end

		arg_4_0.CurrentTierDescription:setText(LAYOUT.SetWarzoneStringHighlightOverride(var_4_1))

		local var_4_3 = var_4_0.actualProgress

		if tonumber(var_4_3) > tonumber(var_4_2[arg_4_0._objIndex]) then
			var_4_3 = var_4_2[arg_4_0._objIndex]
		end

		arg_4_0.ProgressText:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_4_3, var_4_2[arg_4_0._objIndex]))
	end

	if var_4_0.loot and #var_4_0.loot > 0 then
		local var_4_4 = split(var_4_0.loot, "|")[arg_4_0._objIndex]

		arg_4_0._lootID = var_4_4

		if var_4_4 then
			local var_4_5 = LOOT.GetItemRef(LOOT.itemTypes.PLAYERCARD, var_4_4)

			arg_4_0.RewardImage:setImage(RegisterMaterial(CallingCardUtils.GetCardImage(var_4_5)))
			arg_4_0.RewardName:setText(Engine.CBBHFCGDIC(CallingCardUtils.GetCardName(var_4_5)))

			local var_4_6 = split(var_4_0.XPReward, "|")

			arg_4_0.XPAmount:setText(var_4_6[arg_4_0._objIndex])

			local var_4_7 = LOOT.GetItemQuality(LOOT.itemTypes.PLAYERCARD, var_4_5)

			arg_4_0.QualityWithText:UpdateQualityText(var_4_7)
		end
	end

	if var_4_0.progress then
		local var_4_8 = var_4_0.progress

		if var_4_0.numTiers > 1 then
			local var_4_9 = split(var_4_0.amounts, "|")

			if var_4_9 and #var_4_9 > 0 then
				local var_4_10 = tonumber(var_4_9[arg_4_0._objIndex])

				var_4_8 = LUI.clamp(var_4_0.actualProgress / var_4_10, 0, 1)
			end
		end

		arg_4_0._challengeData.barProgress = var_4_8

		arg_4_0.ChallengeProgressBar:SetProgress(var_4_8)
	end

	if not var_4_0.isChallengeActive then
		arg_4_0.CheckBox:SetValue(true, true)
		arg_4_0.CheckBox:SetAlpha(1)
		arg_4_0.LockedChallengeInfo:SetAlpha(1)
	else
		arg_4_0.CheckBox:SetAlpha(0)
		arg_4_0.LockedChallengeInfo:SetAlpha(0)
	end

	arg_4_0.Equip:SetAlpha(var_0_3(arg_4_0) and 1 or 0)
	var_0_2(arg_4_0, var_4_0)
	arg_4_0.RewardTier:setText(LAYOUT.SetWarzoneStringHighlightOverride(Engine.CBBHFCGDIC("CHALLENGE/TIER_REWARD", arg_4_0._objIndex)))
end

local function var_0_6(arg_5_0)
	return arg_5_0._lootID
end

local function var_0_7(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_1)

	arg_6_0._challengeData = arg_6_1

	local var_6_0 = arg_6_0:getParent()
	local var_6_1

	if var_6_0 then
		var_6_1 = LUI.FlowManager.GetScopedData(arg_6_0)
	end

	if var_6_1 and var_6_1.previousObjIndex then
		arg_6_0._objIndex = var_6_1.previousObjIndex

		if var_6_1.currentFocussedElement then
			var_6_1.currentFocussedElement.currentTier = var_6_1.previousObjIndex
		end

		var_6_1.previousObjIndex = nil
		var_6_1.currentFocussedElement = nil
	elseif arg_6_2 then
		arg_6_0._objIndex = arg_6_2
	else
		arg_6_0._objIndex = 1
	end

	if arg_6_1.numTiers > 1 then
		local var_6_2 = _1080p * 28 * arg_6_1.numTiers

		arg_6_0.Pips:SetLeft(-var_6_2 * 0.5)
		arg_6_0.Pips:SetRight(var_6_2 * 0.5)
	end

	arg_6_0.Pips:Setup(arg_6_1.numTiers, arg_6_1)
	var_0_5(arg_6_0)
end

local function var_0_8(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:getParent()

	if LUI.IsLastInputGamepad(var_7_0._controllerIndex) and var_7_0._challengeData.numTiers > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
	end

	if arg_7_1 and type(arg_7_1) == "number" and arg_7_1 > 0 then
		var_7_0._objIndex = arg_7_1
	elseif var_7_0._objIndex > 1 then
		var_7_0._objIndex = var_7_0._objIndex - 1
	else
		var_7_0._objIndex = var_7_0._challengeData.numTiers
	end

	var_7_0:UpdateChallenges()
end

local function var_0_9(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:getParent()

	if LUI.IsLastInputGamepad(var_8_0._controllerIndex) and var_8_0._challengeData.numTiers > 1 then
		Engine.BJDBIAGIDA(SOUND_SETS.default.action)
	end

	if arg_8_1 and type(arg_8_1) == "number" and arg_8_1 > 0 then
		var_8_0._objIndex = arg_8_1
	elseif var_8_0._objIndex < var_8_0._challengeData.numTiers then
		var_8_0._objIndex = var_8_0._objIndex + 1
	else
		var_8_0._objIndex = 1
	end

	var_8_0:UpdateChallenges()
end

local function var_0_10(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 == LUI.BEARING.left then
		var_0_8(arg_9_0.BindButton, arg_9_2)
	elseif arg_9_1 == LUI.BEARING.right then
		var_0_9(arg_9_0.BindButton, arg_9_2)
	end

	return arg_9_0._objIndex
end

local function var_0_11(arg_10_0, arg_10_1)
	var_0_1:SetValue(arg_10_1, arg_10_0._equippedPlayerCardIndex)
	Playercard.FCBJJBFBJ(arg_10_1)
end

local function var_0_12(arg_11_0, arg_11_1)
	local var_11_0 = LAYOUT.GetTextWidth(arg_11_0.Preview, arg_11_1)
	local var_11_1 = LAYOUT.GetTextWidth(arg_11_0.Equip, arg_11_1)
	local var_11_2 = 20 * _1080p

	arg_11_0.Equip:SetLeft(arg_11_0.Preview:GetCurrentAnchorsAndPositions().left + var_11_0 + var_11_2)
	arg_11_0.Equip:SetRight(arg_11_0.Preview:GetCurrentAnchorsAndPositions().left + var_11_0 + var_11_1 + var_11_2)
end

local function var_0_13(arg_12_0)
	local var_12_0 = arg_12_0:getParent()
	local var_12_1

	if var_12_0 then
		var_12_1 = LUI.FlowManager.GetScopedData(var_12_0)
	end

	if var_12_1 then
		var_12_1.previousObjIndex = arg_12_0._objIndex
		var_12_1.currentFocussedElement = var_12_0:GetCurrentFocussedElement()
	end

	local var_12_2 = {
		isBattlePass = false,
		quickPurchaseEnabled = false,
		timerValue = 0,
		bundleData = 0,
		lootID = arg_12_0._lootID,
		lootType = LOOT.itemTypes.PLAYERCARD
	}

	LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, controllerIndex, replaceTop, var_12_2, nil, false, false)
	Engine.BJDBIAGIDA(SOUND_SETS.default.menuDecode)
end

local function var_0_14(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.ShowChallenge = var_0_7
	arg_13_0.UpdateChallenges = var_0_5
	arg_13_0.UpdateDetailsForKeyboard = var_0_10
	arg_13_0.UpdatePlayerCardData = var_0_11
	arg_13_0.GetCallingCardLootID = var_0_6
	arg_13_0.AdjustPrompts = var_0_12
	arg_13_0.EquipCallingCard = var_0_4
	arg_13_0._controllerIndex = arg_13_1

	Playercard.DAHDCGCDEC(arg_13_1)

	arg_13_0._selectedPlayerCardIndex = var_0_1:GetValue(arg_13_1)
	arg_13_0._lootID = nil
	arg_13_0.BindButton = LUI.UIBindButton.new()
	arg_13_0.BindButton.id = "BindButton"

	arg_13_0:addElement(arg_13_0.BindButton)

	local function var_13_0(arg_14_0)
		local var_14_0 = arg_14_0:getParent()

		var_0_13(var_14_0)
	end

	arg_13_0.BindButton:registerEventHandler("button_alt2", function(arg_15_0, arg_15_1)
		if arg_15_1.qualifier ~= "keyboard" then
			var_13_0(arg_15_0)
		end
	end)
	arg_13_0.BindButton:registerEventHandler("button_right_stick", function(arg_16_0, arg_16_1)
		if arg_16_1.qualifier == "keyboard" then
			var_13_0(arg_16_0)
		end
	end)

	local function var_13_1(arg_17_0, arg_17_1)
		local var_17_0 = LUI.IsLastInputGamepad(arg_17_1.controllerIndex)
		local var_17_1 = var_17_0
		local var_17_2 = not var_17_0

		arg_17_0.LeftTrigger:SetAlpha(var_17_1 and 1 or 0)
		arg_17_0.RightTrigger:SetAlpha(var_17_1 and 1 or 0)
		arg_17_0.BindButton:registerEventHandler("button_left_trigger", var_17_0 and var_0_8 or nil)
		arg_17_0.BindButton:registerEventHandler("button_right_trigger", var_17_0 and var_0_9 or nil)
		arg_17_0.BindButton:registerEventHandler("button_left", not var_17_0 and var_0_8 or nil)
		arg_17_0.BindButton:registerEventHandler("button_right", not var_17_0 and var_0_9 or nil)
		arg_17_0.Preview:setText(Engine.CBBHFCGDIC(var_17_0 and "CHALLENGE/PREVIEW_MASTER_CHALLENGE_LOOT" or "CHALLENGE/PREVIEW_MASTER_CHALLENGE_LOOT_KBM"), 0)
		var_0_12(arg_17_0, arg_13_1)
	end

	arg_13_0:registerAndCallEventHandler("update_input_type", var_13_1, {
		controllerIndex = arg_13_1
	})

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_13_0, "WZWipSetup")
	end
end

function CallingCardChallengesDetailsPanel(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 700 * _1080p)

	var_18_0.id = "CallingCardChallengesDetailsPanel"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_18_1
	})

	var_18_4.id = "DoubleNotchedBacker"

	var_18_4:SetAlpha(0.5, 0)
	var_18_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.DoubleNotchedBacker = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "RewardImage"

	var_18_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -267, _1080p * 245, _1080p * -193, _1080p * -65)
	var_18_0:addElement(var_18_6)

	var_18_0.RewardImage = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIStyledText.new()

	var_18_8.id = "ChallengeName"

	var_18_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_18_8:setText("", 0)
	var_18_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_8:SetWordWrap(false)
	var_18_8:SetAlignment(LUI.Alignment.Left)
	var_18_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_8:SetStartupDelay(2000)
	var_18_8:SetLineHoldTime(400)
	var_18_8:SetAnimMoveTime(2000)
	var_18_8:SetAnimMoveSpeed(150)
	var_18_8:SetEndDelay(2000)
	var_18_8:SetCrossfadeTime(250)
	var_18_8:SetFadeInTime(300)
	var_18_8:SetFadeOutTime(300)
	var_18_8:SetMaxVisibleLines(1)
	var_18_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 20, _1080p * 56)
	var_18_0:addElement(var_18_8)

	var_18_0.ChallengeName = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "ChallengeProgressBar"

	var_18_10.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_18_10.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_18_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 188, _1080p * 198)
	var_18_0:addElement(var_18_10)

	var_18_0.ChallengeProgressBar = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIText.new()

	var_18_12.id = "RewardName"

	var_18_12:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_18_12:setText("", 0)
	var_18_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_12:SetWordWrap(false)
	var_18_12:SetAlignment(LUI.Alignment.Left)
	var_18_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 13, _1080p * -39, _1080p * -260, _1080p * -232)
	var_18_0:addElement(var_18_12)

	var_18_0.RewardName = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "QualityWithText"

	var_18_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 173, _1080p * -229, _1080p * -197)
	var_18_0:addElement(var_18_14)

	var_18_0.QualityWithText = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIText.new()

	var_18_16.id = "RewardTier"

	var_18_16:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_18_16:setText("", 0)
	var_18_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_16:SetWordWrap(false)
	var_18_16:SetAlignment(LUI.Alignment.Left)
	var_18_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 13, _1080p * -27, _1080p * -350, _1080p * -326)
	var_18_0:addElement(var_18_16)

	var_18_0.RewardTier = var_18_16

	local var_18_17
	local var_18_18 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_18_1
	}
	local var_18_19 = MenuBuilder.BuildRegisteredType("IconImage", var_18_18)

	var_18_19.id = "LeftTrigger"

	var_18_19:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_18_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -157, _1080p * -125, _1080p * 208, _1080p * 240)
	var_18_0:addElement(var_18_19)

	var_18_0.LeftTrigger = var_18_19

	local var_18_20
	local var_18_21 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_18_1
	}
	local var_18_22 = MenuBuilder.BuildRegisteredType("IconImage", var_18_21)

	var_18_22.id = "RightTrigger"

	var_18_22:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_18_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 125, _1080p * 157, _1080p * 208, _1080p * 240)
	var_18_0:addElement(var_18_22)

	var_18_0.RightTrigger = var_18_22

	local var_18_23
	local var_18_24 = LUI.UIText.new()

	var_18_24.id = "Equip"

	var_18_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_18_24:SetAlpha(0, 0)
	var_18_24:setText(Engine.CBBHFCGDIC("CHALLENGE/EQUIP"), 0)
	var_18_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_24:SetWordWrap(false)
	var_18_24:SetAlignment(LUI.Alignment.Left)
	var_18_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 204, _1080p * 399, _1080p * -61, _1080p * -41)
	var_18_0:addElement(var_18_24)

	var_18_0.Equip = var_18_24

	local var_18_25
	local var_18_26 = LUI.UIText.new()

	var_18_26.id = "LockedChallengeInfo"

	var_18_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_18_26:SetAlpha(0, 0)
	var_18_26:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE"), 0)
	var_18_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_26:SetAlignment(LUI.Alignment.Left)
	var_18_26:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_26:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -20, _1080p * 240, _1080p * 264)
	var_18_0:addElement(var_18_26)

	var_18_0.LockedChallengeInfo = var_18_26

	local var_18_27
	local var_18_28 = MenuBuilder.BuildRegisteredType("CallingCardMasterChallengePips", {
		controllerIndex = var_18_1
	})

	var_18_28.id = "Pips"

	var_18_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -10, _1080p * 10, _1080p * 208, _1080p * 228)
	var_18_0:addElement(var_18_28)

	var_18_0.Pips = var_18_28

	local var_18_29
	local var_18_30 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_18_1
	})

	var_18_30.id = "CheckBox"

	var_18_30:SetAlpha(0, 0)
	var_18_30.Fill:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_18_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 42, _1080p * 242, _1080p * 264)
	var_18_0:addElement(var_18_30)

	var_18_0.CheckBox = var_18_30

	local var_18_31
	local var_18_32 = LUI.UIText.new()

	var_18_32.id = "Preview"

	var_18_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_18_32:setText(Engine.CBBHFCGDIC("CHALLENGE/PREVIEW_MASTER_CHALLENGE_LOOT"), 0)
	var_18_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_32:SetWordWrap(false)
	var_18_32:SetAlignment(LUI.Alignment.Left)
	var_18_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 204, _1080p * -61, _1080p * -41)
	var_18_0:addElement(var_18_32)

	var_18_0.Preview = var_18_32

	local var_18_33
	local var_18_34 = LUI.UIImage.new()

	var_18_34.id = "XPIcon"

	var_18_34:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_18_34:setImage(RegisterMaterial("icon_xp"), 0)
	var_18_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 38, _1080p * -315, _1080p * -290)
	var_18_0:addElement(var_18_34)

	var_18_0.XPIcon = var_18_34

	local var_18_35
	local var_18_36 = LUI.UIText.new()

	var_18_36.id = "XPAmount"

	var_18_36:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_18_36:setText("", 0)
	var_18_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_36:SetWordWrap(false)
	var_18_36:SetAlignment(LUI.Alignment.Left)
	var_18_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_18_36:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 43, _1080p * -38, _1080p * -315, _1080p * -291)
	var_18_0:addElement(var_18_36)

	var_18_0.XPAmount = var_18_36

	local var_18_37
	local var_18_38 = LUI.UIImage.new()

	var_18_38.id = "Line"

	var_18_38:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_18_38:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_18_38:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 365, _1080p * -326, _1080p * -325)
	var_18_0:addElement(var_18_38)

	var_18_0.Line = var_18_38

	local var_18_39
	local var_18_40 = LUI.UIText.new()

	var_18_40.id = "ProgressText"

	var_18_40:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_18_40:setText("", 0)
	var_18_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_40:SetAlignment(LUI.Alignment.Right)
	var_18_40:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 26, _1080p * -20, _1080p * 158, _1080p * 182)
	var_18_0:addElement(var_18_40)

	var_18_0.ProgressText = var_18_40

	local var_18_41
	local var_18_42 = LUI.UIStyledText.new()

	var_18_42.id = "CurrentTierDescription"

	var_18_42:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_18_42:setText("", 0)
	var_18_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_42:SetAlignment(LUI.Alignment.Left)
	var_18_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_42:SetStartupDelay(1000)
	var_18_42:SetLineHoldTime(400)
	var_18_42:SetAnimMoveTime(150)
	var_18_42:SetAnimMoveSpeed(50)
	var_18_42:SetEndDelay(1000)
	var_18_42:SetCrossfadeTime(400)
	var_18_42:SetFadeInTime(300)
	var_18_42:SetFadeOutTime(300)
	var_18_42:SetMaxVisibleLines(3)
	var_18_42:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 26, _1080p * -20, _1080p * 85, _1080p * 109)
	var_18_0:addElement(var_18_42)

	var_18_0.CurrentTierDescription = var_18_42

	local function var_18_43()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_43

	local var_18_44
	local var_18_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_18_0.DoubleNotchedBacker.WZWipPromptBackground
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_18_0.DoubleNotchedBacker.Background
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -60
		}
	}

	var_18_4:RegisterAnimationSequence("WZWipSetup", var_18_45)

	local var_18_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -125
		}
	}

	var_18_6:RegisterAnimationSequence("WZWipSetup", var_18_46)

	local var_18_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_18_8:RegisterAnimationSequence("WZWipSetup", var_18_47)

	local var_18_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 178
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_18_10:RegisterAnimationSequence("WZWipSetup", var_18_48)

	local var_18_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -297
		}
	}

	var_18_12:RegisterAnimationSequence("WZWipSetup", var_18_49)

	local var_18_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -258
		}
	}

	var_18_14:RegisterAnimationSequence("WZWipSetup", var_18_50)

	local var_18_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -445
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -421
		}
	}

	var_18_16:RegisterAnimationSequence("WZWipSetup", var_18_51)

	local var_18_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 230
		}
	}

	var_18_19:RegisterAnimationSequence("WZWipSetup", var_18_52)

	local var_18_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 230
		}
	}

	var_18_22:RegisterAnimationSequence("WZWipSetup", var_18_53)

	local var_18_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -86
		}
	}

	var_18_24:RegisterAnimationSequence("WZWipSetup", var_18_54)

	local var_18_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 45
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZHighlight
		}
	}

	var_18_26:RegisterAnimationSequence("WZWipSetup", var_18_55)

	local var_18_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 198
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 218
		}
	}

	var_18_28:RegisterAnimationSequence("WZWipSetup", var_18_56)

	local var_18_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 172
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 37
		}
	}

	var_18_30:RegisterAnimationSequence("WZWipSetup", var_18_57)

	local var_18_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_18_32:RegisterAnimationSequence("WZWipSetup", var_18_58)

	local var_18_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_xp_token")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 69
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -341
		}
	}

	var_18_34:RegisterAnimationSequence("WZWipSetup", var_18_59)

	local var_18_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -387
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -363
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 76
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -64
		}
	}

	var_18_36:RegisterAnimationSequence("WZWipSetup", var_18_60)

	local var_18_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZLineSeperator
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -419
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -418
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		}
	}

	var_18_38:RegisterAnimationSequence("WZWipSetup", var_18_61)

	local var_18_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 363
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 148
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 172
		}
	}

	var_18_40:RegisterAnimationSequence("WZWipSetup", var_18_62)

	local var_18_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 84
		}
	}

	var_18_42:RegisterAnimationSequence("WZWipSetup", var_18_63)

	local function var_18_64()
		var_18_4:AnimateSequence("WZWipSetup")
		var_18_6:AnimateSequence("WZWipSetup")
		var_18_8:AnimateSequence("WZWipSetup")
		var_18_10:AnimateSequence("WZWipSetup")
		var_18_12:AnimateSequence("WZWipSetup")
		var_18_14:AnimateSequence("WZWipSetup")
		var_18_16:AnimateSequence("WZWipSetup")
		var_18_19:AnimateSequence("WZWipSetup")
		var_18_22:AnimateSequence("WZWipSetup")
		var_18_24:AnimateSequence("WZWipSetup")
		var_18_26:AnimateSequence("WZWipSetup")
		var_18_28:AnimateSequence("WZWipSetup")
		var_18_30:AnimateSequence("WZWipSetup")
		var_18_32:AnimateSequence("WZWipSetup")
		var_18_34:AnimateSequence("WZWipSetup")
		var_18_36:AnimateSequence("WZWipSetup")
		var_18_38:AnimateSequence("WZWipSetup")
		var_18_40:AnimateSequence("WZWipSetup")
		var_18_42:AnimateSequence("WZWipSetup")
	end

	var_18_0._sequences.WZWipSetup = var_18_64

	var_0_14(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("CallingCardChallengesDetailsPanel", CallingCardChallengesDetailsPanel)
LockTable(_M)
