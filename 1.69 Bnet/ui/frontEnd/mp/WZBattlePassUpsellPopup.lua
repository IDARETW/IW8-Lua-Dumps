module(..., package.seeall)

local var_0_0 = {
	{
		subtitle = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_1_SUBTITLE",
		title = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_1"
	},
	{
		subtitle = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_2_SUBTITLE",
		title = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_2"
	},
	{
		subtitle = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_3_SUBTITLE",
		title = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_3"
	},
	{
		subtitle = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_4_SUBTITLE",
		title = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_4"
	},
	{
		subtitle = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_5_SUBTITLE",
		title = "BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_5"
	}
}
local var_0_1 = {
	{
		text = "BATTLEPASS/BLOPS_UPSELL_POPUP_CW_REWARDS_1"
	},
	{
		text = "BATTLEPASS/BLOPS_UPSELL_POPUP_CW_REWARDS_2"
	},
	{
		text = "BATTLEPASS/BLOPS_UPSELL_POPUP_CW_REWARDS_3"
	}
}

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0.MWWZRewardGrid:GetMaxVisibleColumns()

	arg_1_0.MWWZRewardGrid:SetNumChildren(#var_0_0)
	arg_1_0.MWWZRewardGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		assert(arg_2_0.Title, "WZBattlePassUpsellPopup: child.Title is nil and must be specified")
		assert(arg_2_0.SubTitle, "WZBattlePassUpsellPopup: child.SubTitle is nil and must be specified")

		local var_2_0 = arg_2_1 + 1 + arg_2_2 * var_1_0
		local var_2_1 = var_0_0[var_2_0]

		assert(var_2_1.title, "WZBattlePassUpsellPopup: rewardData.title is nil and must be specified")
		assert(var_2_1.subtitle, "WZBattlePassUpsellPopup: rewardData.subtitle is nil and must be specified")
		arg_2_0.Title:setText(Engine.CBBHFCGDIC(var_2_1.title))
		arg_2_0.SubTitle:setText(Engine.CBBHFCGDIC(var_2_1.subtitle))
	end)
	arg_1_0.MWWZRewardGrid:RefreshContent()
	arg_1_0.CWRewardList:SetupBullets(arg_1_1, var_0_1, true)
	arg_1_0.PurchaseButton:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.controller or arg_1_1

		LUI.FlowManager.RequestPopupMenu(arg_1_0, "StoreGameUpsellPopup", true, var_3_0, false, {
			isZeus = true,
			preFetched = true
		})
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function WZBattlePassUpsellPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "WZBattlePassUpsellPopup"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.97, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "GenericPopupWindow"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -400, _1080p * 400)
	var_4_0:addElement(var_4_6)

	var_4_0.GenericPopupWindow = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("BATTLEPASS/BLOPS_UPSELL_POPUP_TITLE")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * -370, _1080p * -310)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "CWLogoIcon"

	var_4_10:setImage(RegisterMaterial("logo_cod_store"), 0)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -790, _1080p * -278, _1080p * -256, _1080p * -60)
	var_4_0:addElement(var_4_10)

	var_4_0.CWLogoIcon = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "ButtonHelperBar"

	var_4_12.Background:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 400, _1080p * 460)
	var_4_0:addElement(var_4_12)

	var_4_0.ButtonHelperBar = var_4_12

	local var_4_13
	local var_4_14 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_4_1
	})

	var_4_14.id = "PurchaseButton"

	var_4_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"), 0)
	var_4_14.Text:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -211, _1080p * 211, _1080p * 307, _1080p * 357)
	var_4_0:addElement(var_4_14)

	var_4_0.PurchaseButton = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "CWRewardPanelBG"

	var_4_16:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_16:setImage(RegisterMaterial("wdg_backer"), 0)
	var_4_16:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 219, _1080p * 899, _1080p * 584, _1080p * 827)
	var_4_0:addElement(var_4_16)

	var_4_0.CWRewardPanelBG = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "CWRewardTitle"

	var_4_18.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/BLOPS_UPSELL_POPUP_CW_REWARDS_TITLE"), 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 219, _1080p * 749, _1080p * 584, _1080p * 628)
	var_4_0:addElement(var_4_18)

	var_4_0.CWRewardTitle = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "MWWZRewardPanelBG"

	var_4_20:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_4_20:setImage(RegisterMaterial("wdg_backer"), 0)
	var_4_20:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_4_20:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -960, _1080p * -219, _1080p * 584, _1080p * 827)
	var_4_0:addElement(var_4_20)

	var_4_0.MWWZRewardPanelBG = var_4_20

	local var_4_21
	local var_4_22 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_22.id = "MWWZRewardTitle"

	var_4_22.Text:setText(Engine.CBBHFCGDIC("BATTLEPASS/BLOPS_UPSELL_POPUP_MWWZ_REWARDS_TITLE"), 0)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 960, _1080p * 1566, _1080p * 584, _1080p * 628)
	var_4_0:addElement(var_4_22)

	var_4_0.MWWZRewardTitle = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "PromoImage"

	var_4_24:setImage(RegisterMaterial("placeholder_x"), 0)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 732, _1080p * 1701, _1080p * 273, _1080p * 526)
	var_4_0:addElement(var_4_24)

	var_4_0.PromoImage = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIStyledText.new()

	var_4_26.id = "NoteText"

	var_4_26:setText(Engine.CBBHFCGDIC("BATTLEPASS/BLOPS_UPSELL_POPUP_NOTE"), 0)
	var_4_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_26:SetAlignment(LUI.Alignment.Left)
	var_4_26:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 219, _1080p * 899, _1080p * 557, _1080p * 581)
	var_4_0:addElement(var_4_26)

	var_4_0.NoteText = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIStyledText.new()

	var_4_28.id = "CWRewardSideText"

	var_4_28:setText("Additional Text", 0)
	var_4_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_28:SetAlignment(LUI.Alignment.Right)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 756, _1080p * 890, _1080p * 598, _1080p * 622)
	var_4_0:addElement(var_4_28)

	var_4_0.CWRewardSideText = var_4_28

	local var_4_29
	local var_4_30 = LUI.UIStyledText.new()

	var_4_30.id = "MWWZRewardSideTextCopy0"

	var_4_30:setText(Engine.CBBHFCGDIC("STORE/AVAILABLE_NOW"), 0)
	var_4_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_30:SetAlignment(LUI.Alignment.Right)
	var_4_30:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -354, _1080p * -229, _1080p * 598, _1080p * 622)
	var_4_0:addElement(var_4_30)

	var_4_0.MWWZRewardSideTextCopy0 = var_4_30

	local var_4_31
	local var_4_32 = {
		fontSize = "24",
		bulletImage = "bullet_point_diamond",
		spacing = 16,
		textColor = "SWATCHES.genericMenu.bodycopy",
		numericSeparator = "",
		separation = 10,
		listType = 1,
		bulletColor = "SWATCHES.BattlePass.PopupTexture",
		bulletScale = 0.75,
		controllerIndex = var_4_1
	}
	local var_4_33 = MenuBuilder.BuildRegisteredType("BulletList", var_4_32)

	var_4_33.id = "CWRewardList"

	var_4_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 249, _1080p * 749, _1080p * 655, _1080p * 673)
	var_4_0:addElement(var_4_33)

	var_4_0.CWRewardList = var_4_33

	local var_4_34
	local var_4_35 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_4_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WZBattlePassUpsellPopupRewardBullet", {
				controllerIndex = var_4_1
			})
		end,
		refreshChild = function(arg_6_0, arg_6_1, arg_6_2)
			return
		end,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 55,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_4_36 = LUI.UIGrid.new(var_4_35)

	var_4_36.id = "MWWZRewardGrid"

	var_4_36:setUseStencil(true)
	var_4_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 981, _1080p * 1628, _1080p * 655, _1080p * 782)
	var_4_0:addElement(var_4_36)

	var_4_0.MWWZRewardGrid = var_4_36

	local function var_4_37()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_37

	local function var_4_38()
		return
	end

	var_4_0._sequences.AR = var_4_38

	local var_4_39
	local var_4_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -862
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -153
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -326
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 153
		}
	}

	var_4_10:RegisterAnimationSequence("MWLogoProportions", var_4_40)

	local function var_4_41()
		var_4_10:AnimateSequence("MWLogoProportions")
	end

	var_4_0._sequences.MWLogoProportions = var_4_41

	function var_4_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_42 = LUI.UIBindButton.new()

	var_4_42.id = "selfBindButton"

	var_4_0:addElement(var_4_42)

	var_4_0.bindButton = var_4_42

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WZBattlePassUpsellPopup", WZBattlePassUpsellPopup)
LockTable(_M)
