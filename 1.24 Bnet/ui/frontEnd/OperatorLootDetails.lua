module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.TutorialVideo:SetMouseFocusBlocker(true)
	arg_1_0.TutorialVideo:SetAlpha(0)
	arg_1_0.OperatorLootIntro:SetAlpha(0)
	arg_1_0.ActionPrompt:SetAlpha(0)
	arg_1_0.QuipPreview:SetAlpha(0)
	arg_1_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_idle"))

	arg_1_0._currentLootType = arg_1_1
	arg_1_0._lootInfo = arg_1_2

	local var_1_0 = arg_1_0._pastVideoVisibility and LUI.EASING.Linear or LUI.EASING.inCubic
	local var_1_1 = arg_1_0._pastVideoVisibility and 200 or 500

	if arg_1_1 == LOOT.itemTypes.OPERATOR_INTRO then
		local var_1_2 = OPERATOR.GetIntroImage(arg_1_2.ref)

		arg_1_0.OperatorLootIntro.Intro:setImage(RegisterMaterial(var_1_2))
		arg_1_0.OperatorLootIntro:SetAlpha(1, var_1_1, var_1_0)
		arg_1_0.ActionPrompt:SetAlpha(1, var_1_1, var_1_0)
	end

	arg_1_0._pastVideoVisibility = false

	if arg_1_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		local var_1_3 = OPERATOR.GetExecutionPet(arg_1_2.lootIndex)

		if not var_1_3 or not (#var_1_3 > 0) then
			local var_1_4 = OPERATOR.GetExecutionLootImage(arg_1_2.ref)

			arg_1_0.ExecutionImage:setImage(RegisterMaterial(var_1_4))
			arg_1_0.ExecutionImage:SetAlpha(1, 500)
		else
			arg_1_0.ExecutionImage:SetAlpha(0)
		end

		if not Engine.FABABBDBA() then
			arg_1_0.PreviewPrompt:SetAlpha(1, 500)
		else
			arg_1_0.PreviewPrompt:SetAlpha(0)
		end
	else
		arg_1_0.ExecutionImage:SetAlpha(0)
		arg_1_0.PreviewPrompt:SetAlpha(0)
	end

	local var_1_5 = ""

	if arg_1_1 == LOOT.itemTypes.OPERATOR_SKIN then
		local var_1_6 = LOOT.GetItemClassName(arg_1_1, arg_1_2.ref)

		if var_1_6 and #var_1_6 > 0 then
			var_1_5 = StringTable.DIFCHIGDFB(CSV.operatorSkins.file, CSV.operatorSkins.cols.ref, arg_1_2.ref, CSV.operatorSkins.cols.desc)
		end
	elseif arg_1_1 == LOOT.itemTypes.OPERATOR_TAUNT then
		var_1_5 = StringTable.DIFCHIGDFB(CSV.operatorQuips.file, CSV.operatorQuips.cols.ref, arg_1_2.ref, CSV.operatorQuips.cols.transcript)
	end

	if var_1_5 and var_1_5 ~= "" and var_1_5 ~= "LUA_MENU/WYATT_DEFAULT_SKIN_DESC" then
		local var_1_7 = Engine.CBBHFCGDIC(var_1_5)

		arg_1_0.FlavorText.StyledLabel:setText(var_1_7)
		arg_1_0.FlavorText:SetAlpha(1)

		arg_1_0._operatorDesc = var_1_7
	elseif arg_1_1 == LOOT.itemTypes.OPERATOR_EXECUTION then
		local var_1_8 = Engine.CBBHFCGDIC("LUA_MENU/TUTORIAL_EXECUTION_HINT")

		arg_1_0.FlavorText.StyledLabel:setText(var_1_8)
		arg_1_0.FlavorText:SetAlpha(1)

		arg_1_0._operatorDesc = var_1_8
	else
		arg_1_0.FlavorText:SetAlpha(0)

		arg_1_0._operatorDesc = ""
	end
end

local function var_0_1(arg_2_0)
	local var_2_0

	local function var_2_1()
		if arg_2_0._quipAudioID and not Engine.CHFEJIG(arg_2_0._quipAudioID) then
			arg_2_0._quipAudioID = nil

			arg_2_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_idle"))
		else
			arg_2_0:Wait(100).onComplete = var_2_1
		end
	end

	if arg_2_0._currentLootType and arg_2_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT and not arg_2_0._quipAudioID and arg_2_0._lootInfo and arg_2_0._lootInfo.ref then
		local var_2_2 = OPERATOR.GetQuipAlias(arg_2_0._lootInfo.ref)

		if var_2_2 and #var_2_2 > 0 and Engine.DHGBFGBAIG(var_2_2) then
			arg_2_0.QuipPreview.AudioVFX:setImage(RegisterMaterial("ui_waveform_active"))

			arg_2_0._quipAudioID = Engine.BJDBIAGIDA(var_2_2)

			var_2_1()
		end
	end

	return true
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = 8 * _1080p
	local var_4_1 = 4 * _1080p
	local var_4_2 = 4 * _1080p
	local var_4_3 = 30 * _1080p
	local var_4_4 = 30 * _1080p
	local var_4_5 = 8 * _1080p
	local var_4_6 = 0
	local var_4_7 = LOOT.GetItemSeason(arg_4_2, arg_4_3)
	local var_4_8 = tonumber(var_4_7) > 0
	local var_4_9 = LOOT.GetItemID(arg_4_2, arg_4_3)
	local var_4_10 = Loot.HDJCADADF(arg_4_1, var_4_9)

	arg_4_0.NewItemNotification:UpdateBreadcrumbByID(arg_4_1, var_4_9, true)

	local var_4_11 = ""

	if IsLanguageArabic() then
		var_4_11 = "AR"
	end

	if arg_4_0._isEquipped then
		arg_4_0.NewItemNotification:UpdateAlpha(0, 0, true)

		var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.EquippedWidget) + var_4_0

		if var_4_8 then
			var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.SeasonWithText) + var_4_1

			ACTIONS.AnimateSequence(arg_4_0, "EquippedWithSeason" .. var_4_11)
		else
			ACTIONS.AnimateSequence(arg_4_0, "EquippedWithoutSeason" .. var_4_11)
		end
	elseif var_4_8 then
		var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.SeasonWithText) + var_4_1

		ACTIONS.AnimateSequence(arg_4_0, var_4_10 and "NewWithSeason" .. var_4_11 or "NotEquippedWithSeason" .. var_4_11)
	else
		ACTIONS.AnimateSequence(arg_4_0, var_4_10 and "NewWithoutSeason" .. var_4_11 or "NotEquippedWithoutSeason" .. var_4_11)
	end

	if var_4_10 then
		var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.NewItemNotification) + var_4_5
	end

	if arg_4_0._operatorDesc and arg_4_0._operatorDesc ~= "" then
		var_4_6 = var_4_6 + LAYOUT.GetTextHeightWithWrapping(arg_4_0.FlavorText.StyledLabel, arg_4_0._operatorDesc) + var_4_2
	end

	if arg_4_2 == LOOT.itemTypes.OPERATOR_TAUNT then
		var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.QuipPreview) + var_4_4

		arg_4_0.QuipPreview:SetAlpha(1, 200)
	end

	local function var_4_12()
		local var_5_0 = arg_4_0._lootInfo

		if arg_4_2 == LOOT.itemTypes.OPERATOR_EXECUTION or arg_4_2 == LOOT.itemTypes.OPERATOR_TAUNT then
			local var_5_1 = arg_4_2 == LOOT.itemTypes.OPERATOR_EXECUTION and OPERATOR.GetExecutionVideo(var_5_0.ref) or OPERATOR.GetTauntVideo(var_5_0.ref)

			LUI.FlowManager.RequestPopupMenu(nil, "TutorialVideoMaximized", true, arg_4_1, false, {
				title = Engine.CBBHFCGDIC(var_5_0.name),
				videoRef = var_5_1,
				videoFlags = VideoPlaybackFlags.LOOP
			})
		elseif arg_4_2 == LOOT.itemTypes.OPERATOR_INTRO then
			LUI.FlowManager.RequestPopupMenu(nil, "ImageMaximized", true, arg_4_1, false, {
				title = Engine.CBBHFCGDIC(var_5_0.name),
				image = OPERATOR.GetIntroImage(var_5_0.ref)
			})
		end
	end

	local function var_4_13(arg_6_0, arg_6_1)
		if arg_4_2 == LOOT.itemTypes.OPERATOR_TAUNT then
			var_0_1(arg_4_0)
		elseif arg_4_2 == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() then
			var_4_12()
		end
	end

	arg_4_0.bindButton:registerEventHandler("button_right_stick", var_4_13)

	if arg_4_2 == LOOT.itemTypes.OPERATOR_EXECUTION then
		local var_4_14 = OPERATOR.GetExecutionID(arg_4_3)
		local var_4_15 = OPERATOR.GetExecutionPet(var_4_14)

		if var_4_15 and #var_4_15 > 0 then
			local var_4_16 = 20 * _1080p

			var_4_6 = var_4_6 + LAYOUT.GetElementHeight(arg_4_0.PreviewPrompt) + var_4_16
		else
			var_4_6 = 580 * _1080p
		end
	end

	arg_4_0:setHeight(arg_4_0._initialHeight + var_4_6, 200)

	local function var_4_17(arg_7_0)
		ACTIONS.AnimateSequence(arg_7_0.ItemStateWidget, "Locked")
		ACTIONS.AnimateSequence(arg_7_0, "Locked")
	end
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_0.LootName:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_8_3.name)))
	arg_8_0.QualityWithText:UpdateQualityText(LOOT.GetItemQuality(arg_8_2, arg_8_3.ref))

	if Dvar.IBEGCHEFE("NPOLQSQMNO") then
		arg_8_0.SeasonWithText:UpdateSeasonText(LOOT.GetItemSeason(arg_8_2, arg_8_3.ref))
	end

	var_0_0(arg_8_0, arg_8_2, arg_8_3)
	var_0_2(arg_8_0, arg_8_1, arg_8_2, arg_8_3.ref)
