module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		{
			showButton = false,
			image = "image_basicstore_announcer001",
			productId = 1,
			price = 0,
			possibleId = {
				"codpoints200",
				"preorder_base_pre"
			},
			title = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_STANDARD"),
			contentLong = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_STANDARD"),
			status = InGameStoreProductStatus.OWNED,
			skuType = InGameStoreProductSkuType.DEMONWARE
		},
		{
			showButton = false,
			image = "image_basicstore_announcer002",
			productId = 2,
			price = "OWNED",
			possibleId = {
				"preorder_deluxe",
				"preorder_ugd_base_to_deluxe",
				"preorder_deluxe_pre"
			},
			title = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_DELUXE"),
			contentLong = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_DELUXE"),
			status = InGameStoreProductStatus.OWNED,
			skuType = InGameStoreProductSkuType.DEMONWARE
		},
		{
			showButton = false,
			image = "image_basicstore_announcer003",
			productId = 3,
			price = 0,
			possibleId = {
				"preorder_enhanced",
				"preorder_ugd_base_to_enhanced",
				"preorder_ugd_deluxe_to_enhanced",
				"preorder_enhanced_pre"
			},
			title = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_ENHANCED"),
			contentLong = Engine.CBBHFCGDIC("LUA_MENU/PREPURCHASE_ENHANCED"),
			status = InGameStoreProductStatus.OWNED,
			skuType = InGameStoreProductSkuType.DEMONWARE
		}
	}
	local var_1_1 = InGameStore.GetCategoryProducts(arg_1_1, "codpoints")

	arg_1_0._editionButtons = {
		arg_1_0.EditionButtons.StandardEditionButton,
		arg_1_0.EditionButtons.OperatorEditionButton,
		arg_1_0.EditionButtons.OperatorEnhancedEditionButton
	}

	local var_1_2 = false

	if var_1_1 then
		for iter_1_0 = 1, #var_1_0 do
			for iter_1_1, iter_1_2 in ipairs(var_1_0[iter_1_0].possibleId) do
				for iter_1_3 = 1, #var_1_1 do
					if var_1_1[iter_1_3].productId == iter_1_2 then
						var_1_0[iter_1_0].title = var_1_1[iter_1_3].title
						var_1_0[iter_1_0].contentLong = var_1_1[iter_1_3].contentLong
						var_1_0[iter_1_0].price = var_1_1[iter_1_3].price
						var_1_0[iter_1_0].status = var_1_1[iter_1_3].status
						var_1_0[iter_1_0].productId = var_1_1[iter_1_3].productId
						var_1_0[iter_1_0].skuType = var_1_1[iter_1_3].skuType
						var_1_0[iter_1_0].showButton = true

						if var_1_0[iter_1_0].status ~= InGameStoreProductStatus.NOT_OWNED then
							var_1_2 = true
						end

						break
					end
				end
			end
		end
	end

	if Engine.BAHIIBFDDG() and var_1_2 == true then
		for iter_1_4 = 1, #var_1_0 do
			var_1_0[iter_1_4].showButton = var_1_0[iter_1_4].status ~= InGameStoreProductStatus.NOT_OWNED
		end
	end

	for iter_1_5 = 1, #var_1_0 do
		arg_1_0._editionButtons[iter_1_5]:SetupButtonData(var_1_0[iter_1_5], iter_1_5, menu)

		if var_1_0[iter_1_5].showButton then
			arg_1_0.EditionButtons:AddButton(iter_1_5)

			arg_1_0._defaultFocusIndex = iter_1_5
		else
			arg_1_0.EditionButtons:RemoveButton(iter_1_5)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	assert(arg_2_1.transactionResult)

	if arg_2_1.transactionResult ~= STORE.TransactionResult.TRANSACTION_SUCCEEDED then
		return
	end

	local var_2_0 = {
		message = Engine.CBBHFCGDIC("TRIAL/RESTART_NEW_CONTENT"),
		buttons = {
			{
				label = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP"),
				action = function()
					Engine.DJEDDFJEIG()
				end
			}
		}
	}

	LUI.FlowManager.RequestPopupMenu(nil, "PopupMessageAndButtons", true, arg_2_1.controllerIndex, false, var_2_0)
end

