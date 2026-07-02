module(..., package.seeall)

local var_0_0 = 500

local function var_0_1(arg_1_0)
	ACTIONS.AnimateSequence(arg_1_0, "Purchasing")
	arg_1_0.bindButton:registerEventHandler("button_secondary", nil)
	arg_1_0.ConfirmButton:SetButtonDisabled(true)
	arg_1_0.CancelButton:SetButtonDisabled(true)

	arg_1_0:Wait(var_0_0).onComplete = function()
		ACTIONS.AnimateSequence(arg_1_0, "ShowProgress")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._currentSeason = SEASON.GetCurrentSeasonDataNum({
		isForBattlePass = true
	})

	if arg_3_0._currentSeason then
		ACTIONS.AnimateSequence(arg_3_0, "S5")
	end

	if arg_3_2.image then
		arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.image))
	end

	arg_3_0.Image:SetMask(arg_3_0.Mask)

	if arg_3_2.itemCost then
		arg_3_0.Price.Amount:setText(arg_3_2.itemCost)
		arg_3_0.Price.Currency:setImage(RegisterMaterial("icon_currency_codpoints"))
		ACTIONS.AnimateSequence(arg_3_0.Price, "PriceAndIcon")
		ACTIONS.AnimateSequence(arg_3_0.Price, "HideBacker")
	else
		arg_3_0.Price:SetAlpha(0)
	end

	if arg_3_2.itemImage then
		arg_3_0.Image:setImage(RegisterMaterial(arg_3_2.itemImage))
	end

	if arg_3_2.itemName then
		arg_3_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/STORE_CONFIRM_PURCHASE_MESSAGE", arg_3_2.itemName))
	else
		arg_3_0.Message:setText("")
	end

	arg_3_0.ConfirmButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		if arg_3_2.confirmAction and type(arg_3_2.confirmAction) == "function" then
			var_0_1(arg_3_0)
			arg_3_2.confirmAction()
		else
			LUI.FlowManager.RequestLeaveMenu(arg_4_0, false, false)
		end
	end)

	local function var_3_0(arg_5_0, arg_5_1)
		if arg_3_2.cancelAction and type(arg_3_2.cancelAction) == "function" then
			arg_3_2.cancelAction()
		end

		LUI.FlowManager.RequestLeaveMenu(arg_5_0, false, false)
	end

	arg_3_0.CancelButton:addEventHandler("button_action", var_3_0)

	arg_3_0.bindButton = LUI.UIBindButton.new()
	arg_3_0.bindButton.id = "BindButton"

	arg_3_0:addElement(arg_3_0.bindButton)
	arg_3_0.bindButton:addEventHandler("button_secondary", var_3_0)
	arg_3_0:registerEventHandler("update_battle_pass_purchasing_popup", function(arg_6_0, arg_6_1)
		if arg_6_1.progress then
			arg_3_0.Progress:SetProgress(arg_6_1.progress, 1)
		end
	end)

	if arg_3_2.skipToPurchaseState then
		arg_3_2.confirmAction()
		var_0_1(arg_3_0)
	end

	if arg_3_2.titleOverride then
		arg_3_0.Title:setText(Engine.CBBHFCGDIC(arg_3_2.titleOverride))
	end
end

