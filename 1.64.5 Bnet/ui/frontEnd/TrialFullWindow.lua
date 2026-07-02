module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Image)

	function arg_1_0.addButtonHelperFunction(arg_2_0, arg_2_1)
		arg_2_0:AddButtonHelperText({
			clickable = true,
			button_ref = "button_primary",
			side = "left",
			helper_text = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW"))
		})
		arg_2_0:AddButtonHelperText({
			clickable = true,
			button_ref = "button_secondary",
			side = "left",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	arg_1_0:addEventHandler("menu_create", arg_1_0.addButtonHelperFunction)

	local var_1_0 = LUI.UIBindButton.new()

	var_1_0.id = "selfBindButton"

	arg_1_0:addElement(var_1_0)

	arg_1_0.bindButton = var_1_0

	arg_1_0.bindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = arg_1_1
		end

		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.bindButton:addEventHandler("button_primary", function(arg_4_0, arg_4_1)
		if CONDITIONS.IsPS4() then
			Commerce.DAGIHHFJIJ(arg_1_1)
		elseif CONDITIONS.IsXboxOne() then
			LUI.FlowManager.RequestPopupMenu(nil, "ShowUpsellXboxStore", false, nil, false, {}, nil, false, true)
		end
	end)

	if Engine.EAIICIFIFA() then
		arg_1_0.Image:setImage(RegisterMaterial("image_motd_zombies4"), 0)
	else
		arg_1_0.Image:setImage(RegisterMaterial("image_motd_mp_generic2"), 0)
	end
end

function TrialFullWindow(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "TrialFullWindow"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "DarkenBackground"

	var_5_4:SetRGBFromInt(0, 0)
	var_5_4:SetAlpha(0.85, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DarkenBackground = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Image"

	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 316, _1080p * -316, _1080p * 103, _1080p * -177)
	var_5_0:addElement(var_5_6)

	var_5_0.Image = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "BodyBackground"

	var_5_8:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_5_8:SetAlpha(0.85, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 316, _1080p * -420, _1080p * 103, _1080p * -173)
	var_5_0:addElement(var_5_8)

	var_5_0.BodyBackground = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "ButtonHelperBar"

	var_5_10:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 316, _1080p * -316, _1080p * -178, _1080p * -128)
	var_5_0:addElement(var_5_10)

	var_5_0.ButtonHelperBar = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "TitleBandAlpha"

	var_5_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_12:SetAlpha(0.2, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 102, _1080p * 182)
	var_5_0:addElement(var_5_12)

	var_5_0.TitleBandAlpha = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "TitleBandTop"

	var_5_14:SetRGBFromTable(SWATCHES.CAC.yellowLight, 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 316, _1080p * -316, _1080p * 92, _1080p * 102)
	var_5_0:addElement(var_5_14)

	var_5_0.TitleBandTop = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "GameLogoShadow"

	var_5_16:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_5_16:SetAlpha(0.9, 0)
	var_5_16:SetScale(-0.4, 0)
	var_5_16:setImage(RegisterMaterial("hud_glow"), 0)
	var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 634, _1080p * 1926, _1080p * 363.2, _1080p * 1216.5)
	var_5_0:addElement(var_5_16)

	var_5_0.GameLogoShadow = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIImage.new()

	var_5_18.id = "GameLogo"

	var_5_18:SetAlpha(0.9, 0)
	var_5_18:SetScale(-0.5, 0)
	var_5_18:setImage(RegisterMaterial("cod_splash_logo_1"), 0)
	var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 746, _1080p * 1770, _1080p * 659.5, _1080p * 915.5)
	var_5_0:addElement(var_5_18)

	var_5_0.GameLogo = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "HeaderText"

	var_5_20:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU/TRIAL_POPUP_HEADER"), 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Left)
	var_5_20:SetShadowMinDistance(-0.2, 0)
	var_5_20:SetShadowMaxDistance(0.2, 0)
	var_5_20:SetShadowRGBFromInt(0, 0)
	var_5_20:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 372, _1080p * 363, _1080p * 112, _1080p * 172)
	var_5_0:addElement(var_5_20)

	var_5_0.HeaderText = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "BodyText"

	var_5_22:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_5_22:setText(Engine.CBBHFCGDIC("LUA_MENU/TRIAL_POPUP_MSG"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Left)
	var_5_22:SetShadowMinDistance(-0.2, 0)
	var_5_22:SetShadowMaxDistance(0.2, 0)
	var_5_22:SetShadowRGBFromInt(0, 0)
	var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 375.5, _1080p * 937.5, _1080p * 204, _1080p * 228)
	var_5_0:addElement(var_5_22)

	var_5_0.BodyText = var_5_22

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("TrialFullWindow", TrialFullWindow)
LockTable(_M)
