module(..., package.seeall)

function PlayerProgressUpsellPopup(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalNavigator.new()

	var_1_0.id = "PlayerProgressUpsellPopup"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.9, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "GenericPopupWindow"

	var_1_6.PopupBackground:SetAlpha(1, 0)
	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 865, _1080p * -391, _1080p * 465)
	var_1_0:addElement(var_1_6)

	var_1_0.GenericPopupWindow = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Glow"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_8:SetAlpha(0.8, 0)
	var_1_8:SetPixelGridEnabled(true)
	var_1_8:SetPixelGridContrast(0.5, 0)
	var_1_8:SetPixelGridBlockWidth(2, 0)
	var_1_8:SetPixelGridBlockHeight(2, 0)
	var_1_8:SetPixelGridGutterWidth(1, 0)
	var_1_8:SetPixelGridGutterHeight(1, 0)
	var_1_8:setImage(RegisterMaterial("wdg_ellipse_glow"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 906, _1080p * 927, _1080p * 154, _1080p * 1005)
	var_1_0:addElement(var_1_8)

	var_1_0.Glow = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "PreviewImage"

	var_1_10:setImage(RegisterMaterial("magma_player_progress_upsell"), 0)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 864, _1080p * -393, _1080p * 465)
	var_1_0:addElement(var_1_10)

	var_1_0.PreviewImage = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "Gradient"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_12:SetAlpha(0.7, 0)
	var_1_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 920, _1080p * 1412, _1080p * 154, _1080p * 1005)
	var_1_0:addElement(var_1_12)

	var_1_0.Gradient = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIText.new()

	var_1_14.id = "CampaignTitle"

	var_1_14:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_14:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN")), 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_14:SetWordWrap(false)
	var_1_14:SetTracking(16 * _1080p, 0)
	var_1_14:SetAlignment(LUI.Alignment.Left)
	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 558, _1080p * -205, _1080p * -155)
	var_1_0:addElement(var_1_14)

	var_1_0.CampaignTitle = var_1_14

	local var_1_15

	if CONDITIONS.IsUserSignedInDemonware(var_1_1) then
		local var_1_16 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_1_1
		})

		var_1_16.id = "MPPlayerDetails"

		var_1_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_1_0:addElement(var_1_16)

		var_1_0.MPPlayerDetails = var_1_16
	end

	local var_1_17
	local var_1_18 = LUI.UIText.new()

	var_1_18.id = "CampaignDesc"

	var_1_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_18:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAMPAIGN_DESC")), 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Left)
	var_1_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 558, _1080p * -152, _1080p * -122)
	var_1_0:addElement(var_1_18)

	var_1_0.CampaignDesc = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIText.new()

	var_1_20.id = "MPTitle"

	var_1_20:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_20:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS")), 0)
	var_1_20:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_20:SetWordWrap(false)
	var_1_20:SetTracking(16 * _1080p, 0)
	var_1_20:SetAlignment(LUI.Alignment.Left)
	var_1_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 558, _1080p * 82, _1080p * 132)
	var_1_0:addElement(var_1_20)

	var_1_0.MPTitle = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIText.new()

	var_1_22.id = "MPDesc"

	var_1_22:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_22:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MULTI_DESC")), 0)
	var_1_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_22:SetAlignment(LUI.Alignment.Left)
	var_1_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 558, _1080p * 135, _1080p * 165)
	var_1_0:addElement(var_1_22)

	var_1_0.MPDesc = var_1_22

	local var_1_23
	local var_1_24 = LUI.UIText.new()

	var_1_24.id = "CPTitle"

	var_1_24:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_24:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COOP_CAPS")), 0)
	var_1_24:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_24:SetWordWrap(false)
	var_1_24:SetTracking(16 * _1080p, 0)
	var_1_24:SetAlignment(LUI.Alignment.Left)
	var_1_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 552, _1080p * 361, _1080p * 411)
	var_1_0:addElement(var_1_24)

	var_1_0.CPTitle = var_1_24

	local var_1_25
	local var_1_26 = LUI.UIText.new()

	var_1_26.id = "CPDesc"

	var_1_26:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COOP_DESC")), 0)
	var_1_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_26:SetAlignment(LUI.Alignment.Left)
	var_1_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -14, _1080p * 552, _1080p * 414, _1080p * 444)
	var_1_0:addElement(var_1_26)

	var_1_0.CPDesc = var_1_26

	local var_1_27
	local var_1_28 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_1_1
	})

	var_1_28.id = "ButtonHelperBar"

	var_1_28.Background:SetAlpha(0, 0)
	var_1_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * 465, _1080p * 525)
	var_1_0:addElement(var_1_28)

	var_1_0.ButtonHelperBar = var_1_28

	local var_1_29
	local var_1_30 = MenuBuilder.BuildRegisteredType("MagmaUpsellPurchaseButton", {
		controllerIndex = var_1_1
	})

	var_1_30.id = "PurchaseButton"

	var_1_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -648, _1080p * -226, _1080p * 246, _1080p * 375)
	var_1_0:addElement(var_1_30)

	var_1_0.PurchaseButton = var_1_30

	local var_1_31
	local var_1_32 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_32.id = "LeaveButton"

	var_1_32.Text:SetLeft(_1080p * 20, 0)
	var_1_32.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/ELITE_SELL_NOTHANKS")), 0)
	var_1_32.Text:SetAlignment(LUI.Alignment.Center)
	var_1_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -649, _1080p * -227, _1080p * 389, _1080p * 439)
	var_1_0:addElement(var_1_32)

	var_1_0.LeaveButton = var_1_32

	local var_1_33
	local var_1_34 = LUI.UIText.new()

	var_1_34.id = "Title"

	var_1_34:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_34:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CONGRATULATIONS")), 0)
	var_1_34:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_1_34:SetAlignment(LUI.Alignment.Center)
	var_1_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -40, _1080p * -370, _1080p * -310)
	var_1_0:addElement(var_1_34)

	var_1_0.Title = var_1_34

	local var_1_35
	local var_1_36 = LUI.UIText.new()

	var_1_36.id = "PFC"

	var_1_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_1_36:setText(ToUpperCase(Engine.CBBHFCGDIC("RANK/PFC_FULL5")), 0)
	var_1_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_36:SetWordWrap(false)
	var_1_36:SetAlignment(LUI.Alignment.Center)
	var_1_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -40, _1080p * -215, _1080p * -179)
	var_1_0:addElement(var_1_36)

	var_1_0.PFC = var_1_36

	local var_1_37
	local var_1_38 = LUI.UIImage.new()

	var_1_38.id = "Rank"

	var_1_38:setImage(RegisterMaterial("icon_rank_10"), 0)
	var_1_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 433, _1080p * 583, _1080p * 195, _1080p * 345)
	var_1_0:addElement(var_1_38)

	var_1_0.Rank = var_1_38

	local var_1_39
	local var_1_40 = LUI.UIText.new()

	var_1_40.id = "Title1"

	var_1_40:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_40:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DIDYOUKNOW")), 0)
	var_1_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_40:SetWordWrap(false)
	var_1_40:SetAlignment(LUI.Alignment.Left)
	var_1_40:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 176, _1080p * 889, _1080p * -115, _1080p * -79)
	var_1_0:addElement(var_1_40)

	var_1_0.Title1 = var_1_40

	local var_1_41
	local var_1_42 = LUI.UIText.new()

	var_1_42.id = "Desc1"

	var_1_42:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_42:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONERANKDESC"), 0)
	var_1_42:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_42:SetAlignment(LUI.Alignment.Left)
	var_1_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -784, _1080p * -71, _1080p * -73, _1080p * -49)
	var_1_0:addElement(var_1_42)

	var_1_0.Desc1 = var_1_42

	local var_1_43
	local var_1_44 = LUI.UIText.new()

	var_1_44.id = "Title2"

	var_1_44:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_44:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DONTFORGET")), 0)
	var_1_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_44:SetWordWrap(false)
	var_1_44:SetAlignment(LUI.Alignment.Left)
	var_1_44:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 176, _1080p * 889, _1080p * 76, _1080p * 112)
	var_1_0:addElement(var_1_44)

	var_1_0.Title2 = var_1_44

	local var_1_45
	local var_1_46 = LUI.UIText.new()

	var_1_46.id = "Desc2"

	var_1_46:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_1_46:setText(Engine.CBBHFCGDIC("LUA_MENU/WZWEAPON"), 0)
	var_1_46:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_46:SetAlignment(LUI.Alignment.Left)
	var_1_46:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -784, _1080p * -71, _1080p * 119, _1080p * 143)
	var_1_0:addElement(var_1_46)

	var_1_0.Desc2 = var_1_46

	local var_1_47
	local var_1_48 = LUI.UIText.new()

	var_1_48.id = "CatchLine"

	var_1_48:SetRGBFromTable(SWATCHES.CAC.equippedPerkTic, 0)
	var_1_48:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/WAITINGFOR")), 0)
	var_1_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_48:SetWordWrap(false)
	var_1_48:SetAlignment(LUI.Alignment.Center)
	var_1_48:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 96, _1080p * 920, _1080p * 190, _1080p * 226)
	var_1_0:addElement(var_1_48)

	var_1_0.CatchLine = var_1_48

	local var_1_49
	local var_1_50 = LUI.UIText.new()

	var_1_50.id = "Number"

	var_1_50:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_1_50:setText(ToUpperCase("10"), 0)
	var_1_50:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_1_50:SetWordWrap(false)
	var_1_50:SetAlignment(LUI.Alignment.Center)
	var_1_50:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -40, _1080p * -179, _1080p * -129)
	var_1_0:addElement(var_1_50)

	var_1_0.Number = var_1_50

	local var_1_51
	local var_1_52 = LUI.UIImage.new()

	var_1_52.id = "BlueLine"

	var_1_52:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_1_52:SetAlpha(0.6, 0)
	var_1_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 919, _1080p * 907, _1080p * 151, _1080p * 1003)
	var_1_0:addElement(var_1_52)

	var_1_0.BlueLine = var_1_52

	var_1_30:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.controller or var_1_1

		ACTIONS.OpenPopupMenu(var_1_0, "StoreGameUpsellPopup", true, var_2_0)
		ACTIONS.LeaveMenu(var_1_0)
	end)
	var_1_32:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_1_1
		end

		ACTIONS.LeaveMenu(var_1_0)
	end)

	return var_1_0
end

MenuBuilder.registerType("PlayerProgressUpsellPopup", PlayerProgressUpsellPopup)
LockTable(_M)
