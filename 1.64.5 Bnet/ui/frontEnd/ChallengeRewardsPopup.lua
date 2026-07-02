module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = LOOT.GetLootCardData(arg_1_0._controllerIndex, arg_1_2)

	if var_1_0 then
		local var_1_1 = LOOT.GetDarkRarityColor(var_1_0.rarity)

		arg_1_1.RarityBG:SetRGBFromTable(var_1_1)
		arg_1_1.Border:setImage(RegisterMaterial(LOOT.GetRarityBorder(var_1_0.rarity)))
		arg_1_1.RarityImage:setImage(RegisterMaterial(var_1_0.rarityImage))
		LOOT.ApplyRarityIconColoring(arg_1_1.RarityImage, var_1_0.rarity)
		ACTIONS.AnimateSequence(arg_1_1, "GlintAnime")

		if var_1_0.image and #var_1_0.image > 0 then
			arg_1_1:UpdateCardConfig(var_1_0.type, var_1_0.image)
			arg_1_1.Foreground:setImage(RegisterMaterial(var_1_0.image))
		else
			assert(false, "Could not find image asset for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end

		if var_1_0.name and #var_1_0.name > 0 then
			arg_1_1.ItemName:setText(ToUpperCase(var_1_0.name))
		else
			assert(false, "Could not find item name for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end

		local var_1_2 = LOOT.GetItemClassName(var_1_0.type, var_1_0.ref)

		if var_1_2 and #var_1_2 > 0 then
			arg_1_1.ItemType:setText(var_1_2)
		else
			assert(false, "Could not find item class name for type: " .. var_1_0.type .. ", and ref: " .. var_1_0.ref)
		end
	else
		assert(false, "Missing loot card data for id " .. arg_1_2)
		arg_1_1:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if not arg_2_2.rewards or #arg_2_2.rewards == 0 then
		LUI.FlowManager.RequestLeaveMenu(arg_2_0)

		return
	end

	arg_2_0._controllerIndex = arg_2_1

	local var_2_0 = #arg_2_2.rewards

	arg_2_0.RewardsGrid:SetNumChildren(var_2_0)
	arg_2_0.RewardsGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = arg_2_0.RewardsGrid:GetContentIndex(arg_3_1, arg_3_2)
		local var_3_1 = arg_2_2.rewards[var_3_0 + 1]
		local var_3_2 = tonumber(StringTable.DIFCHIGDFB(CSV.miscChallenges.file, CSV.miscChallenges.cols.id, var_3_1, CSV.miscChallenges.cols.loot))

		var_0_0(arg_2_0, arg_3_0, var_3_2)
	end)

	local var_2_1 = 210
	local var_2_2 = 20
	local var_2_3 = var_2_1 * var_2_0 + var_2_2 * (var_2_0 - 1)

	arg_2_0.RewardsGrid:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * (-var_2_3 / 2), _1080p * (var_2_3 / 2), _1080p * -100, _1080p * 180)

	local function var_2_4(arg_4_0, arg_4_1)
		if arg_2_2.freeRewards and arg_2_2.toastNotificationDetails then
			arg_2_0:dispatchEventToRoot({
				name = "send_toast_notification",
				immediate = true,
				options = arg_2_2.toastNotificationDetails
			})
			LUI.FlowManager.RequestLeaveMenu(arg_4_0)
		else
			STORE.GoToStore(arg_2_1, arg_2_0.id, "vip")
		end
	end

	arg_2_0.CollectButton:registerEventHandler("button_action", var_2_4)

	local var_2_5 = LUI.UIBindButton.new()

	var_2_5.id = "selfBindButton"

	arg_2_0:addElement(var_2_5)

	arg_2_0._bindButton = var_2_5

	arg_2_0._bindButton:registerEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if arg_2_2.freeRewards then
			var_2_4(arg_5_0, arg_5_1)
		else
			LUI.FlowManager.RequestLeaveMenu(arg_5_0)
		end
	end)
	arg_2_0.ButtonHelperBar.ButtonHelperText:PopButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("")
	})
	arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if arg_2_2.description then
		arg_2_0.RewardDescription:setText(arg_2_2.description, 0)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.Background)