end

local function var_0_4(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0.NewItemNotification:UpdateAlpha(0, 0, true)
		arg_9_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_9_0.EquippedWidget, "TurnOn")
	else
		arg_9_0.EquippedWidget:SetAlpha(0)
	end

	arg_9_0._isEquipped = arg_9_1
end

local function var_0_5(arg_10_0, arg_10_1)
	arg_10_0._initialHeight = arg_10_1.bottom - arg_10_1.top
end

local function var_0_6(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0.LootName)
	assert(arg_11_0.SeasonWithText)
	assert(arg_11_0.QualityWithText)
	assert(arg_11_0.NewItemNotification)

	arg_11_0.SetEquipped = var_0_4
	arg_11_0.InitializeDimensions = var_0_5
	arg_11_0.UpdateDetails = var_0_2
	arg_11_0.PreviewQuip = var_0_1
	arg_11_0._isEquipped = false
	arg_11_0._initialHeight = nil
	arg_11_0._pastVideoVisibility = false

	arg_11_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))

	arg_11_0.SetInfo = var_0_3
	arg_11_0.FullscreenAction = FullscreenAction

	if not IsLanguageArabic() then
		arg_11_0.NewItemNotification:SetupLeftAlignment()
	end

	local var_11_0 = LUI.UIBindButton.new()

	var_11_0.id = "bindButton"

	arg_11_0:addElement(var_11_0)

	arg_11_0.bindButton = var_11_0

	if arg_11_0._currentLootType and arg_11_0._currentLootType == LOOT.itemTypes.OPERATOR_TAUNT then
		arg_11_0.bindButton:addEventHandler("button_right_stick", var_0_1)
	elseif arg_11_0._currentLootType and arg_11_0._currentLootType == LOOT.itemTypes.OPERATOR_EXECUTION and not Engine.FABABBDBA() then
		arg_11_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
			FullscreenAction()
		end)
	end
