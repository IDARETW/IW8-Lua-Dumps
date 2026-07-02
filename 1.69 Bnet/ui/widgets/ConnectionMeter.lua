module(..., package.seeall)

MeterHistogramTypes = {
	[0] = "ping",
	"loss"
}

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	arg_1_0.HistogramElements[arg_1_1][arg_1_3]:SetTop(arg_1_4 + arg_1_5 * 100 * arg_1_0.HistogramValues[arg_1_1][arg_1_2] / arg_1_0.HistogramPointDimensions[arg_1_1].valueLimit)
end

local function var_0_1(arg_2_0)
	local var_2_0 = 0
	local var_2_1 = 0
	local var_2_2 = 0
	local var_2_3 = 0
	local var_2_4 = 0
	local var_2_5 = 0
	local var_2_6 = ""
	local var_2_7 = 0
	local var_2_8 = 1

	while MeterHistogramTypes[var_2_5] ~= nil do
		local var_2_9 = MeterHistogramTypes[var_2_5]

		if var_2_9 == "ping" then
			var_2_0 = DataModel.JJEHAEBDF(arg_2_0.LatencyModel) or 0

			if var_2_0 > 0 then
				arg_2_0.pingValue:setText(var_2_0 .. arg_2_0.pingAppendix)
			else
				arg_2_0.pingValue:setText(Engine.CBBHFCGDIC("LUA_MENU/N_A"))
			end

			if var_2_0 >= arg_2_0.HistogramPointDimensions.ping.valueLimit then
				arg_2_0.HistogramPointDimensions.ping.valueLimit = var_2_0 * 1.1
				arg_2_0.HistogramPointDimensions.ping.valueLimitUnit = var_2_0 * 0.011 + 1
			elseif var_2_0 < arg_2_0.HistogramPointDimensions.ping.valueLimitUnit then
				var_2_0 = arg_2_0.HistogramPointDimensions.ping.valueLimitUnit
			end
		elseif var_2_9 == "loss" then
			var_2_0 = DataModel.JJEHAEBDF(arg_2_0.PacketLossModel) or 0

			arg_2_0.lossValue:setText(var_2_0 .. arg_2_0.lossAppendix)

			if var_2_0 >= arg_2_0.HistogramPointDimensions.loss.valueLimit then
				if var_2_0 < arg_2_0.HistogramPointDimensions.loss.valueLimit * 1.2 then
					arg_2_0.HistogramPointDimensions.loss.valueLimit = var_2_0 * 1.1
					arg_2_0.HistogramPointDimensions.loss.valueLimitUnit = var_2_0 * 0.011 + 1
				else
					var_2_0 = arg_2_0.HistogramPointDimensions.loss.valueLimit
				end
			elseif var_2_0 < arg_2_0.HistogramPointDimensions.loss.valueLimitUnit then
				var_2_0 = arg_2_0.HistogramPointDimensions.loss.valueLimitUnit
			end
		end

		if arg_2_0.CurrentHistogramPoints[var_2_9] ~= nil and arg_2_0.HistogramElements[var_2_9] ~= nil and #arg_2_0.HistogramElements[var_2_9] > 0 then
			local var_2_10 = #arg_2_0.HistogramElements[var_2_9]
			local var_2_11 = arg_2_0.CurrentHistogramPoints[var_2_9] % var_2_10 + 1

			arg_2_0.CurrentHistogramPoints[var_2_9] = var_2_11
			arg_2_0.HistogramValues[var_2_9][var_2_11] = var_2_0

			local var_2_12 = arg_2_0.HistogramPointDimensions[var_2_9].bottom or 0
			local var_2_13 = arg_2_0.HistogramPointDimensions[var_2_9].scaleUnit or 1
			local var_2_14 = var_2_11 + 1
			local var_2_15 = 1

			while var_2_14 <= var_2_10 do
				var_0_0(arg_2_0, var_2_9, var_2_14, var_2_15, var_2_12, var_2_13)

				var_2_14 = var_2_14 + 1
				var_2_15 = var_2_15 + 1
			end

			local var_2_16 = 1

			while var_2_16 <= var_2_11 do
				var_0_0(arg_2_0, var_2_9, var_2_16, var_2_15, var_2_12, var_2_13)

				var_2_16 = var_2_16 + 1
				var_2_15 = var_2_15 + 1
			end
		end

		var_2_5 = var_2_5 + 1
		arg_2_0.meterInit = true
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.meterVisible = arg_3_1 or false

	if arg_3_1 == true then
		if not arg_3_0.meterInit then
			var_0_1(arg_3_0)
		end

		arg_3_0:SetAlpha(1)
	else
		arg_3_0:SetAlpha(0)
	end
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.meterInit = false
	arg_4_0.HistogramElements = {}
	arg_4_0.HistogramValues = {}
	arg_4_0.CurrentHistogramPoints = {}
	arg_4_0.HistogramPointDimensions = {}

	local var_4_0 = 0
	local var_4_1 = ""
	local var_4_2 = 0
	local var_4_3 = ""

	while MeterHistogramTypes[var_4_0] ~= nil do
		local var_4_4 = MeterHistogramTypes[var_4_0]

		arg_4_0.HistogramElements[var_4_4] = {}
		arg_4_0.HistogramValues[var_4_4] = {}
		arg_4_0.CurrentHistogramPoints[var_4_4] = 0
		arg_4_0.HistogramPointDimensions[var_4_4] = {}

		local var_4_5 = 1
		local var_4_6 = var_4_4 .. "Bar" .. (var_4_5 < 10 and "0" or "") .. var_4_5

		if arg_4_0[var_4_6] ~= nil then
			local var_4_7, var_4_8, var_4_9, var_4_10 = arg_4_0[var_4_6]:getLocalRect()

			arg_4_0.HistogramPointDimensions[var_4_4].bottom = var_4_10
			arg_4_0.HistogramPointDimensions[var_4_4].scaleUnit = (var_4_8 - var_4_10) / 100
		end

		while arg_4_0[var_4_6] ~= nil do
			arg_4_0.HistogramElements[var_4_4][var_4_5] = arg_4_0[var_4_6]
			arg_4_0.HistogramValues[var_4_4][var_4_5] = 0
			var_4_5 = var_4_5 + 1
			var_4_6 = var_4_4 .. "Bar" .. (var_4_5 < 10 and "0" or "") .. var_4_5
		end

		var_4_0 = var_4_0 + 1
	end

	arg_4_0.HistogramPointDimensions.loss.valueLimit = 100
	arg_4_0.HistogramPointDimensions.loss.valueLimitUnit = 1
	arg_4_0.HistogramPointDimensions.ping.valueLimit = 500
	arg_4_0.HistogramPointDimensions.ping.valueLimitUnit = 5

	arg_4_0:addEventHandler("network_diagnostic_show", function(arg_5_0, arg_5_1)
		var_0_2(arg_4_0, not Dvar.IBEGCHEFE("OMOTRTTLNP"))
	end)
	arg_4_0:addEventHandler("network_diagnostic_hide", function(arg_6_0, arg_6_1)
		var_0_2(arg_4_0, false)
	end)
	arg_4_0:addEventHandler("connection_meter_toggle", function(arg_7_0, arg_7_1)
		var_0_2(arg_4_0, not Dvar.IBEGCHEFE("OMOTRTTLNP"))
	end)
	arg_4_0:addEventHandler("connection_meter_refresh", function(arg_8_0, arg_8_1)
		var_0_2(arg_4_0, not Dvar.IBEGCHEFE("OMOTRTTLNP"))
	end)

	arg_4_0.PacketLossDataSource = LUI.DataSourceInGlobalModel.new("netstats.NETSTATS_PACKETLOSS")
	arg_4_0.PacketLossModel = arg_4_0.PacketLossDataSource:GetModel()
	arg_4_0.LatencyDataSource = LUI.DataSourceInGlobalModel.new("netstats.NETSTATS_LATENCY")
	arg_4_0.LatencyModel = arg_4_0.LatencyDataSource:GetModel()
	arg_4_0.SnapsDataSource = LUI.DataSourceInGlobalModel.new("netstats.NETSTATS_SNAPS")
	arg_4_0.SnapsModel = arg_4_0.SnapsDataSource:GetModel()
	arg_4_0.ControlDataSource = LUI.DataSourceInGlobalModel.new("netstats.NETSTATS_CONTROL")
	arg_4_0.ControlModel = arg_4_0.ControlDataSource:GetModel()

	assert(arg_4_0.PacketLossDataSource)
	assert(arg_4_0.LatencyDataSource)
	assert(arg_4_0.SnapsDataSource)

	arg_4_0.pingAppendix = Engine.CBBHFCGDIC("LUA_MENU/PING_MS")
	arg_4_0.lossAppendix = Engine.CBBHFCGDIC("LUA_MENU/LOSS_PERCENT")

	assert(arg_4_0.pingValue)
	assert(arg_4_0.lossValue)
	arg_4_0:SubscribeToModel(arg_4_0.ControlDataSource:GetModel(arg_4_1), function()
		if arg_4_0.meterVisible then
			var_0_1(arg_4_0)
		end
	end, true)
	var_0_2(arg_4_0, true)

	if IsLanguageArabic() then
		arg_4_0.pingLabel:SetAlignment(LUI.Alignment.Right)
		arg_4_0.lossLabel:SetAlignment(LUI.Alignment.Right)
	end
