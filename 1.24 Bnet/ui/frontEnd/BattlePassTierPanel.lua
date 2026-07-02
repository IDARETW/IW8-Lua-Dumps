module(..., package.seeall)

local var_0_0 = {
	NO_TIER_UP = 3,
	TIER_UP = 2,
	FIRST_TIER = 1,
	MAX_TIER = 4,
	TIER_UP_ONE_UNLOCK = 5,
	NONE = 0
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		arg_1_0.PurchaseBattlePassButton:SetAlpha(1)
		arg_1_0.PurchaseBattlePassButton:SetHandleMouse(true)

		local var_1_0 = {
			promptsData = {
				{
					kbmTooltipPromptOverload = "button_alt1",
					button_ref = "button_alt1",
					helper_text = ""
				}
			}
		}

		arg_1_0.PurchaseBattlePassButton:AddTooltipData(arg_1_1, var_1_0)
		ACTIONS.AnimateSequence(arg_1_0.PurchaseBattlePassButton, "LowGlow")
	else
		arg_1_0.PurchaseBattlePassButton:SetAlpha(0)
		arg_1_0.PurchaseBattlePassButton:SetHandleMouse(false)
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	if BATTLEPASS.IsOwned(arg_2_1) then
		var_0_1(arg_2_0, arg_2_1, false)
	else
		var_0_1(arg_2_0, arg_2_1, true)
	end

	if arg_2_0.tierProgressionState == var_0_0.FIRST_TIER then
		ACTIONS.AnimateSequence(arg_2_0, "FirstTierNoUnlocks")

		local var_2_0 = BATTLEPASS.GetTierUnlocksByTier(arg_2_1, 0, 3)

		arg_2_0.BattlePassNextUnlock:InitTierUnlocks(arg_2_1, var_2_0, Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"))
	elseif arg_2_0.tierProgressionState == var_0_0.TIER_UP then
		if not BATTLEPASS.IsOwned(arg_2_1) then
			arg_2_0._enableBattlePassPurchaseInAAR = true
		end

		ACTIONS.AnimateSequence(arg_2_0, BATTLEPASS.IsOwned(arg_2_1) and "NewUnlockPurchased" or "NewUnlock")
		arg_2_0.BattlePassUnlock:InitTierUnlocks(arg_2_1, arg_2_0.tierUnlocks, Engine.CBBHFCGDIC("AAR/UNLOCKED"), nil, true)
	elseif arg_2_0.tierProgressionState == var_0_0.TIER_UP_ONE_UNLOCK then
		ACTIONS.AnimateSequence(arg_2_0, BATTLEPASS.IsOwned(arg_2_1) and "OnlyOneUnlockPurchased" or "OnlyOneNewUnlock")
		arg_2_0.BattlePassUnlock:InitTierUnlocks(arg_2_1, arg_2_0.tierUnlocks, Engine.CBBHFCGDIC("AAR/UNLOCKED"), 1, true)
		arg_2_0.BattlePassNextUnlock:InitTierUnlocks(arg_2_1, arg_2_0.nextTierUnlocks, Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"), 1)
	elseif arg_2_0.tierProgressionState == var_0_0.NO_TIER_UP then
		ACTIONS.AnimateSequence(arg_2_0, BATTLEPASS.IsOwned(arg_2_1) and "NoNewUnlockPurchased" or "NoNewUnlock")
		arg_2_0.BattlePassUnlock:InitTierUnlocks(arg_2_1, arg_2_0.recentTierUnlocks, Engine.CBBHFCGDIC("AAR/RECENT_UNLOCKS"), 1, true)
		arg_2_0.BattlePassNextUnlock:InitTierUnlocks(arg_2_1, arg_2_0.nextTierUnlocks, Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"), 1)
	elseif arg_2_0.tierProgressionState == var_0_0.MAX_TIER then
		if not BATTLEPASS.IsOwned(arg_2_1) then
			arg_2_0._enableBattlePassPurchaseInAAR = true
		end

		ACTIONS.AnimateSequence(arg_2_0, BATTLEPASS.IsOwned(arg_2_1) and "MaxTierPurchased" or "MaxTier")
		arg_2_0.BattlePassUnlock:InitTierUnlocks(arg_2_1, arg_2_0.recentTierUnlocks, Engine.CBBHFCGDIC("AAR/RECENT_UNLOCKS"), nil, true)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_2 == nil or arg_3_3 == nil then
		arg_3_0.tierProgressionState = var_0_0.NO_TIER_UP
	else
		local var_3_0 = BATTLEPASS.GetTierByXP(arg_3_1, arg_3_2)
		local var_3_1 = BATTLEPASS.GetTierByXP(arg_3_1, arg_3_3)

		arg_3_0.tierProgressionState = var_0_0.NONE

		if var_3_0 == 0 and var_3_1 == 0 then
			arg_3_0.tierProgressionState = var_0_0.FIRST_TIER
		elseif var_3_0 < var_3_1 then
			arg_3_0.tierProgressionState = var_0_0.TIER_UP
		elseif var_3_1 == var_3_0 then
			if var_3_1 == BATTLEPASS.GetMaxTier() then
				arg_3_0.tierProgressionState = var_0_0.MAX_TIER
			else
				arg_3_0.tierProgressionState = var_0_0.NO_TIER_UP
			end
		end

		arg_3_0.recentTierUnlocks = BATTLEPASS.GetRecentTierUnlocks(arg_3_1, 3)
		arg_3_0.nextTierUnlocks = BATTLEPASS.GetNextTierUnlocks(arg_3_1)
		arg_3_0.tierUnlocks = BATTLEPASS.GetTierUnlocksByTier(arg_3_1, var_3_0, var_3_1)

		if arg_3_0.tierUnlocks and #arg_3_0.tierUnlocks == 1 then
			arg_3_0.tierProgressionState = var_0_0.TIER_UP_ONE_UNLOCK
		end
	end

	local var_3_2 = BATTLEPASS.GetTier(arg_3_1)
	local var_3_3
	local var_3_4 = arg_3_0.tierProgressionState == var_0_0.MAX_TIER and 1 or BATTLEPASS.GetTierPercentageFromXP(arg_3_1, BATTLEPASS.GetXP(arg_3_1))

	arg_3_0.ProgressBar:SetProgress(0, 0)
	arg_3_0.ProgressBar:SetProgress(var_3_4, 300)

	local var_3_5 = (arg_3_0.tierProgressionState == var_0_0.MAX_TIER and BATTLEPASS.GetMaxTier() - 1 or var_3_2) == 0 and 0 or 1

	arg_3_0.Level:SetAlpha(var_3_5)
	arg_3_0.LevelBorder:SetAlpha(var_3_5)
	arg_3_0.Fill:SetAlpha(var_3_5)
	arg_3_0.Level:setText(arg_3_0.tierProgressionState == var_0_0.MAX_TIER and BATTLEPASS.GetMaxTier() - 1 or var_3_2)
	arg_3_0.NextLevel:setText(arg_3_0.tierProgressionState == var_0_0.MAX_TIER and Engine.CBBHFCGDIC("LUA_MENU/MAX") or var_3_2 + 1)
	var_0_2(arg_3_0, arg_3_1)
end

function PurchaseBattlePass(arg_4_0, arg_4_1)
	if not BATTLEPASS.IsOwned(arg_4_1) then
		local var_4_0 = {
			purchaseBattlePassInAAR = true
		}

		LUI.FlowManager.RequestAddMenu("BattlePassMenuPopup", true, arg_4_1, false, var_4_0, true)
	end
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InitTierProgression = var_0_3

	arg_5_0.TierIcon:setImage(RegisterMaterial(BATTLEPASS.GetCurrentEmblem()))

	if BATTLEPASS.IsOwned(arg_5_1) then
		arg_5_0.TierIconCircle:SetRGBFromTable(SWATCHES.BattlePass.Purchased)
		ACTIONS.AnimateSequence(arg_5_0.ProgressBar, "Purchased")
		ACTIONS.AnimateSequence(arg_5_0, "TierLevelCompletedPurchased")
	else
		arg_5_0.TierIconCircle:SetRGBFromTable(SWATCHES.HUD.HUDMain)
		ACTIONS.AnimateSequence(arg_5_0.ProgressBar, "Free")
		ACTIONS.AnimateSequence(arg_5_0, "TierLevelCompletedFree")
	end

	local var_5_0 = LUI.UIBindButton.new()

	var_5_0.id = "selfBindButton"

	arg_5_0:addElement(var_5_0)

	arg_5_0.bindButton = var_5_0

	arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_6_0, arg_6_1)
		PurchaseBattlePass(arg_5_0, arg_5_1)
	end)
	arg_5_0.PurchaseBattlePassButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		PurchaseBattlePass(arg_5_0, arg_5_1)
	end)

	local var_5_1, var_5_2, var_5_3, var_5_4 = OnlineProgression.CEHEBBGFGG(arg_5_1)
	local var_5_5, var_5_6, var_5_7, var_5_8 = PROGRESSION.GetGlobalDoubleXPEventsEndTime()
	local var_5_9 = tonumber(Engine.DCJHCAFIIA())
	local var_5_10 = var_5_4 ~= nil and var_5_4 - var_5_9 > 0 or var_5_8 ~= nil and var_5_8 - var_5_9 > 0

	if LOOT.IsDoubleBattlePassXPActive() or var_5_10 then
		arg_5_0.XPActive:SetAlpha(1)
		arg_5_0.DoubleXP:SetAlpha(1)
	else
		arg_5_0.XPActive:SetAlpha(0)
		arg_5_0.DoubleXP:SetAlpha(0)
	end

	arg_5_0:registerAndCallEventHandler("update_input_type", function(arg_8_0, arg_8_1)
		if LUI.IsLastInputKeyboardMouse(arg_5_1) then
			ACTIONS.AnimateSequence(arg_8_0, "KBM")
		else
			ACTIONS.AnimateSequence(arg_8_0, "Gamepad")
		end
	end)
	ACTIONS.AnimateSequence(arg_5_0.BattlePassNextUnlock, "RightAligned")
	ACTIONS.AnimateSequence(arg_5_0.BattlePassNextUnlock.Title, "RightAligned")
end

function BattlePassTierPanel(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 580 * _1080p, 0, 757 * _1080p)

	var_9_0.id = "BattlePassTierPanel"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:setUseStencil(true)

	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Background"

	var_9_4:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_9_4:SetAlpha(0.5, 0)
	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIText.new()

	var_9_6.id = "BattlePassUpgradeLabel"

	var_9_6:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_9_6:SetAlpha(0, 0)
	var_9_6:setText(Engine.CBBHFCGDIC("BATTLEPASS/ITEM_NOT_AVAILABLE"), 0)
	var_9_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_6:SetWordWrap(false)
	var_9_6:SetAlignment(LUI.Alignment.Center)
	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -98, _1080p * 98, _1080p * 730, _1080p * 746)
	var_9_0:addElement(var_9_6)

	var_9_0.BattlePassUpgradeLabel = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIImage.new()

	var_9_8.id = "TierIconCircle"

	var_9_8:SetScale(0.2, 0)
	var_9_8:setImage(RegisterMaterial("battlepass_celebration_tier_circle"), 0)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -110, _1080p * 110, _1080p * 77, _1080p * 297)
	var_9_0:addElement(var_9_8)

	var_9_0.TierIconCircle = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "TierIcon"

	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 87, _1080p * 287)
	var_9_0:addElement(var_9_10)

	var_9_0.TierIcon = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "BattlePassHeader"

	var_9_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS"), 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 47)
	var_9_0:addElement(var_9_12)

	var_9_0.BattlePassHeader = var_9_12

	local var_9_13
	local var_9_14 = MenuBuilder.BuildRegisteredType("BattlePassUnlockItem", {
		controllerIndex = var_9_1
	})

	var_9_14.id = "BattlePassUnlock"

	var_9_14.Title.Text:setText(Engine.CBBHFCGDIC("AAR/UNLOCKED"), 0)
	var_9_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -290, _1080p * 290, _1080p * 367, _1080p * 746)
	var_9_0:addElement(var_9_14)

	var_9_0.BattlePassUnlock = var_9_14

	local var_9_15
	local var_9_16 = MenuBuilder.BuildRegisteredType("BattlePassUnlockItem", {
		controllerIndex = var_9_1
	})

	var_9_16.id = "BattlePassNextUnlock"

	var_9_16.Title.Text:setText(Engine.CBBHFCGDIC("AAR/NEXT_UNLOCK"), 0)
	var_9_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 98, _1080p * 678, _1080p * 367, _1080p * 746)
	var_9_0:addElement(var_9_16)

	var_9_0.BattlePassNextUnlock = var_9_16

	local var_9_17
	local var_9_18 = LUI.UIImage.new()

	var_9_18.id = "ProgressLine"

	var_9_18:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -204, _1080p * 204, _1080p * 347, _1080p * 348)
	var_9_0:addElement(var_9_18)

	var_9_0.ProgressLine = var_9_18

	local var_9_19
	local var_9_20 = MenuBuilder.BuildRegisteredType("BattlePassProgressBar", {
		controllerIndex = var_9_1
	})

	var_9_20.id = "ProgressBar"

	var_9_20.Fill:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_20.Cap:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_20.Cap:SetAlpha(0, 0)
	var_9_20.Glint:SetAlpha(0, 0)
	var_9_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -204, _1080p * 204, _1080p * 344, _1080p * 350)
	var_9_0:addElement(var_9_20)

	var_9_0.ProgressBar = var_9_20

	local var_9_21
	local var_9_22 = LUI.UIImage.new()

	var_9_22.id = "Fill"

	var_9_22:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -236, _1080p * -204, _1080p * 333, _1080p * 361)
	var_9_0:addElement(var_9_22)

	var_9_0.Fill = var_9_22

	local var_9_23
	local var_9_24 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_9_25 = LUI.UIBorder.new(var_9_24)

	var_9_25.id = "LevelBorder"

	var_9_25:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -236, _1080p * -204, _1080p * 333, _1080p * 361)
	var_9_0:addElement(var_9_25)

	var_9_0.LevelBorder = var_9_25

	local var_9_26
	local var_9_27 = LUI.UIText.new()

	var_9_27.id = "Level"

	var_9_27:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_27:setText("99", 0)
	var_9_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_27:SetWordWrap(false)
	var_9_27:SetTracking(-1 * _1080p, 0)
	var_9_27:SetAlignment(LUI.Alignment.Center)
	var_9_27:SetVerticalAlignment(LUI.Alignment.Center)
	var_9_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -236, _1080p * -204, _1080p * 335, _1080p * 359)
	var_9_0:addElement(var_9_27)

	var_9_0.Level = var_9_27

	local var_9_28
	local var_9_29 = LUI.UIImage.new()

	var_9_29.id = "NextFill"

	var_9_29:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_9_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 204, _1080p * 236, _1080p * 333, _1080p * 361)
	var_9_0:addElement(var_9_29)

	var_9_0.NextFill = var_9_29

	local var_9_30
	local var_9_31 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_9_32 = LUI.UIBorder.new(var_9_31)

	var_9_32.id = "NextLevelBorder"

	var_9_32:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 204, _1080p * 236, _1080p * 333, _1080p * 361)
	var_9_0:addElement(var_9_32)

	var_9_0.NextLevelBorder = var_9_32

	local var_9_33
	local var_9_34 = LUI.UIText.new()

	var_9_34.id = "NextLevel"

	var_9_34:SetRGBFromTable(SWATCHES.BattlePass.Free, 0)
	var_9_34:setText("99", 0)
	var_9_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_34:SetWordWrap(false)
	var_9_34:SetTracking(-1 * _1080p, 0)
	var_9_34:SetAlignment(LUI.Alignment.Center)
	var_9_34:SetVerticalAlignment(LUI.Alignment.Center)
	var_9_34:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 204, _1080p * 236, _1080p * 335, _1080p * 359)
	var_9_0:addElement(var_9_34)

	var_9_0.NextLevel = var_9_34

	local var_9_35
	local var_9_36 = LUI.UIImage.new()

	var_9_36.id = "DoubleXP"

	var_9_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_36:setImage(RegisterMaterial("icon_double_battle_xp"), 0)
	var_9_36:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -41, _1080p * -9, _1080p * 55, _1080p * 87)
	var_9_0:addElement(var_9_36)

	var_9_0.DoubleXP = var_9_36

	local var_9_37
	local var_9_38 = LUI.UIStyledText.new()

	var_9_38.id = "XPActive"

	var_9_38:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_9_38:setText(Engine.CBBHFCGDIC("LUA_MENU/ACTIVE"), 0)
	var_9_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_38:SetWordWrap(false)
	var_9_38:SetAlignment(LUI.Alignment.Right)
	var_9_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -139, _1080p * -41, _1080p * 59, _1080p * 83)
	var_9_0:addElement(var_9_38)

	var_9_0.XPActive = var_9_38

	local var_9_39
	local var_9_40 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_9_1
	})

	var_9_40.id = "PurchaseBattlePassButton"

	var_9_40.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS"), 0)
	var_9_40.Text:SetAlignment(LUI.Alignment.Center)
	var_9_40:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * 308.5, _1080p * 342.5)
	var_9_0:addElement(var_9_40)

	var_9_0.PurchaseBattlePassButton = var_9_40

	local function var_9_41()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_41

	local var_9_42
	local var_9_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("NewUnlockPurchased", var_9_43)

	local var_9_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_9_14:RegisterAnimationSequence("NewUnlockPurchased", var_9_44)

	local var_9_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("NewUnlockPurchased", var_9_45)

	local function var_9_46()
		var_9_6:AnimateSequence("NewUnlockPurchased")
		var_9_14:AnimateSequence("NewUnlockPurchased")
		var_9_16:AnimateSequence("NewUnlockPurchased")
	end

	var_9_0._sequences.NewUnlockPurchased = var_9_46

	local var_9_47
	local var_9_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("NoNewUnlock", var_9_48)

	local var_9_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("NoNewUnlock", var_9_49)

	local var_9_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_9_16:RegisterAnimationSequence("NoNewUnlock", var_9_50)

	local function var_9_51()
		var_9_6:AnimateSequence("NoNewUnlock")
		var_9_14:AnimateSequence("NoNewUnlock")
		var_9_16:AnimateSequence("NoNewUnlock")
	end

	var_9_0._sequences.NoNewUnlock = var_9_51

	local var_9_52
	local var_9_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("FirstTierNoUnlocks", var_9_53)

	local var_9_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_9_16:RegisterAnimationSequence("FirstTierNoUnlocks", var_9_54)

	local function var_9_55()
		var_9_14:AnimateSequence("FirstTierNoUnlocks")
		var_9_16:AnimateSequence("FirstTierNoUnlocks")
	end

	var_9_0._sequences.FirstTierNoUnlocks = var_9_55

	local var_9_56
	local var_9_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("MaxTierPurchased", var_9_57)

	local var_9_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("MaxTierPurchased", var_9_58)

	local var_9_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("MaxTierPurchased", var_9_59)

	local var_9_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_29:RegisterAnimationSequence("MaxTierPurchased", var_9_60)

	local var_9_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_32:RegisterAnimationSequence("MaxTierPurchased", var_9_61)

	local var_9_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_34:RegisterAnimationSequence("MaxTierPurchased", var_9_62)

	local function var_9_63()
		var_9_6:AnimateSequence("MaxTierPurchased")
		var_9_14:AnimateSequence("MaxTierPurchased")
		var_9_16:AnimateSequence("MaxTierPurchased")
		var_9_29:AnimateSequence("MaxTierPurchased")
		var_9_32:AnimateSequence("MaxTierPurchased")
		var_9_34:AnimateSequence("MaxTierPurchased")
	end

	var_9_0._sequences.MaxTierPurchased = var_9_63

	local var_9_64
	local var_9_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("NewUnlock", var_9_65)

	local var_9_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("NewUnlock", var_9_66)

	local var_9_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("NewUnlock", var_9_67)

	local function var_9_68()
		var_9_6:AnimateSequence("NewUnlock")
		var_9_14:AnimateSequence("NewUnlock")
		var_9_16:AnimateSequence("NewUnlock")
	end

	var_9_0._sequences.NewUnlock = var_9_68

	local var_9_69
	local var_9_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("MaxTier", var_9_70)

	local var_9_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		}
	}

	var_9_14:RegisterAnimationSequence("MaxTier", var_9_71)

	local var_9_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_16:RegisterAnimationSequence("MaxTier", var_9_72)

	local var_9_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_29:RegisterAnimationSequence("MaxTier", var_9_73)

	local var_9_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_32:RegisterAnimationSequence("MaxTier", var_9_74)

	local var_9_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 260
		}
	}

	var_9_34:RegisterAnimationSequence("MaxTier", var_9_75)

	local function var_9_76()
		var_9_6:AnimateSequence("MaxTier")
		var_9_14:AnimateSequence("MaxTier")
		var_9_16:AnimateSequence("MaxTier")
		var_9_29:AnimateSequence("MaxTier")
		var_9_32:AnimateSequence("MaxTier")
		var_9_34:AnimateSequence("MaxTier")
	end

	var_9_0._sequences.MaxTier = var_9_76

	local var_9_77
	local var_9_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = -360,
			duration = 33333,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_9_8:RegisterAnimationSequence("Idle", var_9_78)

	local function var_9_79()
		var_9_8:AnimateLoop("Idle")
	end

	var_9_0._sequences.Idle = var_9_79

	local var_9_80
	local var_9_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("NoNewUnlockedPurchased", var_9_81)

	local var_9_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("NoNewUnlockedPurchased", var_9_82)

	local var_9_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_9_16:RegisterAnimationSequence("NoNewUnlockedPurchased", var_9_83)

	local function var_9_84()
		var_9_6:AnimateSequence("NoNewUnlockedPurchased")
		var_9_14:AnimateSequence("NoNewUnlockedPurchased")
		var_9_16:AnimateSequence("NoNewUnlockedPurchased")
	end

	var_9_0._sequences.NoNewUnlockedPurchased = var_9_84

	local var_9_85
	local var_9_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Purchased
		}
	}

	var_9_22:RegisterAnimationSequence("TierLevelCompletedPurchased", var_9_86)

	local var_9_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("TierLevelCompletedPurchased", var_9_87)

	local var_9_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_9_27:RegisterAnimationSequence("TierLevelCompletedPurchased", var_9_88)

	local function var_9_89()
		var_9_22:AnimateSequence("TierLevelCompletedPurchased")
		var_9_25:AnimateSequence("TierLevelCompletedPurchased")
		var_9_27:AnimateSequence("TierLevelCompletedPurchased")
	end

	var_9_0._sequences.TierLevelCompletedPurchased = var_9_89

	local var_9_90
	local var_9_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Free
		}
	}

	var_9_22:RegisterAnimationSequence("TierLevelCompletedFree", var_9_91)

	local var_9_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_25:RegisterAnimationSequence("TierLevelCompletedFree", var_9_92)

	local var_9_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BattlePass.Locked
		}
	}

	var_9_27:RegisterAnimationSequence("TierLevelCompletedFree", var_9_93)

	local function var_9_94()
		var_9_22:AnimateSequence("TierLevelCompletedFree")
		var_9_25:AnimateSequence("TierLevelCompletedFree")
		var_9_27:AnimateSequence("TierLevelCompletedFree")
	end

	var_9_0._sequences.TierLevelCompletedFree = var_9_94

	local var_9_95
	local var_9_96 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("OnlyOneNewUnlock", var_9_96)

	local var_9_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("OnlyOneNewUnlock", var_9_97)

	local var_9_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 367
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 746
		}
	}

	var_9_16:RegisterAnimationSequence("OnlyOneNewUnlock", var_9_98)

	local function var_9_99()
		var_9_6:AnimateSequence("OnlyOneNewUnlock")
		var_9_14:AnimateSequence("OnlyOneNewUnlock")
		var_9_16:AnimateSequence("OnlyOneNewUnlock")
	end

	var_9_0._sequences.OnlyOneNewUnlock = var_9_99

	local var_9_100
	local var_9_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_6:RegisterAnimationSequence("OnlyOneNewUnlockPurchased", var_9_101)

	local var_9_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -290
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -8
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_14:RegisterAnimationSequence("OnlyOneNewUnlockPurchased", var_9_102)

	local var_9_103 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 290
		}
	}

	var_9_16:RegisterAnimationSequence("OnlyOneNewUnlockPurchased", var_9_103)

	local function var_9_104()
		var_9_6:AnimateSequence("OnlyOneNewUnlockPurchased")
		var_9_14:AnimateSequence("OnlyOneNewUnlockPurchased")
		var_9_16:AnimateSequence("OnlyOneNewUnlockPurchased")
	end

	var_9_0._sequences.OnlyOneNewUnlockPurchased = var_9_104

	local var_9_105
	local var_9_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS"),
			child = var_9_0.PurchaseBattlePassButton.Text
		}
	}

	var_9_40:RegisterAnimationSequence("KBM", var_9_106)

	local function var_9_107()
		var_9_40:AnimateSequence("KBM")
	end

	var_9_0._sequences.KBM = var_9_107

	local var_9_108
	local var_9_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("BATTLEPASS/PURCHASE_BATTLEPASS_WITH_BUTTON"),
			child = var_9_0.PurchaseBattlePassButton.Text
		}
	}

	var_9_40:RegisterAnimationSequence("Gamepad", var_9_109)

	local function var_9_110()
		var_9_40:AnimateSequence("Gamepad")
	end

	var_9_0._sequences.Gamepad = var_9_110

	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("BattlePassTierPanel", BattlePassTierPanel)
LockTable(_M)
