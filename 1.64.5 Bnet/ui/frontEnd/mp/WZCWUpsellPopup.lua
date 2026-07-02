module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.Campaign:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/CAMPAIGN")))
	arg_1_0.Zombies:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LAUNCH_ZM")))
	arg_1_0.OperatorLabelPart1:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_GAIN_ACCESS")))
	arg_1_0.OperatorLabelPart2:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_OPERATORS")))
	arg_1_0.SpecialEvents:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT")))
	arg_1_0.WeaponsTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_WEAPONS")))
	arg_1_0.BuyButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		InGameStore.SelectProduct(arg_2_1.controller, STORE.ZeusStandardID, InGameStorePurchaseType.BROWSE)
	end)
	arg_1_0.BuyButton:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0.BuyButton, "ButtonOverGlint")
		ACTIONS.AnimateSequence(arg_1_0.BuyButton, "AnimateGlow")
	end)
	arg_1_0.BuyButton:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_1_0.BuyButton, "ButtonUpGlint")
		ACTIONS.AnimateSequence(arg_1_0.BuyButton, "StopGlow")
	end)
	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if Engine.CIEGIACHAE() then
			InGameStore.ShowStoreIcon(false)
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
	ACTIONS.AnimateSequence(arg_1_0.BuyButton, "Glint")

	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(true, InGameStoreStoreIconPosition.CENTER)
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function WZCWUpsellPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "WZCWUpsellPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_4:SetAlpha(0.85, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "BG"

	var_6_6:SetAlpha(0.8, 0)
	var_6_6:setImage(RegisterMaterial("ui_mp_br_shared_popup_generic_background_ch2"), 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -473, _1080p * 378)
	var_6_0:addElement(var_6_6)

	var_6_0.BG = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "BGOverlayImage"

	var_6_8:SetAlpha(0.8, 0)
	var_6_8:setImage(RegisterMaterial("t9_upsell_image_backing"), 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 67, _1080p * 920)
	var_6_0:addElement(var_6_8)

	var_6_0.BGOverlayImage = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "MultiplayerImg"

	var_6_10:setImage(RegisterMaterial("t9_upsell_multiplayer"), 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 523, _1080p * 872, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_10)

	var_6_0.MultiplayerImg = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "ZombiesImg"

	var_6_12:setImage(RegisterMaterial("t9_upsell_zombies"), 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 903, _1080p * 1252, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_12)

	var_6_0.ZombiesImg = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "CampaignImg"

	var_6_14:setImage(RegisterMaterial("t9_upsell_campaign"), 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 494, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_14)

	var_6_0.CampaignImg = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "CampaignDescBG"

	var_6_16:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_16:SetAlpha(0.85, 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 494, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_16)

	var_6_0.CampaignDescBG = var_6_16

	local var_6_17
	local var_6_18 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_19 = LUI.UIBorder.new(var_6_18)

	var_6_19.id = "CampaignImgBorder"

	var_6_19:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_19:SetAlpha(0.25, 0)
	var_6_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 497, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_19)

	var_6_0.CampaignImgBorder = var_6_19

	local var_6_20
	local var_6_21 = LUI.UIStyledText.new()

	var_6_21.id = "Campaign"

	var_6_21:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_21:setText(Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"), 0)
	var_6_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_21:SetWordWrap(false)
	var_6_21:SetAlignment(LUI.Alignment.Left)
	var_6_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_21:SetStartupDelay(1000)
	var_6_21:SetLineHoldTime(400)
	var_6_21:SetAnimMoveTime(1500)
	var_6_21:SetAnimMoveSpeed(1500)
	var_6_21:SetEndDelay(1500)
	var_6_21:SetCrossfadeTime(400)
	var_6_21:SetFadeInTime(300)
	var_6_21:SetFadeOutTime(300)
	var_6_21:SetMaxVisibleLines(1)
	var_6_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 437, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_21)

	var_6_0.Campaign = var_6_21

	local var_6_22
	local var_6_23 = LUI.UIText.new()

	var_6_23.id = "CampaignDesc"

	var_6_23:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_23:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_CAMPAIGN_DESC"), 0)
	var_6_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_23:SetAlignment(LUI.Alignment.Left)
	var_6_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 437, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_23)

	var_6_0.CampaignDesc = var_6_23

	local var_6_24
	local var_6_25 = LUI.UIImage.new()

	var_6_25.id = "MultiplayerDescBG"

	var_6_25:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_25:SetAlpha(0.85, 0)
	var_6_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 523, _1080p * 872, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_25)

	var_6_0.MultiplayerDescBG = var_6_25

	local var_6_26
	local var_6_27 = LUI.UIText.new()

	var_6_27.id = "MultiplayerDesc"

	var_6_27:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_27:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_MULTIPLAYER_DESC"), 0)
	var_6_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_27:SetAlignment(LUI.Alignment.Left)
	var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 548, _1080p * 848, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_27)

	var_6_0.MultiplayerDesc = var_6_27

	local var_6_28
	local var_6_29 = LUI.UIStyledText.new()

	var_6_29.id = "Multiplayer"

	var_6_29:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_29:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_6_29:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_29:SetWordWrap(false)
	var_6_29:SetAlignment(LUI.Alignment.Left)
	var_6_29:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_29:SetStartupDelay(1000)
	var_6_29:SetLineHoldTime(400)
	var_6_29:SetAnimMoveTime(1500)
	var_6_29:SetAnimMoveSpeed(1500)
	var_6_29:SetEndDelay(1500)
	var_6_29:SetCrossfadeTime(400)
	var_6_29:SetFadeInTime(300)
	var_6_29:SetFadeOutTime(300)
	var_6_29:SetMaxVisibleLines(1)
	var_6_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 548, _1080p * 848, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_29)

	var_6_0.Multiplayer = var_6_29

	local var_6_30
	local var_6_31 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_32 = LUI.UIBorder.new(var_6_31)

	var_6_32.id = "MultiplayerImgBorder"

	var_6_32:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_32:SetAlpha(0.25, 0)
	var_6_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 520, _1080p * 875, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_32)

	var_6_0.MultiplayerImgBorder = var_6_32

	local var_6_33
	local var_6_34 = LUI.UIImage.new()

	var_6_34.id = "ZombiesDescBG"

	var_6_34:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_34:SetAlpha(0.85, 0)
	var_6_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 903, _1080p * 1252, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_34)

	var_6_0.ZombiesDescBG = var_6_34

	local var_6_35
	local var_6_36 = LUI.UIText.new()

	var_6_36.id = "ZombiesDesc"

	var_6_36:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_36:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_ZOMBIES_DESC"), 0)
	var_6_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_36:SetAlignment(LUI.Alignment.Left)
	var_6_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 928, _1080p * 1226, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_36)

	var_6_0.ZombiesDesc = var_6_36

	local var_6_37
	local var_6_38 = LUI.UIStyledText.new()

	var_6_38.id = "Zombies"

	var_6_38:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_38:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_ZOMBIES"), 0)
	var_6_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_38:SetWordWrap(false)
	var_6_38:SetAlignment(LUI.Alignment.Left)
	var_6_38:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_38:SetStartupDelay(1000)
	var_6_38:SetLineHoldTime(400)
	var_6_38:SetAnimMoveTime(1500)
	var_6_38:SetAnimMoveSpeed(1500)
	var_6_38:SetEndDelay(1500)
	var_6_38:SetCrossfadeTime(400)
	var_6_38:SetFadeInTime(300)
	var_6_38:SetFadeOutTime(300)
	var_6_38:SetMaxVisibleLines(1)
	var_6_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 928, _1080p * 1226, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_38)

	var_6_0.Zombies = var_6_38

	local var_6_39
	local var_6_40 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_41 = LUI.UIBorder.new(var_6_40)

	var_6_41.id = "ZombiesImgBorder"

	var_6_41:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_41:SetAlpha(0.25, 0)
	var_6_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 900, _1080p * 1255, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_41)

	var_6_0.ZombiesImgBorder = var_6_41

	local var_6_42
	local var_6_43 = LUI.UIImage.new()

	var_6_43.id = "OperatorBG"

	var_6_43:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_43:SetAlpha(0.85, 0)
	var_6_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1775, _1080p * 600, _1080p * 697)
	var_6_0:addElement(var_6_43)

	var_6_0.OperatorBG = var_6_43

	local var_6_44
	local var_6_45 = LUI.UIStyledText.new()

	var_6_45.id = "OperatorLabelPart2"

	var_6_45:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_OPERATORS"), 0)
	var_6_45:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_45:SetWordWrap(false)
	var_6_45:SetAlignment(LUI.Alignment.Center)
	var_6_45:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_45:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_45:SetStartupDelay(1000)
	var_6_45:SetLineHoldTime(400)
	var_6_45:SetAnimMoveTime(1500)
	var_6_45:SetAnimMoveSpeed(1500)
	var_6_45:SetEndDelay(1000)
	var_6_45:SetCrossfadeTime(400)
	var_6_45:SetFadeInTime(300)
	var_6_45:SetFadeOutTime(300)
	var_6_45:SetMaxVisibleLines(1)
	var_6_45:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 384, _1080p * 805, _1080p * 95, _1080p * 145)
	var_6_0:addElement(var_6_45)

	var_6_0.OperatorLabelPart2 = var_6_45

	local var_6_46
	local var_6_47 = LUI.UIText.new()

	var_6_47.id = "OperatorLabelPart1"

	var_6_47:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_6_47:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_GAIN_ACCESS"), 0)
	var_6_47:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_47:SetAlignment(LUI.Alignment.Center)
	var_6_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 373, _1080p * 815, _1080p * 71, _1080p * 95)
	var_6_0:addElement(var_6_47)

	var_6_0.OperatorLabelPart1 = var_6_47

	local var_6_48
	local var_6_49 = LUI.UIImage.new()

	var_6_49.id = "TitleImg"

	var_6_49:SetScale(-0.1, 0)
	var_6_49:setImage(RegisterMaterial("mw_bocw_logo"), 0)
	var_6_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 398, _1080p * 77, _1080p * 205)
	var_6_0:addElement(var_6_49)

	var_6_0.TitleImg = var_6_49

	local var_6_50
	local var_6_51 = LUI.UIText.new()

	var_6_51.id = "IncludesTagLine"

	var_6_51:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_6_51:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_INCLUDES"), 0)
	var_6_51:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_51:SetAlignment(LUI.Alignment.Left)
	var_6_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 417, _1080p * 1819, _1080p * 117, _1080p * 165)
	var_6_0:addElement(var_6_51)

	var_6_0.IncludesTagLine = var_6_51

	local var_6_52
	local var_6_53 = LUI.UIImage.new()

	var_6_53.id = "OperatorImg1"

	var_6_53:setImage(RegisterMaterial("t9_upsell_op_adler"), 0)
	var_6_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1333, _1080p * 1433, _1080p * 435, _1080p * 593)
	var_6_0:addElement(var_6_53)

	var_6_0.OperatorImg1 = var_6_53

	local var_6_54
	local var_6_55 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_56 = LUI.UIBorder.new(var_6_55)

	var_6_56.id = "OperatorImg1Border"

	var_6_56:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1434, _1080p * 434, _1080p * 594)
	var_6_0:addElement(var_6_56)

	var_6_0.OperatorImg1Border = var_6_56

	local var_6_57
	local var_6_58 = LUI.UIImage.new()

	var_6_58.id = "OperatorImg2"

	var_6_58:setImage(RegisterMaterial("t9_upsell_op_zeyna"), 0)
	var_6_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1447, _1080p * 1547, _1080p * 435, _1080p * 593)
	var_6_0:addElement(var_6_58)

	var_6_0.OperatorImg2 = var_6_58

	local var_6_59
	local var_6_60 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_61 = LUI.UIBorder.new(var_6_60)

	var_6_61.id = "OperatorImg2Border"

	var_6_61:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_61:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1446, _1080p * 1548, _1080p * 434, _1080p * 594)
	var_6_0:addElement(var_6_61)

	var_6_0.OperatorImg2Border = var_6_61

	local var_6_62
	local var_6_63 = LUI.UIImage.new()

	var_6_63.id = "OperatorImg3"

	var_6_63:setImage(RegisterMaterial("t9_upsell_op_park"), 0)
	var_6_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1561, _1080p * 1661, _1080p * 435, _1080p * 593)
	var_6_0:addElement(var_6_63)

	var_6_0.OperatorImg3 = var_6_63

	local var_6_64
	local var_6_65 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_66 = LUI.UIBorder.new(var_6_65)

	var_6_66.id = "OperatorImg3Border"

	var_6_66:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1560, _1080p * 1662, _1080p * 434, _1080p * 594)
	var_6_0:addElement(var_6_66)

	var_6_0.OperatorImg3Border = var_6_66

	local var_6_67
	local var_6_68 = LUI.UIImage.new()

	var_6_68.id = "OperatorImg4"

	var_6_68:setImage(RegisterMaterial("t9_upsell_op_sims"), 0)
	var_6_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1674, _1080p * 1774, _1080p * 435, _1080p * 593)
	var_6_0:addElement(var_6_68)

	var_6_0.OperatorImg4 = var_6_68

	local var_6_69
	local var_6_70 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_71 = LUI.UIBorder.new(var_6_70)

	var_6_71.id = "OperatorImg4Border"

	var_6_71:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_71:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1673, _1080p * 1775, _1080p * 434, _1080p * 594)
	var_6_0:addElement(var_6_71)

	var_6_0.OperatorImg4Border = var_6_71

	local var_6_72
	local var_6_73 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_6_74 = LUI.UIBorder.new(var_6_73)

	var_6_74.id = "OperatorTopLeftCornerBorder"

	var_6_74:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_74:SetAlpha(0.25, 0)
	var_6_74:SetBorderThicknessRight(_1080p * 0, 0)
	var_6_74:SetBorderThicknessBottom(_1080p * 0, 0)
	var_6_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1329, _1080p * 1369, _1080p * 216, _1080p * 256)
	var_6_0:addElement(var_6_74)

	var_6_0.OperatorTopLeftCornerBorder = var_6_74

	local var_6_75
	local var_6_76 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_6_77 = LUI.UIBorder.new(var_6_76)

	var_6_77.id = "OperatorTopRightCornerBorder"

	var_6_77:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_77:SetAlpha(0.25, 0)
	var_6_77:SetBorderThicknessLeft(_1080p * 0, 0)
	var_6_77:SetBorderThicknessBottom(_1080p * 0, 0)
	var_6_77:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1739, _1080p * 1778, _1080p * 216, _1080p * 254)
	var_6_0:addElement(var_6_77)

	var_6_0.OperatorTopRightCornerBorder = var_6_77

	local var_6_78
	local var_6_79 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_80 = LUI.UIBorder.new(var_6_79)

	var_6_80.id = "OperatorBottomLeftCornerBorder"

	var_6_80:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_80:SetAlpha(0.25, 0)
	var_6_80:SetBorderThicknessRight(_1080p * 0, 0)
	var_6_80:SetBorderThicknessTop(_1080p * 0, 0)
	var_6_80:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1329, _1080p * 1369, _1080p * 662, _1080p * 700)
	var_6_0:addElement(var_6_80)

	var_6_0.OperatorBottomLeftCornerBorder = var_6_80

	local var_6_81
	local var_6_82 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_83 = LUI.UIBorder.new(var_6_82)

	var_6_83.id = "OperatorBottomRightCornerBorder"

	var_6_83:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_83:SetAlpha(0.25, 0)
	var_6_83:SetBorderThicknessLeft(_1080p * 0, 0)
	var_6_83:SetBorderThicknessTop(_1080p * 0, 0)
	var_6_83:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1738, _1080p * 1778, _1080p * 660, _1080p * 700)
	var_6_0:addElement(var_6_83)

	var_6_0.OperatorBottomRightCornerBorder = var_6_83

	local var_6_84
	local var_6_85 = LUI.UIImage.new()

	var_6_85.id = "SpecialEventsBG"

	var_6_85:setImage(RegisterMaterial("t9_upsell_redacted_backing_arrow"), 0)
	var_6_85:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 149, _1080p * 690, _1080p * 795, _1080p * 887)
	var_6_0:addElement(var_6_85)

	var_6_0.SpecialEventsBG = var_6_85

	local var_6_86
	local var_6_87 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_88 = LUI.UIBorder.new(var_6_87)

	var_6_88.id = "SpecialEventsBGBorder"

	var_6_88:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_88:SetAlpha(0.25, 0)
	var_6_88:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 690, _1080p * 758, _1080p * 890)
	var_6_0:addElement(var_6_88)

	var_6_0.SpecialEventsBGBorder = var_6_88

	local var_6_89
	local var_6_90 = LUI.UIStyledText.new()

	var_6_90.id = "SpecialEvents"

	var_6_90:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_90:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT"), 0)
	var_6_90:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_90:SetWordWrap(false)
	var_6_90:SetAlignment(LUI.Alignment.Left)
	var_6_90:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_90:SetStartupDelay(1000)
	var_6_90:SetLineHoldTime(400)
	var_6_90:SetAnimMoveTime(1500)
	var_6_90:SetAnimMoveSpeed(1500)
	var_6_90:SetEndDelay(1500)
	var_6_90:SetCrossfadeTime(400)
	var_6_90:SetFadeInTime(300)
	var_6_90:SetFadeOutTime(300)
	var_6_90:SetMaxVisibleLines(1)
	var_6_90:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 164, _1080p * 670, _1080p * 766, _1080p * 796)
	var_6_0:addElement(var_6_90)

	var_6_0.SpecialEvents = var_6_90

	local var_6_91
	local var_6_92 = LUI.UIText.new()

	var_6_92.id = "SpecialEventsDesc"

	var_6_92:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_92:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT_DESC"), 0)
	var_6_92:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_92:SetAlignment(LUI.Alignment.Left)
	var_6_92:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 199, _1080p * 631, _1080p * 804, _1080p * 822)
	var_6_0:addElement(var_6_92)

	var_6_0.SpecialEventsDesc = var_6_92

	local var_6_93
	local var_6_94 = LUI.UIImage.new()

	var_6_94.id = "SpecialEventsXPImg"

	var_6_94:SetAlpha(0, 0)
	var_6_94:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 510, _1080p * 623, _1080p * 770, _1080p * 877)
	var_6_0:addElement(var_6_94)

	var_6_0.SpecialEventsXPImg = var_6_94

	local var_6_95
	local var_6_96 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_97 = LUI.UIBorder.new(var_6_96)

	var_6_97.id = "WeaponsBGBorder"

	var_6_97:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_6_97:SetAlpha(0.25, 0)
	var_6_97:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1255, _1080p * 758, _1080p * 890)
	var_6_0:addElement(var_6_97)

	var_6_0.WeaponsBGBorder = var_6_97

	local var_6_98
	local var_6_99 = LUI.UIImage.new()

	var_6_99.id = "WeaponsBG"

	var_6_99:setImage(RegisterMaterial("t9_upsell_redacted_backing_star"), 0)
	var_6_99:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1255, _1080p * 795, _1080p * 887)
	var_6_0:addElement(var_6_99)

	var_6_0.WeaponsBG = var_6_99

	local var_6_100
	local var_6_101 = LUI.UIStyledText.new()

	var_6_101.id = "WeaponsTitle"

	var_6_101:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_WEAPONS"), 0)
	var_6_101:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_101:SetWordWrap(false)
	var_6_101:SetAlignment(LUI.Alignment.Left)
	var_6_101:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_101:SetStartupDelay(1000)
	var_6_101:SetLineHoldTime(400)
	var_6_101:SetAnimMoveTime(1500)
	var_6_101:SetAnimMoveSpeed(1500)
	var_6_101:SetEndDelay(1500)
	var_6_101:SetCrossfadeTime(400)
	var_6_101:SetFadeInTime(300)
	var_6_101:SetFadeOutTime(300)
	var_6_101:SetMaxVisibleLines(1)
	var_6_101:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 739, _1080p * 1214, _1080p * 766, _1080p * 796)
	var_6_0:addElement(var_6_101)

	var_6_0.WeaponsTitle = var_6_101

	local var_6_102
	local var_6_103 = LUI.UIText.new()

	var_6_103.id = "WeaponDesc"

	var_6_103:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_6_103:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_WEAPONS_DESC"), 0)
	var_6_103:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_103:SetAlignment(LUI.Alignment.Left)
	var_6_103:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 758, _1080p * 1196, _1080p * 804, _1080p * 822)
	var_6_0:addElement(var_6_103)

	var_6_0.WeaponDesc = var_6_103

	local var_6_104
	local var_6_105 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_105.id = "ButtonHelperBar"

	var_6_105.Background:SetAlpha(0, 0)
	var_6_105:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -813, _1080p * 813, _1080p * 388, _1080p * 448)
	var_6_0:addElement(var_6_105)

	var_6_0.ButtonHelperBar = var_6_105

	local var_6_106
	local var_6_107 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_6_1
	})

	var_6_107.id = "BuyButton"

	var_6_107.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_6_107.Text:SetAlignment(LUI.Alignment.Center)
	var_6_107:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1333, _1080p * 1775, _1080p * 797, _1080p * 856)
	var_6_0:addElement(var_6_107)

	var_6_0.BuyButton = var_6_107

	function var_6_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_108 = LUI.UIBindButton.new()

	var_6_108.id = "selfBindButton"

	var_6_0:addElement(var_6_108)

	var_6_0.bindButton = var_6_108

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WZCWUpsellPopup", WZCWUpsellPopup)
LockTable(_M)