end

function ConnectionMeter(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 170 * _1080p)

	var_10_0.id = "ConnectionMeter"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(0, 0)
	var_10_4:SetAlpha(0.15, 0)
	var_10_4:setImage(RegisterMaterial("wdg_backer"), 0)
	var_10_4:Setup9SliceImage(_1080p * 25, _1080p * 25, 0.5, 0.5)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIText.new()

	var_10_6.id = "lossLabel"

	var_10_6:setText(Engine.CBBHFCGDIC("LUA_MENU/PACKET_LOSS"), 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_6:SetAlignment(LUI.Alignment.Left)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 248, _1080p * 410, _1080p * 135, _1080p * 153)
	var_10_0:addElement(var_10_6)

	var_10_0.lossLabel = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIText.new()

	var_10_8.id = "pingLabel"

	var_10_8:setText(Engine.CBBHFCGDIC("LUA_MENU/LATENCY"), 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 181, _1080p * 135, _1080p * 153)
	var_10_0:addElement(var_10_8)

	var_10_0.pingLabel = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIText.new()

	var_10_10.id = "lossValue"

	var_10_10:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_10_10:setText("0%", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 410, _1080p * 460, _1080p * 117, _1080p * 135)
	var_10_0:addElement(var_10_10)

	var_10_0.lossValue = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIText.new()

	var_10_12.id = "pingValue"

	var_10_12:setText("0ms", 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Left)
	var_10_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 191, _1080p * 241, _1080p * 117, _1080p * 135)
	var_10_0:addElement(var_10_12)

	var_10_0.pingValue = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "pingBar16"

	var_10_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 175, _1080p * 181, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_14)

	var_10_0.pingBar16 = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIImage.new()

	var_10_16.id = "pingBar15"

	var_10_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 165, _1080p * 171, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_16)

	var_10_0.pingBar15 = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "pingBar14"

	var_10_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 155, _1080p * 161, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_18)

	var_10_0.pingBar14 = var_10_18

	local var_10_19
	local var_10_20 = LUI.UIImage.new()

	var_10_20.id = "pingBar13"

	var_10_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 145, _1080p * 151, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_20)

	var_10_0.pingBar13 = var_10_20

	local var_10_21
	local var_10_22 = LUI.UIImage.new()

	var_10_22.id = "pingBar12"

	var_10_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 135, _1080p * 141, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_22)

	var_10_0.pingBar12 = var_10_22

	local var_10_23
	local var_10_24 = LUI.UIImage.new()

	var_10_24.id = "pingBar11"

	var_10_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 131, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_24)

	var_10_0.pingBar11 = var_10_24

	local var_10_25
	local var_10_26 = LUI.UIImage.new()

	var_10_26.id = "pingBar10"

	var_10_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 115, _1080p * 121, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_26)

	var_10_0.pingBar10 = var_10_26

	local var_10_27
	local var_10_28 = LUI.UIImage.new()

	var_10_28.id = "pingBar09"

	var_10_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 111, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_28)

	var_10_0.pingBar09 = var_10_28

	local var_10_29
	local var_10_30 = LUI.UIImage.new()

	var_10_30.id = "pingBar08"

	var_10_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 95, _1080p * 101, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_30)

	var_10_0.pingBar08 = var_10_30

	local var_10_31
	local var_10_32 = LUI.UIImage.new()

	var_10_32.id = "pingBar07"

	var_10_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 91, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_32)

	var_10_0.pingBar07 = var_10_32

	local var_10_33
	local var_10_34 = LUI.UIImage.new()

	var_10_34.id = "pingBar06"

	var_10_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 75, _1080p * 81, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_34)

	var_10_0.pingBar06 = var_10_34

	local var_10_35
	local var_10_36 = LUI.UIImage.new()

	var_10_36.id = "pingBar05"

	var_10_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 71, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_36)

	var_10_0.pingBar05 = var_10_36

	local var_10_37
	local var_10_38 = LUI.UIImage.new()

	var_10_38.id = "pingBar04"

	var_10_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 55, _1080p * 61, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_38)

	var_10_0.pingBar04 = var_10_38

	local var_10_39
	local var_10_40 = LUI.UIImage.new()

	var_10_40.id = "pingBar03"

	var_10_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 45, _1080p * 51, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_40)

	var_10_0.pingBar03 = var_10_40

	local var_10_41
	local var_10_42 = LUI.UIImage.new()

	var_10_42.id = "pingBar02"

	var_10_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 35, _1080p * 41, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_42)

	var_10_0.pingBar02 = var_10_42

	local var_10_43
	local var_10_44 = LUI.UIImage.new()

	var_10_44.id = "pingBar01"

	var_10_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 31, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_44)

	var_10_0.pingBar01 = var_10_44

	local var_10_45
	local var_10_46 = LUI.UIImage.new()

	var_10_46.id = "lossBar16"

	var_10_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 398, _1080p * 404, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_46)

	var_10_0.lossBar16 = var_10_46

	local var_10_47
	local var_10_48 = LUI.UIImage.new()

	var_10_48.id = "lossBar15"

	var_10_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 388, _1080p * 394, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_48)

	var_10_0.lossBar15 = var_10_48

	local var_10_49
	local var_10_50 = LUI.UIImage.new()

	var_10_50.id = "lossBar14"

	var_10_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 378, _1080p * 384, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_50)

	var_10_0.lossBar14 = var_10_50

	local var_10_51
	local var_10_52 = LUI.UIImage.new()

	var_10_52.id = "lossBar13"

	var_10_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 368, _1080p * 374, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_52)

	var_10_0.lossBar13 = var_10_52

	local var_10_53
	local var_10_54 = LUI.UIImage.new()

	var_10_54.id = "lossBar12"

	var_10_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 358, _1080p * 364, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_54)

	var_10_0.lossBar12 = var_10_54

	local var_10_55
	local var_10_56 = LUI.UIImage.new()

	var_10_56.id = "lossBar11"

	var_10_56:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 348, _1080p * 354, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_56)

	var_10_0.lossBar11 = var_10_56

	local var_10_57
	local var_10_58 = LUI.UIImage.new()

	var_10_58.id = "lossBar10"

	var_10_58:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 338, _1080p * 344, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_58)

	var_10_0.lossBar10 = var_10_58

	local var_10_59
	local var_10_60 = LUI.UIImage.new()

	var_10_60.id = "lossBar09"

	var_10_60:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 328, _1080p * 334, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_60)

	var_10_0.lossBar09 = var_10_60

	local var_10_61
	local var_10_62 = LUI.UIImage.new()

	var_10_62.id = "lossBar08"

	var_10_62:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 318, _1080p * 324, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_62)

	var_10_0.lossBar08 = var_10_62

	local var_10_63
	local var_10_64 = LUI.UIImage.new()

	var_10_64.id = "lossBar07"

	var_10_64:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 314, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_64)

	var_10_0.lossBar07 = var_10_64

	local var_10_65
	local var_10_66 = LUI.UIImage.new()

	var_10_66.id = "lossBar06"

	var_10_66:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 298, _1080p * 304, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_66)

	var_10_0.lossBar06 = var_10_66

	local var_10_67
	local var_10_68 = LUI.UIImage.new()

	var_10_68.id = "lossBar05"

	var_10_68:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 288, _1080p * 294, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_68)

	var_10_0.lossBar05 = var_10_68

	local var_10_69
	local var_10_70 = LUI.UIImage.new()

	var_10_70.id = "lossBar04"

	var_10_70:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 278, _1080p * 284, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_70)

	var_10_0.lossBar04 = var_10_70

	local var_10_71
	local var_10_72 = LUI.UIImage.new()

	var_10_72.id = "lossBar03"

	var_10_72:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 268, _1080p * 274, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_72)

	var_10_0.lossBar03 = var_10_72

	local var_10_73
	local var_10_74 = LUI.UIImage.new()

	var_10_74.id = "lossBar02"

	var_10_74:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 258, _1080p * 264, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_74)

	var_10_0.lossBar02 = var_10_74

	local var_10_75
	local var_10_76 = LUI.UIImage.new()

	var_10_76.id = "lossBar01"

	var_10_76:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 248, _1080p * 254, _1080p * 49, _1080p * 129)
	var_10_0:addElement(var_10_76)

	var_10_0.lossBar01 = var_10_76

	local var_10_77
	local var_10_78 = LUI.UIText.new()

	var_10_78.id = "WarningLabel"

	var_10_78:setText(Engine.CBBHFCGDIC("LUA_MENU/CONNECTION_WARNING"), 0)
	var_10_78:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_78:SetAlignment(LUI.Alignment.Left)
	var_10_78:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 460, _1080p * 20, _1080p * 38)
	var_10_0:addElement(var_10_78)

	var_10_0.WarningLabel = var_10_78

	PostLoadFunc(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("ConnectionMeter", ConnectionMeter)
LockTable(_M)