function BattlePassConfirmPurchasePopup(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalNavigator.new()

	var_7_0.id = "BattlePassConfirmPurchasePopup"
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

	var_7_4.id = "Darkener"

	var_7_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_4:SetAlpha(0.9, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Darkener = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "GenericPopupWindow"

	var_7_6.PopupBackground:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_7_6.PopupBackground:SetAlpha(0.3, 0)
	var_7_6.CornerTopLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6.CornerTopRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6.CornerBotLeft:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6.CornerBotRight:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6.TopBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6.BotBorder:SetRGBFromTable(SWATCHES.BattlePass.PopupTexture, 0)
	var_7_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -193, _1080p * 207)
	var_7_0:addElement(var_7_6)

	var_7_0.GenericPopupWindow = var_7_6

	local var_7_7
	local var_7_8 = LUI.UIImage.new()

	var_7_8.id = "Image"

	var_7_8:setImage(RegisterMaterial("battlepass_purchase_image"), 0)
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -853, _1080p * 267, _1080p * -191, _1080p * 205)
	var_7_0:addElement(var_7_8)

	var_7_0.Image = var_7_8

	local var_7_9
	local var_7_10 = LUI.UIImage.new()

	var_7_10.id = "Mask"

	var_7_10:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1227, _1080p * 344, _1080p * 747)
	var_7_0:addElement(var_7_10)

	var_7_0.Mask = var_7_10

	local var_7_11
	local var_7_12 = LUI.UIText.new()

	var_7_12.id = "Title"

	var_7_12:SetRGBFromTable(SWATCHES.BattlePass.PopupTitle, 0)
	var_7_12:SetAlpha(0.9, 0)
	var_7_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STORE_CONFIRM_PURCHASE_TITLE")), 0)
	var_7_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_7_12:SetAlignment(LUI.Alignment.Left)
	var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -162, _1080p * -102)
	var_7_0:addElement(var_7_12)

	var_7_0.Title = var_7_12

	local var_7_13
	local var_7_14 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_7_1
	})

	var_7_14.id = "ConfirmButton"

	var_7_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_7_14.Text:SetAlignment(LUI.Alignment.Left)
	var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 70, _1080p * 108)
	var_7_0:addElement(var_7_14)

	var_7_0.ConfirmButton = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "CancelButton"

	var_7_16.Text:setText(Engine.CBBHFCGDIC("MENU/CANCEL"), 0)
	var_7_16.Text:SetAlignment(LUI.Alignment.Left)
	var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 118, _1080p * 156)
	var_7_0:addElement(var_7_16)

	var_7_0.CancelButton = var_7_16

	local var_7_17
	local var_7_18 = LUI.UIStyledText.new()

	var_7_18.id = "Message"

	var_7_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_7_18:setText("", 0)
	var_7_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_7_18:SetAlignment(LUI.Alignment.Left)
	var_7_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -97, _1080p * -75)
	var_7_0:addElement(var_7_18)

	var_7_0.Message = var_7_18

	local var_7_19
	local var_7_20 = MenuBuilder.BuildRegisteredType("PriceButtonSmall", {
		controllerIndex = var_7_1
	})

	var_7_20.id = "Price"

	var_7_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -40, _1080p * -8, _1080p * 42)
	var_7_0:addElement(var_7_20)

	var_7_0.Price = var_7_20

	local var_7_21
	local var_7_22 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_7_1
	})

	var_7_22.id = "PlayerDetails"

	var_7_22:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_7_0:addElement(var_7_22)

	var_7_0.PlayerDetails = var_7_22

	local var_7_23
	local var_7_24 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_7_1
	})

	var_7_24.id = "Spinner"

	var_7_24:SetAlpha(0, 0)
	var_7_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1060, _1080p * 552, _1080p * 562)
	var_7_0:addElement(var_7_24)

	var_7_0.Spinner = var_7_24

	local var_7_25
	local var_7_26 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
		controllerIndex = var_7_1
	})

	var_7_26.id = "Progress"

	var_7_26:SetAlpha(0, 0)
	var_7_26.Fill:SetRGBFromTable(SWATCHES.BattlePass.Purchased, 0)
	var_7_26.Frame:SetAlpha(0, 0)
	var_7_26.Cap:SetAlpha(0, 0)
	var_7_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 720, _1080p * 1060, _1080p * 552, _1080p * 562)
	var_7_0:addElement(var_7_26)

	var_7_0.Progress = var_7_26

	local var_7_27
	local var_7_28 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})

	var_7_28.id = "ButtonHelperBar"

	var_7_28.Background:SetAlpha(0, 0)
	var_7_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 207, _1080p * 267)
	var_7_0:addElement(var_7_28)

	var_7_0.ButtonHelperBar = var_7_28

	local var_7_29
	local var_7_30 = LUI.UIImage.new()

	var_7_30.id = "Sparks"

	var_7_30:SetAlpha(0.3, 0)
	var_7_30:setImage(RegisterMaterial("battlepass_sparks"), 0)
	var_7_30:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -533, _1080p * -191, _1080p * 207)
	var_7_0:addElement(var_7_30)

	var_7_0.Sparks = var_7_30

	local function var_7_31()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_31

	local var_7_32
	local var_7_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_TITLE"))
		}
	}

	var_7_12:RegisterAnimationSequence("Purchasing", var_7_33)

	local var_7_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_18:RegisterAnimationSequence("Purchasing", var_7_34)

	local var_7_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_20:RegisterAnimationSequence("Purchasing", var_7_35)

	local var_7_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_24:RegisterAnimationSequence("Purchasing", var_7_36)

	local function var_7_37()
		var_7_12:AnimateSequence("Purchasing")
		var_7_18:AnimateSequence("Purchasing")
		var_7_20:AnimateSequence("Purchasing")
		var_7_24:AnimateSequence("Purchasing")
	end

	var_7_0._sequences.Purchasing = var_7_37

	local var_7_38
	local var_7_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_26:RegisterAnimationSequence("ShowProgress", var_7_39)

	local function var_7_40()
		var_7_26:AnimateSequence("ShowProgress")
	end

	var_7_0._sequences.ShowProgress = var_7_40

	local var_7_41
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

	var_7_30:RegisterAnimationSequence("S5", var_7_42)

	local function var_7_43()
		var_7_30:AnimateSequence("S5")
	end

	var_7_0._sequences.S5 = var_7_43

	function var_7_0.addButtonHelperFunction(arg_12_0, arg_12_1)
		arg_12_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_12_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_7_0:addEventHandler("menu_create", var_7_0.addButtonHelperFunction)

	local var_7_44 = LUI.UIBindButton.new()

	var_7_44.id = "selfBindButton"

	var_7_0:addElement(var_7_44)

	var_7_0.bindButton = var_7_44

	var_0_2(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BattlePassConfirmPurchasePopup", BattlePassConfirmPurchasePopup)
LockTable(_M)
