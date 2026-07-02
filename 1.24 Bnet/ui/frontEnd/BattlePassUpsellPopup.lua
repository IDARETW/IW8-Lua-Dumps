module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.PurchaseButton)
	assert(arg_1_0.LeaveButton)

	arg_1_0._currentSeason = SEASON.GetCurrentSeason()

	if arg_1_0._currentSeason and arg_1_0._currentSeason == 5 then
		ACTIONS.AnimateSequence(arg_1_0, "S5")
	end

	BATTLEPASS.MarkPassSeenForSeason(arg_1_1, arg_1_0._currentSeason)

	local var_1_0 = SEASON.GetName(arg_1_0._currentSeason)

	arg_1_0.Title:setText(Engine.CBBHFCGDIC("BATTLEPASS/UPSELL_TITLE", var_1_0))

	local var_1_1 = {
		{
			tier = 18,
			isTopAligned = false,
			element = arg_1_0.LabelLeft1,
			alignment = LUI.Alignment.Right
		},
		{
			tier = 38,
			isTopAligned = false,
			element = arg_1_0.LabelLeft2,
			alignment = LUI.Alignment.Right
		},
		{
			tier = 51,
			isTopAligned = false,
			element = arg_1_0.LabelLeft3,
			alignment = LUI.Alignment.Right
		},
		{
			tier = 59,
			isTopAligned = false,
			element = arg_1_0.LabelRight1,
			alignment = LUI.Alignment.Left
		},
		{
			tier = 81,
			isTopAligned = false,
			element = arg_1_0.LabelRight2,
			alignment = LUI.Alignment.Left
		},
		{
			tier = 89,
			isTopAligned = false,
			element = arg_1_0.LabelRight3,
			alignment = LUI.Alignment.Left
		},
		{
			isSpecial = true,
			tier = 85,
			element = arg_1_0.SpecialLeft,
			alignment = LUI.Alignment.Right
		},
		{
			subTier = 2,
			tier = 100,
			isSpecial = true,
			element = arg_1_0.SpecialRight,
			alignment = LUI.Alignment.Left
		}
	}

	for iter_1_0 = 1, #var_1_1 do
		var_1_1[iter_1_0].element:SetupTier(arg_1_1, var_1_1[iter_1_0])
	end

	assert(arg_1_2.sourceMenu)

	local var_1_2 = arg_1_2.sourceMenu

	if var_1_2.GetPurchaseAction and not BATTLEPASS.IsOwned(arg_1_1) then
		arg_1_0.PurchaseButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
			local var_2_0 = var_1_2:GetPurchaseAction(BATTLEPASS.GetPurchaseRef())

			LUI.FlowManager.RequestPopupMenu(arg_1_0, "BattlePassPurchasePopup", false, arg_2_1.controller, true, {
				sourceMenu = var_1_2,
				purchaseAction = var_2_0,
				backLeavesBPMenuPopup = arg_1_2.backLeavesBPMenuPopup
			})
		end)
		arg_1_0.PurchaseButton:addEventHandler("button_over", function(arg_3_0, arg_3_1)
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "ButtonOverGlint")
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "AnimateGlow")
		end)
		arg_1_0.PurchaseButton:addEventHandler("button_up", function(arg_4_0, arg_4_1)
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "ButtonUpGlint")
			ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "StopGlow")
		end)
		ACTIONS.AnimateSequence(arg_1_0.PurchaseButton, "Glint")
	else
		arg_1_0.PurchaseButton:closeTree()

		arg_1_0.PurchaseButton = nil
	end

	local function var_1_3(arg_5_0, arg_5_1)
		if var_1_2.AnimateXPEarned then
			var_1_2:AnimateXPEarned()
		end

		ACTIONS.LeaveMenu(arg_1_0)

		if arg_1_2.backLeavesBPMenuPopup and CONDITIONS.IsMenuInStack("BattlePassMenuPopup") then
			LUI.FlowManager.RequestLeaveMenuByName("BattlePassMenuPopup", true)
		end
	end

	arg_1_0.LeaveButton:addEventHandler("button_action", var_1_3)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_3)

	if BATTLEPASS.SHOW_TRAILER_PROMPT then
		arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_6_0, arg_6_1)
			BATTLEPASS.ShowBPTrailer(arg_1_1)
		end)
		arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("BATTLEPASS/VIEW_TRAILER", arg_1_0._currentSeason)
		})
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Background)
end

function BattlePassUpsellPopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0.id = "BattlePassUpsellPopup"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0.9, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6.PopupBackground:SetRGBFromTable(SWATCHES.BattlePass.ShadowDark, 0)
	var_7_6.PopupBackground:SetAlpha(0.3, 0)
	var_7_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.ShadowLight, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -856, _1080p * 856, _1080p * -361, _1080p * 433)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "PreviewImage"

	var_7_8:setImage(RegisterMaterial("battlepass_upsell_popup"), 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -359, _1080p * 431)
	var_7_0:addElement(var_7_8)

	var_7_0.PreviewImage = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIText.new()

	var_7_10.id = "Title"

	var_7_10:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_7_10:setText(ToUpperCase(Engine.CBBHFCGDIC("SEASONS/SEASON_1")), 0)
	var_7_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_10:SetWordWrap(false)
	var_7_10:SetAlignment(LUI.Alignment.Left)
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -235, _1080p * -440, _1080p * -370)
	var_7_0:addElement(var_7_10)

	var_7_0.Title = var_7_10

	local var_7_11

	if CONDITIONS.IsUserSignedInDemonware(var_7_1) then
		local var_7_12 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_7_1
		})

		var_7_12.id = "MPPlayerDetails"

		var_7_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_7_0:addElement(var_7_12)

		var_7_0.MPPlayerDetails = var_7_12
	end

	local var_7_13
	local var_7_14 = LUI.UIImage.new()

	var_7_14.id = "SparksLeft"

	var_7_14:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_7_14:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1171, _1080p * 1361, _1080p * 706, _1080p * 894)
	var_7_0:addElement(var_7_14)

	var_7_0.SparksLeft = var_7_14

	local var_7_15
	local var_7_16 = LUI.UIImage.new()

	var_7_16.id = "SparksRight"

	var_7_16:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_7_16:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 753, _1080p * 565, _1080p * 712, _1080p * 900)
	var_7_0:addElement(var_7_16)

	var_7_0.SparksRight = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "PurchaseButton"

	var_7_18.Text:setText(Engine.CBBHFCGDIC("MENU/UPGRADE_TO_PREMIUM"), 0)
	var_7_18.Text:SetAlignment(LUI.Alignment.Center)
	var_7_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 749, _1080p * 1171, _1080p * 216, _1080p * 266)
	var_7_0:addElement(var_7_18)

	var_7_0.PurchaseButton = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "LeaveButton"

	var_7_20.Text:setText(Engine.CBBHFCGDIC("MENU/CONTINUE"), 0)
	var_7_20.Text:SetAlignment(LUI.Alignment.Center)
	var_7_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 749, _1080p * 1171, _1080p * 279, _1080p * 329)
	var_7_0:addElement(var_7_20)

	var_7_0.LeaveButton = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "LabelLeft1"

	var_7_22.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_22.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * -510, _1080p * -210, _1080p * -172)
	var_7_0:addElement(var_7_22)

	var_7_0.LabelLeft1 = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "LabelLeft2"

	var_7_24.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_24.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -755, _1080p * -459, _1080p * -100, _1080p * -62)
	var_7_0:addElement(var_7_24)

	var_7_0.LabelLeft2 = var_7_24

	local var_7_25
	local var_7_26 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_26.id = "LabelLeft3"

	var_7_26.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_26.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -708, _1080p * -412, _1080p * 11, _1080p * 49)
	var_7_0:addElement(var_7_26)

	var_7_0.LabelLeft3 = var_7_26

	local var_7_27
	local var_7_28 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_28.id = "LabelRight1"

	var_7_28.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_28.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 506, _1080p * 802, _1080p * -210, _1080p * -172)
	var_7_0:addElement(var_7_28)

	var_7_0.LabelRight1 = var_7_28

	local var_7_29
	local var_7_30 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_30.id = "LabelRight2"

	var_7_30.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_30.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 457, _1080p * 753, _1080p * -100, _1080p * -62)
	var_7_0:addElement(var_7_30)

	var_7_0.LabelRight2 = var_7_30

	local var_7_31
	local var_7_32 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_32.id = "LabelRight3"

	var_7_32.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_32.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 408, _1080p * 704, _1080p * 11, _1080p * 49)
	var_7_0:addElement(var_7_32)

	var_7_0.LabelRight3 = var_7_32

	local var_7_33
	local var_7_34 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_34.id = "SpecialLeft"

	var_7_34.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_34.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -665, _1080p * -361, _1080p * 135, _1080p * 156)
	var_7_0:addElement(var_7_34)

	var_7_0.SpecialLeft = var_7_34

	local var_7_35
	local var_7_36 = MenuBuilder.BuildRegisteredType("LabelWithLock", {
		controllerIndex = var_7_1
	})

	var_7_36.id = "SpecialRight"

	var_7_36.Tier:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_VALUE"), 0)
	var_7_36.ItemName:setText(Engine.CBBHFCGDIC("BATTLEPASS/TIER_ITEM_NAME"), 0)
	var_7_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 359, _1080p * 667, _1080p * 135, _1080p * 156)
	var_7_0:addElement(var_7_36)

	var_7_0.SpecialRight = var_7_36

	local var_7_37
	local var_7_38 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})

	var_7_38.id = "ButtonHelperBar"

	var_7_38.Background:SetAlpha(0, 0)
	var_7_38:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 433, _1080p * 493)
	var_7_0:addElement(var_7_38)

	var_7_0.ButtonHelperBar = var_7_38

	local function var_7_39()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_39

	local var_7_40
	local var_7_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks_s5")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		}
	}

	var_7_14:RegisterAnimationSequence("S5", var_7_41)

	local var_7_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_sparks_s5")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Blend_Mode,
			value = BLEND_MODE.blend
		}
	}

	var_7_16:RegisterAnimationSequence("S5", var_7_42)

	local function var_7_43()
		var_7_14:AnimateSequence("S5")
		var_7_16:AnimateSequence("S5")
	end

	var_7_0._sequences.S5 = var_7_43

	function var_7_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_7_0:addEventHandler("menu_create", var_7_0.addButtonHelperFunction)

	local var_7_44 = LUI.UIBindButton.new()

	var_7_44.id = "selfBindButton"

	var_7_0:addElement(var_7_44)

	var_7_0.bindButton = var_7_44

	var_0_0(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BattlePassUpsellPopup", BattlePassUpsellPopup)
LockTable(_M)