end

function ChallengeRewardsPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0.id = "ChallengeRewardsPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.9, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GenericPopupWindow"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -300, _1080p * 299)
	var_6_0:addElement(var_6_6)

	var_6_0.GenericPopupWindow = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "ButtonHelperBar"

	var_6_8:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_6_8.Background:SetAlpha(0, 0)
	var_6_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -818, _1080p * 314, _1080p * 364)
	var_6_0:addElement(var_6_8)

	var_6_0.ButtonHelperBar = var_6_8

	local var_6_9

	if Engine.DDJFBBJAIG() then
		local var_6_10 = {
			scrollingThresholdX = 1,
			maxVisibleRows = 1,
			maxVelocity = 5000,
			adjustSizeToContent = false,
			scrollingThresholdY = 1,
			wrapX = false,
			maxVisibleColumns = 9,
			wrapY = false,
			arrowsVerticalOffset = 0,
			buildArrowsLabel = false,
			springCoefficient = 400,
			controllerIndex = var_6_1,
			buildChild = function()
				return MenuBuilder.BuildRegisteredType("LootItemCard", {
					controllerIndex = var_6_1
				})
			end,
			refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
				return
			end,
			primaryAxis = LUI.DIRECTION.horizontal,
			spacingX = _1080p * 20,
			spacingY = _1080p * 20,
			columnWidth = _1080p * 210,
			rowHeight = _1080p * 280,
			horizontalAlignment = LUI.Alignment.Left,
			verticalAlignment = LUI.Alignment.Middle
		}
		local var_6_11 = LUI.UIGrid.new(var_6_10)

		var_6_11.id = "RewardsGrid"

		var_6_11:SetScale(-0.2, 0)
		var_6_11:setUseStencil(false)
		var_6_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -650, _1080p * 650, _1080p * -103, _1080p * 177)
		var_6_0:addElement(var_6_11)

		var_6_0.RewardsGrid = var_6_11
	end

	local var_6_12
	local var_6_13 = LUI.UIStyledText.new()

	var_6_13.id = "RewardDescription"

	var_6_13:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_13:setText(Engine.CBBHFCGDIC("STORE/VG_EVENT_REWARD_DESC"), 0)
	var_6_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_13:SetAlignment(LUI.Alignment.Center)
	var_6_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -305, _1080p * 305, _1080p * -199, _1080p * -171)
	var_6_0:addElement(var_6_13)

	var_6_0.RewardDescription = var_6_13

	local var_6_14
	local var_6_15 = LUI.UIText.new()

	var_6_15.id = "Title"

	var_6_15:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_6_15:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONGRATULATIONS")), 0)
	var_6_15:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_15:SetAlignment(LUI.Alignment.Center)
	var_6_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -602, _1080p * 602, _1080p * -272, _1080p * -212)
	var_6_0:addElement(var_6_15)

	var_6_0.Title = var_6_15

	local var_6_16
	local var_6_17 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_6_1
	})

	var_6_17.id = "CollectButton"

	var_6_17:SetScale(-0.2, 0)
	var_6_17.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/COLLECT_REWARD"), 0)
	var_6_17.Text:SetAlignment(LUI.Alignment.Center)
	var_6_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 216, _1080p * 254)
	var_6_0:addElement(var_6_17)

	var_6_0.CollectButton = var_6_17

	function var_6_0.addButtonHelperFunction(arg_9_0, arg_9_1)
		arg_9_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_18 = LUI.UIBindButton.new()

	var_6_18.id = "selfBindButton"

	var_6_0:addElement(var_6_18)

	var_6_0.bindButton = var_6_18

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ChallengeRewardsPopup", ChallengeRewardsPopup)
LockTable(_M)
