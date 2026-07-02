module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.PurchaseButton)
	assert(arg_1_0.LeaveButton)

	arg_1_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_1_0._currentSeason then
		ACTIONS.AnimateSequence(arg_1_0, "S5")
	end

	BATTLEPASS.MarkPassSeenForSeason(arg_1_1, arg_1_0._currentSeason)
	arg_1_0.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/UPSELL_TITLE", SEASON.GetLocalizedSimpleName({
		isForBattlePass = true
	})))

	local var_1_0 = {}
	local var_1_1 = {}
	local var_1_2 = CSV.battlpassUpsellItems
	local var_1_3 = StringTable.BFHCAIIDA(var_1_2.file)
	local var_1_4 = 1

	for iter_1_0 = 0, var_1_3 - 1 do
		local var_1_5 = CSV.ReadRowWithFileAndColumns(var_1_2.file, iter_1_0, var_1_2.cols)

		if tonumber(var_1_5.season) == SEASON.GetCurrentSeasonDisplayNum({
			isForBattlePass = true
		}) then
			if var_1_5.useSpecialSlot == "true" then
				table.insert(var_1_1, var_1_5)
			else
				var_1_0[var_1_4] = var_1_5
				var_1_4 = var_1_4 + 1
			end
		end
	end

	if var_1_1 and #var_1_1 > 0 then
		for iter_1_1 = 1, #var_1_1 do
			local var_1_6 = arg_1_0["SpecialSlot" .. iter_1_1]

			assert(var_1_6, "BattlePassUpsellPopup must have an element (setup in UI Editor) with the ID SpecialSlot" .. iter_1_1)
			assert(var_1_1[iter_1_1], "Data is missing for SpecialSlot" .. iter_1_1)
			var_1_6:SetupTier(arg_1_1, var_1_1[iter_1_1])
		end
	end

	local function var_1_7(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_1 + 1
		local var_2_1 = var_1_0[var_2_0]

		arg_2_0:SetupTier(arg_1_1, var_2_1)
	end

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.UpsellItemGrid:SetRefreshChild(var_1_7)
		arg_1_0.UpsellItemGrid:SetNumChildren(var_1_4)
		arg_1_0.UpsellItemGrid:RefreshContent()
	end

	assert(arg_1_2.sourceMenu)

	local var_1_8 = arg_1_2.sourceMenu

	if var_1_8.GetPurchaseAction and not BATTLEPASS.IsOwned(arg_1_1) then
		arg_1_0.PurchaseButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			local var_3_0 = var_1_8:GetPurchaseAction(BATTLEPASS.GetPurchaseRef())

			LUI.FlowManager.RequestPopupMenu(arg_1_0, "BattlePassPurchasePopup", false, arg_3_1.controller, true, {
				sourceMenu = var_1_8,
				purchaseAction = var_3_0,
				backLeavesBPMenuPopup = arg_1_2.backLeavesBPMenuPopup
			})
		end)
		arg_1_0.PurchaseButton:addEventHandler("button_over", function(arg_4_0, arg_4_1)
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "ButtonOverGlint")
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "AnimateGlow")
		end)
		arg_1_0.PurchaseButton:addEventHandler("button_up", function(arg_5_0, arg_5_1)
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "ButtonUpGlint")
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "StopGlow")
		end)
		ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "Glint")
	else
		arg_1_0.PurchaseButton:closeTree()

		arg_1_0.PurchaseButton = nil
	end

	local function var_1_9(arg_6_0, arg_6_1)
		if var_1_8.AnimateXPEarned then
			var_1_8:AnimateXPEarned()
		end

		ACTIONS.LeaveMenu(arg_1_0)

		if arg_1_2.backLeavesBPMenuPopup and CONDITIONS.IsMenuInStack("BattlePassMenuPopup") then
			LUI.FlowManager.RequestLeaveMenuByName("BattlePassMenuPopup", true)
		end
	end

	arg_1_0.LeaveButton:addEventHandler("button_action", var_1_9)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_9)

	if BATTLEPASS.SHOW_TRAILER_PROMPT then
		arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_7_0, arg_7_1)
			BATTLEPASS.ShowBPTrailer(arg_1_1)
		end)
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", SEASON.GetLocalizedName({
				isForBattlePass = true
			}))
		})
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Background)
	arg_1_0.WZSnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceExclusivityID = BATTLEPASS.GetCurrentSeasonGameExclusivity(),
		alignment = LUI.Alignment.Left
	})
