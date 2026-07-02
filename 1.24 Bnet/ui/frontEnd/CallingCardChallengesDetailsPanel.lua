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

		arg_4_0.CurrentTierDescription:setText(var_4_1)

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
	arg_4_0.RewardTier:setText(Engine.CBBHFCGDIC("CHALLENGE/TIER_REWARD", arg_4_0._objIndex))
end

local function var_0_6(arg_5_0)
	return arg_5_0._lootID
end

local function var_0_7(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_1)

	arg_6_0._challengeData = arg_6_1

	if arg_6_2 then
		arg_6_0._objIndex = arg_6_2
	else
		arg_6_0._objIndex = 1
	end

	if arg_6_1.numTiers > 1 then
		local var_6_0 = _1080p * 28 * arg_6_1.numTiers

		arg_6_0.Pips:SetLeft(-var_6_0 * 0.5)
		arg_6_0.Pips:SetRight(var_6_0 * 0.5)
	end

	arg_6_0.Pips:Setup(arg_6_1.numTiers, arg_6_1.currentTier)
	var_0_5(arg_6_0)
end

local function var_0_8(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:getParent()

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
	local var_12_0 = {
		isBattlePass = false,
		quickPurchaseEnabled = false,
		timerValue = 0,
		bundleData = 0,
		lootID = arg_12_0._lootID,
		lootType = LOOT.itemTypes.PLAYERCARD
	}

	LUI.FlowManager.RequestPopupMenu(nil, "StorePreviewItemPopup", true, controllerIndex, replaceTop, var_12_0, nil, false, false)
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
	arg_13_0.BindButton = LUI.UIBindButton.new()
	arg_13_0.BindButton.id = "BindButton"

	arg_13_0:addElement(arg_13_0.BindButton)

	arg_13_0._controllerIndex = arg_13_1

	arg_13_0.BindButton:registerEventHandler("button_alt2", function(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_0:getParent()

		var_0_13(var_14_0)
	end)
	Playercard.DAHDCGCDEC(arg_13_1)

	arg_13_0._selectedPlayerCardIndex = var_0_1:GetValue(arg_13_1)
	arg_13_0._lootID = nil

	local function var_13_0(arg_15_0, arg_15_1)
		local var_15_0 = LUI.IsLastInputGamepad(arg_15_1.controllerIndex)
		local var_15_1 = var_15_0
		local var_15_2 = not var_15_0

		arg_15_0.LeftTrigger:SetAlpha(var_15_1 and 1 or 0)
		arg_15_0.RightTrigger:SetAlpha(var_15_1 and 1 or 0)
		arg_15_0.BindButton:registerEventHandler("button_left_trigger", var_15_0 and var_0_8 or nil)
		arg_15_0.BindButton:registerEventHandler("button_right_trigger", var_15_0 and var_0_9 or nil)
		arg_15_0.BindButton:registerEventHandler("button_left", not var_15_0 and var_0_8 or nil)
		arg_15_0.BindButton:registerEventHandler("button_right", not var_15_0 and var_0_9 or nil)
		var_0_12(arg_15_0, arg_13_1)
	end

	arg_13_0:registerAndCallEventHandler("update_input_type", var_13_0, {
		controllerIndex = arg_13_1
	})
end

function CallingCardChallengesDetailsPanel(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 560 * _1080p, 0, 700 * _1080p)

	var_16_0.id = "CallingCardChallengesDetailsPanel"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "DoubleNotchedBacker"

	var_16_4:SetAlpha(0.5, 0)
	var_16_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_16_0:addElement(var_16_4)

	var_16_0.DoubleNotchedBacker = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIImage.new()

	var_16_6.id = "RewardImage"

	var_16_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -267, _1080p * 245, _1080p * -193, _1080p * -65)
	var_16_0:addElement(var_16_6)

	var_16_0.RewardImage = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "ChallengeName"

	var_16_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_8:setText("", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_16_8:SetWordWrap(false)
	var_16_8:SetAlignment(LUI.Alignment.Left)
	var_16_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_16_8:SetStartupDelay(2000)
	var_16_8:SetLineHoldTime(400)
	var_16_8:SetAnimMoveTime(2000)
	var_16_8:SetAnimMoveSpeed(150)
	var_16_8:SetEndDelay(2000)
	var_16_8:SetCrossfadeTime(250)
	var_16_8:SetFadeInTime(300)
	var_16_8:SetFadeOutTime(300)
	var_16_8:SetMaxVisibleLines(1)
	var_16_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 20, _1080p * 56)
	var_16_0:addElement(var_16_8)

	var_16_0.ChallengeName = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "ChallengeProgressBar"

	var_16_10.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_16_10.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_16_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 188, _1080p * 198)
	var_16_0:addElement(var_16_10)

	var_16_0.ChallengeProgressBar = var_16_10

	local var_16_11
	local var_16_12 = LUI.UIText.new()

	var_16_12.id = "RewardName"

	var_16_12:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_16_12:setText("", 0)
	var_16_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_12:SetWordWrap(false)
	var_16_12:SetAlignment(LUI.Alignment.Left)
	var_16_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 13, _1080p * -39, _1080p * -262, _1080p * -232)
	var_16_0:addElement(var_16_12)

	var_16_0.RewardName = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "QualityWithText"

	var_16_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 173, _1080p * -229, _1080p * -197)
	var_16_0:addElement(var_16_14)

	var_16_0.QualityWithText = var_16_14

	local var_16_15
	local var_16_16 = LUI.UIText.new()

	var_16_16.id = "RewardTier"

	var_16_16:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_16_16:setText("", 0)
	var_16_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_16:SetWordWrap(false)
	var_16_16:SetAlignment(LUI.Alignment.Left)
	var_16_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_16:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 13, _1080p * -27, _1080p * -350, _1080p * -326)
	var_16_0:addElement(var_16_16)

	var_16_0.RewardTier = var_16_16

	local var_16_17
	local var_16_18 = {
		iconString = "LUA_MENU/PAD_LEFT_TRIGGER_BUTTON",
		controllerIndex = var_16_1
	}
	local var_16_19 = MenuBuilder.BuildRegisteredType("IconImage", var_16_18)

	var_16_19.id = "LeftTrigger"

	var_16_19:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_16_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -157, _1080p * -125, _1080p * 208, _1080p * 240)
	var_16_0:addElement(var_16_19)

	var_16_0.LeftTrigger = var_16_19

	local var_16_20
	local var_16_21 = {
		iconString = "LUA_MENU/PAD_RIGHT_TRIGGER_BUTTON",
		controllerIndex = var_16_1
	}
	local var_16_22 = MenuBuilder.BuildRegisteredType("IconImage", var_16_21)

	var_16_22.id = "RightTrigger"

	var_16_22:SetRGBFromTable(SWATCHES.tabManager.tabText, 0)
	var_16_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 125, _1080p * 157, _1080p * 208, _1080p * 240)
	var_16_0:addElement(var_16_22)

	var_16_0.RightTrigger = var_16_22

	local var_16_23
	local var_16_24 = LUI.UIText.new()

	var_16_24.id = "Equip"

	var_16_24:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_24:SetAlpha(0, 0)
	var_16_24:setText(ToUpperCase(Engine.CBBHFCGDIC("CHALLENGE/EQUIP")), 0)
	var_16_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_24:SetWordWrap(false)
	var_16_24:SetAlignment(LUI.Alignment.Left)
	var_16_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_24:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 204, _1080p * 399, _1080p * -61, _1080p * -41)
	var_16_0:addElement(var_16_24)

	var_16_0.Equip = var_16_24

	local var_16_25
	local var_16_26 = LUI.UIText.new()

	var_16_26.id = "LockedChallengeInfo"

	var_16_26:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_16_26:SetAlpha(0, 0)
	var_16_26:setText(Engine.CBBHFCGDIC("CHALLENGE/COMPLETE"), 0)
	var_16_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_26:SetAlignment(LUI.Alignment.Left)
	var_16_26:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 50, _1080p * -20, _1080p * 240, _1080p * 264)
	var_16_0:addElement(var_16_26)

	var_16_0.LockedChallengeInfo = var_16_26

	local var_16_27
	local var_16_28 = MenuBuilder.BuildRegisteredType("CallingCardMasterChallengePips", {
		controllerIndex = var_16_1
	})

	var_16_28.id = "Pips"

	var_16_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -10, _1080p * 10, _1080p * 208, _1080p * 228)
	var_16_0:addElement(var_16_28)

	var_16_0.Pips = var_16_28

	local var_16_29
	local var_16_30 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_16_1
	})

	var_16_30.id = "CheckBox"

	var_16_30:SetAlpha(0, 0)
	var_16_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 42, _1080p * 242, _1080p * 264)
	var_16_0:addElement(var_16_30)

	var_16_0.CheckBox = var_16_30

	local var_16_31
	local var_16_32 = LUI.UIText.new()

	var_16_32.id = "Preview"

	var_16_32:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_16_32:setText(Engine.CBBHFCGDIC("CHALLENGE/PREVIEW_MASTER_CHALLENGE_LOOT"), 0)
	var_16_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_32:SetWordWrap(false)
	var_16_32:SetAlignment(LUI.Alignment.Left)
	var_16_32:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_32:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 204, _1080p * -61, _1080p * -41)
	var_16_0:addElement(var_16_32)

	var_16_0.Preview = var_16_32

	local var_16_33
	local var_16_34 = LUI.UIImage.new()

	var_16_34.id = "XPIcon"

	var_16_34:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_16_34:setImage(RegisterMaterial("icon_xp"), 0)
	var_16_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 13, _1080p * 38, _1080p * -315, _1080p * -290)
	var_16_0:addElement(var_16_34)

	var_16_0.XPIcon = var_16_34

	local var_16_35
	local var_16_36 = LUI.UIText.new()

	var_16_36.id = "XPAmount"

	var_16_36:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_16_36:setText("", 0)
	var_16_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_36:SetWordWrap(false)
	var_16_36:SetAlignment(LUI.Alignment.Left)
	var_16_36:SetOptOutRightToLeftAlignmentFlip(true)
	var_16_36:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 43, _1080p * -38, _1080p * -315, _1080p * -291)
	var_16_0:addElement(var_16_36)

	var_16_0.XPAmount = var_16_36

	local var_16_37
	local var_16_38 = LUI.UIImage.new()

	var_16_38.id = "Line"

	var_16_38:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_16_38:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_16_38:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 365, _1080p * -326, _1080p * -325)
	var_16_0:addElement(var_16_38)

	var_16_0.Line = var_16_38

	local var_16_39
	local var_16_40 = LUI.UIText.new()

	var_16_40.id = "ProgressText"

	var_16_40:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_16_40:setText("", 0)
	var_16_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_40:SetAlignment(LUI.Alignment.Right)
	var_16_40:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 26, _1080p * -20, _1080p * 164, _1080p * 188)
	var_16_0:addElement(var_16_40)

	var_16_0.ProgressText = var_16_40

	local var_16_41
	local var_16_42 = LUI.UIStyledText.new()

	var_16_42.id = "CurrentTierDescription"

	var_16_42:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_16_42:setText("", 0)
	var_16_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_16_42:SetAlignment(LUI.Alignment.Left)
	var_16_42:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_16_42:SetStartupDelay(1000)
	var_16_42:SetLineHoldTime(400)
	var_16_42:SetAnimMoveTime(150)
	var_16_42:SetAnimMoveSpeed(50)
	var_16_42:SetEndDelay(1000)
	var_16_42:SetCrossfadeTime(400)
	var_16_42:SetFadeInTime(300)
	var_16_42:SetFadeOutTime(300)
	var_16_42:SetMaxVisibleLines(3)
	var_16_42:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 26, _1080p * -20, _1080p * 85, _1080p * 109)
	var_16_0:addElement(var_16_42)

	var_16_0.CurrentTierDescription = var_16_42

	var_0_14(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("CallingCardChallengesDetailsPanel", CallingCardChallengesDetailsPanel)
LockTable(_M)
