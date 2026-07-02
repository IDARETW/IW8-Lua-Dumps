LUI.WebViewManager = LUI.Class(LUI.UIElement)
LUI.WebViewManager.USAGE_FULLSCREEN = 0
LUI.WebViewManager.USAGE_MOTD = 1
LUI.WebViewManager.ButtonMap = {
	alt2 = 8,
	down = 4,
	alt1 = 7,
	right_stick = 14,
	secondary = 6,
	shoulderr = 10,
	left = 1,
	left_trigger = 11,
	left_stick = 13,
	up = 3,
	shoulderl = 9,
	right_trigger = 12,
	primary = 5,
	right = 2
}
LUI.WebViewManager.EnhancedButtonMap = {
	alt2 = 8,
	rs_up = 3,
	rs_right = 2,
	right_stick = 14,
	shoulderr = 10,
	left_stick = 13,
	up = 3,
	rs_left = 1,
	left_trigger = 11,
	shoulderl = 9,
	rs_down = 4,
	alt1 = 7,
	secondary = 6,
	left = 1,
	down = 4,
	right_trigger = 12,
	primary = 5,
	right = 2
}
LUI.WebViewManager.NavigationButtonIndexBegin = LUI.WebViewManager.ButtonMap.left
LUI.WebViewManager.NavigationButtonIndexEnd = LUI.WebViewManager.ButtonMap.down
LUI.WebViewManager.LStickAnalogDirectionButtonIdBase = 1000
LUI.WebViewManager.RStickAnalogDirectionButtonIdBase = 1100
LUI.WebViewManager.ButtonEventTypePressed = 1
LUI.WebViewManager.ButtonEventTypeReleased = 0

function LUI.WebViewManager.Instance()
	return LUI.WebViewManager.GetLayer()
end

function LUI.WebViewManager.GetLayer()
	return Engine.DBFFAEEFGJ().webviewManager
end

function LUI.WebViewManager.TelescopeEnabled()
	if Engine.BHICADFIHA() then
		local var_3_0 = Dvar.CFHDGABACF("OKMLNRSSNO")

		if var_3_0 == 1 then
			return true
		elseif var_3_0 == 2 then
			return false
		end
	end

	return Dvar.IBEGCHEFE("LPKOSTRNOL")
end

function LUI.WebViewManager.MotdEnabled()
	return LUI.WebViewManager.TelescopeEnabled() and Dvar.IBEGCHEFE("LMTLRTPSOK")
end

function LUI.WebViewManager.CdlEnabled()
	return LUI.WebViewManager.TelescopeEnabled() and Dvar.IBEGCHEFE("NMPQRPKTTR")
end

function LUI.WebViewManager.GetUsage(arg_6_0)
	return arg_6_0.options.usage
end

function LUI.WebViewManager.GetContext(arg_7_0)
	if arg_7_0 == LUI.WebViewManager.USAGE_MOTD then
		if CONDITIONS.IsMagmaGameMode() then
			return "motd_wz_lobby"
		elseif Engine.EAAHGICFBD() and Engine.ECHCFGDDDF() then
			return "motd_mp_lobby"
		elseif Engine.EAIICIFIFA() then
			return "motd_cp_lobby"
		end
	end

	return nil
end

function LUI.WebViewManager.ShouldBeVisible(arg_8_0)
	return true
end

function LUI.WebViewManager.TrapsInput(arg_9_0)
	return false
end

function LUI.WebViewManager.InitLayer(arg_10_0)
	return
end

function LUI.WebViewManager.ClearLayer(arg_11_0, arg_11_1)
	arg_11_0.closeChildren()
end

function LUI.WebViewManager.Reset(arg_12_0)
	arg_12_0._isSystemReady = nil
	arg_12_0._usageBeingOpened = nil
end

function LUI.WebViewManager.ResetLoadComplete(arg_13_0)
	local var_13_0 = LUI.DataSourceInGlobalModel.new("telescope.loadcomplete")

	DataModel.DBEBGEAJHJ(var_13_0:GetModel(), false)
