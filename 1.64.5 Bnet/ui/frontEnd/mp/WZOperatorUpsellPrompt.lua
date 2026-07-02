module(..., package.seeall)

local var_0_0 = ""
local var_0_1 = {
	OPEN_STORE_MW = 2,
	OPEN_MW = 0,
	OPEN_PASS = 4,
	OPEN_UPSELL_CW = 3,
	OPEN_UPSELL_VG = 5,
	OPEN_CW = 1,
	NONE = -1
}

local function var_0_2(arg_1_0)
	if arg_1_0.state == var_0_1.OPEN_MW then
		return "LUA_MENU/WZ_LAUNCH_MW_PROMPT", "LUA_MENU/WZ_LAUNCH_MW"
	elseif arg_1_0.state == var_0_1.OPEN_CW then
		return "LUA_MENU/WZ_LAUNCH_CW_PROMPT", "LUA_MENU/WZ_LAUNCH_CW"
	elseif arg_1_0.state == var_0_1.OPEN_UPSELL_CW then
		return "LUA_MENU_TANGO/PURCHASE_BLACK_OPS_PROMPT", "LUA_MENU_TANGO/PURCHASE_BLACK_OPS"
	elseif arg_1_0.state == var_0_1.OPEN_STORE_MW then
		return "LUA_MENU/WZ_GOTO_STORE_PROMPT", "LUA_MENU/WZ_GOTO_STORE"
	elseif arg_1_0.state == var_0_1.OPEN_PASS then
		return "LUA_MENU/VIEW_BATTLE_PASS_PROMPT", "LUA_MENU/VIEW_BATTLE_PASS"
	elseif arg_1_0.state == var_0_1.OPEN_UPSELL_VG then
		return "LUA_MENU_FISHER/PURCHASE_VANGUARD_PROMPT", "LUA_MENU_FISHER/PURCHASE_VANGUARD"
	end

	return var_0_0, var_0_0
end

local function var_0_3(arg_2_0, arg_2_1)
	return
end

local function var_0_4(arg_3_0, arg_3_1)
	return
end

local function var_0_5(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.state == var_0_1.OPEN_UPSELL_CW and {
		isZeus = true
	} or nil

	LUI.FlowManager.RequestPopupMenu(arg_4_0, "StoreGameUpsellPopup", true, arg_4_1, false, var_4_0)
end

local function var_0_6(arg_5_0, arg_5_1)
	local var_5_0 = LUI.FlowManager.GetCurrentMenu(arg_5_0)

	LUI.TabManager.OpenTabByMenuName(var_5_0.MPTabsMenu, arg_5_1, "BattlePassMenu")
end

local function var_0_7(arg_6_0, arg_6_1)
	if arg_6_0.state == var_0_1.OPEN_UPSELL_CW then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "WZCWUpsellPopup", true, arg_6_1, false)
	elseif arg_6_0.state == var_0_1.OPEN_UPSELL_VG then
		LUI.FlowManager.RequestPopupMenu(arg_6_0, "WZVGUpsellPopup", true, arg_6_1, false)
	elseif arg_6_0.state == var_0_1.OPEN_STORE_MW then
		var_0_5(arg_6_0, arg_6_1)
	elseif arg_6_0.state == var_0_1.OPEN_MW then
		var_0_3(arg_6_0, arg_6_1)
	elseif arg_6_0.state == var_0_1.OPEN_CW then
		var_0_4(arg_6_0, arg_6_1)
	elseif arg_6_0.state == var_0_1.OPEN_PASS then
		var_0_6(arg_6_0, arg_6_1)
	end
end

