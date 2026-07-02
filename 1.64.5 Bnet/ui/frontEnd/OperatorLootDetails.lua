module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:SetAnchorsAndPosition(0, 1, 0, 1, arg_1_0._curDim.left, arg_1_0._curDim.right, arg_1_0._curDim.top, arg_1_0._curDim.bottom + arg_1_1, 200)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.TutorialVideo:SetMouseFocusBlocker(true)
	arg_2_0.TutorialVideo:SetAlpha(0)
	arg_2_0.OperatorLootIntro:SetAlpha(0)
	arg_2_0.ActionPrompt:SetAlpha(0)
	arg_2_0.QuipPreview:SetAlpha(0)
	arg_2_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_idle"))

	arg_2_0._currentLootType = arg_2_1
	arg_2_0._lootInfo = arg_2_2

	local var_2_0 = arg_2_0._pastVideoVisibility and LUI.EASING.Linear or LUI.EASING.inCubic
	local var_2_1 = arg_2_0._pastVideoVisibility and 200 or 500

	if arg_2_1 == LOOT.itemTypes.OPERATOR_INTRO then
		local var_2_2 = arg_2_2.imagePreview

		arg_2_0.OperatorLootIntro.Intro:setImage(RegisterMaterial(var_2_2))
		arg_2_0.OperatorLootIntro:SetAlpha(1, var_2_1, var_2_0)
		arg_2_0.ActionPrompt:SetAlpha(1, var_2_1, var_2_0)
	end

	arg_2_0._pastVideoVisibility = false
	arg_2_0._goreLootNotAllowed = not Engine.CIDEADAABH() and (arg_2_2.ref == "execution_mp_universal_ref_variant_23" or arg_2_2.ref == "execution_mp_universal_ref_variant_24")

	local var_2_3 = ""

	if arg_2_1 == LOOT.itemTypes.OPERATOR_SKIN then
		var_2_3 = arg_2_2.desc
	elseif arg_2_1 == LOOT.itemTypes.OPERATOR_TAUNT then
		var_2_3 = arg_2_2.transcript
	end

	if arg_2_2.isRandom then
		arg_2_0._operatorDesc = Engine.CBBHFCGDIC(RANDOM.GetDesc(arg_2_1))
	elseif var_2_3 and var_2_3 ~= "" and var_2_3 ~= "LUA_MENU/WYATT_DEFAULT_SKIN_DESC" then
		arg_2_0._operatorDesc = Engine.CBBHFCGDIC(var_2_3)
	elseif arg_2_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		arg_2_0._operatorDesc = Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_EXECUTION_HINT")
	else
		arg_2_0._operatorDesc = ""
	end
end

