module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.recipientXuid)

	local var_1_0 = Friends.HCAFBJBHC(arg_1_1, arg_1_2.recipientXuid)

	if var_1_0 then
		local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/YOUR_GIFT_TO_X_FAILED", Engine.JCBDICCAH(var_1_0.gamertag))

		arg_1_0.Description:setText(var_1_1)
	end

	arg_1_0.CloseButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
end

function GiftingFailedTransaction(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0.id = "GiftingFailedTransaction"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Darkener"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_4:SetAlpha(0.8, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Darkener = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "GenericPopupWindow"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -182, _1080p * 182)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "ButtonHelperBar"

	var_3_8.Background:SetAlpha(0, 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 182, _1080p * 242)
	var_3_0:addElement(var_3_8)

	var_3_0.ButtonHelperBar = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "Image"

	var_3_10:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -630, _1080p * -374, _1080p * -128, _1080p * 128)
	var_3_0:addElement(var_3_10)

	var_3_0.Image = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "Title"

	var_3_12:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_3_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFTING_TRANSACTION_FAILED_TITLE")), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -144, _1080p * -84)
	var_3_0:addElement(var_3_12)

	var_3_0.Title = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "SubTitle"

	var_3_14:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_3_14:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFTING_TRANSACTION_FAILED_SUB_TITLE"), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -57, _1080p * -27)
	var_3_0:addElement(var_3_14)

	var_3_0.SubTitle = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIStyledText.new()

	var_3_16.id = "Description"

	var_3_16:SetRGBFromTable(SWATCHES.CH2.WZFenceMessage, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 805, _1080p * -24, _1080p * 6)
	var_3_0:addElement(var_3_16)

	var_3_0.Description = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIStyledText.new()

	var_3_18.id = "CPNotification"

	var_3_18:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_18:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/GIFTING_NO_COD_POINTS_TAKEN"), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -199, _1080p * 800, _1080p * 40, _1080p * 62)
	var_3_0:addElement(var_3_18)

	var_3_0.CPNotification = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "CPImage"

	var_3_20:setImage(RegisterMaterial("icon_currency_codpoints"), 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -208, _1080p * 36, _1080p * 68)
	var_3_0:addElement(var_3_20)

	var_3_0.CPImage = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "CloseButton"

	var_3_22:SetButtonDisabled(false)
	var_3_22.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLOSE")), 0)
	var_3_22.Text:SetAlignment(LUI.Alignment.Left)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * 244, _1080p * 88, _1080p * 126)
	var_3_0:addElement(var_3_22)

	var_3_0.CloseButton = var_3_22

	function var_3_8.addButtonHelperFunction(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	local var_3_23 = LUI.UIBindButton.new()

	var_3_23.id = "ButtonHelperBarBindButton"

	var_3_8:addElement(var_3_23)

	var_3_8.bindButton = var_3_23

	function var_3_0.addButtonHelperFunction(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_24 = LUI.UIBindButton.new()

	var_3_24.id = "selfBindButton"

	var_3_0:addElement(var_3_24)

	var_3_0.bindButton = var_3_24

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GiftingFailedTransaction", GiftingFailedTransaction)
LockTable(_M)