end

function LUI.WebViewManager.SetPendingOpen(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_1 == nil then
		arg_14_0._pendingOpen = nil
	else
		arg_14_0._pendingOpen = {
			usage = arg_14_1,
			width = arg_14_2,
			height = arg_14_3
		}
	end
end

function LUI.WebViewManager.SystemIsReady(arg_15_0)
	return arg_15_0._isSystemReady
end

function LUI.WebViewManager.ReadyStateChanged(arg_16_0, arg_16_1)
	arg_16_0._isSystemReady = DataModel.JJEHAEBDF(arg_16_1)

	if arg_16_0._isSystemReady then
		local var_16_0 = arg_16_0._pendingOpen

		if var_16_0 then
			arg_16_0:Open(var_16_0.usage, var_16_0.width, var_16_0.height)
		end
	else
		arg_16_0:Reset()
	end
end

function LUI.WebViewManager.FullScreenChanged(arg_17_0, arg_17_1)
	local var_17_0 = DataModel.JJEHAEBDF(arg_17_1)

	if var_17_0 == arg_17_0:IsFullScreenOpened() then
		return
	end

	if var_17_0 then
		arg_17_0:RequestOpenFullScreen(nil, false)
	else
		arg_17_0:RequestCloseFullScreen(false)
	end
end

function LUI.WebViewManager.LoadCompleteChanged(arg_18_0, arg_18_1)
	arg_18_0._isLoadComplete = DataModel.JJEHAEBDF(arg_18_1)
end

function LUI.WebViewManager.ReserveMotdConfig(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0._reservedMotdConfig = {
		usage = arg_19_1,
		width = arg_19_2,
		height = arg_19_3
	}
end

function LUI.WebViewManager.CanInteractive(arg_20_0)
	return arg_20_0._isLoadComplete
end

function LUI.WebViewManager.UpdateInputDevice(arg_21_0)
	if arg_21_0._usageBeingOpened ~= nil then
		WebViewUpdateInputType(arg_21_0._usageBeingOpened)
	end
end

function LUI.WebViewManager.init(arg_22_0, arg_22_1)
	LUI.UIElement.init(arg_22_0)

	arg_22_0.id = "WebViewManager"
end

function LUI.WebViewManager.PostInit(arg_23_0)
	arg_23_0._isLoadComplete = false
	arg_23_0._isSystemReady = false
	arg_23_0._usageBeingOpen = nil
	arg_23_0._pendingOpen = nil
	arg_23_0._context = nil
	arg_23_0._reservedMotdConfig = nil

	local var_23_0
	local var_23_1 = LUI.DataSourceInGlobalModel.new("telescope.ready")

	arg_23_0:SubscribeToModel(var_23_1:GetModel(0), function(arg_24_0)
		arg_23_0:ReadyStateChanged(arg_24_0)
	end)

	local var_23_2 = LUI.DataSourceInGlobalModel.new("telescope.fullscreen")

	arg_23_0:SubscribeToModel(var_23_2:GetModel(0), function(arg_25_0)
		arg_23_0:FullScreenChanged(arg_25_0)
	end)

	local var_23_3 = LUI.DataSourceInGlobalModel.new("telescope.loadcomplete")

	arg_23_0:SubscribeToModel(var_23_3:GetModel(0), function(arg_26_0)
		arg_23_0:LoadCompleteChanged(arg_26_0)
	end)
	arg_23_0:registerEventHandler("webview_navigate_menu", function(arg_27_0, arg_27_1)
		arg_23_0:NavigateMenu(arg_27_1.jumpType, arg_27_1.jumpIntArg, arg_27_1.jumpStrArg)
	end)
	arg_23_0:registerEventHandler("update_input_type", function(arg_28_0, arg_28_1)
		arg_28_0:UpdateInputDevice()
	end)
	arg_23_0:registerEventHandler("input_connection", function(arg_29_0, arg_29_1)
		arg_29_0:UpdateInputDevice()
	end)
end

function LUI.WebViewManager.Setup(arg_30_0, arg_30_1)
	SetupWebView(arg_30_1)
end

function LUI.WebViewManager.OpenByElement(arg_31_0, arg_31_1)
	arg_31_0:Open(LUI.WebViewManager.GetUsage(arg_31_1), arg_31_1:GetSize())
end

function LUI.WebViewManager.CloseByElement(arg_32_0, arg_32_1)
	arg_32_0:Close(LUI.WebViewManager.GetUsage(arg_32_1))
end

function LUI.WebViewManager.OpenCdl(arg_33_0)
	if not arg_33_0:SystemIsReady() then
		return
	end

	if not LUI.WebViewManager.CdlEnabled() then
		return
	end

	LUI.FlowManager.RequestPopupMenu(nil, "FullScreenWeb", true, Engine.IJEBHJIJF(), false, nil)
	arg_33_0:Open(LUI.WebViewManager.USAGE_FULLSCREEN, 1920, 1080, "cdl")
end

function LUI.WebViewManager.ResetContext(arg_34_0)
	arg_34_0._context = nil
end

function LUI.WebViewManager.Open(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	local var_35_0 = false
	local var_35_1 = arg_35_4 or LUI.WebViewManager.GetContext(arg_35_1)

	if arg_35_0._usageBeingOpened ~= arg_35_1 then
		var_35_0 = true
	end

	if var_35_1 ~= nil and arg_35_0._context ~= var_35_1 then
		arg_35_0._context = var_35_1
		var_35_0 = true
	end

	if not var_35_0 then
		return
	end

	if arg_35_0:SystemIsReady() then
		arg_35_0:ResetLoadComplete()
		OpenWebView(arg_35_1, arg_35_2, arg_35_3, arg_35_0._context)

		arg_35_0._usageBeingOpened = arg_35_1

		if arg_35_1 == LUI.WebViewManager.USAGE_MOTD then
			arg_35_0:ReserveMotdConfig(arg_35_1, arg_35_2, arg_35_3)
		end
	else
		arg_35_0:SetPendingOpen(arg_35_1, arg_35_2, arg_35_3)
	end
end

function LUI.WebViewManager.Close(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0._pendingOpen

	if var_36_0 and var_36_0.usage == arg_36_1 then
		arg_36_0:SetPendingOpen(nil)
	end
end

function LUI.WebViewManager.GainFocus(arg_37_0, arg_37_1)
	arg_37_1.m_isFocused = true

	local var_37_0 = arg_37_1.m_mouseOver == true

	GainFocusWebView(LUI.WebViewManager.GetUsage(arg_37_1), var_37_0)
end

function LUI.WebViewManager.LoseFocus(arg_38_0, arg_38_1)
	arg_38_1.m_isFocused = false
	arg_38_1.m_mouseOver = nil

	LoseFocusWebView(LUI.WebViewManager.GetUsage(arg_38_1))

	arg_38_0._buttonReleasedEventEnabledMap = nil
end

function LUI.WebViewManager.ButtonPress(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_0:CanInteractive() then
		return
	end

	if not arg_39_1.m_isFocused then
		return
	end

	if arg_39_2.down == false then
		return
	end

	local var_39_0 = LUI.WebViewManager.ButtonMap[arg_39_2.button]

	if var_39_0 == nil then
		return
	end

	ButtonPressWebView(LUI.WebViewManager.GetUsage(arg_39_1), var_39_0)
end

function LUI.WebViewManager.ButtonEvent(arg_40_0, arg_40_1, arg_40_2)
	local function var_40_0(arg_41_0)
		return arg_41_0 >= LUI.WebViewManager.NavigationButtonIndexBegin and arg_41_0 <= LUI.WebViewManager.NavigationButtonIndexEnd
	end

	local function var_40_1(arg_42_0)
		return string.find(arg_42_0, "rs_", 1) ~= nil
	end

	if not arg_40_0:CanInteractive() then
		return
	end

	if not arg_40_1.m_isFocused then
		return
	end

	local var_40_2 = LUI.WebViewManager.EnhancedButtonMap[arg_40_2.button]

	if var_40_2 == nil then
		return
	end

	local var_40_3 = var_40_2

	if var_40_0(var_40_2) and arg_40_2.qualifier ~= "dpad" and arg_40_2.qualifier ~= "keyboard" then
		if var_40_1(arg_40_2.button) then
			var_40_3 = var_40_3 + LUI.WebViewManager.RStickAnalogDirectionButtonIdBase
		else
			var_40_3 = var_40_3 + LUI.WebViewManager.LStickAnalogDirectionButtonIdBase
		end
	end

	local var_40_4 = LUI.WebViewManager.ButtonEventTypeReleased

	if arg_40_2.down then
		var_40_4 = LUI.WebViewManager.ButtonEventTypePressed

		if arg_40_0._buttonReleasedEventEnabledMap == nil then
			arg_40_0._buttonReleasedEventEnabledMap = {}
		end

		arg_40_0._buttonReleasedEventEnabledMap[var_40_3] = true
	elseif arg_40_0._buttonReleasedEventEnabledMap == nil or not arg_40_0._buttonReleasedEventEnabledMap[var_40_3] then
		return
	end

	ButtonEventWebView(LUI.WebViewManager.GetUsage(arg_40_1), var_40_4, var_40_2, var_40_3)
end

function LUI.WebViewManager.GetMousePositionByEvent(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_2.x
	local var_43_1 = arg_43_2.y

	if arg_43_3 == false then
		var_43_0, var_43_1 = ProjectRootCoordinate(arg_43_2.rootName, var_43_0, var_43_1)
	end

	local var_43_2, var_43_3 = arg_43_2.root:PixelsToUnits(var_43_0, var_43_1)
	local var_43_4, var_43_5 = arg_43_1:getCurrentGlobalRect()

	if var_43_4 == nil or var_43_5 == nil then
		return
	end

	local var_43_6 = math.floor((var_43_2 - var_43_4) / _1080p + 0.5)
	local var_43_7 = math.floor((var_43_3 - var_43_5) / _1080p + 0.5)

	return var_43_6, var_43_7
end

function LUI.WebViewManager.MouseMove(arg_44_0, arg_44_1, arg_44_2)
	if not arg_44_0:CanInteractive() then
		return
	end

	local var_44_0, var_44_1 = arg_44_0:GetMousePositionByEvent(arg_44_1, arg_44_2, false)

	if var_44_0 ~= nil and var_44_1 ~= nil then
		MouseMoveWebView(arg_44_2.controller, LUI.WebViewManager.GetUsage(arg_44_1), var_44_0, var_44_1)
	end
end

function LUI.WebViewManager.MouseAction(arg_45_0, arg_45_1, arg_45_2)
	if not arg_45_0:CanInteractive() then
		return
	end

	local var_45_0, var_45_1 = arg_45_0:GetMousePositionByEvent(arg_45_1, arg_45_2, false)

	if var_45_0 ~= nil and var_45_1 ~= nil then
		local var_45_2 = arg_45_2.button == "left"
		local var_45_3 = arg_45_2.name == "mousedown"

		MouseActionWebView(LUI.WebViewManager.GetUsage(arg_45_1), var_45_0, var_45_1, var_45_2, var_45_3)
	end
end

function LUI.WebViewManager.MouseWheel(arg_46_0, arg_46_1, arg_46_2)
	if not arg_46_0:CanInteractive() then
		return
	end

	local var_46_0, var_46_1 = arg_46_0:GetMousePositionByEvent(arg_46_1, arg_46_2, false)

	if var_46_0 ~= nil and var_46_1 ~= nil then
		local var_46_2 = ({
			down = 1,
			up = 0,
			left = 2,
			right = 3
		})[arg_46_2.button]

		if var_46_2 == nil then
			return
		end

		MouseWheelWebView(LUI.WebViewManager.GetUsage(arg_46_1), var_46_2, var_46_0, var_46_1)
	end
end

function LUI.WebViewManager.GetFullScreenMenu()
	local var_47_0 = "FullScreenWeb"

	if LUI.FlowManager.IsInStack(var_47_0) then
		local var_47_1 = LUI.FlowManager.GetMenuByName(var_47_0).menu

		if var_47_1 then
			return var_47_1
		end
	end

	return nil
end

function LUI.WebViewManager.IsFullScreenOpened(arg_48_0)
	return arg_48_0:GetFullScreenMenu() ~= nil
end

function LUI.WebViewManager.MakeSureFullScreenClosed(arg_49_0)
	if arg_49_0:IsFullScreenOpened() then
		arg_49_0:RequestCloseFullScreen(arg_49_0:GetFullScreenMenu().WebView, true)
	end
end

function LUI.WebViewManager.RequestOpenFullScreen(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = Engine.IJEBHJIJF()
	local var_50_1 = LUI.DataSourceInControllerModel.new("alwaysLoaded.openedSeasonalFlow"):GetValue(var_50_0)

	if arg_50_2 and not arg_50_0:CanInteractive() then
		return
	end

	local var_50_2 = Engine.CGABICJHAI() and CONDITIONS.ShowWZSeasonalOpeningScreenPC(var_50_0)

	if var_50_1 or var_50_2 then
		RequestCloseBigView(LUI.WebViewManager.USAGE_FULLSCREEN)
	else
		LUI.FlowManager.RequestPopupMenu(nil, "FullScreenWeb", true, var_50_0, false, nil)

		if arg_50_2 and arg_50_1 then
			RequestOpenBigView(LUI.WebViewManager.GetUsage(arg_50_1))
		end
	end
end

local function var_0_0()
	local var_51_0 = {
		"MPMainMenu",
		"BRMainMenu",
		"CPMainMenu",
		"MPPublicLobby",
		"BRPublicLobby",
		"CPPublicMatchMenu"
	}

	for iter_51_0 = 1, #var_51_0 do
		local var_51_1 = var_51_0[iter_51_0]

		if LUI.FlowManager.IsInStack(var_51_1) then
			local var_51_2 = LUI.FlowManager.GetMenuByName(var_51_1).menu

			if var_51_2 then
				return var_51_2.MPTabsMenu
			end
		end
	end
end

function LUI.WebViewManager.RequestCloseFullScreen(arg_52_0, arg_52_1)
	if not arg_52_0:IsFullScreenOpened() then
		return
	end

	local var_52_0 = LUI.WebViewManager.GetUsage(arg_52_0:GetFullScreenMenu().WebView)

	LUI.FlowManager.RequestLeaveMenuByName("FullScreenWeb", true, true)

	if arg_52_0._context == "cdl" then
		local var_52_1 = arg_52_0._reservedMotdConfig

		if var_52_1 then
			arg_52_0:Open(var_52_1.usage, var_52_1.width, var_52_1.height)
		else
			arg_52_0._context = nil
		end
	elseif (arg_52_0._context == "motd_wz_lobby" or arg_52_0._context == "motd_mp_lobby" or arg_52_0._context == "motd_cp_lobby") and arg_52_1 then
		RequestCloseBigView(var_52_0)
	end
end

LUI.WebViewManager.NavigateEnum = {
	challenges = 4,
	battlepass = 8,
	operators = 2,
	goto_url = 9,
	redeem = 17,
	tournaments = 14,
	barracks = 3,
	trials = 13,
	armory = 12,
	store_item = 5,
	loadouts = 1,
	goto_upsell = 23,
	battlepass_gifting = 21,
	game_install = 24,
	battlepass_tier_gift = 18,
	cdl = 7,
	store = 10,
	goto_first_party_store = 22,
	missions = 15,
	register = 16,
	goto_bundle_locker = 25,
	social = 11,
	goto_franchise_store = 0,
	store_item_gifting = 20,
	options = 19,
	cdl_web = 6
}

local function var_0_1(arg_53_0, arg_53_1)
	arg_53_0[CRM.keys.STORE_ITEM] = arg_53_1
end

local function var_0_2(arg_54_0, arg_54_1)
	arg_54_0[CRM.keys.STORE_ITEM] = arg_54_1
end

local function var_0_3(arg_55_0, arg_55_1)
	arg_55_0[CRM.keys.STORE_ITEM] = arg_55_1
end

local function var_0_4(arg_56_0, arg_56_1)
	arg_56_0[CRM.keys.STORE_ITEM] = arg_56_1
end

local function var_0_5(arg_57_0, arg_57_1)
	arg_57_0[CRM.keys.STORE_ITEM] = arg_57_1
end

local function var_0_6(arg_58_0, arg_58_1)
	arg_58_0[CRM.keys.ACTION_LOCATION] = arg_58_1
end

local function var_0_7(arg_59_0, arg_59_1)
	arg_59_0[CRM.keys.STORE_ITEM] = arg_59_1
end

local function var_0_8(arg_60_0, arg_60_1)
	arg_60_0[CRM.keys.OPTION_ITEM] = arg_60_1
end

local function var_0_9(arg_61_0, arg_61_1)
	arg_61_0[CRM.keys.OPTION_ITEM] = arg_61_1
end

local function var_0_10(arg_62_0)
	for iter_62_0, iter_62_1 in pairs(LUI.WebViewManager.NavigateEnum) do
		if iter_62_1 == arg_62_0 then
			return iter_62_0
		end
	end
end

local function var_0_11(arg_63_0)
	return CRM.LocationFunctions[arg_63_0] or CRM.actionFunctions[arg_63_0]
end

local function var_0_12(arg_64_0)
	local var_64_0 = {}
	local var_64_1 = {}

	var_64_0[CRM.keys.LOCATION_ID] = 0
	var_64_0[CRM.keys.MESSAGE_ID] = 0
	var_64_0[CRM.keys.MESSAGE_INDEX] = 0
	var_64_1.controller = arg_64_0

	return var_64_0, var_64_1
end

local var_0_13 = {
	store_item = var_0_2,
	store_item_gifting = var_0_2,
	battlepass_tier_gift = var_0_7
}
local var_0_14 = {
	store = var_0_1,
	goto_url = var_0_6,
	goto_franchise_store = var_0_3,
	goto_first_party_store = var_0_4,
	goto_upsell = var_0_5,
	options = var_0_8,
	game_install = var_0_9
}

function LUI.WebViewManager.NavigateMenu(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	local var_65_0 = var_0_10(arg_65_1)

	if arg_65_1 == LUI.WebViewManager.NavigateEnum.cdl_web then
		var_65_0 = "goto_url"
		arg_65_3 = Dvar.DHEEJCCJBH("QMKTOPOPP")
	end

	local var_65_1 = var_0_11(var_65_0)
	local var_65_2 = var_0_13[var_65_0]
	local var_65_3 = var_0_14[var_65_0]
	local var_65_4 = Engine.IJEBHJIJF()
	local var_65_5 = var_0_0()
	local var_65_6, var_65_7 = var_0_12(var_65_4)
	local var_65_8 = arg_65_0:GetFullScreenMenu()

	if var_65_0 == "cdl" then
		arg_65_0:OpenCdl()

		return
	end

	if var_65_8 == nil then
		return
	end

	if var_65_2 then
		var_65_2(var_65_6, arg_65_2)
	end

	if var_65_3 then
		var_65_3(var_65_6, arg_65_3)
	end

	if var_65_1 == nil then
		return
	end

	local var_65_9 = var_65_1(var_65_4, var_65_6)

	if var_65_9 == nil then
		return
	end

	local var_65_10 = var_65_9(var_65_8, var_65_7)

	if var_65_10 ~= nil then
		if var_65_5 == nil then
			return
		end

		var_65_5:SetupOnRestoreFocusOverride(var_65_10)
		arg_65_0:RequestCloseFullScreen(true)
	elseif arg_65_1 == LUI.WebViewManager.NavigateEnum.goto_franchise_store then
		arg_65_0:RequestCloseFullScreen(true)
	end
end