local function var_0_2(arg_3_0)
	local var_3_0

	local function var_3_1()
		if arg_3_0._quipAudioID and not Engine.CHFEJIG(arg_3_0._quipAudioID) then
			arg_3_0._quipAudioID = nil

			arg_3_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_idle"))
		else
			arg_3_0:Wait(100).onComplete = var_3_1
		end
	end

	if arg_3_0._currentLootType and arg_3_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT and not arg_3_0._quipAudioID and arg_3_0._lootInfo and arg_3_0._lootInfo.ref then
		local var_3_2 = arg_3_0._lootInfo.isRandom and "" or OPERATOR.GetQuipAlias(arg_3_0._lootInfo.ref)

		if var_3_2 and #var_3_2 > 0 and Engine.DHGBFGBAIG(var_3_2) then
			arg_3_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_active"))

			arg_3_0._quipAudioID = Engine.BJDBIAGIDA(var_3_2)

			var_3_1()
		end
	end

	return true
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_3.ref
	local var_5_1 = LOOT.GetItemID(arg_5_2, var_5_0)
	local var_5_2 = LOOT.GetItemQuality(arg_5_2, arg_5_3.ref)
	local var_5_3 = LOOT.GetItemSeason(arg_5_2, var_5_0)
	local var_5_4 = not arg_5_3.isRandom and Loot.HDJCADADF(arg_5_1, var_5_1)

	if var_5_2 then
		arg_5_0.QualityWithText:UpdateQualityText(var_5_2)
	end

	if Dvar.IBEGCHEFE("NPOLQSQMNO") and var_5_3 and tonumber(var_5_3) > 0 then
		arg_5_0.SeasonWithText:UpdateSeasonText(tonumber(var_5_3))
	end

	local var_5_5 = 12 * _1080p
	local var_5_6 = arg_5_0.LootName:GetCurrentAnchorsAndPositions().bottom + var_5_5
	local var_5_7 = var_5_4 and not LOOT.HideLootBreadcrumbsCondition()

	arg_5_0.NewItemNotification:UpdateBreadcrumbByID(arg_5_1, var_5_1, true)
	arg_5_0.NewItemNotification:SetAlpha(not arg_5_0._isEquipped and var_5_7 and 1 or 0, 200)

	if not arg_5_0._isEquipped and var_5_7 then
		local var_5_8 = LAYOUT.GetElementHeight(arg_5_0.NewItemNotification)

		arg_5_0.NewItemNotification:SetTop(var_5_6, 200)
		arg_5_0.NewItemNotification:SetBottom(var_5_6 + var_5_8, 200)

		var_5_6 = var_5_6 + var_5_8 + var_5_5
	end

	if arg_5_0._isEquipped and not arg_5_0.EquippedWidget.enabled then
		ACTIONS.AnimateSequence(arg_5_0.EquippedWidget, "TurnOn")
	end

	arg_5_0.EquippedWidget:UpdateVisibility(arg_5_0._isEquipped)

	if arg_5_0._isEquipped then
		local var_5_9 = LAYOUT.GetElementHeight(arg_5_0.EquippedWidget)

		arg_5_0.EquippedWidget:SetTop(var_5_6, 200)
		arg_5_0.EquippedWidget:SetBottom(var_5_6 + var_5_9, 200)

		var_5_6 = var_5_6 + var_5_9 + var_5_5
	end

	if not arg_5_3.isRandom and var_5_2 and var_5_2 > -1 then
		arg_5_0.QualityWithText:SetAlpha(1, 200)

		local var_5_10 = LAYOUT.GetElementHeight(arg_5_0.QualityWithText)

		arg_5_0.QualityWithText:SetTop(var_5_6, 200)
		arg_5_0.QualityWithText:SetBottom(var_5_6 + var_5_10, 200)

		var_5_6 = var_5_6 + var_5_10 + var_5_5
	else
		arg_5_0.QualityWithText:SetAlpha(0)
	end

	if var_5_3 and var_5_3 > 0 then
		arg_5_0.SeasonWithText:SetAlpha(1, 200)

		local var_5_11 = LAYOUT.GetElementHeight(arg_5_0.SeasonWithText)

		arg_5_0.SeasonWithText:SetTop(var_5_6, 200)
		arg_5_0.SeasonWithText:SetBottom(var_5_6 + var_5_11, 200)

		var_5_6 = var_5_6 + var_5_11 + var_5_5
	else
		arg_5_0.SeasonWithText:SetAlpha(0)
	end

	if arg_5_3.operatorRef and OPERATOR.IsS4Operator(arg_5_3.operatorRef) and arg_5_2 == LOOT.itemTypes.OPERATOR_SKIN then
		local var_5_12 = CSV.operatorProgressionTable
		local var_5_13 = var_5_12:GetFile(arg_5_3.operatorRef)
		local var_5_14 = StringTable.DIFCHIGDFB(var_5_13, var_5_12.cols.lootID, var_5_1, var_5_12.cols.lootID)

		if var_5_14 ~= nil and var_5_14 ~= "" then
			arg_5_0.ProgressionUnlockText:SetAlpha(1, 200)

			local var_5_15 = LAYOUT.GetElementHeight(arg_5_0.ProgressionUnlockText)

			arg_5_0.ProgressionUnlockText:SetTop(var_5_6, 200)
			arg_5_0.ProgressionUnlockText:SetBottom(var_5_6 + var_5_15, 200)

			var_5_6 = var_5_6 + var_5_15 + var_5_5
		else
			arg_5_0.ProgressionUnlockText:SetAlpha(0)
		end
	else
		arg_5_0.ProgressionUnlockText:SetAlpha(0)
	end

	if arg_5_0._operatorDesc and #arg_5_0._operatorDesc > 0 then
		arg_5_0.Description:setText(arg_5_0._operatorDesc)
		arg_5_0.Description:SetAlpha(1, 200)

		local var_5_16 = LAYOUT.GetTextHeightWithWrapping(arg_5_0.Description, arg_5_0._operatorDesc)
		local var_5_17 = LAYOUT.GetElementHeight(arg_5_0.Description)

		arg_5_0.Description:SetTop(var_5_6, 200)
		arg_5_0.Description:SetBottom(var_5_6 + var_5_17, 200)

		var_5_6 = var_5_6 + var_5_16 + var_5_5
	else
		arg_5_0.Description:SetAlpha(0)
	end

	if arg_5_2 == LOOT.itemTypes.OPERATOR_TAUNT and var_5_0 ~= RANDOM.ref then
		arg_5_0.QuipPreview:SetAlpha(1, 200)

		local var_5_18 = LAYOUT.GetElementHeight(arg_5_0.QuipPreview)

		arg_5_0.QuipPreview:SetTop(var_5_6)
		arg_5_0.QuipPreview:SetBottom(var_5_6 + var_5_18)

		var_5_6 = var_5_6 + var_5_18 + var_5_5
	end

	local var_5_19 = arg_5_3.operatorRef and OPERATOR.IsT9Operator(arg_5_3.operatorRef)

	if arg_5_2 == LOOT.itemTypes.OPERATOR_EXECUTION and not arg_5_3.isRandom and not var_5_19 then
		local var_5_20 = arg_5_3.pet

		if not var_5_20 or not (#var_5_20 > 0) then
			local var_5_21 = arg_5_3.lootImage

			arg_5_0.ExecutionImage:setImage(RegisterMaterial(var_5_21))
			arg_5_0.ExecutionImage:SetAlpha(1, 200)

			local var_5_22 = LAYOUT.GetElementHeight(arg_5_0.ExecutionImage)

			arg_5_0.ExecutionImage:SetTop(var_5_6)
			arg_5_0.ExecutionImage:SetBottom(var_5_6 + var_5_22)

			var_5_6 = var_5_6 + var_5_22 + var_5_5
		else
			arg_5_0.ExecutionImage:SetAlpha(0)
		end
	else
		arg_5_0.ExecutionImage:SetAlpha(0)
	end

	var_0_0(arg_5_0, var_5_6)

	local function var_5_23()
		local var_6_0 = arg_5_0._lootInfo

		if not (var_6_0.operatorRef and OPERATOR.IsT9Operator(var_6_0.operatorRef)) and arg_5_2 == LOOT.itemTypes.OPERATOR_EXECUTION or arg_5_2 == LOOT.itemTypes.OPERATOR_TAUNT then
			local var_6_1 = arg_5_2 == LOOT.itemTypes.OPERATOR_EXECUTION and OPERATOR.GetExecutionVideo(var_6_0.ref) or OPERATOR.GetTauntVideo(var_6_0.ref)

			LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, arg_5_1, false, {
				title = Engine.CBBHFCGDIC(var_6_0.name),
				videoRef = var_6_1,
				videoFlags = VideoPlaybackFlags.LOOP
			})
		elseif arg_5_2 == LOOT.itemTypes.OPERATOR_INTRO then
			LUI.FlowManager.RequestPopupMenu(nil, "ImageMaximized", true, arg_5_1, false, {
				title = Engine.CBBHFCGDIC(var_6_0.name),
				image = OPERATOR.GetIntroImage(var_6_0.ref)
			})
		end
	end

	local function var_5_24(arg_7_0, arg_7_1)
		if var_5_0 == RANDOM.ref then
			return
		end

		if arg_5_2 == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() and not arg_5_0._goreLootNotAllowed and not CONDITIONS.HideFinishingMovePreview() then
			var_5_23()
		end
	end

	arg_5_0.bindButton:registerEventHandler("button_right_stick", var_5_24)
