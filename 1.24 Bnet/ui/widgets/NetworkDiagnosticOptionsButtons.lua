module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.NATType)
	assert(arg_1_0.Bandwidth)
	assert(arg_1_0.ConnectionType)
	assert(arg_1_0.GeographicalRegion)
	assert(arg_1_0.ExternalIPAddress)
	assert(arg_1_0.InternalIPAddress)
	assert(arg_1_0.ConnectionMeter)
	OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_1_1, arg_1_0.GeographicalRegion, "MKMOPQKMPO", OPTIONS.GeographicalRegionToggle)
	OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_1_1, arg_1_0.ExternalIPAddress, "MTSPMPOSTO", OPTIONS.ExternalIPToggle)
	OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_1_1, arg_1_0.InternalIPAddress, "SQMORMQQS", OPTIONS.InternalIPToggle)
	OPTIONS.ConfigureNetworkDiagnosticHiderArrowButton(arg_1_1, arg_1_0.ConnectionMeter, "OMOTRTTLNP", OPTIONS.ConnectionMeterToggle)

	local var_1_0 = MenuBuilder.BuildRegisteredType("ConnectionMeter", {
		controllerIndex = arg_1_1
	})

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1270, _1080p * 1770, _1080p * 415, _1080p * 615)
	arg_1_0:addElement(var_1_0)

	arg_1_0.ConnectionMeterHistograms = var_1_0

	arg_1_0.ConnectionMeter:registerEventHandler("connection_meter_toggle", function()
		var_1_0:processEvent({
			name = "connection_meter_toggle"
		})
	end)
end