end

function BattlePassUpsellPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "BattlePassUpsellPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Background"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.9, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Background = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6.PopupBackground:SetRGBFromTable(SWATCHES.BattlePass.ShadowDark, 0)
	var_8_6.PopupBackground:SetAlpha(0.3, 0)
	var_8_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_8_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_8_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_8_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_8_6.TopBorder:SetRGBFromTable(SWATCHES.CH2.CH2Season2FreeBanner, 0)
	var_8_6.BotBorder:SetRGBFromTable(SWATCHES.CH2.CH2Season2FreeBanner, 0)

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_8_6.BotBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_8_6.TopBorderWZ:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	end

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -338, _1080p * 390)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIImage.new()

	var_8_8.id = "PreviewImage"

	var_8_8:setImage(RegisterMaterial("battlepass_upsell_popup"), 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -334, _1080p * 386)
	var_8_0:addElement(var_8_8)

	var_8_0.PreviewImage = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Title"

	var_8_10:SetRGBFromTable(SWATCHES.CH2.CH2Season3FreeBanner, 0)
	var_8_10:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONS/SEASON_1")), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_10:SetWordWrap(false)
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -235, _1080p * -440, _1080p * -370)
	var_8_0:addElement(var_8_10)

	var_8_0.Title = var_8_10

	local var_8_11

	if CONDITIONS.IsUserSignedInDemonware(var_8_1) then
		local var_8_12 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_8_1
		})

		var_8_12.id = "MPPlayerDetails"

		var_8_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_8_0:addElement(var_8_12)

		var_8_0.MPPlayerDetails = var_8_12
	end

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "SparksLeft"

	var_8_14:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_8_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 211, _1080p * 401, _1080p * 256, _1080p * 446)
	var_8_0:addElement(var_8_14)

	var_8_0.SparksLeft = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "SparksRight"

	var_8_16:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_8_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -207, _1080p * -395, _1080p * 256, _1080p * 444)
	var_8_0:addElement(var_8_16)

	var_8_0.SparksRight = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "PurchaseButton"

	var_8_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM")), 0)
	var_8_18.Text:SetAlignment(LUI.Alignment.Center)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * 272, _1080p * 322)
	var_8_0:addElement(var_8_18)

	var_8_0.PurchaseButton = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "LeaveButton"

	var_8_20.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONTINUE")), 0)
	var_8_20.Text:SetAlignment(LUI.Alignment.Center)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * 333, _1080p * 380)
	var_8_0:addElement(var_8_20)

	var_8_0.LeaveButton = var_8_20

	local var_8_21
	local var_8_22 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_22.id = "SpecialSlot1"

	var_8_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 571, _1080p * 820, _1080p * -225, _1080p * -195)
	var_8_0:addElement(var_8_22)

	var_8_0.SpecialSlot1 = var_8_22

	local var_8_23
	local var_8_24 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_24.id = "SpecialSlot2"

	var_8_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 586, _1080p * 842, _1080p * -83, _1080p * -54)
	var_8_0:addElement(var_8_24)

	var_8_0.SpecialSlot2 = var_8_24

	local var_8_25
	local var_8_26 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_26.id = "SpecialSlot3"

	var_8_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 540, _1080p * 796, _1080p * 88, _1080p * 115)
	var_8_0:addElement(var_8_26)

	var_8_0.SpecialSlot3 = var_8_26

	local var_8_27
	local var_8_28 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_28.id = "SpecialSlot4"

	var_8_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 442, _1080p * 698, _1080p * 277, _1080p * 305)
	var_8_0:addElement(var_8_28)

	var_8_0.SpecialSlot4 = var_8_28

	local var_8_29
	local var_8_30 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_30.id = "SpecialSlot5"

	var_8_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -846, _1080p * -596, _1080p * -215, _1080p * -185)
	var_8_0:addElement(var_8_30)

	var_8_0.SpecialSlot5 = var_8_30

	local var_8_31
	local var_8_32 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_32.id = "SpecialSlot6"

	var_8_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -847, _1080p * -591, _1080p * -69, _1080p * -40)
	var_8_0:addElement(var_8_32)

	var_8_0.SpecialSlot6 = var_8_32

	local var_8_33
	local var_8_34 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_34.id = "SpecialSlot7"

	var_8_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -825, _1080p * -569, _1080p * 77, _1080p * 104)
	var_8_0:addElement(var_8_34)

	var_8_0.SpecialSlot7 = var_8_34

	local var_8_35
	local var_8_36 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_36.id = "SpecialSlot8"

	var_8_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -667, _1080p * -411, _1080p * 247, _1080p * 274)
	var_8_0:addElement(var_8_36)

	var_8_0.SpecialSlot8 = var_8_36

	local var_8_37
	local var_8_38 = MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
		controllerIndex = var_8_1
	})

	var_8_38.id = "SpecialSlot9"

	var_8_38:SetAlpha(0, 0)
	var_8_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 203, _1080p * -40, _1080p * -14)
	var_8_0:addElement(var_8_38)

	var_8_0.SpecialSlot9 = var_8_38

	local var_8_39
	local var_8_40 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_40.id = "ButtonHelperBar"

	var_8_40.Background:SetAlpha(0, 0)
	var_8_40:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 433, _1080p * 493)
	var_8_0:addElement(var_8_40)

	var_8_0.ButtonHelperBar = var_8_40

	local var_8_41
	local var_8_42 = LUI.UIImage.new()

	var_8_42.id = "ExclusiveBacker"

	var_8_42:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_8_42:SetAlpha(0, 0)
	var_8_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -853, _1080p * 853, _1080p * 360, _1080p * 430)
	var_8_0:addElement(var_8_42)

	var_8_0.ExclusiveBacker = var_8_42

	local var_8_43
	local var_8_44 = LUI.UIText.new()

	var_8_44.id = "ExclusiveText"

	var_8_44:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_8_44:setText(Engine.CBBHFCGDIC("BATTLEPASS/EXCLUSIVELY_USABLE_IN"), 0)
	var_8_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_44:SetAlignment(LUI.Alignment.Left)
	var_8_44:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 483, _1080p * -218, _1080p * -194)
	var_8_0:addElement(var_8_44)

	var_8_0.ExclusiveText = var_8_44

	local var_8_45
	local var_8_46 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("BattlePassTierColumn", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 286,
		rowHeight = _1080p * 26,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_47 = LUI.UIGrid.new(var_8_46)

	var_8_47.id = "UpsellItemGrid"

	var_8_47:setUseStencil(true)
	var_8_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -350, _1080p * -324)
	var_8_0:addElement(var_8_47)

	var_8_0.UpsellItemGrid = var_8_47

	local var_8_48
	local var_8_49 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_8_1
	})

	var_8_49.id = "WZSnipeIcon"

	var_8_49:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 166, _1080p * 325, _1080p * -194, _1080p * -154)
	var_8_0:addElement(var_8_49)

	var_8_0.WZSnipeIcon = var_8_49

	local function var_8_50()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_50

	local function var_8_51()
		return
	end

	var_8_0._sequences.S5 = var_8_51

	local var_8_52
	local var_8_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -493
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 337
		}
	}

	var_8_22:RegisterAnimationSequence("AR", var_8_53)

	local var_8_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -466
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -210
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -86
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -57
		}
	}

	var_8_24:RegisterAnimationSequence("AR", var_8_54)

	local var_8_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -450
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -194
		}
	}

	var_8_26:RegisterAnimationSequence("AR", var_8_55)

	local var_8_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -770
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -514
		}
	}

	var_8_28:RegisterAnimationSequence("AR", var_8_56)

	local var_8_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -308
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -281
		}
	}

	var_8_36:RegisterAnimationSequence("AR", var_8_57)

	local function var_8_58()
		var_8_22:AnimateSequence("AR")
		var_8_24:AnimateSequence("AR")
		var_8_26:AnimateSequence("AR")
		var_8_28:AnimateSequence("AR")
		var_8_36:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_58

	function var_8_0.addButtonHelperFunction(arg_14_0, arg_14_1)
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_59 = LUI.UIBindButton.new()

	var_8_59.id = "selfBindButton"

	var_8_0:addElement(var_8_59)

	var_8_0.bindButton = var_8_59

	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BattlePassUpsellPopup", BattlePassUpsellPopup)
LockTable(_M)
