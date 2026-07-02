module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 12

	arg_1_0.SpecialEvents:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT")))
	arg_1_0.OperatorLabelPart2:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/X_NEW_OPERATORS", var_1_0))
	arg_1_0.BuyButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		InGameStore.SelectProduct(arg_2_1.controller, STORE.VanguardStandardID, InGameStorePurchaseType.BROWSE)
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

function WZVGUpsellPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "WZVGUpsellPopup"

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
	var_6_8:setImage(RegisterMaterial("s4_upsell_image_backing"), 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 67, _1080p * 920)
	var_6_0:addElement(var_6_8)

	var_6_0.BGOverlayImage = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "BuyButtonBackerGradient"

	var_6_10:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_6_10:SetAlpha(0.3, 0)
	var_6_10:setImage(RegisterMaterial("button_gradient_active_fade_bottom"), 0)
	var_6_10:SetUMin(1, 0)
	var_6_10:SetUMax(0, 0)
	var_6_10:SetVMin(1, 0)
	var_6_10:SetVMax(0, 0)
	var_6_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 557, _1080p * 1824, _1080p * 480, _1080p * 918)
	var_6_0:addElement(var_6_10)

	var_6_0.BuyButtonBackerGradient = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "MultiplayerImg"

	var_6_12:setImage(RegisterMaterial("s4_upsell_multiplayer"), 0)
	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 523, _1080p * 872, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_12)

	var_6_0.MultiplayerImg = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "ZombiesImg"

	var_6_14:setImage(RegisterMaterial("s4_upsell_zombies"), 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 903, _1080p * 1252, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_14)

	var_6_0.ZombiesImg = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "CampaignImg"

	var_6_16:setImage(RegisterMaterial("s4_upsell_campaign"), 0)
	var_6_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 494, _1080p * 212, _1080p * 697)
	var_6_0:addElement(var_6_16)

	var_6_0.CampaignImg = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "CampaignDescBG"

	var_6_18:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_18:SetAlpha(0.85, 0)
	var_6_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 494, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_18)

	var_6_0.CampaignDescBG = var_6_18

	local var_6_19
	local var_6_20 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_21 = LUI.UIBorder.new(var_6_20)

	var_6_21.id = "CampaignImgBorder"

	var_6_21:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_6_21:SetAlpha(0.25, 0)
	var_6_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 497, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_21)

	var_6_0.CampaignImgBorder = var_6_21

	local var_6_22
	local var_6_23 = LUI.UIStyledText.new()

	var_6_23.id = "Campaign"

	var_6_23:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_6_23:setText(Engine.CBBHFCGDIC("MENU_SP/CAMPAIGN"), 0)
	var_6_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_23:SetWordWrap(false)
	var_6_23:SetAlignment(LUI.Alignment.Left)
	var_6_23:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_23:SetStartupDelay(1000)
	var_6_23:SetLineHoldTime(400)
	var_6_23:SetAnimMoveTime(1500)
	var_6_23:SetAnimMoveSpeed(1500)
	var_6_23:SetEndDelay(1500)
	var_6_23:SetCrossfadeTime(400)
	var_6_23:SetFadeInTime(300)
	var_6_23:SetFadeOutTime(300)
	var_6_23:SetMaxVisibleLines(1)
	var_6_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 437, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_23)

	var_6_0.Campaign = var_6_23

	local var_6_24
	local var_6_25 = LUI.UIText.new()

	var_6_25.id = "CampaignDesc"

	var_6_25:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_25:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/VG_UPSELL_CAMPAGIN_DESC"), 0)
	var_6_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_25:SetAlignment(LUI.Alignment.Left)
	var_6_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 160, _1080p * 437, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_25)

	var_6_0.CampaignDesc = var_6_25

	local var_6_26
	local var_6_27 = LUI.UIImage.new()

	var_6_27.id = "MultiplayerDescBG"

	var_6_27:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_27:SetAlpha(0.85, 0)
	var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 523, _1080p * 872, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_27)

	var_6_0.MultiplayerDescBG = var_6_27

	local var_6_28
	local var_6_29 = LUI.UIText.new()

	var_6_29.id = "MultiplayerDesc"

	var_6_29:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_29:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/VG_UPSELL_MULTIPLAYER_DESC"), 0)
	var_6_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_29:SetAlignment(LUI.Alignment.Left)
	var_6_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 548, _1080p * 848, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_29)

	var_6_0.MultiplayerDesc = var_6_29

	local var_6_30
	local var_6_31 = LUI.UIStyledText.new()

	var_6_31.id = "Multiplayer"

	var_6_31:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_6_31:setText(Engine.CBBHFCGDIC("LUA_MENU/MULTIPLAYER_CAPS"), 0)
	var_6_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_31:SetWordWrap(false)
	var_6_31:SetAlignment(LUI.Alignment.Left)
	var_6_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_31:SetStartupDelay(1000)
	var_6_31:SetLineHoldTime(400)
	var_6_31:SetAnimMoveTime(1500)
	var_6_31:SetAnimMoveSpeed(1500)
	var_6_31:SetEndDelay(1500)
	var_6_31:SetCrossfadeTime(400)
	var_6_31:SetFadeInTime(300)
	var_6_31:SetFadeOutTime(300)
	var_6_31:SetMaxVisibleLines(1)
	var_6_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 548, _1080p * 848, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_31)

	var_6_0.Multiplayer = var_6_31

	local var_6_32
	local var_6_33 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_34 = LUI.UIBorder.new(var_6_33)

	var_6_34.id = "MultiplayerImgBorder"

	var_6_34:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_6_34:SetAlpha(0.25, 0)
	var_6_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 520, _1080p * 875, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_34)

	var_6_0.MultiplayerImgBorder = var_6_34

	local var_6_35
	local var_6_36 = LUI.UIImage.new()

	var_6_36.id = "ZombiesDescBG"

	var_6_36:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_36:SetAlpha(0.85, 0)
	var_6_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 903, _1080p * 1252, _1080p * 559, _1080p * 697)
	var_6_0:addElement(var_6_36)

	var_6_0.ZombiesDescBG = var_6_36

	local var_6_37
	local var_6_38 = LUI.UIText.new()

	var_6_38.id = "ZombiesDesc"

	var_6_38:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_38:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/VG_UPSELL_ZOMBIES_DESC"), 0)
	var_6_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_38:SetAlignment(LUI.Alignment.Left)
	var_6_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 928, _1080p * 1226, _1080p * 610, _1080p * 630)
	var_6_0:addElement(var_6_38)

	var_6_0.ZombiesDesc = var_6_38

	local var_6_39
	local var_6_40 = LUI.UIStyledText.new()

	var_6_40.id = "Zombies"

	var_6_40:SetRGBFromTable(SWATCHES.WZCH3.WZCH3VanguardGold, 0)
	var_6_40:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_ZOMBIES"), 0)
	var_6_40:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_40:SetWordWrap(false)
	var_6_40:SetAlignment(LUI.Alignment.Left)
	var_6_40:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_40:SetStartupDelay(1000)
	var_6_40:SetLineHoldTime(400)
	var_6_40:SetAnimMoveTime(1500)
	var_6_40:SetAnimMoveSpeed(1500)
	var_6_40:SetEndDelay(1500)
	var_6_40:SetCrossfadeTime(400)
	var_6_40:SetFadeInTime(300)
	var_6_40:SetFadeOutTime(300)
	var_6_40:SetMaxVisibleLines(1)
	var_6_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 928, _1080p * 1226, _1080p * 572, _1080p * 608)
	var_6_0:addElement(var_6_40)

	var_6_0.Zombies = var_6_40

	local var_6_41
	local var_6_42 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_43 = LUI.UIBorder.new(var_6_42)

	var_6_43.id = "ZombiesImgBorder"

	var_6_43:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_6_43:SetAlpha(0.25, 0)
	var_6_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 900, _1080p * 1255, _1080p * 209, _1080p * 700)
	var_6_0:addElement(var_6_43)

	var_6_0.ZombiesImgBorder = var_6_43

	local var_6_44
	local var_6_45 = LUI.UIImage.new()

	var_6_45.id = "OperatorBG"

	var_6_45:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_6_45:SetAlpha(0.85, 0)
	var_6_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1332, _1080p * 1775, _1080p * 600, _1080p * 697)
	var_6_0:addElement(var_6_45)

	var_6_0.OperatorBG = var_6_45

	local var_6_46
	local var_6_47 = LUI.UIStyledText.new()

	var_6_47.id = "OperatorLabelPart2"

	var_6_47:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/X_NEW_OPERATORS"), 0)
	var_6_47:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_47:SetWordWrap(false)
	var_6_47:SetAlignment(LUI.Alignment.Center)
	var_6_47:SetVerticalAlignment(LUI.Alignment.Center)
	var_6_47:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_47:SetStartupDelay(1000)
	var_6_47:SetLineHoldTime(400)
	var_6_47:SetAnimMoveTime(1500)
	var_6_47:SetAnimMoveSpeed(1500)
	var_6_47:SetEndDelay(1000)
	var_6_47:SetCrossfadeTime(400)
	var_6_47:SetFadeInTime(300)
	var_6_47:SetFadeOutTime(300)
	var_6_47:SetMaxVisibleLines(1)
	var_6_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 384, _1080p * 805, _1080p * 95, _1080p * 145)
	var_6_0:addElement(var_6_47)

	var_6_0.OperatorLabelPart2 = var_6_47

	local var_6_48
	local var_6_49 = LUI.UIText.new()

	var_6_49.id = "OperatorLabelPart1"

	var_6_49:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_6_49:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_GAIN_ACCESS"), 0)
	var_6_49:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_49:SetAlignment(LUI.Alignment.Center)
	var_6_49:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 373, _1080p * 815, _1080p * 71, _1080p * 95)
	var_6_0:addElement(var_6_49)

	var_6_0.OperatorLabelPart1 = var_6_49

	local var_6_50
	local var_6_51 = LUI.UIImage.new()

	var_6_51.id = "TitleImg"

	var_6_51:SetScale(-0.1, 0)
	var_6_51:setImage(RegisterMaterial("s4_ui_upsell_pv_neg_vgbranding"), 0)
	var_6_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 398, _1080p * 77, _1080p * 205)
	var_6_0:addElement(var_6_51)

	var_6_0.TitleImg = var_6_51

	local var_6_52
	local var_6_53 = LUI.UIText.new()

	var_6_53.id = "IncludesTagLine"

	var_6_53:SetRGBFromTable(SWATCHES.HUD.eInkBack, 0)
	var_6_53:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/VG_UPSELL_INCLUDES"), 0)
	var_6_53:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_53:SetAlignment(LUI.Alignment.Left)
	var_6_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 417, _1080p * 1819, _1080p * 117, _1080p * 165)
	var_6_0:addElement(var_6_53)

	var_6_0.IncludesTagLine = var_6_53

	local var_6_54
	local var_6_55 = LUI.UIImage.new()

	var_6_55.id = "OperatorImg1"

	var_6_55:setImage(RegisterMaterial("ui_operator_eng_s4_arthur_02_portrait"), 0)
	var_6_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1333, _1080p * 1470, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_55)

	var_6_0.OperatorImg1 = var_6_55

	local var_6_56
	local var_6_57 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_58 = LUI.UIBorder.new(var_6_57)

	var_6_58.id = "OperatorImg1Border"

	var_6_58:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1333, _1080p * 1470, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_58)

	var_6_0.OperatorImg1Border = var_6_58

	local var_6_59
	local var_6_60 = LUI.UIImage.new()

	var_6_60.id = "OperatorImg2"

	var_6_60:setImage(RegisterMaterial("ui_operator_rus_s4_polina_01_portrait"), 0)
	var_6_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1486, _1080p * 1623, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_60)

	var_6_0.OperatorImg2 = var_6_60

	local var_6_61
	local var_6_62 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_63 = LUI.UIBorder.new(var_6_62)

	var_6_63.id = "OperatorImg2Border"

	var_6_63:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1486, _1080p * 1623, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_63)

	var_6_0.OperatorImg2Border = var_6_63

	local var_6_64
	local var_6_65 = LUI.UIImage.new()

	var_6_65.id = "OperatorImg3"

	var_6_65:setImage(RegisterMaterial("ui_operator_aus_s4_lucas_02_portrait"), 0)
	var_6_65:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1638, _1080p * 1775, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_65)

	var_6_0.OperatorImg3 = var_6_65

	local var_6_66
	local var_6_67 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_68 = LUI.UIBorder.new(var_6_67)

	var_6_68.id = "OperatorImg3Border"

	var_6_68:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1638, _1080p * 1775, _1080p * 454, _1080p * 594)
	var_6_0:addElement(var_6_68)

	var_6_0.OperatorImg3Border = var_6_68

	local var_6_69
	local var_6_70 = LUI.UIImage.new()

	var_6_70.id = "OperatorImg4"

	var_6_70:SetAlpha(0, 0)
	var_6_70:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1637, _1080p * 1774, _1080p * 456, _1080p * 593)
	var_6_0:addElement(var_6_70)

	var_6_0.OperatorImg4 = var_6_70

	local var_6_71
	local var_6_72 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_73 = LUI.UIBorder.new(var_6_72)

	var_6_73.id = "OperatorImg4Border"

	var_6_73:SetRGBFromTable(SWATCHES.CH2.WZGenericPopupFrame, 0)
	var_6_73:SetAlpha(0, 0)
	var_6_73:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1673, _1080p * 1775, _1080p * 434, _1080p * 594)
	var_6_0:addElement(var_6_73)

	var_6_0.OperatorImg4Border = var_6_73

	local var_6_74
	local var_6_75 = LUI.UIImage.new()

	var_6_75.id = "SpecialEventsBG"

	var_6_75:SetRGBFromInt(0, 0)
	var_6_75:SetAlpha(0.85, 0)
	var_6_75:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 146, _1080p * 624, _1080p * 736, _1080p * 874)
	var_6_0:addElement(var_6_75)

	var_6_0.SpecialEventsBG = var_6_75

	local var_6_76
	local var_6_77 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_78 = LUI.UIBorder.new(var_6_77)

	var_6_78.id = "SpecialEventsBGBorder"

	var_6_78:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_6_78:SetAlpha(0.25, 0)
	var_6_78:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 143, _1080p * 627, _1080p * 733, _1080p * 877)
	var_6_0:addElement(var_6_78)

	var_6_0.SpecialEventsBGBorder = var_6_78

	local var_6_79
	local var_6_80 = LUI.UIStyledText.new()

	var_6_80.id = "SpecialEvents"

	var_6_80:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_6_80:SetAlpha(0.8, 0)
	var_6_80:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT"), 0)
	var_6_80:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_80:SetWordWrap(false)
	var_6_80:SetAlignment(LUI.Alignment.Left)
	var_6_80:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_80:SetStartupDelay(1000)
	var_6_80:SetLineHoldTime(400)
	var_6_80:SetAnimMoveTime(1500)
	var_6_80:SetAnimMoveSpeed(1500)
	var_6_80:SetEndDelay(1500)
	var_6_80:SetCrossfadeTime(400)
	var_6_80:SetFadeInTime(300)
	var_6_80:SetFadeOutTime(300)
	var_6_80:SetMaxVisibleLines(1)
	var_6_80:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 158, _1080p * 614, _1080p * 738, _1080p * 768)
	var_6_0:addElement(var_6_80)

	var_6_0.SpecialEvents = var_6_80

	local var_6_81
	local var_6_82 = LUI.UIText.new()

	var_6_82.id = "SpecialEventsDesc"

	var_6_82:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_82:SetAlpha(0.8, 0)
	var_6_82:setText(Engine.CBBHFCGDIC("LUA_MENU_TANGO/CW_UPSELL_SHARED_CONTENT_DESC"), 0)
	var_6_82:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_82:SetAlignment(LUI.Alignment.Left)
	var_6_82:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 158, _1080p * 614, _1080p * 772, _1080p * 790)
	var_6_0:addElement(var_6_82)

	var_6_0.SpecialEventsDesc = var_6_82

	local var_6_83
	local var_6_84 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_85 = LUI.UIBorder.new(var_6_84)

	var_6_85.id = "WZIntegrationBGBorder"

	var_6_85:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_6_85:SetAlpha(0.25, 0)
	var_6_85:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 654, _1080p * 1255, _1080p * 733, _1080p * 877)
	var_6_0:addElement(var_6_85)

	var_6_0.WZIntegrationBGBorder = var_6_85

	local var_6_86
	local var_6_87 = LUI.UIImage.new()

	var_6_87.id = "WZIntegrationBG"

	var_6_87:SetRGBFromInt(0, 0)
	var_6_87:SetAlpha(0.85, 0)
	var_6_87:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 657, _1080p * 1252, _1080p * 736, _1080p * 874)
	var_6_0:addElement(var_6_87)

	var_6_0.WZIntegrationBG = var_6_87

	local var_6_88
	local var_6_89 = LUI.UIStyledText.new()

	var_6_89.id = "WZIntegrationTitle"

	var_6_89:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_6_89:SetAlpha(0.8, 0)
	var_6_89:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/WZ_INTEGRATION_AND_POST_LAUNCH"), 0)
	var_6_89:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_89:SetWordWrap(false)
	var_6_89:SetAlignment(LUI.Alignment.Left)
	var_6_89:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_89:SetStartupDelay(1000)
	var_6_89:SetLineHoldTime(400)
	var_6_89:SetAnimMoveTime(1500)
	var_6_89:SetAnimMoveSpeed(1500)
	var_6_89:SetEndDelay(1500)
	var_6_89:SetCrossfadeTime(400)
	var_6_89:SetFadeInTime(300)
	var_6_89:SetFadeOutTime(300)
	var_6_89:SetMaxVisibleLines(1)
	var_6_89:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 669, _1080p * 1239, _1080p * 738, _1080p * 768)
	var_6_0:addElement(var_6_89)

	var_6_0.WZIntegrationTitle = var_6_89

	local var_6_90
	local var_6_91 = LUI.UIStyledText.new()

	var_6_91.id = "WZIntegrationDesc"

	var_6_91:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_6_91:SetAlpha(0.8, 0)
	var_6_91:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/WARZONE_INTEGRATION_DESC"), 0)
	var_6_91:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_91:SetAlignment(LUI.Alignment.Left)
	var_6_91:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_6_91:SetStartupDelay(4000)
	var_6_91:SetLineHoldTime(400)
	var_6_91:SetAnimMoveTime(50)
	var_6_91:SetAnimMoveSpeed(20)
	var_6_91:SetEndDelay(4000)
	var_6_91:SetCrossfadeTime(400)
	var_6_91:SetFadeInTime(300)
	var_6_91:SetFadeOutTime(300)
	var_6_91:SetMaxVisibleLines(4)
	var_6_91:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 669, _1080p * 1239, _1080p * 772, _1080p * 790)
	var_6_0:addElement(var_6_91)

	var_6_0.WZIntegrationDesc = var_6_91

	local var_6_92
	local var_6_93 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_93.id = "ButtonHelperBar"

	var_6_93.Background:SetAlpha(0, 0)
	var_6_93:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -813, _1080p * 813, _1080p * 388, _1080p * 448)
	var_6_0:addElement(var_6_93)

	var_6_0.ButtonHelperBar = var_6_93

	local var_6_94
	local var_6_95 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_6_1
	})

	var_6_95.id = "BuyButton"

	var_6_95.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_6_95.Text:SetAlignment(LUI.Alignment.Center)
	var_6_95:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1333, _1080p * 1775, _1080p * 775, _1080p * 834)
	var_6_0:addElement(var_6_95)

	var_6_0.BuyButton = var_6_95

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

	local var_6_96 = LUI.UIBindButton.new()

	var_6_96.id = "selfBindButton"

	var_6_0:addElement(var_6_96)

	var_6_0.bindButton = var_6_96

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WZVGUpsellPopup", WZVGUpsellPopup)
LockTable(_M)
