module(..., package.seeall)

local var_0_0 = {
	"VariantA",
	"VariantB",
	"VariantC"
}

local function var_0_1(arg_1_0)
	arg_1_0.BtnHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_1_0.BtnHelperBar.ButtonHelperText:PushButtonPrompt({
		10,
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
end

local function var_0_2()
	local var_2_0 = {
		"MPMainMenu",
		"BRMainMenu",
		"CPMainMenu",
		"MPPublicLobby",
		"BRPublicLobby",
		"CPPublicMatchMenu"
	}

	for iter_2_0 = 1, #var_2_0 do
		local var_2_1 = var_2_0[iter_2_0]

		if LUI.FlowManager.IsInStack(var_2_1) then
			local var_2_2 = LUI.FlowManager.GetMenuByName(var_2_1).menu

			if var_2_2 then
				return var_2_2.MPTabsMenu
			end
		end
	end
end

local function var_0_3(arg_3_0)
	local function var_3_0()
		local var_4_0 = Dvar.CFHDGABACF("ui_vg_preorder_upsell_variant")

		Engine.CEJJDJJHIJ(arg_3_0._controllerIndex, "dlog_event_vanguard_upsell_popup_preorder_clicked", {
			screenVariant = var_4_0
		})
	end

	local var_3_1

	if not arg_3_0._mainMenuRef or not arg_3_0._mainMenuRef.MPTabsMenu then
		var_3_1 = var_0_2()
	else
		var_3_1 = arg_3_0._mainMenuRef.MPTabsMenu
	end

	ACTIONS.LeaveMenu(arg_3_0)

	if var_3_1 then
		var_3_0()
		LUI.TabManager.OpenTabByMenuName(var_3_1, arg_3_0._controllerIndex, "MPStoreMenu")
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0.OnPreOrderButtonClicked = var_0_3
	arg_5_0._mainMenuRef = arg_5_2.mainMenuRef

	var_0_1(arg_5_0)

	if Engine.HDGDBCJFG() then
		ACTIONS.AnimateSequence(arg_5_0, "ConsoleConfig")
	end

	local var_5_0 = CONDITIONS.GetX2UpsellVariant()

	if var_5_0 ~= nil then
		if var_5_0 == 0 then
			ACTIONS.LeaveMenu(arg_5_0)

			return
		end

		ACTIONS.AnimateSequence(arg_5_0, var_0_0[var_5_0])
	else
		ACTIONS.AnimateSequence(arg_5_0, var_0_0[1])
	end

	arg_5_0.PreOrderButton:registerEventHandler("button_action", function(arg_6_0, arg_6_1)
		arg_5_0:OnPreOrderButtonClicked()
	end)

	local var_5_1 = LUI.UIBindButton.new()

	var_5_1.id = "selfBindButton"

	arg_5_0:addElement(var_5_1)

	arg_5_0._bindButton = var_5_1

	arg_5_0._bindButton:registerEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		ACTIONS.LeaveMenu()
	end)
	arg_5_0._bindButton:registerEventHandler("button_primary", function(arg_8_0, arg_8_1)
		arg_5_0:OnPreOrderButtonClicked()
	end)
	ACTIONS.ScaleFullscreen(arg_5_0.Darkener)
end

function VGPreOrderUpsellPopup(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIElement.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_9_0.id = "VGPreOrderUpsellPopup"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = LUI.UIImage.new()

	var_9_4.id = "Darkener"

	var_9_4:SetRGBFromInt(0, 0)
	var_9_4:SetAlpha(0.95, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Darkener = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIImage.new()

	var_9_6.id = "GameImage"

	var_9_6:setImage(RegisterMaterial("vanguard_upsell_popup_background_a"), 0)
	var_9_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_9_0:addElement(var_9_6)

	var_9_0.GameImage = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIText.new()

	var_9_8.id = "Message"

	var_9_8:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_9_8:SetAlpha(0, 0)
	var_9_8:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_SPLASH_VERSION_B_PC"), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_9_8:SetAlignment(LUI.Alignment.Center)
	var_9_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -806, _1080p * 806, _1080p * 243, _1080p * 293)
	var_9_0:addElement(var_9_8)

	var_9_0.Message = var_9_8

	local var_9_9
	local var_9_10 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_9_1
	})

	var_9_10.id = "PreOrderButton"

	var_9_10.Text:setText(Engine.CBBHFCGDIC("MENU/PRE_PURCHASE"), 0)
	var_9_10.Text:SetAlignment(LUI.Alignment.Center)
	var_9_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 390, _1080p * 428)
	var_9_0:addElement(var_9_10)

	var_9_0.PreOrderButton = var_9_10

	local var_9_11
	local var_9_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_9_1
	})

	var_9_12.id = "BtnHelperBar"

	var_9_12.Background:SetAlpha(0, 0)
	var_9_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 1020, _1080p * 1080)
	var_9_0:addElement(var_9_12)

	var_9_0.BtnHelperBar = var_9_12

	local function var_9_13()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_13

	local var_9_14
	local var_9_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("vanguard_upsell_popup_background_a")
		}
	}

	var_9_6:RegisterAnimationSequence("VariantA", var_9_15)

	local var_9_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_8:RegisterAnimationSequence("VariantA", var_9_16)

	local function var_9_17()
		var_9_6:AnimateSequence("VariantA")
		var_9_8:AnimateSequence("VariantA")
	end

	var_9_0._sequences.VariantA = var_9_17

	local var_9_18
	local var_9_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("vanguard_upsell_popup_background_b")
		}
	}

	var_9_6:RegisterAnimationSequence("VariantB", var_9_19)

	local var_9_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -774
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 774
		}
	}

	var_9_8:RegisterAnimationSequence("VariantB", var_9_20)

	local function var_9_21()
		var_9_6:AnimateSequence("VariantB")
		var_9_8:AnimateSequence("VariantB")
	end

	var_9_0._sequences.VariantB = var_9_21

	local var_9_22
	local var_9_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("vanguard_upsell_popup_background_c")
		}
	}

	var_9_6:RegisterAnimationSequence("VariantC", var_9_23)

	local var_9_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_SPLASH_VERSION_C_SY_MS")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -670
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 670
		}
	}

	var_9_8:RegisterAnimationSequence("VariantC", var_9_24)

	local function var_9_25()
		var_9_6:AnimateSequence("VariantC")
		var_9_8:AnimateSequence("VariantC")
	end

	var_9_0._sequences.VariantC = var_9_25

	local var_9_26
	local var_9_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_SPLASH_VERSION_B_SY_MS")
		}
	}

	var_9_8:RegisterAnimationSequence("ConsoleConfig", var_9_27)

	local var_9_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER"),
			child = var_9_0.PreOrderButton.Text
		}
	}

	var_9_10:RegisterAnimationSequence("ConsoleConfig", var_9_28)

	local function var_9_29()
		var_9_8:AnimateSequence("ConsoleConfig")
		var_9_10:AnimateSequence("ConsoleConfig")
	end

	var_9_0._sequences.ConsoleConfig = var_9_29

	function var_9_0.addButtonHelperFunction(arg_15_0, arg_15_1)
		arg_15_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_9_0:addEventHandler("menu_create", var_9_0.addButtonHelperFunction)

	local var_9_30 = LUI.UIBindButton.new()

	var_9_30.id = "selfBindButton"

	var_9_0:addElement(var_9_30)

	var_9_0.bindButton = var_9_30

	var_0_4(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("VGPreOrderUpsellPopup", VGPreOrderUpsellPopup)
LockTable(_M)