end

local function var_0_4(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_0.LootName:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_8_3.name)))
	var_0_1(arg_8_0, arg_8_2, arg_8_3)
	var_0_3(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
end

local function var_0_5(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0.NewItemNotification:UpdateAlpha(0, 0, true)
		arg_9_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_9_0.EquippedWidget, "TurnOn")
	else
		arg_9_0.EquippedWidget:SetAlpha(0)
	end

	arg_9_0._isEquipped = arg_9_1
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0._curDim = arg_10_1
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0.LootName)
	assert(arg_11_0.SeasonWithText)
	assert(arg_11_0.QualityWithText)
	assert(arg_11_0.NewItemNotification)

	arg_11_0.SetEquipped = var_0_5
	arg_11_0.InitializeDimensions = var_0_6
	arg_11_0.UpdateDetails = var_0_3
	arg_11_0.PreviewQuip = var_0_2
	arg_11_0.SetInfo = var_0_4
	arg_11_0.FullscreenAction = FullscreenAction
	arg_11_0._isEquipped = false
	arg_11_0._curDim = nil
	arg_11_0._pastVideoVisibility = false

	arg_11_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	if not IsLanguageArabic() then
		arg_11_0.NewItemNotification:SetupLeftAlignment()
	else
		ACTIONS.AnimateSequence(arg_11_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_11_0, "WZWipSetup")
	end

	local var_11_0 = LUI.UIBindButton.new()

	var_11_0.id = "bindButton"

	arg_11_0:addElement(var_11_0)

	arg_11_0.bindButton = var_11_0

	if arg_11_0._currentLootType and arg_11_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() then
		arg_11_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
			FullscreenAction()
		end)
	end
