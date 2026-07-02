module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = SEASON.GetName(SEASON.GetCurrentSeason())

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.SeasonName:setText(Engine.CBBHFCGDIC(var_1_0))
	end

	arg_1_0.Title:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/PLAYER_RANK_RESET"))
	arg_1_0.NewRank:setText(Engine.CBBHFCGDIC("ELDER_PROGRESSION/NEW_RANK"))
	arg_1_0.ResetRank:setText(Engine.CBBHFCGDIC("LUA_MENU/RANK_VALUE", PROGRESSION.GetMaxRank() + 2))
	arg_1_0.ContinueButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
		LUI.FlowManager.RequestPopupMenu(nil, "SeasonUnlocksPopup", true, arg_1_1, false, nil)
	end)
end

function SeasonResetPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "SeasonResetPopup"

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

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -304, _1080p * 304)
	var_3_0:addElement(var_3_6)

	var_3_0.GenericPopupWindow = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Title"

	var_3_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_8:setText(ToUpperCase(Engine.CBBHFCGDIC("ELDER_PROGRESSION/WEAPON_UNLOCKS")), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -240, _1080p * -180)
	var_3_0:addElement(var_3_8)

	var_3_0.Title = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "SeasonName"

	var_3_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 713, _1080p * -276, _1080p * -240)
	var_3_0:addElement(var_3_10)

	var_3_0.SeasonName = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ContinueButton"

	var_3_12.Text:SetLeft(_1080p * 20, 0)
	var_3_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CONTINUE"), 0)
	var_3_12.Text:SetAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 775, _1080p * 813)
	var_3_0:addElement(var_3_12)

	var_3_0.ContinueButton = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "ResetRankIcon"

	var_3_14:setImage(RegisterMaterial("icon_rank_officer_00"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 860, _1080p * 1060, _1080p * 443, _1080p * 644)
	var_3_0:addElement(var_3_14)

	var_3_0.ResetRankIcon = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "ResetRankName"

	var_3_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_3_16:setText(Engine.CBBHFCGDIC("RANK/MSC_FULL"), 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetWordWrap(false)
	var_3_16:SetAlignment(LUI.Alignment.Center)
	var_3_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -790, _1080p * 789, _1080p * 139, _1080p * 175)
	var_3_0:addElement(var_3_16)

	var_3_0.ResetRankName = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "ResetRank"

	var_3_18:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_18:setText("Rank 56", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -76, _1080p * 75, _1080p * 192, _1080p * 216)
	var_3_0:addElement(var_3_18)

	var_3_0.ResetRank = var_3_18

	local var_3_19
	local var_3_20 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_20.id = "ButtonHelperBar"

	var_3_20.Background:SetAlpha(0, 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 304, _1080p * 364)
	var_3_0:addElement(var_3_20)

	var_3_0.ButtonHelperBar = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "NewRank"

	var_3_22:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -254, _1080p * 253, _1080p * -151, _1080p * -115)
	var_3_0:addElement(var_3_22)

	var_3_0.NewRank = var_3_22

	function var_3_0.addButtonHelperFunction(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_23 = LUI.UIBindButton.new()

	var_3_23.id = "selfBindButton"

	var_3_0:addElement(var_3_23)

	var_3_0.bindButton = var_3_23

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonResetPopup", SeasonResetPopup)
LockTable(_M)