end

function OperatorLootDetails(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 506 * _1080p, 0, 135 * _1080p)

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
	var_13_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 18, _1080p * -25, _1080p * 22, _1080p * 72)
	var_13_0:addElement(var_13_6)

	var_13_0.LootName = var_13_6

	local var_13_7

	if CONDITIONS.AlwaysFalse(var_13_0) then
		local var_13_8 = MenuBuilder.BuildRegisteredType("UnlockCriteria", {
			controllerIndex = var_13_1
		})

		var_13_8.id = "UnlockCriteria"

		var_13_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
		var_13_8.UnlockDesc:SetRight(_1080p * 340, 0)
		var_13_8.UnlockDesc:SetRGBFromInt(16777215, 0)
		var_13_8.UnlockDesc:setText("", 0)
		var_13_8.UnlockDesc:SetAlignment(LUI.Alignment.Left)
		var_13_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -491, _1080p * -174, _1080p * 109, _1080p * 133)
		var_13_0:addElement(var_13_8)

		var_13_0.UnlockCriteria = var_13_8
	end

	local var_13_9

	if CONDITIONS.AlwaysFalse(var_13_0) then
		local var_13_10 = MenuBuilder.BuildRegisteredType("LockedWidget", {
			controllerIndex = var_13_1
		})

		var_13_10.id = "LockedWidget"

		var_13_10:SetAlpha(0, 0)
		var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 32, _1080p * 168, _1080p * 183, _1080p * 213)
		var_13_0:addElement(var_13_10)

		var_13_0.LockedWidget = var_13_10
	end

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("SeasonWithText", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "SeasonWithText"

	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 233, _1080p * 167, _1080p * 199)
	var_13_0:addElement(var_13_12)

	var_13_0.SeasonWithText = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "QualityWithText"

	var_13_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 232, _1080p * 129, _1080p * 161)
	var_13_0:addElement(var_13_14)

	var_13_0.QualityWithText = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "EquippedWidget"

	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 155, _1080p * 87, _1080p * 117)
	var_13_0:addElement(var_13_16)

	var_13_0.EquippedWidget = var_13_16

	local var_13_17
	local var_13_18 = MenuBuilder.BuildRegisteredType("OperatorLootIntro", {
		controllerIndex = var_13_1
	})

	var_13_18.id = "OperatorLootIntro"

	var_13_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -228, _1080p * 228, _1080p * -299, _1080p * -43)
	var_13_0:addElement(var_13_18)

	var_13_0.OperatorLootIntro = var_13_18

	local var_13_19
	local var_13_20 = MenuBuilder.BuildRegisteredType("TutorialVideo", {
		controllerIndex = var_13_1
	})

	var_13_20.id = "TutorialVideo"

	var_13_20:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -228, _1080p * 228, _1080p * -299, _1080p * -43)
	var_13_0:addElement(var_13_20)

	var_13_0.TutorialVideo = var_13_20

	local var_13_21

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_22 = LUI.UIStyledText.new()

		var_13_22.id = "ActionPrompt"

		var_13_22:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
		var_13_22:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_FULLSCREEN_PROMPT"), 0)
		var_13_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_13_22:SetAlignment(LUI.Alignment.Left)
		var_13_22:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 25, _1080p * 481, _1080p * -33, _1080p * -13)
		var_13_0:addElement(var_13_22)

		var_13_0.ActionPrompt = var_13_22
	end

	local var_13_23
	local var_13_24 = MenuBuilder.BuildRegisteredType("StyleLabelContainer", {
		controllerIndex = var_13_1
	})

	var_13_24.id = "FlavorText"

	var_13_24:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_13_24.StyledLabel:setText("", 0)
	var_13_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 480, _1080p * 171, _1080p * 189)
	var_13_0:addElement(var_13_24)

	var_13_0.FlavorText = var_13_24

	local var_13_25
	local var_13_26 = MenuBuilder.BuildRegisteredType("ItemStateWidget", {
		controllerIndex = var_13_1
	})

	var_13_26.id = "ItemStateWidget"

	var_13_26:SetAlpha(0, 0)
	var_13_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 155, _1080p * 109, _1080p * 141)
	var_13_0:addElement(var_13_26)

	var_13_0.ItemStateWidget = var_13_26

	local var_13_27
	local var_13_28 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_13_1
	})

	var_13_28.id = "NewItemNotification"

	var_13_28:SetAlpha(0, 0)
	var_13_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19, _1080p * 97, _1080p * 87, _1080p * 117)
	var_13_0:addElement(var_13_28)

	var_13_0.NewItemNotification = var_13_28

	local var_13_29
	local var_13_30 = MenuBuilder.BuildRegisteredType("OperatorQuipPreview", {
		controllerIndex = var_13_1
	})

	var_13_30.id = "QuipPreview"

	var_13_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 332, _1080p * 1, _1080p * 159)
	var_13_0:addElement(var_13_30)

	var_13_0.QuipPreview = var_13_30

	local var_13_31
	local var_13_32 = LUI.UIImage.new()

	var_13_32.id = "ExecutionImage"

	var_13_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 481, _1080p * 226, _1080p * 682)
	var_13_0:addElement(var_13_32)

	var_13_0.ExecutionImage = var_13_32

	local var_13_33

	if CONDITIONS.InFrontend(var_13_0) then
		local var_13_34 = LUI.UIStyledText.new()

		var_13_34.id = "PreviewPrompt"

		var_13_34:SetRGBFromTable(SWATCHES.Frontend.Main, 0)
		var_13_34:setText(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_LOOT_PREVIEW"), 0)
		var_13_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_13_34:SetAlignment(LUI.Alignment.Left)
		var_13_34:SetOptOutRightToLeftAlignmentFlip(true)
		var_13_34:SetTintFontIcons(true)
		var_13_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 25, _1080p * 525, _1080p * -33, _1080p * -13)
		var_13_0:addElement(var_13_34)

		var_13_0.PreviewPrompt = var_13_34
	end

	local function var_13_35()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_35

	local var_13_36
	local var_13_37 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 125
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		}
	}

	var_13_12:RegisterAnimationSequence("NotEquippedWithSeason", var_13_37)

	local var_13_38 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_13_14:RegisterAnimationSequence("NotEquippedWithSeason", var_13_38)

	local var_13_39 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("NotEquippedWithSeason", var_13_39)

	local var_13_40 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 182
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		}
	}

	var_13_24:RegisterAnimationSequence("NotEquippedWithSeason", var_13_40)

	local var_13_41 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 163
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 321
		}
	}

	var_13_30:RegisterAnimationSequence("NotEquippedWithSeason", var_13_41)

	local function var_13_42()
		var_13_12:AnimateSequence("NotEquippedWithSeason")
		var_13_14:AnimateSequence("NotEquippedWithSeason")
		var_13_16:AnimateSequence("NotEquippedWithSeason")
		var_13_24:AnimateSequence("NotEquippedWithSeason")
		var_13_30:AnimateSequence("NotEquippedWithSeason")
	end

	var_13_0._sequences.NotEquippedWithSeason = var_13_42

	local var_13_43
	local var_13_44 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_13_12:RegisterAnimationSequence("EquippedWithSeason", var_13_44)

	local var_13_45 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("EquippedWithSeason", var_13_45)

	local var_13_46 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("EquippedWithSeason", var_13_46)

	local var_13_47 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_13_24:RegisterAnimationSequence("EquippedWithSeason", var_13_47)

	local var_13_48 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 206
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 364
		}
	}

	var_13_30:RegisterAnimationSequence("EquippedWithSeason", var_13_48)

	local function var_13_49()
		var_13_12:AnimateSequence("EquippedWithSeason")
		var_13_14:AnimateSequence("EquippedWithSeason")
		var_13_16:AnimateSequence("EquippedWithSeason")
		var_13_24:AnimateSequence("EquippedWithSeason")
		var_13_30:AnimateSequence("EquippedWithSeason")
	end

	var_13_0._sequences.EquippedWithSeason = var_13_49

	local var_13_50
	local var_13_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 125
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		}
	}

	var_13_12:RegisterAnimationSequence("NotEquippedWithoutSeason", var_13_51)

	local var_13_52 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_13_14:RegisterAnimationSequence("NotEquippedWithoutSeason", var_13_52)

	local var_13_53 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("NotEquippedWithoutSeason", var_13_53)

	local var_13_54 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 145
		}
	}

	var_13_24:RegisterAnimationSequence("NotEquippedWithoutSeason", var_13_54)

	local var_13_55 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 287
		}
	}

	var_13_30:RegisterAnimationSequence("NotEquippedWithoutSeason", var_13_55)

	local function var_13_56()
		var_13_12:AnimateSequence("NotEquippedWithoutSeason")
		var_13_14:AnimateSequence("NotEquippedWithoutSeason")
		var_13_16:AnimateSequence("NotEquippedWithoutSeason")
		var_13_24:AnimateSequence("NotEquippedWithoutSeason")
		var_13_30:AnimateSequence("NotEquippedWithoutSeason")
	end

	var_13_0._sequences.NotEquippedWithoutSeason = var_13_56

	local var_13_57
	local var_13_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("EquippedWithoutSeason", var_13_58)

	local var_13_59 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("EquippedWithoutSeason", var_13_59)

	local var_13_60 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 189
		}
	}

	var_13_24:RegisterAnimationSequence("EquippedWithoutSeason", var_13_60)

	local var_13_61 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 325
		}
	}

	var_13_30:RegisterAnimationSequence("EquippedWithoutSeason", var_13_61)

	local function var_13_62()
		var_13_12:AnimateSequence("EquippedWithoutSeason")
		var_13_14:AnimateSequence("EquippedWithoutSeason")
		var_13_24:AnimateSequence("EquippedWithoutSeason")
		var_13_30:AnimateSequence("EquippedWithoutSeason")
	end

	var_13_0._sequences.EquippedWithoutSeason = var_13_62

	local var_13_63
	local var_13_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_13_12:RegisterAnimationSequence("NewWithSeason", var_13_64)

	local var_13_65 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("NewWithSeason", var_13_65)

	local var_13_66 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 226
		}
	}

	var_13_24:RegisterAnimationSequence("NewWithSeason", var_13_66)

	local function var_13_67()
		var_13_12:AnimateSequence("NewWithSeason")
		var_13_14:AnimateSequence("NewWithSeason")
		var_13_24:AnimateSequence("NewWithSeason")
	end

	var_13_0._sequences.NewWithSeason = var_13_67

	local var_13_68
	local var_13_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("NewWithoutSeason", var_13_69)

	local var_13_70 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("NewWithoutSeason", var_13_70)

	local var_13_71 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 189
		}
	}

	var_13_24:RegisterAnimationSequence("NewWithoutSeason", var_13_71)

	local var_13_72 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 325
		}
	}

	var_13_30:RegisterAnimationSequence("NewWithoutSeason", var_13_72)

	local function var_13_73()
		var_13_12:AnimateSequence("NewWithoutSeason")
		var_13_14:AnimateSequence("NewWithoutSeason")
		var_13_24:AnimateSequence("NewWithoutSeason")
		var_13_30:AnimateSequence("NewWithoutSeason")
	end

	var_13_0._sequences.NewWithoutSeason = var_13_73

	local var_13_74
	local var_13_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("EquippedWithoutSeasonAR", var_13_75)

	local var_13_76 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("EquippedWithoutSeasonAR", var_13_76)

	local var_13_77 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		}
	}

	var_13_24:RegisterAnimationSequence("EquippedWithoutSeasonAR", var_13_77)

	local var_13_78 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 325
		}
	}

	var_13_30:RegisterAnimationSequence("EquippedWithoutSeasonAR", var_13_78)

	local function var_13_79()
		var_13_12:AnimateSequence("EquippedWithoutSeasonAR")
		var_13_14:AnimateSequence("EquippedWithoutSeasonAR")
		var_13_24:AnimateSequence("EquippedWithoutSeasonAR")
		var_13_30:AnimateSequence("EquippedWithoutSeasonAR")
	end

	var_13_0._sequences.EquippedWithoutSeasonAR = var_13_79

	local var_13_80
	local var_13_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_13_12:RegisterAnimationSequence("EquippedWithSeasonAR", var_13_81)

	local var_13_82 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("EquippedWithSeasonAR", var_13_82)

	local var_13_83 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("EquippedWithSeasonAR", var_13_83)

	local var_13_84 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 232
		}
	}

	var_13_24:RegisterAnimationSequence("EquippedWithSeasonAR", var_13_84)

	local var_13_85 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 206
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 364
		}
	}

	var_13_30:RegisterAnimationSequence("EquippedWithSeasonAR", var_13_85)

	local function var_13_86()
		var_13_12:AnimateSequence("EquippedWithSeasonAR")
		var_13_14:AnimateSequence("EquippedWithSeasonAR")
		var_13_16:AnimateSequence("EquippedWithSeasonAR")
		var_13_24:AnimateSequence("EquippedWithSeasonAR")
		var_13_30:AnimateSequence("EquippedWithSeasonAR")
	end

	var_13_0._sequences.EquippedWithSeasonAR = var_13_86

	local var_13_87
	local var_13_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("NewWithoutSeasonAR", var_13_88)

	local var_13_89 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("NewWithoutSeasonAR", var_13_89)

	local var_13_90 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 171
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 195
		}
	}

	var_13_24:RegisterAnimationSequence("NewWithoutSeasonAR", var_13_90)

	local var_13_91 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 325
		}
	}

	var_13_30:RegisterAnimationSequence("NewWithoutSeasonAR", var_13_91)

	local function var_13_92()
		var_13_12:AnimateSequence("NewWithoutSeasonAR")
		var_13_14:AnimateSequence("NewWithoutSeasonAR")
		var_13_24:AnimateSequence("NewWithoutSeasonAR")
		var_13_30:AnimateSequence("NewWithoutSeasonAR")
	end

	var_13_0._sequences.NewWithoutSeasonAR = var_13_92

	local var_13_93
	local var_13_94 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 167
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 199
		}
	}

	var_13_12:RegisterAnimationSequence("NewWithSeasonAR", var_13_94)

	local var_13_95 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		}
	}

	var_13_14:RegisterAnimationSequence("NewWithSeasonAR", var_13_95)

	local var_13_96 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 208
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 232
		}
	}

	var_13_24:RegisterAnimationSequence("NewWithSeasonAR", var_13_96)

	local function var_13_97()
		var_13_12:AnimateSequence("NewWithSeasonAR")
		var_13_14:AnimateSequence("NewWithSeasonAR")
		var_13_24:AnimateSequence("NewWithSeasonAR")
	end

	var_13_0._sequences.NewWithSeasonAR = var_13_97

	local var_13_98
	local var_13_99 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_12:RegisterAnimationSequence("NotEquippedWithoutSeasonAR", var_13_99)

	local var_13_100 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_13_14:RegisterAnimationSequence("NotEquippedWithoutSeasonAR", var_13_100)

	local var_13_101 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("NotEquippedWithoutSeasonAR", var_13_101)

	local var_13_102 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 127
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 151
		}
	}

	var_13_24:RegisterAnimationSequence("NotEquippedWithoutSeasonAR", var_13_102)

	local var_13_103 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 129
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 287
		}
	}

	var_13_30:RegisterAnimationSequence("NotEquippedWithoutSeasonAR", var_13_103)

	local function var_13_104()
		var_13_12:AnimateSequence("NotEquippedWithoutSeasonAR")
		var_13_14:AnimateSequence("NotEquippedWithoutSeasonAR")
		var_13_16:AnimateSequence("NotEquippedWithoutSeasonAR")
		var_13_24:AnimateSequence("NotEquippedWithoutSeasonAR")
		var_13_30:AnimateSequence("NotEquippedWithoutSeasonAR")
	end

	var_13_0._sequences.NotEquippedWithoutSeasonAR = var_13_104

	local var_13_105
	local var_13_106 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 125
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 157
		}
	}

	var_13_12:RegisterAnimationSequence("NotEquippedWithSeasonAR", var_13_106)

	local var_13_107 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 87
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 119
		}
	}

	var_13_14:RegisterAnimationSequence("NotEquippedWithSeasonAR", var_13_107)

	local var_13_108 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_16:RegisterAnimationSequence("NotEquippedWithSeasonAR", var_13_108)

	local var_13_109 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 164
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 188
		}
	}

	var_13_24:RegisterAnimationSequence("NotEquippedWithSeasonAR", var_13_109)

	local var_13_110 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 163
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 321
		}
	}

	var_13_30:RegisterAnimationSequence("NotEquippedWithSeasonAR", var_13_110)

	local function var_13_111()
		var_13_12:AnimateSequence("NotEquippedWithSeasonAR")
		var_13_14:AnimateSequence("NotEquippedWithSeasonAR")
		var_13_16:AnimateSequence("NotEquippedWithSeasonAR")
		var_13_24:AnimateSequence("NotEquippedWithSeasonAR")
		var_13_30:AnimateSequence("NotEquippedWithSeasonAR")
	end

	var_13_0._sequences.NotEquippedWithSeasonAR = var_13_111

	var_0_6(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("OperatorLootDetails", OperatorLootDetails)
LockTable(_M)