function NetworkDiagnosticOptionsButtons(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "NetworkDiagnosticOptionsButtons"

	local var_3_1 = LUI.UIElement.new()

	var_3_1.id = "NetworkDiagnosticButtonsStencil"

	var_3_1:setUseStencil(true)
	var_3_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 140, 0, 0)

	var_3_0.listStencil = var_3_1

	var_3_0:addElement(var_3_1)

	var_3_0.vList = LUI.UIGrid.new({
		maxVisibleColumns = 1,
		wrapY = true,
		maxRows = 25,
		maxVisibleRows = CONDITIONS.IsSplitscreen() and 6 or 14,
		spacingY = 8 * _1080p
	})

	var_3_0.vList:SetAnchorsAndPosition(0, 0, 0, 1, 0, -140 * _1080p, 0, 490 * _1080p)

	var_3_0.vList.id = "NetworkDiagnosticOptionsButtonsList"

	var_3_1:addElement(var_3_0.vList)

	local var_3_2 = arg_3_1 or {}
	local var_3_3 = var_3_2.controllerIndex
	local var_3_4 = _1080p * 40
	local var_3_5 = OPTIONS.FirstPartyServersLabel()
	local var_3_6 = ""
	local var_3_7 = ""

	if NetworkInfo.DDADIHAFHH() then
		var_3_6 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED_CAPS", var_3_5))
		var_3_7 = Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_CONNECTED_DESC", var_3_5)
	else
		var_3_6 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED_CAPS", var_3_5))
		var_3_7 = Engine.CBBHFCGDIC("LUA_MENU/FIRSTPARTY_NOT_CONNECTED_DESC", var_3_5)
	end

	local var_3_8 = OPTIONS.BuildNetworkDiagnosticLabelButton(var_3_3, "FirstParty", var_3_4, var_3_7, var_3_6)

	var_3_0.vList:AddElement(var_3_8)

	var_3_0.ConnectionFirstParty = var_3_8

	local var_3_9 = ""
	local var_3_10 = ""

	if NetworkInfo.FIDJJHHCA() then
		var_3_10 = Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_CONNECTED_DESC")
		var_3_9 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_CONNECTED_CAPS"))
	else
		var_3_10 = Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_NOT_CONNECTED_DESC")
		var_3_9 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DEMONWARE_NOT_CONNECTED_CAPS"))
	end

	local var_3_11 = OPTIONS.BuildNetworkDiagnosticLabelButton(var_3_3, "Demonware", var_3_4, var_3_10, var_3_9)

	var_3_0.vList:AddElement(var_3_11)

	var_3_0.ConnectionDW = var_3_11

	local var_3_12 = NetworkInfo.DGDAAFJDBI()

	if OPTIONS.natTypeUILabels[var_3_12] == nil then
		netdiagNat = "unknown"
	end

	if OPTIONS.natTypeDescUILabels[var_3_12] == nil then
		netdiagNat = "unknown"
	end

	local var_3_13 = OPTIONS.BuildNetworkDiagnosticLabelButton(var_3_3, "NATType", var_3_4, Engine.CBBHFCGDIC(OPTIONS.natTypeDescUILabels[var_3_12], var_3_12), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/YOURNATTYPE", OPTIONS.natTypeUILabels[var_3_12])))

	var_3_0.vList:AddElement(var_3_13)

	var_3_0.NATType = var_3_13

	local var_3_14 = NetworkInfo.HGEFAEJCE()
	local var_3_15 = OPTIONS.BuildNetworkDiagnosticLabelButton(var_3_3, "Bandwidth", var_3_4, Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH_DESC"), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BANDWIDTH_CAPS", var_3_14)))

	var_3_0.vList:AddElement(var_3_15)

	var_3_0.Bandwidth = var_3_15

	local var_3_16 = ""
	local var_3_17 = ""
	local var_3_18 = NetworkInfo.DCFDACAGBG()

	if NetworkInfo.DCFDACAGBG() == true then
		var_3_17 = Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRELESS_DESC")
		var_3_16 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRELESS_CAPS"))
	elseif var_3_18 == false then
		var_3_17 = Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRED_DESC")
		var_3_16 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_TYPE_WIRED_CAPS"))
	end

	local var_3_19 = OPTIONS.BuildNetworkDiagnosticLabelButton(var_3_3, "ConnectionType", var_3_4, var_3_17, var_3_16)

	var_3_0.vList:AddElement(var_3_19)

	var_3_0.ConnectionType = var_3_19

	local var_3_20 = Dvar.IBEGCHEFE("MKMOPQKMPO") and "LUA_MENU/HIDDEN" or NetworkInfo.BGJIBGHBAG()
	local var_3_21 = OPTIONS.BuildNetworkDiagnosticHiderArrowButton(var_3_3, "GeographicalRegion", var_3_4, Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION_DESC"), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/GEOGRAPHICAL_REGION_CAPS", var_3_20)))

	var_3_0.vList:AddElement(var_3_21)

	var_3_0.GeographicalRegion = var_3_21

	local var_3_22 = Dvar.IBEGCHEFE("MTSPMPOSTO") and "LUA_MENU/HIDDEN" or NetworkInfo.BBJBJGDIGD()
	local var_3_23 = OPTIONS.BuildNetworkDiagnosticHiderArrowButton(var_3_3, "ExternalIPAddress", var_3_4, Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS_DESC"), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/EXTERNAL_IP_ADDRESS_CAPS", var_3_22)))

	var_3_0.vList:AddElement(var_3_23)

	var_3_0.ExternalIPAddress = var_3_23

	local var_3_24 = Dvar.IBEGCHEFE("SQMORMQQS") and "LUA_MENU/HIDDEN" or NetworkInfo.DBDIHEIEGB()
	local var_3_25 = OPTIONS.BuildNetworkDiagnosticHiderArrowButton(var_3_3, "InternalIPAddress", var_3_4, Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS_DESC"), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/INTERNAL_IP_ADDRESS_CAPS", var_3_24)))

	var_3_0.vList:AddElement(var_3_25)

	var_3_0.InternalIPAddress = var_3_25

	local var_3_26 = OPTIONS.BuildNetworkDiagnosticHiderArrowButton(var_3_3, "ConnectionMeter", var_3_4, Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_METER_DESC"), ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_METER_CAPS")))

	var_3_0.vList:AddElement(var_3_26)

	var_3_0.ConnectionMeter = var_3_26

	var_0_0(var_3_0, var_3_3, var_3_2)

	return var_3_0
end

MenuBuilder.registerType("NetworkDiagnosticOptionsButtons", NetworkDiagnosticOptionsButtons)
LockTable(_M)
