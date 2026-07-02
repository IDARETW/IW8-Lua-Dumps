module(..., package.seeall)

local var_0_0 = 10
local var_0_1 = 25

local function var_0_2(arg_1_0)
	return arg_1_0.ViewStorePrompt
end

local var_0_3 = {
	PLATFORM_FAMILY_SONY = 1,
	PLATFORM_FAMILY_XBOX = 2,
	PLATFORM_FAMILY_COUNT = 3,
	PLATFORM_FAMILY_NONE = 0
}

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.GetPromptContainer = var_0_2

	arg_2_0.BattlePass.Desc1:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_BUFF", var_0_0))
	arg_2_0.VGOwner.Desc1:setText(Engine.CBBHFCGDIC("LUA_MENU/XP_BUFF", var_0_0))
	arg_2_0.VGOwner.Desc2:setText(Engine.CBBHFCGDIC("LUA_MENU/BATTLEPASS_XP", var_0_0))
	arg_2_0.VGOwner.Desc3:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPON_XP", var_0_0))
	arg_2_0.PSPartyBoost.Desc1:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPON_XP", var_0_1))
	arg_2_0.PSPartyBoost.Desc2:setText("[{ui_ps_icon}]")
	ACTIONS.AnimateSequence(arg_2_0.VGOwner, "Show3Desc")
	ACTIONS.AnimateSequence(arg_2_0.PSPartyBoost, "Show2Desc")
	ACTIONS.AnimateSequence(arg_2_0, "Hide")

	local var_2_0 = CONDITIONS.IsVGPremiumPlayer(arg_2_1)
	local var_2_1 = BATTLEPASS.IsOwned(arg_2_1)
	local var_2_2

	if var_2_1 then
		var_2_2 = BATTLEPASS.GetEmblemGold()
	else
		var_2_2 = BATTLEPASS.GetEmblemSilver()
	end

	if var_2_2 ~= "" then
		arg_2_0.BattlePass.Image:setImage(RegisterMaterial(var_2_2))
	end

	if CONDITIONS.IsVanguardOwnershipDisplayEnabled() then
		ACTIONS.AnimateSequence(arg_2_0, "Show")

		if var_2_0 then
			ACTIONS.AnimateSequence(arg_2_0, "ShowVanguardOwner")
		end

		if var_2_1 then
			ACTIONS.AnimateSequence(arg_2_0, "ShowBattlePassOwner")
		end

		arg_2_0:registerAndCallEventHandler("update_input_type", function(arg_3_0, arg_3_1)
			if LUI.IsLastInputKeyboardMouse(arg_2_1) then
				arg_3_0.ViewStorePrompt:SetAlpha(0)
				arg_3_0.ViewStoreButton:SetAlpha(1)
			else
				arg_3_0.ViewStorePrompt:SetAlpha(1)
				arg_3_0.ViewStoreButton:SetAlpha(0)
			end
		end)
	end

	if CONDITIONS.InFrontend() then
		arg_2_0.bindButton = LUI.UIBindButton.new()
		arg_2_0.bindButton.id = "selfBindButton"

		arg_2_0:addElement(arg_2_0.bindButton)
		arg_2_0.bindButton:addEventHandler("button_right_stick", function(arg_4_0, arg_4_1)
			if not CONDITIONS.IsVGPremiumPlayer(arg_2_1) then
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "VGPreOrderPopup", true, arg_2_0._controllerIndex, false, {
					allowWeaponPreview = true,
					sceneChangeDisabled = true,
					defaultProductId = STORE.VanguardUpgradeToUltimateID
				})
			else
				local var_4_0 = arg_2_0:GetCurrentMenu(arg_2_0)

				if var_4_0 and var_4_0.MPTabsMenu and var_4_0.MPTabsMenu.Tabs then
					local var_4_1 = var_4_0.MPTabsMenu
					local var_4_2 = var_4_1:GetTabIndexByWidgetName("MPStoreMenu")

					var_4_1.Tabs:FocusTab(arg_2_1, var_4_2 - 1)
				end
			end
		end)
		arg_2_0.ViewStoreButton:addEventHandler("mousedown", function(arg_5_0, arg_5_1)
			if not CONDITIONS.IsVGPremiumPlayer(arg_2_1) then
				LUI.FlowManager.RequestPopupMenu(arg_5_0, "VGPreOrderPopup", true, arg_5_0._controllerIndex, false, {
					allowWeaponPreview = true,
					sceneChangeDisabled = true,
					defaultProductId = STORE.VanguardUpgradeToUltimateID
				})
			else
				local var_5_0 = arg_5_0:GetCurrentMenu(arg_5_0)

				if var_5_0 and var_5_0.MPTabsMenu and var_5_0.MPTabsMenu.Tabs then
					local var_5_1 = var_5_0.MPTabsMenu
					local var_5_2 = var_5_1:GetTabIndexByWidgetName("MPStoreMenu")

					var_5_1.Tabs:FocusTab(arg_2_1, var_5_2 - 1)
				end
			end
		end)
	end

	local function var_2_3()
		if CONDITIONS.IsSony() then
			if Lobby.DDAIHEIBF(var_0_3.PLATFORM_FAMILY_SONY) then
				ACTIONS.AnimateSequence(arg_2_0, "ShowIsInPSParty")
			else
				ACTIONS.AnimateSequence(arg_2_0, "ShowOnPSPlatform")
			end
		end
	end

	if CONDITIONS.IsSony() then
		local var_2_4 = LUI.UITimer.new({
			interval = 1000,
			event = "update_playstation_party_boost"
		})

		var_2_4.id = "playstationPartyTimer"

		arg_2_0:addElement(var_2_4)
		arg_2_0:addAndCallEventHandler("update_playstation_party_boost", var_2_3)
	end

	if Dvar.IBEGCHEFE("ui_kill_vanguard_owner_boost") then
		ACTIONS.AnimateSequence(arg_2_0, "HideVGBoost")
	end

	if Dvar.IBEGCHEFE("ui_kill_battlepass_owner_boost") then
		ACTIONS.AnimateSequence(arg_2_0, "HideBPBoost")
	end

	if Dvar.IBEGCHEFE("ui_kill_playstation_party_boost") then
		ACTIONS.AnimateSequence(arg_2_0, "HidePSPartyBoost")
	end