end

function OperatorLootDetails(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 506 * _1080p, 0, 736 * _1080p)

	var_13_0.id = "OperatorLootDetails"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "Backer"

	var_13_4:SetAlpha(0.5, 0)
	var_13_4.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_13_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Backer = var_13_4

	local var_13_5
	local var_13_6 = LUI.UIStyledText.new()

	var_13_6.id = "LootName"

	var_13_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_6:setText("", 0)
	var_13_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_13_6:SetWordWrap(false)
	var_13_6:SetAlignment(LUI.Alignment.Left)
	var_13_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_13_6:SetStartupDelay(1000)
	var_13_6:SetLineHoldTime(400)
	var_13_6:SetAnimMoveTime(2000)
	var_13_6:SetAnimMoveSpeed(50)
	var_13_6:SetEndDelay(1000)
	var_13_6:SetCrossfadeTime(400)
	var_13_6:SetFadeInTime(300)
	var_13_6:SetFadeOutTime(300)
	var_13_6:SetMaxVisibleLines(1)
	var_13_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -25, _1080p * 21, _1080p * 71)
	var_13_0:addElement(var_13_6)

	var_13_0.LootName = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "SeasonWithText"

	var_13_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 233, _1080p * 167, _1080p * 199)
	var_13_0:addElement(var_13_8)

	var_13_0.SeasonWithText = var_13_8

	local var_13_9
	local var_13_10 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_13_1
	})

	var_13_10.id = "QualityWithText"

	var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 232, _1080p * 129, _1080p * 161)
	var_13_0:addElement(var_13_10)

	var_13_0.QualityWithText = var_13_10

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "EquippedWidget"

	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 155, _1080p * 87, _1080p * 117)
	var_13_0:addElement(var_13_12)

	var_13_0.EquippedWidget = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("OperatorLootIntro", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "OperatorLootIntro"

	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -228, _1080p * 228, _1080p * 437, _1080p * 693)
	var_13_0:addElement(var_13_14)

	var_13_0.OperatorLootIntro = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("TutorialVideo", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "TutorialVideo"

	var_13_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -228, _1080p * 228, _1080p * 437, _1080p * 693)
	var_13_0:addElement(var_13_16)

	var_13_0.TutorialVideo = var_13_16

	local var_13_17

	if CONDITIONS.InFrontend() then
		local var_13_18 = LUI.UIStyledText.new()

		var_13_18.id = "ActionPrompt"

		var_13_18:SetRGBFromTable(SWATCHES.Callouts.teamAxis, 0)
		var_13_18:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_FULLSCREEN_PROMPT"), 0)
		var_13_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_13_18:SetAlignment(LUI.Alignment.Left)
		var_13_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 481, _1080p * 703, _1080p * 723)
		var_13_0:addElement(var_13_18)

		var_13_0.ActionPrompt = var_13_18
	end

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "NewItemNotification"

	var_13_20:SetAlpha(0, 0)
	var_13_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 97, _1080p * 87, _1080p * 117)
	var_13_0:addElement(var_13_20)

	var_13_0.NewItemNotification = var_13_20

	local var_13_21
	local var_13_22 = MenuBuilder.BuildRegisteredType("OperatorQuipPreview", {
		controllerIndex = var_13_1
	})

	var_13_22.id = "QuipPreview"

	var_13_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 332, _1080p * 1, _1080p * 159)
	var_13_0:addElement(var_13_22)

	var_13_0.QuipPreview = var_13_22

	local var_13_23
	local var_13_24 = LUI.UIImage.new()

	var_13_24.id = "ExecutionImage"

	var_13_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 481, _1080p * 226, _1080p * 682)
	var_13_0:addElement(var_13_24)

	var_13_0.ExecutionImage = var_13_24

	local var_13_25
	local var_13_26 = LUI.UIStyledText.new()

	var_13_26.id = "Description"

	var_13_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_26:setText("", 0)
	var_13_26:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_26:SetAlignment(LUI.Alignment.Left)
	var_13_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 490, _1080p * 204, _1080p * 226)
	var_13_0:addElement(var_13_26)

	var_13_0.Description = var_13_26

	local var_13_27
	local var_13_28 = LUI.UIStyledText.new()

	var_13_28.id = "ProgressionUnlockText"

	var_13_28:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_13_28:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/SKIN_UNLOCKED_BY_PROGRESSING_OP"), 0)
	var_13_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_28:SetAlignment(LUI.Alignment.Left)
	var_13_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 490, _1080p * 204, _1080p * 226)
	var_13_0:addElement(var_13_28)

	var_13_0.ProgressionUnlockText = var_13_28

	local function var_13_29()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_29

	local var_13_30
	local var_13_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 236
		}
	}

	var_13_26:RegisterAnimationSequence("AR", var_13_31)

	local function var_13_32()
		var_13_26:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_32

	local var_13_33
	local var_13_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_13_6:RegisterAnimationSequence("WZWipSetup", var_13_34)

	local var_13_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_13_26:RegisterAnimationSequence("WZWipSetup", var_13_35)

	local function var_13_36()
		var_13_6:AnimateSequence("WZWipSetup")
		var_13_26:AnimateSequence("WZWipSetup")
	end

	var_13_0._sequences.WZWipSetup = var_13_36

	var_0_7(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("OperatorLootDetails", OperatorLootDetails)
LockTable(_M)