local function var_0_8(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	local var_7_0 = CONDITIONS.IsOperatorUpsellEnabled() and arg_7_4
	local var_7_1 = STORE.IsZeusAvailable(arg_7_1)
	local var_7_2 = STORE.IsVanguardAvailable(arg_7_1)
	local var_7_3 = OPERATOR.GetOperatorGameSourceID(arg_7_2)
	local var_7_4 = Engine.CFHBIHABCB(arg_7_1)
	local var_7_5 = STORE.IsZeusOwned(arg_7_1)
	local var_7_6 = STORE.IsVanguardOwned(arg_7_1)
	local var_7_7 = not var_7_5 or Dvar.IBEGCHEFE("RONTRKPRP") == true
	local var_7_8 = not var_7_6 or Dvar.IBEGCHEFE("MKLPPNMKMR") == true
	local var_7_9 = arg_7_3.isUnlockedWithBattlePass or false
	local var_7_10 = arg_7_3.isUnlockedWithActiveBattlePass or false

	if var_7_0 and arg_7_2 == OPERATOR.KingsleyRef then
		arg_7_0.state = var_0_1.OPEN_UPSELL_VANGUARD
	elseif var_7_0 and var_7_4 and var_7_3 == LUI.GAME_SOURCE_ID.MODERN_WARFARE and not var_7_9 then
		arg_7_0.state = var_0_1.OPEN_MW
	elseif var_7_0 and var_7_3 == LUI.GAME_SOURCE_ID.COLD_WAR and var_7_1 and var_7_7 and not var_7_9 then
		arg_7_0.state = var_0_1.OPEN_UPSELL_CW
	elseif var_7_0 and var_7_5 and var_7_3 == LUI.GAME_SOURCE_ID.COLD_WAR and not var_7_9 then
		arg_7_0.state = var_0_1.OPEN_CW
	elseif var_7_0 and var_7_3 == LUI.GAME_SOURCE_ID.VANGUARD and var_7_2 and var_7_8 and not var_7_9 then
		arg_7_0.state = var_0_1.OPEN_UPSELL_VG
	elseif var_7_0 and var_7_3 == LUI.GAME_SOURCE_ID.MODERN_WARFARE and not var_7_9 then
		arg_7_0.state = var_0_1.OPEN_STORE_MW
	elseif var_7_0 and var_7_9 and var_7_10 then
		arg_7_0.state = var_0_1.OPEN_PASS
	else
		arg_7_0.state = var_0_1.NONE
	end
end

local function var_0_9(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	var_0_8(arg_8_0, arg_8_1, arg_8_2.operatorRef, arg_8_2, arg_8_3)

	local var_8_0, var_8_1 = var_0_2(arg_8_0)

	arg_8_0.UpsellPrompt:setText(Engine.CBBHFCGDIC(var_8_0))
	arg_8_0.UpsellButton.Text:setText(Engine.CBBHFCGDIC(var_8_1))

	if var_8_0 ~= var_0_0 and var_8_1 ~= var_0_0 then
		local var_8_2 = {
			promptsData = {
				{
					kbmTooltipPromptOverload = "button_alt1",
					button_ref = "button_alt1",
					helper_text = var_0_0
				}
			}
		}

		arg_8_0.UpsellButton:AddTooltipData(arg_8_1, var_8_2)
	end
end

local function var_0_10(arg_9_0, arg_9_1)
	local var_9_0 = LUI.IsLastInputKeyboardMouse(arg_9_1) and "Button" or "Prompt"

	ACTIONS.AnimateSequence(arg_9_0, var_9_0)
end

local function var_0_11(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.SetAnimation = var_0_10
	arg_10_0.SetUpsellPrompt = var_0_9
	arg_10_0.OnPerformPromptAction = var_0_7
end

function WZOperatorUpsellPrompt(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 38 * _1080p)

	var_11_0.id = "WZOperatorUpsellPrompt"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = MenuBuilder.BuildRegisteredType("TimedButton", {
		controllerIndex = var_11_1
	})

	var_11_4.id = "UpsellButton"

	var_11_4:SetButtonDisabled(false)
	var_11_4.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_GOTO_STORE"), 0)
	var_11_4.Text:SetAlignment(LUI.Alignment.Center)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 38)
	var_11_0:addElement(var_11_4)

	var_11_0.UpsellButton = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIText.new()

	var_11_6.id = "UpsellPrompt"

	var_11_6:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_11_6:setText(Engine.CBBHFCGDIC("LUA_MENU/WZ_GOTO_STORE_PROMPT"), 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_6:SetAlignment(LUI.Alignment.Center)
	var_11_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 7, _1080p * -7)
	var_11_0:addElement(var_11_6)

	var_11_0.UpsellPrompt = var_11_6

	local function var_11_7()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_7

	local var_11_8
	local var_11_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Button", var_11_9)

	local var_11_10 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Button", var_11_10)

	local function var_11_11()
		var_11_4:AnimateSequence("Button")
		var_11_6:AnimateSequence("Button")
	end

	var_11_0._sequences.Button = var_11_11

	local var_11_12
	local var_11_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Prompt", var_11_13)

	local var_11_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Prompt", var_11_14)

	local function var_11_15()
		var_11_4:AnimateSequence("Prompt")
		var_11_6:AnimateSequence("Prompt")
	end

	var_11_0._sequences.Prompt = var_11_15

	local var_11_16
	local var_11_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_4:RegisterAnimationSequence("Hidden", var_11_17)

	local var_11_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Hidden", var_11_18)

	local function var_11_19()
		var_11_4:AnimateSequence("Hidden")
		var_11_6:AnimateSequence("Hidden")
	end

	var_11_0._sequences.Hidden = var_11_19

	var_0_11(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("WZOperatorUpsellPrompt", WZOperatorUpsellPrompt)
LockTable(_M)
