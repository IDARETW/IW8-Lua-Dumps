module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._isUninstallDLCButton = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._checked = arg_2_1

	if arg_2_1 then
		arg_2_0.InstallStatus:setText(Engine.CBBHFCGDIC("MPUI/DLC_INSTALLED"), 0)
		arg_2_0.InstallStatus:SetRGBFromTable(SWATCHES.Frontend.Installed, 0)
	else
		arg_2_0.InstallStatus:setText(Engine.CBBHFCGDIC("MPUI/DLC_NOT_INSTALLED"))
		arg_2_0.InstallStatus:SetRGBFromTable(SWATCHES.Frontend.NotInstalled, 0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetCheckValue = var_0_1
	arg_3_0.SetIsDLCValue = var_0_0

	local function var_3_0(arg_4_0)
		if not arg_3_0._menu or not arg_3_0._product then
			return
		end

		arg_3_0._menu:UpdateDetails(arg_3_0._product, arg_4_0._checked)
	end

	arg_3_0:registerEventHandler("button_over", function(arg_5_0, arg_5_1)
		ACTIONS.AnimateSequence(arg_3_0, "ButtonOver")
		var_3_0(arg_5_0)
	end)
	arg_3_0:registerEventHandler("button_up", function(arg_6_0, arg_6_1)
		if arg_3_0._isUninstallDLCButton then
			ACTIONS.AnimateSequence(arg_3_0, "Highlight")
		else
			ACTIONS.AnimateSequence(arg_3_0, "ButtonUp")
		end
	end)
	arg_3_0:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not arg_3_0._product then
			return
		end

		if arg_3_0._product.status == InGameStoreProductStatus.NOT_INSTALLED or arg_3_0._product.status == InGameStoreProductStatus.NOT_OWNED then
			InGameStore.SelectProduct(arg_3_1, arg_3_0._product.productId, InGameStorePurchaseType.BROWSE)
		elseif arg_3_0._product.status == InGameStoreProductStatus.INSTALLED then
			if not Engine.BAHIIBFDDG() then
				local function var_7_0()
					Dvar.BDEHAEGHAF("LRTQKNLLMO", arg_3_0._product.productId)
					Dvar.DHEGHJJJHI("MKKNSMLKPR", true)
					Dvar.BDEHAEGHAF("LQSPQSNQSN", "LUA_MENU/UNINSTALL_COMPLETED")
					Engine.EBCGADABJ()
				end

				local var_7_1 = arg_3_0._product.productId == STORE.DATA_PACK_1_NAME and "LUA_MENU/UNINSTALL_DATA_PACK_DESC" or "LUA_MENU/UNINSTALL_PACK_DESC"
				local var_7_2 = {
					header = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL_PACK", Engine.JCBDICCAH(arg_3_0._product.title)),
					message = Engine.CBBHFCGDIC(var_7_1, Engine.JCBDICCAH(arg_3_0._product.title)),
					YesAction = var_7_0
				}

				LUI.FlowManager.RequestPopupMenu(nil, "GameUninstallPopup", true, arg_3_1, false, var_7_2)
			end
		elseif arg_3_0._product.status == InGameStoreProductStatus.DOWNLOADING then
			LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupOK", true, arg_3_1, false, {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("LUA_MENU/DLC_DOWNLOADING", Engine.JCBDICCAH(arg_3_0._product.title))
			})
		elseif arg_3_0._product.status == InGameStoreProductStatus.SUSPENDED then
			LUI.FlowManager.RequestPopupMenu(arg_3_0, "PopupOK", true, arg_3_1, false, {
				title = Engine.CBBHFCGDIC("MENU/NOTICE"),
				message = Engine.CBBHFCGDIC("LUA_MENU/DLC_DOWNLOAD_SUSPENDED", Engine.JCBDICCAH(arg_3_0._product.title))
			})
		end
	end)

	local var_3_1 = {
		clearChildrenSFX = true
	}

	arg_3_0:setGainFocusAllSFX(SOUND_SETS.mpMainMenu.quickPlayMove, var_3_1)