local function var_0_2(arg_4_0, arg_4_1)
	arg_4_0:SetMouseFocusBlocker(false)
	var_0_0(arg_4_0, arg_4_1)
	ACTIONS.AnimateSequence(arg_4_0, "ShowContent")

	if LUI.IsLastInputGamepad(arg_4_1) then
		if arg_4_0._editionButtons and arg_4_0.selectedIndex and arg_4_0._editionButtons[arg_4_0.selectedIndex].added == true then
			arg_4_0._editionButtons[arg_4_0.selectedIndex]:processEvent({
				name = "gain_focus"
			})
		else
			arg_4_0._editionButtons[arg_4_0._defaultFocusIndex]:processEvent({
				name = "gain_focus"
			})
		end
	end
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0:SetMouseFocusBlocker(true)
	InGameStore.FetchCatalog(arg_5_1, true, true)

	local var_5_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "update_preorder_tab",
			controllerIndex = arg_5_1
		}
	})

	var_5_0.id = "preorderTimer"

	arg_5_0:addElement(var_5_0)

	arg_5_0._preorderTimer = var_5_0

	arg_5_0:registerEventHandler("update_preorder_tab", function(arg_6_0, arg_6_1)
		local var_6_0 = InGameStore.GetCatalogStatus(arg_6_1.controllerIndex)
		local var_6_1 = false

		if var_6_0 == InGameStoreCatalogStatus.READY then
			var_0_2(arg_6_0, arg_6_1.controllerIndex)

			var_6_1 = true
		elseif var_6_0 == InGameStoreCatalogStatus.ERROR then
			var_6_1 = true

			local var_6_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_6_3 = Engine.BIAFEJHHDD()

				if var_6_3 ~= nil then
					local var_6_4 = Engine.JCBDICCAH(var_6_3)

					var_6_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_6_4)

					Engine.DCFIDJGACA()
				else
					var_6_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_6_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_6_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_6_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_6_2, nil, false, true)
			Engine.DHCGHHBHCH()
			ACTIONS.AnimateSequence(arg_5_0, "Error")
		end

		if var_6_1 then
			arg_6_0._preorderTimer:closeTree()

			arg_6_0._preorderTimer = nil
		end
	end)
end

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._defaultFocusIndex = 3

	local var_7_0 = Engine.HDGDBCJFG()

	var_0_3(arg_7_0, arg_7_1)
	arg_7_0:registerEventHandler("ingamestore_purchased_product", var_0_1)

	if not LUI.TrialManager:TrialHasEnded() then
		function arg_7_0.addButtonHelperFunction(arg_8_0, arg_8_1)
			arg_8_0:AddButtonHelperText({
				side = "left",
				button_ref = "button_secondary",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
			})
		end

		arg_7_0:addEventHandler("menu_create", arg_7_0.addButtonHelperFunction)

		local var_7_1 = LUI.UIBindButton.new()

		var_7_1.id = "selfBindButton"

		arg_7_0:addElement(var_7_1)

		arg_7_0.bindButton = var_7_1

		arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
			ACTIONS.LeaveMenu(arg_7_0)
		end)
	else
		function arg_7_0.addButtonHelperFunction(arg_10_0, arg_10_1)
			if var_7_0 then
				arg_10_0:AddButtonHelperText({
					clickable = true,
					priority = 0,
					side = "left",
					button_ref = "button_secondary",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
				})
			else
				arg_10_0:AddButtonHelperText({
					clickable = true,
					priority = 0,
					side = "left",
					button_ref = "button_secondary",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/QUIT_DESKTOP")
				})
			end
		end

		arg_7_0:addEventHandler("menu_create", arg_7_0.addButtonHelperFunction)

		local var_7_2 = LUI.UIBindButton.new()

		var_7_2.id = "selfBindButton"

		arg_7_0:addElement(var_7_2)

		arg_7_0.bindButton = var_7_2

		arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
			if var_7_0 then
				if CONDITIONS.ArePartiesEnabledInMainMenu() then
					Engine.DAGFFDGFII("xstopprivateparty 0", arg_7_1)
					Dvar.DHEGHJJJHI("LTSNLQNRKO", false)
				end

				LUI.FlowManager.RequestLeaveMenu(arg_11_0, true, true)
			else
				LUI.FlowManager.RequestPopupMenu(arg_7_0, "quit_popmenu", false, arg_11_1.controller)
			end
		end)
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)
	ACTIONS.ScaleFullscreen(arg_7_0.Background)
end

