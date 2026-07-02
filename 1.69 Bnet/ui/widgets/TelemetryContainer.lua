module(..., package.seeall)

local var_0_0 = {
	packetLoss = "100 %",
	gpuTemp = "999°",
	gpuTime = "8888 ms",
	fps = "8888",
	cpuTime = "8888 ms",
	latency = "8888 ms",
	sound = Engine.CBBHFCGDIC("LUA_MENU/ENABLED"),
	voiceChat = Engine.CBBHFCGDIC("LUA_MENU/ENABLED")
}
local var_0_1 = {
	red = SWATCHES.HUD.enemyTeam,
	default = SWATCHES.genericMenu.mainTitle
}
local var_0_2 = 85
local var_0_3 = 166
local var_0_4 = 5
local var_0_5 = 20
local var_0_6 = Dvar.CFHDGABACF("NRPMSPLMLS")
local var_0_7 = Dvar.CFHDGABACF("OMTMKKMKOQ")

local function var_0_8(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0:GetCurrentFont()
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0:getLocalRect()
	local var_1_5 = math.abs(var_1_4 - var_1_2)
	local var_1_6, var_1_7, var_1_8, var_1_9 = GetTextDimensions(arg_1_1, var_1_0, var_1_5)
	local var_1_10 = var_1_9
	local var_1_11 = var_1_8
	local var_1_12 = var_1_7

	return var_1_11 - var_1_6
end

local function var_0_9(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1.TelemetryLayout.Spacer1)

	local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_1.TelemetryLayout.Spacer1:getLocalRect()
	local var_2_4 = (var_2_2 - var_2_0) * 3
	local var_2_5 = arg_2_1.TelemetryLayout.Name
	local var_2_6 = var_0_8(var_2_5, var_2_5:getText())
	local var_2_7 = arg_2_1.TelemetryLayout.Info
	local var_2_8 = var_0_8(var_2_7, arg_2_2)
	local var_2_9 = var_2_0
	local var_2_10 = var_2_9 + var_2_6 + var_2_8 + var_2_4

	arg_2_1:SetLeft(var_2_9)
	arg_2_1.Background:SetLeft(var_2_9)
	arg_2_1:SetRight(var_2_10)
	arg_2_1.Background:SetRight(var_2_10)
	LAYOUT.ResetElementAnchorAndPosition(arg_2_0)
end

local function var_0_10(arg_3_0, arg_3_1, arg_3_2)
	arg_3_1:SetAlpha(arg_3_2)
	LAYOUT.ResetElementAnchorAndPosition(arg_3_0)
end

local function var_0_11(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:SetIgnoreInvisibleChildren(true)

	arg_4_0.SetVisibility = var_0_10
	arg_4_0.SetWidgetSize = var_0_9

	local var_4_0 = Engine.BECCFCBIAA("displayTelemetryTime", arg_4_1)
	local var_4_1 = Engine.BECCFCBIAA("displayTelemetryFPS", arg_4_1)
	local var_4_2 = not CONDITIONS.IsSingleplayer() and Engine.BECCFCBIAA("displayTelemetryLatency", arg_4_1)
	local var_4_3 = Engine.BECCFCBIAA("displayTelemetryGpuTemperature", arg_4_1)
	local var_4_4 = Engine.BECCFCBIAA("displayTelemetryGpuTime", arg_4_1)
	local var_4_5 = Engine.BECCFCBIAA("displayTelemetryCpuTime", arg_4_1)
	local var_4_6 = Engine.BECCFCBIAA("showSoundMuted", arg_4_1)
	local var_4_7 = Engine.BECCFCBIAA("showVoiceChatMuted", arg_4_1)
	local var_4_8 = Engine.BECCFCBIAA("displayTelemetryPacketLoss", arg_4_1) == 1

	local function var_4_9(arg_5_0)
		if var_4_1 == true then
			local var_5_0 = DataModel.JJEHAEBDF(arg_5_0)

			if var_5_0 then
				arg_4_0.Fps.TelemetryLayout.Info:setText(var_5_0)

				if var_5_0 < var_0_5 then
					arg_4_0.Fps.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.Fps.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.Fps, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.Fps, 0)
		end
	end

	local function var_4_10(arg_6_0)
		if var_4_2 == true then
			local var_6_0 = DataModel.JJEHAEBDF(arg_6_0)

			arg_4_0.Latency.TelemetryLayout.Unit:SetRGBFromTable(var_0_1.default, 0)

			if var_6_0 and var_6_0 >= 0 then
				arg_4_0.Latency.TelemetryLayout.Unit:setText(Engine.CBBHFCGDIC("LUA_MENU/MS"))
				arg_4_0.Latency.TelemetryLayout.Info:setText(var_6_0)

				if Engine.BFJBEHGGCH() == true then
					if var_6_0 > var_0_7 then
						arg_4_0.Latency.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
						arg_4_0.Latency.TelemetryLayout.Unit:SetRGBFromTable(var_0_1.red, 0)
					else
						arg_4_0.Latency.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
						arg_4_0.Latency.TelemetryLayout.Unit:SetRGBFromTable(var_0_1.default, 0)
					end
				elseif var_6_0 > var_0_6 then
					arg_4_0.Latency.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
					arg_4_0.Latency.TelemetryLayout.Unit:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.Latency.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
					arg_4_0.Latency.TelemetryLayout.Unit:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.Latency, 1)
			else
				arg_4_0.Latency.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				arg_4_0:SetVisibility(arg_4_0.Latency, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.Latency, 0)
		end
	end

	local function var_4_11(arg_7_0)
		if var_4_3 == true then
			local var_7_0 = DataModel.JJEHAEBDF(arg_7_0)

			if var_7_0 and var_7_0 > 0 then
				local var_7_1 = LUI.Round(var_7_0, 0)

				arg_4_0.GpuTemp.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("HUD/DEGREES", var_7_1))

				if var_7_1 > var_0_2 then
					arg_4_0.GpuTemp.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.GpuTemp.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.GpuTemp, 1)
			else
				arg_4_0.GpuTemp.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/N_A"))
				arg_4_0.GpuTemp.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				arg_4_0:SetVisibility(arg_4_0.GpuTemp, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.GpuTemp, 0)
		end
	end

	local function var_4_12(arg_8_0)
		if var_4_4 == true then
			local var_8_0 = DataModel.JJEHAEBDF(arg_8_0)

			if var_8_0 then
				local var_8_1 = LUI.Round(var_8_0, 0)

				arg_4_0.GpuTime.TelemetryLayout.Info:setText(var_8_1)

				if var_8_1 > var_0_3 then
					arg_4_0.GpuTime.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.GpuTime.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.GpuTime, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.GpuTime, 0)
		end
	end

	local function var_4_13(arg_9_0)
		if var_4_5 == true then
			local var_9_0 = DataModel.JJEHAEBDF(arg_9_0)

			if var_9_0 then
				local var_9_1 = LUI.Round(var_9_0, 0)

				arg_4_0.CpuTime.TelemetryLayout.Info:setText(var_9_1)

				if var_9_1 > var_0_3 then
					arg_4_0.CpuTime.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.CpuTime.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.CpuTime, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.CpuTime, 0)
		end
	end

	local function var_4_14(arg_10_0)
		local var_10_0 = DataModel.JJEHAEBDF(arg_10_0)

		if var_4_0 and var_10_0 then
			local var_10_1 = Engine.CIIGICAIFC(var_10_0)

			arg_4_0.LocalTime.TelemetryLayout.Name:setText(var_10_1)
			arg_4_0:SetVisibility(arg_4_0.LocalTime, 1)
		else
			arg_4_0:SetVisibility(arg_4_0.LocalTime, 0)
		end
	end

	local function var_4_15(arg_11_0)
		if var_4_6 == true then
			if DataModel.JJEHAEBDF(arg_11_0) then
				arg_4_0:SetVisibility(arg_4_0.Sound, 1)
			else
				arg_4_0:SetVisibility(arg_4_0.Sound, 0)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.Sound, 0)
		end
	end

	local function var_4_16(arg_12_0)
		if var_4_7 == true then
			if DataModel.JJEHAEBDF(arg_12_0) then
				arg_4_0:SetVisibility(arg_4_0.VoiceChat, 1)
			else
				arg_4_0:SetVisibility(arg_4_0.VoiceChat, 0)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.VoiceChat, 0)
		end
	end

	local function var_4_17(arg_13_0)
		if var_4_8 == true then
			local var_13_0 = DataModel.JJEHAEBDF(arg_13_0)

			if var_13_0 then
				arg_4_0.PacketLoss.TelemetryLayout.Unit:setText(Engine.CBBHFCGDIC("LUA_MENU/LOSS_PERCENT"))
				arg_4_0.PacketLoss.TelemetryLayout.Info:setText(var_13_0)

				if var_13_0 > var_0_4 then
					arg_4_0.PacketLoss.TelemetryLayout.Info:SetRGBFromTable(var_0_1.red, 0)
				else
					arg_4_0.PacketLoss.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				end

				arg_4_0:SetVisibility(arg_4_0.PacketLoss, 1)
			else
				arg_4_0.PacketLoss.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/N_A"))
				arg_4_0.PacketLoss.TelemetryLayout.Unit:setText("")
				arg_4_0.PacketLoss.TelemetryLayout.Info:SetRGBFromTable(var_0_1.default, 0)
				arg_4_0:SetVisibility(arg_4_0.PacketLoss, 1)
			end
		else
			arg_4_0:SetVisibility(arg_4_0.PacketLoss, 0)
		end
	end

	local var_4_18 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.Time")

	if var_4_18 then
		arg_4_0:SubscribeToModel(var_4_18:GetModel(arg_4_1), var_4_14)
	end

	local var_4_19 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.FPS")

	if var_4_19 then
		arg_4_0:SubscribeToModel(var_4_19:GetModel(arg_4_1), var_4_9)
	end

	local var_4_20 = LUI.DataSourceInControllerModel.new("cg.alwaysLoaded.telemetry.Latency")

	if var_4_20 then
		arg_4_0:SubscribeToModel(var_4_20:GetModel(arg_4_1), var_4_10)
	end

	local var_4_21 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.GPU_Temperature")

	if var_4_21 then
		arg_4_0:SubscribeToModel(var_4_21:GetModel(arg_4_1), var_4_11)
	end

	local var_4_22 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.GPU_Time")

	if var_4_22 then
		arg_4_0:SubscribeToModel(var_4_22:GetModel(arg_4_1), var_4_12)
	end

	local var_4_23 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.CPU_Time")

	if var_4_23 then
		arg_4_0:SubscribeToModel(var_4_23:GetModel(arg_4_1), var_4_13)
	end

	local var_4_24 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.volume_mute")

	if var_4_24 then
		arg_4_0:SubscribeToModel(var_4_24:GetModel(arg_4_1), var_4_15)
	end

	local var_4_25 = LUI.DataSourceInGlobalModel.new("cg.alwaysLoaded.telemetry.voice_mute")

	if var_4_25 then
		arg_4_0:SubscribeToModel(var_4_25:GetModel(arg_4_1), var_4_16)
	end

	local var_4_26 = LUI.DataSourceInGlobalModel.new("netstats.NETSTATS_PACKETLOSS")

	if var_4_26 then
		arg_4_0:SubscribeToModel(var_4_26:GetModel(arg_4_1), var_4_17)
	end

	arg_4_0:registerEventHandler("update_telemetry", function(arg_14_0, arg_14_1)
		if arg_14_1.id == "localTime" then
			var_4_0 = arg_14_1.value == 1

			var_4_14(var_4_18:GetModel(arg_4_1))
		elseif arg_14_1.id == "fps" then
			var_4_1 = arg_14_1.value == 1

			var_4_9(var_4_19:GetModel(arg_4_1))
		elseif arg_14_1.id == "latency" then
			var_4_2 = arg_14_1.value == 1

			var_4_10(var_4_20:GetModel(arg_4_1))
		elseif arg_14_1.id == "gpuTemp" then
			var_4_3 = arg_14_1.value == 1

			var_4_11(var_4_21:GetModel(arg_4_1))
		elseif arg_14_1.id == "gpuTime" then
			var_4_4 = arg_14_1.value == 1

			var_4_12(var_4_22:GetModel(arg_4_1))
		elseif arg_14_1.id == "cpuTime" then
			var_4_5 = arg_14_1.value == 1

			var_4_13(var_4_23:GetModel(arg_4_1))
		elseif arg_14_1.id == "sound" then
			var_4_6 = arg_14_1.value == 1

			var_4_15(var_4_24:GetModel(arg_4_1))
		elseif arg_14_1.id == "voiceChat" then
			var_4_7 = arg_14_1.value == 1

			var_4_16(var_4_25:GetModel(arg_4_1))
		elseif arg_14_1.id == "packetLoss" then
			var_4_8 = arg_14_1.value == 1

			var_4_17(var_4_26:GetModel(arg_4_1))
		end
	end)
	arg_4_0:addEventHandler("gamerprofile_settings_initialized", function(arg_15_0, arg_15_1)
		var_4_0 = Engine.BECCFCBIAA("displayTelemetryTime", arg_4_1)
		var_4_1 = Engine.BECCFCBIAA("displayTelemetryFPS", arg_4_1)
		var_4_2 = Engine.BECCFCBIAA("displayTelemetryLatency", arg_4_1)
		var_4_3 = Engine.BECCFCBIAA("displayTelemetryGpuTemperature", arg_4_1)
		var_4_4 = Engine.BECCFCBIAA("displayTelemetryGpuTime", arg_4_1)
		var_4_5 = Engine.BECCFCBIAA("displayTelemetryCpuTime", arg_4_1)
		var_4_6 = Engine.BECCFCBIAA("showSoundMuted", arg_4_1)
		var_4_7 = Engine.BECCFCBIAA("showVoiceChatMuted", arg_4_1)
		var_4_8 = Engine.BECCFCBIAA("displayTelemetryPacketLoss", arg_4_1) == 1

		var_4_9(var_4_19:GetModel(arg_4_1))
		var_4_10(var_4_20:GetModel(arg_4_1))
		var_4_11(var_4_21:GetModel(arg_4_1))
		var_4_12(var_4_22:GetModel(arg_4_1))
		var_4_13(var_4_23:GetModel(arg_4_1))
		var_4_15(var_4_24:GetModel(arg_4_1))
		var_4_16(var_4_25:GetModel(arg_4_1))
		var_4_17(var_4_26:GetModel(arg_4_1))
	end)
	arg_4_0:SetWidgetSize(arg_4_0.Fps, var_0_0.fps)
	arg_4_0:SetWidgetSize(arg_4_0.Latency, var_0_0.latency)
	arg_4_0:SetWidgetSize(arg_4_0.GpuTemp, var_0_0.gpuTemp)
	arg_4_0:SetWidgetSize(arg_4_0.GpuTime, var_0_0.gpuTime)
	arg_4_0:SetWidgetSize(arg_4_0.CpuTime, var_0_0.cpuTime)
	arg_4_0:SetWidgetSize(arg_4_0.Sound, var_0_0.sound)
	arg_4_0:SetWidgetSize(arg_4_0.VoiceChat, var_0_0.voiceChat)
	arg_4_0:SetWidgetSize(arg_4_0.PacketLoss, var_0_0.packetLoss)