end

function GameInstallButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 50 * _1080p)

	var_9_0.id = "GameInstallButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "GenericButtonBackground"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.GenericButtonBackground = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIStyledText.new()

	var_9_6.id = "DLCSizeText"

	var_9_6:SetRGBFromTable(SWATCHES.genericButton.warzoneTextDefault, 0)
	var_9_6:setText(MarkLocalized(ToUpperCase("")), 0)
	var_9_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_6:SetWordWrap(false)
	var_9_6:SetAlignment(LUI.Alignment.Left)
	var_9_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_9_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -528, _1080p * -380, _1080p * 8, _1080p * 23)
	var_9_0:addElement(var_9_6)

	var_9_0.DLCSizeText = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "DLCPackText"

	var_9_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_8:setText(ToUpperCase(""), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(2000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(300)
	var_9_8:SetAnimMoveSpeed(50)
	var_9_8:SetEndDelay(1500)
	var_9_8:SetCrossfadeTime(750)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_9_8:SetOutlineRGBFromInt(0, 0)
	var_9_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -229, _1080p * -12, _1080p * 12)
	var_9_0:addElement(var_9_8)

	var_9_0.DLCPackText = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "DLCUninstall"

	var_9_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_9_10:SetAlpha(0, 0)
	var_9_10:setImage(RegisterMaterial("uninstall_icon"), 0)
	var_9_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 559, _1080p * 594, _1080p * 8, _1080p * 42)
	var_9_0:addElement(var_9_10)

	var_9_0.DLCUninstall = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIStyledText.new()

	var_9_12.id = "InstallStatus"

	var_9_12:SetRGBFromTable(SWATCHES.Frontend.Installed, 0)
	var_9_12:setText(Engine.CBBHFCGDIC("MPUI/DLC_INSTALLED"), 0)
	var_9_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_12:SetWordWrap(false)
	var_9_12:SetAlignment(LUI.Alignment.Right)
	var_9_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_9_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_12:SetStartupDelay(2000)
	var_9_12:SetLineHoldTime(400)
	var_9_12:SetAnimMoveTime(2000)
	var_9_12:SetAnimMoveSpeed(50)
	var_9_12:SetEndDelay(2000)
	var_9_12:SetCrossfadeTime(250)
	var_9_12:SetFadeInTime(300)
	var_9_12:SetFadeOutTime(300)
	var_9_12:SetMaxVisibleLines(1)
	var_9_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 383, _1080p * 584, _1080p * 13, _1080p * 37)
	var_9_0:addElement(var_9_12)

	var_9_0.InstallStatus = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14
	local var_9_15 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonOver", var_9_15)

	local var_9_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonOver", var_9_16)

	local var_9_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 584
		}
	}

	var_9_12:RegisterAnimationSequence("ButtonOver", var_9_17)

	local function var_9_18()
		var_9_8:AnimateSequence("ButtonOver")
		var_9_10:AnimateSequence("ButtonOver")
		var_9_12:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_18

	local var_9_19
	local var_9_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_8:RegisterAnimationSequence("ButtonUp", var_9_20)

	local var_9_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("ButtonUp", var_9_21)

	local var_9_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 584
		}
	}

	var_9_12:RegisterAnimationSequence("ButtonUp", var_9_22)

	local function var_9_23()
		var_9_8:AnimateSequence("ButtonUp")
		var_9_10:AnimateSequence("ButtonUp")
		var_9_12:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_23

	local var_9_24
	local var_9_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_10:RegisterAnimationSequence("Highlight", var_9_25)

	local var_9_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 554
		}
	}

	var_9_12:RegisterAnimationSequence("Highlight", var_9_26)

	local function var_9_27()
		var_9_10:AnimateSequence("Highlight")
		var_9_12:AnimateSequence("Highlight")
	end

	var_9_0._sequences.Highlight = var_9_27

	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("GameInstallButton", GameInstallButton)
LockTable(_M)