function MPBattlenetStoreMenu(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_12_0.id = "MPBattlenetStoreMenu"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Background"

	var_12_4:SetRGBFromInt(0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "StandardEditionKeyart"

	var_12_6:SetAlpha(0, 0)
	var_12_6:setImage(RegisterMaterial("keyart_standard_edition_background"), 0)
	var_12_6:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.StandardEditionKeyart = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "OperatorEditionKeyart"

	var_12_8:SetAlpha(0, 0)
	var_12_8:setImage(RegisterMaterial("keyart_operator_edition_background"), 0)
	var_12_8:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_12_0:addElement(var_12_8)

	var_12_0.OperatorEditionKeyart = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "OperatorEnhancedEditionKeyart"

	var_12_10:SetAlpha(0, 0)
	var_12_10:setImage(RegisterMaterial("keyart_operator_enhanced_edition_background"), 0)
	var_12_10:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -1080, _1080p * 1080, 0, 0)
	var_12_0:addElement(var_12_10)

	var_12_0.OperatorEnhancedEditionKeyart = var_12_10

	local var_12_11
	local var_12_12 = MenuBuilder.BuildRegisteredType("BattlenetStoreDeveloppers", {
		controllerIndex = var_12_1
	})

	var_12_12.id = "Developpers"

	var_12_12:SetAlpha(0, 0)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -316, _1080p * 316, _1080p * -168, _1080p * -151)
	var_12_0:addElement(var_12_12)

	var_12_0.Developpers = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIText.new()

	var_12_14.id = "LegalMentions"

	var_12_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_12_14:SetAlpha(0, 0)
	var_12_14:setText(Engine.CBBHFCGDIC("MENU/BNET_STORE_LEGAL_MENTIONS"), 0)
	var_12_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_14:SetAlignment(LUI.Alignment.Center)
	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -766, _1080p * 766, _1080p * -243, _1080p * -226)
	var_12_0:addElement(var_12_14)

	var_12_0.LegalMentions = var_12_14

	local var_12_15
	local var_12_16 = MenuBuilder.BuildRegisteredType("MPBattlenetStoreMenuButtons", {
		controllerIndex = var_12_1
	})

	var_12_16.id = "EditionButtons"

	var_12_16:SetAlpha(0, 0)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 742, _1080p * 240, _1080p * 560)
	var_12_0:addElement(var_12_16)

	var_12_0.EditionButtons = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIImage.new()

	var_12_18.id = "Divider"

	var_12_18:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_12_18:SetAlpha(0, 0)
	var_12_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * -218, _1080p * 224, _1080p * 226)
	var_12_0:addElement(var_12_18)

	var_12_0.Divider = var_12_18

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "HelperBar"

	var_12_20.Background:SetAlpha(0.2, 0)
	var_12_20:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0:addElement(var_12_20)

	var_12_0.HelperBar = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIText.new()

	var_12_22.id = "SubTitle"

	var_12_22:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_12_22:SetAlpha(0, 0)
	var_12_22:setText(Engine.CBBHFCGDIC("MENU/CHOOSE_EDITION"), 0)
	var_12_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_22:SetAlignment(LUI.Alignment.Left)
	var_12_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * -218, _1080p * 200, _1080p * 224)
	var_12_0:addElement(var_12_22)

	var_12_0.SubTitle = var_12_22

	local var_12_23
	local var_12_24 = MenuBuilder.BuildRegisteredType("BattlenetStoreItemDescription", {
		controllerIndex = var_12_1
	})

	var_12_24.id = "Description"

	var_12_24:SetAlpha(0, 0)
	var_12_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * -218, _1080p * 590, _1080p * 656)
	var_12_0:addElement(var_12_24)

	var_12_0.Description = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIImage.new()

	var_12_26.id = "AtlasMW"

	var_12_26:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_26:setImage(RegisterMaterial("spinner_loading"), 0)
	var_12_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -171, _1080p * 171, _1080p * -5, _1080p * 5)
	var_12_0:addElement(var_12_26)

	var_12_0.AtlasMW = var_12_26

	local var_12_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("DefaultSequence", var_12_27)

	local var_12_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("DefaultSequence", var_12_28)

	local var_12_29 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("DefaultSequence", var_12_29)

	local var_12_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/CHOOSE_EDITION")
		}
	}

	var_12_22:RegisterAnimationSequence("DefaultSequence", var_12_30)

	local var_12_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("DefaultSequence", var_12_31)

	local function var_12_32()
		var_12_6:AnimateSequence("DefaultSequence")
		var_12_8:AnimateSequence("DefaultSequence")
		var_12_10:AnimateSequence("DefaultSequence")
		var_12_22:AnimateSequence("DefaultSequence")
		var_12_24:AnimateSequence("DefaultSequence")
	end

	var_12_0._sequences.DefaultSequence = var_12_32

	local var_12_33 = {
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ShowOne", var_12_33)

	local var_12_34 = {
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ShowOne", var_12_34)

	local var_12_35 = {
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ShowOne", var_12_35)

	local function var_12_36()
		var_12_6:AnimateSequence("ShowOne")
		var_12_8:AnimateSequence("ShowOne")
		var_12_10:AnimateSequence("ShowOne")
	end

	var_12_0._sequences.ShowOne = var_12_36

	local var_12_37 = {
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ShowTwo", var_12_37)

	local var_12_38 = {
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ShowTwo", var_12_38)

	local var_12_39 = {
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ShowTwo", var_12_39)

	local function var_12_40()
		var_12_6:AnimateSequence("ShowTwo")
		var_12_8:AnimateSequence("ShowTwo")
		var_12_10:AnimateSequence("ShowTwo")
	end

	var_12_0._sequences.ShowTwo = var_12_40

	local var_12_41 = {
		{
			value = 1,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ShowThree", var_12_41)

	local var_12_42 = {
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ShowThree", var_12_42)

	local var_12_43 = {
		{
			value = 0,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_10:RegisterAnimationSequence("ShowThree", var_12_43)

	local function var_12_44()
		var_12_6:AnimateSequence("ShowThree")
		var_12_8:AnimateSequence("ShowThree")
		var_12_10:AnimateSequence("ShowThree")
	end

	var_12_0._sequences.ShowThree = var_12_44

	local var_12_45 = {
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("ShowContent", var_12_45)

	local var_12_46 = {
		{
			value = 0,
			duration = 240,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 130,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("ShowContent", var_12_46)

	local var_12_47 = {
		{
			value = 0,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 110,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("ShowContent", var_12_47)

	local var_12_48 = {
		{
			value = 0.3,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ShowContent", var_12_48)

	local var_12_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("MENU/CHOOSE_EDITION")
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_22:RegisterAnimationSequence("ShowContent", var_12_49)

	local var_12_50 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("ShowContent", var_12_50)

	local var_12_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("ShowContent", var_12_51)

	local function var_12_52()
		var_12_12:AnimateSequence("ShowContent")
		var_12_14:AnimateSequence("ShowContent")
		var_12_16:AnimateSequence("ShowContent")
		var_12_18:AnimateSequence("ShowContent")
		var_12_22:AnimateSequence("ShowContent")
		var_12_24:AnimateSequence("ShowContent")
		var_12_26:AnimateSequence("ShowContent")
	end

	var_12_0._sequences.ShowContent = var_12_52

	local var_12_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("HideContent", var_12_53)

	local var_12_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("HideContent", var_12_54)

	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_16:RegisterAnimationSequence("HideContent", var_12_55)

	local var_12_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("HideContent", var_12_56)

	local var_12_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_22:RegisterAnimationSequence("HideContent", var_12_57)

	local var_12_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("HideContent", var_12_58)

	local var_12_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("HideContent", var_12_59)

	local function var_12_60()
		var_12_12:AnimateSequence("HideContent")
		var_12_14:AnimateSequence("HideContent")
		var_12_16:AnimateSequence("HideContent")
		var_12_18:AnimateSequence("HideContent")
		var_12_22:AnimateSequence("HideContent")
		var_12_24:AnimateSequence("HideContent")
		var_12_26:AnimateSequence("HideContent")
	end

	var_12_0._sequences.HideContent = var_12_60

	local var_12_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_12:RegisterAnimationSequence("Error", var_12_61)

	local var_12_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("Error", var_12_62)

	local var_12_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("Error", var_12_63)

	local var_12_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/STORE_ERROR_GENERIC")
		}
	}

	var_12_22:RegisterAnimationSequence("Error", var_12_64)

	local var_12_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_24:RegisterAnimationSequence("Error", var_12_65)

	local var_12_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_26:RegisterAnimationSequence("Error", var_12_66)

	local function var_12_67()
		var_12_12:AnimateSequence("Error")
		var_12_14:AnimateSequence("Error")
		var_12_18:AnimateSequence("Error")
		var_12_22:AnimateSequence("Error")
		var_12_24:AnimateSequence("Error")
		var_12_26:AnimateSequence("Error")
	end

	var_12_0._sequences.Error = var_12_67

	var_0_4(var_12_0, var_12_1, arg_12_1)
	ACTIONS.AnimateSequence(var_12_0, "DefaultSequence")

	return var_12_0
end

MenuBuilder.registerType("MPBattlenetStoreMenu", MPBattlenetStoreMenu)
LockTable(_M)