end

function TelemetryContainer(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIHorizontalStackedLayout.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 25 * _1080p)

	var_16_0.id = "TelemetryContainer"

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0

	var_16_0:SetSpacing(5 * _1080p)

	local var_16_3
	local var_16_4 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_4.id = "Fps"

	var_16_4.Background:SetLeft(0, 0)
	var_16_4.Background:SetRight(_1080p * 192, 0)
	var_16_4.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_FPS"), 0)
	var_16_4.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_4.TelemetryLayout.Info:setText("", 0)
	var_16_4.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_4.TelemetryLayout.Unit:setText("", 0)
	var_16_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 192, 0, _1080p * 24)
	var_16_0:addElement(var_16_4)

	var_16_0.Fps = var_16_4

	local var_16_5
	local var_16_6 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_6.id = "Latency"

	var_16_6.Background:SetLeft(0, 0)
	var_16_6.Background:SetRight(_1080p * 192, 0)
	var_16_6.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_LATENCY"), 0)
	var_16_6.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_6.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/N_A"), 0)
	var_16_6.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_6.TelemetryLayout.Unit:setText("", 0)
	var_16_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 389, 0, _1080p * 25)
	var_16_0:addElement(var_16_6)

	var_16_0.Latency = var_16_6

	local var_16_7
	local var_16_8 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_8.id = "GpuTemp"

	var_16_8.Background:SetLeft(0, 0)
	var_16_8.Background:SetRight(_1080p * 192, 0)
	var_16_8.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_GPU_TEMPERATURE"), 0)
	var_16_8.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_8.TelemetryLayout.Info:setText("", 0)
	var_16_8.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_8.TelemetryLayout.Unit:setText("", 0)
	var_16_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 394, _1080p * 586, 0, _1080p * 25)
	var_16_0:addElement(var_16_8)

	var_16_0.GpuTemp = var_16_8

	local var_16_9
	local var_16_10 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_10.id = "GpuTime"

	var_16_10.Background:SetLeft(0, 0)
	var_16_10.Background:SetRight(_1080p * 192, 0)
	var_16_10.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_GPU_TIME"), 0)
	var_16_10.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_10.TelemetryLayout.Info:setText("", 0)
	var_16_10.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_10.TelemetryLayout.Unit:setText(Engine.CBBHFCGDIC("LUA_MENU/MS"), 0)
	var_16_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 591, _1080p * 783, 0, _1080p * 24)
	var_16_0:addElement(var_16_10)

	var_16_0.GpuTime = var_16_10

	local var_16_11
	local var_16_12 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_12.id = "CpuTime"

	var_16_12.Background:SetLeft(0, 0)
	var_16_12.Background:SetRight(_1080p * 192, 0)
	var_16_12.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_CPU_TIME_NAME"), 0)
	var_16_12.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_12.TelemetryLayout.Info:setText("", 0)
	var_16_12.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_12.TelemetryLayout.Unit:setText(Engine.CBBHFCGDIC("LUA_MENU/MS"), 0)
	var_16_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 788, _1080p * 980, 0, _1080p * 25)
	var_16_0:addElement(var_16_12)

	var_16_0.CpuTime = var_16_12

	local var_16_13
	local var_16_14 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_14.id = "Sound"

	var_16_14.Background:SetLeft(0, 0)
	var_16_14.Background:SetRight(_1080p * 192, 0)
	var_16_14.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_SOUND_NAME"), 0)
	var_16_14.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_14.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/ENABLED"), 0)
	var_16_14.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_14.TelemetryLayout.Unit:setText("", 0)
	var_16_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 985, _1080p * 1177, 0, _1080p * 25)
	var_16_0:addElement(var_16_14)

	var_16_0.Sound = var_16_14

	local var_16_15
	local var_16_16 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_16.id = "VoiceChat"

	var_16_16.Background:SetLeft(0, 0)
	var_16_16.Background:SetRight(_1080p * 192, 0)
	var_16_16.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/TELEMETRY_VOICE_CHAT_NAME"), 0)
	var_16_16.TelemetryLayout.Info:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_16.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/ENABLED"), 0)
	var_16_16.TelemetryLayout.Unit:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_16_16.TelemetryLayout.Unit:setText("", 0)
	var_16_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1182, _1080p * 1374, 0, _1080p * 25)
	var_16_0:addElement(var_16_16)

	var_16_0.VoiceChat = var_16_16

	local var_16_17
	local var_16_18 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_18.id = "PacketLoss"

	var_16_18.Background:SetLeft(0, 0)
	var_16_18.Background:SetRight(_1080p * 192, 0)
	var_16_18.TelemetryLayout.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/PACKET_LOSS"), 0)
	var_16_18.TelemetryLayout.Info:setText(Engine.CBBHFCGDIC("LUA_MENU/N_A"), 0)
	var_16_18.TelemetryLayout.Unit:setText("", 0)
	var_16_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1379, _1080p * 1569, 0, _1080p * 25)
	var_16_0:addElement(var_16_18)

	var_16_0.PacketLoss = var_16_18

	local var_16_19
	local var_16_20 = MenuBuilder.BuildRegisteredType("TelemetryWidget", {
		controllerIndex = var_16_1
	})

	var_16_20.id = "LocalTime"

	var_16_20.Background:SetLeft(0, 0)
	var_16_20.Background:SetRight(_1080p * 60, 0)
	var_16_20.TelemetryLayout.Name:setText("", 0)
	var_16_20.TelemetryLayout.Info:setText("", 0)
	var_16_20.TelemetryLayout.Unit:setText("", 0)
	var_16_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1574, _1080p * 1764, 0, _1080p * 25)
	var_16_0:addElement(var_16_20)

	var_16_0.LocalTime = var_16_20

	var_16_0:addEventHandler("anchor_on_screen", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_16_1
		end

		ACTIONS.DebugPrint(var_16_0, "Allo")
	end)
	var_0_11(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("TelemetryContainer", TelemetryContainer)
LockTable(_M)
