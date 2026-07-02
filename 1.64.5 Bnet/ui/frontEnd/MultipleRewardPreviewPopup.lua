module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 1, #arg_1_0._RewardButtons do
		local var_1_0 = arg_1_0._RewardButtons[iter_1_0]
		local var_1_1 = arg_1_2[iter_1_0]

		var_1_0._lootData = arg_1_2[1]

		var_1_0:UpdateCardConfig(LOOT.GetTypeForID(var_1_1.lootItemID), var_1_1.image)
		var_1_0:ClearCardBackground()
		var_1_0.ItemName:setText(var_1_1.name)
		var_1_0.ItemType:setText(LOOT.GetItemClassName(LOOT.GetTypeForID(var_1_1.lootItemID), var_1_1.ref))
		var_1_0.Foreground:setImage(RegisterMaterial(var_1_1.image))
		var_1_0:registerEventHandler("button_action", function(arg_2_0, arg_2_1)
			STORE.PreviewItem(arg_2_1.controller, LOOT.GetTypeForID(arg_2_0._lootData.lootItemID), arg_2_0._lootData.lootItemID)
		end)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	local var_3_0 = "BATTLEPASS/PREVIEW_PROMPT"

	if LUI.IsLastInputKeyboardMouse(arg_3_1) then
		var_3_0 = "LUA_MENU/SELECT_PREVIEW"
	end

	arg_3_0.Preview:setText(Engine.CBBHFCGDIC(var_3_0))
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._RewardButtons = {
		arg_4_0.FirstReward,
		arg_4_0.SecondReward
	}

	var_0_1(arg_4_0, arg_4_1)
	arg_4_0:addEventHandler("update_input_type", function(arg_5_0, arg_5_1)
		var_0_1(arg_5_0, arg_5_1.controllerIndex)
	end)
	var_0_0(arg_4_0, arg_4_1, arg_4_2.lootData)
	arg_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK"),
		container = arg_4_0.Prompts
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)
	ACTIONS.ScaleFullscreen(arg_4_0.Darkener)
end

function MultipleRewardPreviewPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIHorizontalNavigator.new()

	var_6_0.id = "MultipleRewardPreviewPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_4:SetAlpha(0.97, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "Prompts"

	if CONDITIONS.AlwaysFalse(var_6_0) then
		var_6_6.Label:setText("Select/Back", 0)
	end

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * -730, _1080p * 340, _1080p * 371)
	var_6_0:addElement(var_6_6)

	var_6_0.Prompts = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "GenericPopupWindow"

	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -860, _1080p * 860, _1080p * -340, _1080p * 340)
	var_6_0:addElement(var_6_8)

	var_6_0.GenericPopupWindow = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "Title"

	var_6_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_10:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PREVIEW")), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -324, _1080p * -264)
	var_6_0:addElement(var_6_10)

	var_6_0.Title = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "Preview"

	var_6_12:SetRGBFromTable(SWATCHES.text.offwhite, 0)
	var_6_12:setText(Engine.CBBHFCGDIC("BATTLEPASS/PREVIEW_PROMPT"), 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 748, _1080p * 1172, _1080p * 282, _1080p * 306)
	var_6_0:addElement(var_6_12)

	var_6_0.Preview = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "FirstReward"

	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 870, _1080p * 400, _1080p * 680)
	var_6_0:addElement(var_6_14)

	var_6_0.FirstReward = var_6_14

	local var_6_15
	local var_6_16 = MenuBuilder.BuildRegisteredType("LootItemCard", {
		controllerIndex = var_6_1
	})

	var_6_16.id = "SecondReward"

	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1067, _1080p * 1277, _1080p * 400, _1080p * 680)
	var_6_0:addElement(var_6_16)

	var_6_0.SecondReward = var_6_16

	local var_6_17 = LUI.UIBindButton.new()

	var_6_17.id = "selfBindButton"

	var_6_0:addElement(var_6_17)

	var_6_0.bindButton = var_6_17

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("MultipleRewardPreviewPopup", MultipleRewardPreviewPopup)
LockTable(_M)