end

function XPBoost(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 584 * _1080p, 0, 182 * _1080p)

	var_7_0.id = "XPBoost"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("XPBoostElement", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "BattlePass"

	var_7_4.Image:setImage(RegisterMaterial("battlepass_season_emblem_silver"), 0)
	var_7_4.Desc1:setText("", 0)
	var_7_4.Desc2:setText("", 0)
	var_7_4.Desc3:setText("", 0)
	var_7_4.Title:setText(Engine.CBBHFCGDIC("LUA_MENU/GET_BATTLE_PASS"), 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 396, _1080p * 584, 0, _1080p * 190)
	var_7_0:addElement(var_7_4)

	var_7_0.BattlePass = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("XPBoostElement", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "VGOwner"

	var_7_6.Image:setImage(RegisterMaterial("vanguard_owner_xp_boost_icon_0"), 0)
	var_7_6.Desc1:setText("", 0)
	var_7_6.Desc2:setText("", 0)
	var_7_6.Desc3:setText("", 0)
	var_7_6.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GET_VANGUARD")), 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 198, _1080p * 386, 0, _1080p * 190)
	var_7_0:addElement(var_7_6)

	var_7_0.VGOwner = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("XPBoostElement", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "PSPartyBoost"

	var_7_8.Image:setImage(RegisterMaterial("playstation_xp_boost_icon_0"), 0)
	var_7_8.Desc1:setText("", 0)
	var_7_8.Desc2:setText("", 0)
	var_7_8.Desc3:setText("", 0)
	var_7_8.Title:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/PLAYSTATION_PARTY_BOOST")), 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 188, 0, _1080p * 190)
	var_7_0:addElement(var_7_8)

	var_7_0.PSPartyBoost = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "ViewStorePrompt"

	var_7_10:SetAlpha(0, 0)

	if CONDITIONS.AlwaysFalse() then
		var_7_10.Label:setText("", 0)
	end

	var_7_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 198, _1080p * 387, _1080p * 205, _1080p * 227)
	var_7_0:addElement(var_7_10)

	var_7_0.ViewStorePrompt = var_7_10

	local var_7_11
	local var_7_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_7_1
	})

	var_7_12.id = "ViewStoreButton"

	var_7_12:SetAlpha(0, 0)
	var_7_12.Text:SetLeft(_1080p * 20, 0)
	var_7_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_STORE"), 0)
	var_7_12.Text:SetAlignment(LUI.Alignment.Center)
	var_7_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 198, _1080p * 387, _1080p * 205, _1080p * 227)
	var_7_0:addElement(var_7_12)

	var_7_0.ViewStoreButton = var_7_12

	local function var_7_13()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_13

	local var_7_14
	local var_7_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Hide", var_7_15)

	local var_7_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Hide", var_7_16)

	local var_7_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("Hide", var_7_17)

	local var_7_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_10:RegisterAnimationSequence("Hide", var_7_18)

	local var_7_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_12:RegisterAnimationSequence("Hide", var_7_19)

	local function var_7_20()
		var_7_4:AnimateSequence("Hide")
		var_7_6:AnimateSequence("Hide")
		var_7_8:AnimateSequence("Hide")
		var_7_10:AnimateSequence("Hide")
		var_7_12:AnimateSequence("Hide")
	end

	var_7_0._sequences.Hide = var_7_20

	local var_7_21
	local var_7_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("Show", var_7_22)

	local var_7_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("Show", var_7_23)

	local function var_7_24()
		var_7_4:AnimateSequence("Show")
		var_7_6:AnimateSequence("Show")
	end

	var_7_0._sequences.Show = var_7_24

	local var_7_25
	local var_7_26 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.VGOwner.Image
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("vanguard_owner_xp_boost_icon_1"),
			child = var_7_0.VGOwner.Image
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_OWNER")),
			child = var_7_0.VGOwner.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.VGOwner.Desc1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.VGOwner.Desc2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.VGOwner.Desc3
		}
	}

	var_7_6:RegisterAnimationSequence("ShowVanguardOwner", var_7_26)

	local function var_7_27()
		var_7_6:AnimateSequence("ShowVanguardOwner")
	end

	var_7_0._sequences.ShowVanguardOwner = var_7_27

	local var_7_28
	local var_7_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("HideVGBoost", var_7_29)

	local function var_7_30()
		var_7_6:AnimateSequence("HideVGBoost")
	end

	var_7_0._sequences.HideVGBoost = var_7_30

	local var_7_31
	local var_7_32 = {
		{
			value = 0,
			duration = 6890,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_4:RegisterAnimationSequence("HideBPBoost", var_7_32)

	local function var_7_33()
		var_7_4:AnimateSequence("HideBPBoost")
	end

	var_7_0._sequences.HideBPBoost = var_7_33

	local var_7_34
	local var_7_35 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.BattlePass.Image
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("battlepass_season_emblem_gold"),
			child = var_7_0.BattlePass.Image
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/BATTLE_PASS_OWNED"),
			child = var_7_0.BattlePass.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.BattlePass.Desc1
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.BattlePass.Desc2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.BattlePass.Desc3
		}
	}

	var_7_4:RegisterAnimationSequence("ShowBattlePassOwner", var_7_35)

	local function var_7_36()
		var_7_4:AnimateSequence("ShowBattlePassOwner")
	end

	var_7_0._sequences.ShowBattlePassOwner = var_7_36

	local var_7_37
	local var_7_38 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.PSPartyBoost.Desc3
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MPUI/PARTY_INVITE_ACCEPT")),
			child = var_7_0.PSPartyBoost.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("playstation_xp_boost_icon_0"),
			child = var_7_0.PSPartyBoost.Image
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.PSPartyBoost.Desc2
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.PSPartyBoost.Desc1
		}
	}

	var_7_8:RegisterAnimationSequence("ShowOnPSPlatform", var_7_38)

	local function var_7_39()
		var_7_8:AnimateSequence("ShowOnPSPlatform")
	end

	var_7_0._sequences.ShowOnPSPlatform = var_7_39

	local var_7_40
	local var_7_41 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.PSPartyBoost.Desc3
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ345/PLAYSTATION_PARTY_BOOST")),
			child = var_7_0.PSPartyBoost.Title
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("playstation_xp_boost_icon_1"),
			child = var_7_0.PSPartyBoost.Image
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			child = var_7_0.PSPartyBoost.Desc2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold,
			child = var_7_0.PSPartyBoost.Desc1
		}
	}

	var_7_8:RegisterAnimationSequence("ShowIsInPSParty", var_7_41)

	local function var_7_42()
		var_7_8:AnimateSequence("ShowIsInPSParty")
	end

	var_7_0._sequences.ShowIsInPSParty = var_7_42

	local var_7_43
	local var_7_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_8:RegisterAnimationSequence("HidePSPartyBoost", var_7_44)

	local function var_7_45()
		var_7_8:AnimateSequence("HidePSPartyBoost")
	end

	var_7_0._sequences.HidePSPartyBoost = var_7_45

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("XPBoost", XPBoost)
LockTable(_M)
