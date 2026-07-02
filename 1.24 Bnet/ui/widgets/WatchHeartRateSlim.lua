module(..., package.seeall)

local var_0_0 = 4000
local var_0_1 = 12000

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		arg_1_0._alternateFormat = true
	end

	ACTIONS.AnimateSequence(arg_1_0, "TimeAndDate")

	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())
		local var_2_1 = {}
		local var_2_2 = {}
		local var_2_3 = false

		for iter_2_0 = 1, #var_2_0 do
			local var_2_4 = string.sub(tostring(var_2_0), iter_2_0, iter_2_0)

			if tonumber(var_2_4) then
				if var_2_3 then
					var_2_2[#var_2_2 + 1] = var_2_4
				else
					var_2_1[#var_2_1 + 1] = var_2_4
				end
			else
				var_2_3 = true
			end
		end

		if #var_2_1 < 2 then
			var_2_1[2] = var_2_1[1]
			var_2_1[1] = "0"
		end

		arg_1_0.TimeTop:setText(var_2_1[1] .. var_2_1[2])
		arg_1_0.TimeBot:setText(var_2_2[1] .. var_2_2[2])

		local var_2_5 = Engine.BADEEDFGHB(Engine.DCJHCAFIIA())
		local var_2_6 = {}
		local var_2_7 = {}
		local var_2_8 = false
		local var_2_9 = 0

		for iter_2_1 = 1, #var_2_5 do
			local var_2_10 = string.sub(tostring(var_2_5), iter_2_1, iter_2_1)

			if arg_1_0._alternateFormat then
				if tonumber(var_2_10) then
					if var_2_8 and var_2_9 == 2 then
						var_2_7[#var_2_7 + 1] = var_2_10
					elseif var_2_9 == 1 then
						var_2_6[#var_2_6 + 1] = var_2_10
					end
				else
					var_2_8 = true
					var_2_9 = var_2_9 + 1
				end
			elseif tonumber(var_2_10) then
				if var_2_8 then
					var_2_7[#var_2_7 + 1] = var_2_10
				else
					var_2_6[#var_2_6 + 1] = var_2_10
				end
			elseif var_2_8 then
				break
			else
				var_2_8 = true
			end
		end

		local function var_2_11(arg_3_0)
			local var_3_0 = ""

			for iter_3_0 = 1, #arg_3_0 do
				var_3_0 = var_3_0 .. arg_3_0[iter_3_0]
			end

			return var_3_0
		end

		arg_1_0.DateLabel:setText(Engine.CBBHFCGDIC("HUD/Fraction", var_2_11(var_2_6), var_2_11(var_2_7)))

		local var_2_12 = Engine.EBCIHGAFBB(Engine.DCJHCAFIIA())

		arg_1_0.Day:setText(var_2_12)

		arg_1_0:Wait(var_0_1).onComplete = var_1_1
	end

	var_1_1()

	local var_1_2 = {
		"WATCHES/STEPS_QUIP_1",
		"WATCHES/STEPS_QUIP_2",
		"WATCHES/STEPS_QUIP_3"
	}
	local var_1_3 = {
		"WATCHES/CALS_QUIP_1",
		"WATCHES/CALS_QUIP_2",
		"WATCHES/CALS_QUIP_3"
	}
	local var_1_4 = 0.05

	if not Engine.DDJFBBJAIG() then
		local function var_1_5()
			var_1_4 = DataSources.inGame.player.isSprinting:GetValue(arg_1_1) and 0.08 or 0.05
		end

		arg_1_0:SubscribeToModel(DataSources.inGame.player.isSprinting:GetModel(arg_1_1), var_1_5)

		local var_1_6 = LUI.DataSourceInControllerModel.new("cg.player.footstepCount")

		arg_1_0:SubscribeToModel(var_1_6:GetModel(arg_1_1), function(arg_5_0)
			local var_5_0 = DataModel.JJEHAEBDF(arg_5_0)
			local var_5_1 = math.floor(var_5_0 * var_1_4)

			if var_5_0 ~= nil then
				if var_5_0 >= 1000 then
					local var_5_2 = Engine.CBBHFCGDIC("WATCHES/THOUSAND_ABBREVIATION", LUI.Round(var_5_0 / 1000, 1))

					arg_1_0.StepCount:setText(var_5_2)
				else
					arg_1_0.StepCount:setText(var_5_0)
				end
			end

			if var_5_1 ~= nil then
				if var_5_1 >= 1000 then
					local var_5_3 = Engine.CBBHFCGDIC("WATCHES/THOUSAND_ABBREVIATION", LUI.Round(var_5_1 / 1000, 1))

					arg_1_0.CalsCount:setText(var_5_3)
				else
					arg_1_0.CalsCount:setText(var_5_1)
				end
			end
		end)
	else
		local var_1_7 = 0

		if var_1_7 >= 1000 then
			local var_1_8 = Engine.CBBHFCGDIC("WATCHES/THOUSAND_ABBREVIATION", LUI.Round(var_1_7 / 1000, 1))

			arg_1_0.StepCount:setText(var_1_8)
		else
			arg_1_0.StepCount:setText(var_1_7)
		end

		local var_1_9 = 0 * var_1_4

		if var_1_9 >= 1000 then
			local var_1_10 = Engine.CBBHFCGDIC("WATCHES/THOUSAND_ABBREVIATION", LUI.Round(var_1_7 / 1000, 1))

			arg_1_0.CalsCount:setText(var_1_10)
		else
			arg_1_0.CalsCount:setText(var_1_9)
		end
	end

	local function var_1_11(arg_6_0)
		local var_6_0 = ""
		local var_6_1 = 0
		local var_6_2

		if arg_6_0 == "StepsTaken" then
			var_6_1 = 1
			var_6_0 = not Engine.DDJFBBJAIG() and var_1_2[math.random(1, #var_1_2)] or "WATCHES/STEPS_INACTIVE"
			var_6_2 = arg_1_0.Quip:Wait(10000, true)

			ACTIONS.AnimateSequence(arg_1_0, "ScrollQuip")
		elseif arg_6_0 == "CalsBurned" then
			var_6_1 = 1
			var_6_0 = not Engine.DDJFBBJAIG() and var_1_3[math.random(1, #var_1_3)] or "WATCHES/CALS_INACTIVE"
			var_6_2 = arg_1_0.Quip:Wait(10000, true)

			ACTIONS.AnimateSequence(arg_1_0, "ScrollQuip")
		end

		if var_6_2 then
			function var_6_2.onComplete()
				arg_1_0.Quip:SetAlpha(0, 100)
			end
		end

		local var_6_3 = (arg_6_0 == "StepsTaken" or arg_6_0 == "CalsBurned") and 200 or 0

		arg_1_0.Quip:SetAlpha(var_6_1, var_6_3)
		arg_1_0.Quip:setText(Engine.CBBHFCGDIC(var_6_0))
	end

	local var_1_12 = 1
	local var_1_13 = 1
	local var_1_14 = {
		"TimeAndDate",
		"StepsTaken",
		"CalsBurned"
	}

	local function var_1_15()
		if var_1_12 == #var_1_14 then
			var_1_13 = 1
		else
			var_1_13 = var_1_12 + 1
		end

		ACTIONS.AnimateSequence(arg_1_0, var_1_14[var_1_13])

		var_1_12 = var_1_13

		var_1_11(var_1_14[var_1_13])
	end

	if Engine.DDJFBBJAIG() then
		local var_1_16

		local function var_1_17()
			arg_1_0:Wait(8000).onComplete = function()
				var_1_15()
				var_1_17()
			end
		end

		var_1_17()
	else
		local var_1_18 = LUI.DataSourceFromOmnvar.new("ui_smart_watch_interact")

		arg_1_0:SubscribeToModel(var_1_18:GetModel(arg_1_1), var_1_15, true)
	end
end

function WatchHeartRateSlim(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_11_0.id = "WatchHeartRateSlim"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "Background"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.Background = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIText.new()

	var_11_6.id = "StepCount"

	var_11_6:SetAlpha(0, 0)
	var_11_6:SetPixelGridEnabled(true)
	var_11_6:SetPixelGridContrast(0.8, 0)
	var_11_6:SetPixelGridBlockWidth(1, 0)
	var_11_6:SetPixelGridBlockHeight(1, 0)
	var_11_6:SetPixelGridGutterWidth(1, 0)
	var_11_6:SetPixelGridGutterHeight(1, 0)
	var_11_6:setText("", 0)
	var_11_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_6:SetAlignment(LUI.Alignment.Center)
	var_11_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 12, _1080p * 82)
	var_11_0:addElement(var_11_6)

	var_11_0.StepCount = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIStyledText.new()

	var_11_8.id = "TimeTop"

	var_11_8:SetPixelGridEnabled(true)
	var_11_8:SetPixelGridContrast(0.8, 0)
	var_11_8:SetPixelGridBlockWidth(1, 0)
	var_11_8:SetPixelGridBlockHeight(1, 0)
	var_11_8:SetPixelGridGutterWidth(1, 0)
	var_11_8:SetPixelGridGutterHeight(1, 0)
	var_11_8:setText("10", 0)
	var_11_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_11_8:SetAlignment(LUI.Alignment.Center)
	var_11_8:SetOutlineRGBFromInt(16579836, 0)
	var_11_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -153, _1080p * -25)
	var_11_0:addElement(var_11_8)

	var_11_0.TimeTop = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIStyledText.new()

	var_11_10.id = "TimeBot"

	var_11_10:SetPixelGridEnabled(true)
	var_11_10:SetPixelGridContrast(0.8, 0)
	var_11_10:SetPixelGridBlockWidth(1, 0)
	var_11_10:SetPixelGridBlockHeight(1, 0)
	var_11_10:SetPixelGridGutterWidth(1, 0)
	var_11_10:SetPixelGridGutterHeight(1, 0)
	var_11_10:setText("47", 0)
	var_11_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_10:SetAlignment(LUI.Alignment.Center)
	var_11_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -64, _1080p * 56)
	var_11_0:addElement(var_11_10)

	var_11_0.TimeBot = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIStyledText.new()

	var_11_12.id = "Day"

	var_11_12:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_11_12:SetPixelGridEnabled(true)
	var_11_12:SetPixelGridContrast(0.8, 0)
	var_11_12:SetPixelGridBlockWidth(1, 0)
	var_11_12:SetPixelGridBlockHeight(1, 0)
	var_11_12:SetPixelGridGutterWidth(1, 0)
	var_11_12:SetPixelGridGutterHeight(1, 0)
	var_11_12:setText("Friday", 0)
	var_11_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_12:SetAlignment(LUI.Alignment.Center)
	var_11_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * 64, _1080p * 100)
	var_11_0:addElement(var_11_12)

	var_11_0.Day = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIStyledText.new()

	var_11_14.id = "DateLabel"

	var_11_14:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_11_14:SetPixelGridEnabled(true)
	var_11_14:SetPixelGridContrast(0.8, 0)
	var_11_14:SetPixelGridBlockWidth(1, 0)
	var_11_14:SetPixelGridBlockHeight(1, 0)
	var_11_14:SetPixelGridGutterWidth(1, 0)
	var_11_14:SetPixelGridGutterHeight(1, 0)
	var_11_14:setText("", 0)
	var_11_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_14:SetAlignment(LUI.Alignment.Center)
	var_11_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -377, _1080p * 377, _1080p * 100, _1080p * 136)
	var_11_0:addElement(var_11_14)

	var_11_0.DateLabel = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIText.new()

	var_11_16.id = "StepsLabel"

	var_11_16:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_11_16:SetAlpha(0, 0)
	var_11_16:SetPixelGridEnabled(true)
	var_11_16:SetPixelGridContrast(0.8, 0)
	var_11_16:SetPixelGridBlockWidth(1, 0)
	var_11_16:SetPixelGridBlockHeight(1, 0)
	var_11_16:SetPixelGridGutterWidth(1, 0)
	var_11_16:SetPixelGridGutterHeight(1, 0)
	var_11_16:setText(Engine.CBBHFCGDIC("WATCHES/STEPS_TAKEN"), 0)
	var_11_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_16:SetAlignment(LUI.Alignment.Center)
	var_11_16:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_11_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -112, _1080p * 112, _1080p * -47, _1080p * -11)
	var_11_0:addElement(var_11_16)

	var_11_0.StepsLabel = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIText.new()

	var_11_18.id = "CalsCount"

	var_11_18:SetAlpha(0, 0)
	var_11_18:SetPixelGridEnabled(true)
	var_11_18:SetPixelGridContrast(0.8, 0)
	var_11_18:SetPixelGridBlockWidth(1, 0)
	var_11_18:SetPixelGridBlockHeight(1, 0)
	var_11_18:SetPixelGridGutterWidth(1, 0)
	var_11_18:SetPixelGridGutterHeight(1, 0)
	var_11_18:setText("", 0)
	var_11_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_11_18:SetAlignment(LUI.Alignment.Center)
	var_11_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * 12, _1080p * 82)
	var_11_0:addElement(var_11_18)

	var_11_0.CalsCount = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIText.new()

	var_11_20.id = "CalsLabel"

	var_11_20:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_11_20:SetAlpha(0, 0)
	var_11_20:SetPixelGridEnabled(true)
	var_11_20:SetPixelGridContrast(0.8, 0)
	var_11_20:SetPixelGridBlockWidth(1, 0)
	var_11_20:SetPixelGridBlockHeight(1, 0)
	var_11_20:SetPixelGridGutterWidth(1, 0)
	var_11_20:SetPixelGridGutterHeight(1, 0)
	var_11_20:setText(Engine.CBBHFCGDIC("WATCHES/CALS_BURNED"), 0)
	var_11_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_20:SetAlignment(LUI.Alignment.Center)
	var_11_20:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_11_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -112, _1080p * 112, _1080p * -47, _1080p * -11)
	var_11_0:addElement(var_11_20)

	var_11_0.CalsLabel = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIText.new()

	var_11_22.id = "Quip"

	var_11_22:SetRGBFromTable(SWATCHES.HUD.accent, 0)
	var_11_22:SetAlpha(0, 0)
	var_11_22:SetPixelGridEnabled(true)
	var_11_22:SetPixelGridContrast(0.8, 0)
	var_11_22:SetPixelGridBlockWidth(1, 0)
	var_11_22:SetPixelGridBlockHeight(1, 0)
	var_11_22:SetPixelGridGutterWidth(1, 0)
	var_11_22:SetPixelGridGutterHeight(1, 0)
	var_11_22:setText("", 0)
	var_11_22:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_11_22:SetWordWrap(false)
	var_11_22:SetAlignment(LUI.Alignment.Left)
	var_11_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * 87, _1080p * 147)
	var_11_0:addElement(var_11_22)

	var_11_0.Quip = var_11_22

	local function var_11_23()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_23

	local function var_11_24()
		return
	end

	var_11_0._sequences.BeatNormal = var_11_24

	local function var_11_25()
		return
	end

	var_11_0._sequences.BeatFast = var_11_25

	local var_11_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("TimeAndDate", var_11_26)

	local var_11_27 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("TimeAndDate", var_11_27)

	local var_11_28 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("TimeAndDate", var_11_28)

	local var_11_29 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("TimeAndDate", var_11_29)

	local var_11_30 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("TimeAndDate", var_11_30)

	local var_11_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("TimeAndDate", var_11_31)

	local var_11_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("TimeAndDate", var_11_32)

	local var_11_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("TimeAndDate", var_11_33)

	local var_11_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_22:RegisterAnimationSequence("TimeAndDate", var_11_34)

	local function var_11_35()
		var_11_6:AnimateSequence("TimeAndDate")
		var_11_8:AnimateSequence("TimeAndDate")
		var_11_10:AnimateSequence("TimeAndDate")
		var_11_12:AnimateSequence("TimeAndDate")
		var_11_14:AnimateSequence("TimeAndDate")
		var_11_16:AnimateSequence("TimeAndDate")
		var_11_18:AnimateSequence("TimeAndDate")
		var_11_20:AnimateSequence("TimeAndDate")
		var_11_22:AnimateSequence("TimeAndDate")
	end

	var_11_0._sequences.TimeAndDate = var_11_35

	local var_11_36 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("StepsTaken", var_11_36)

	local var_11_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("StepsTaken", var_11_37)

	local var_11_38 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("StepsTaken", var_11_38)

	local var_11_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("StepsTaken", var_11_39)

	local var_11_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("StepsTaken", var_11_40)

	local var_11_41 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("StepsTaken", var_11_41)

	local var_11_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("StepsTaken", var_11_42)

	local var_11_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("StepsTaken", var_11_43)

	local function var_11_44()
		var_11_6:AnimateSequence("StepsTaken")
		var_11_8:AnimateSequence("StepsTaken")
		var_11_10:AnimateSequence("StepsTaken")
		var_11_12:AnimateSequence("StepsTaken")
		var_11_14:AnimateSequence("StepsTaken")
		var_11_16:AnimateSequence("StepsTaken")
		var_11_18:AnimateSequence("StepsTaken")
		var_11_20:AnimateSequence("StepsTaken")
	end

	var_11_0._sequences.StepsTaken = var_11_44

	local function var_11_45()
		return
	end

	var_11_0._sequences.BeatMed = var_11_45

	local function var_11_46()
		return
	end

	var_11_0._sequences.PulseFast = var_11_46

	local function var_11_47()
		return
	end

	var_11_0._sequences.PulseNormal = var_11_47

	local var_11_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("CalsBurned", var_11_48)

	local var_11_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_8:RegisterAnimationSequence("CalsBurned", var_11_49)

	local var_11_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_10:RegisterAnimationSequence("CalsBurned", var_11_50)

	local var_11_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_12:RegisterAnimationSequence("CalsBurned", var_11_51)

	local var_11_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_14:RegisterAnimationSequence("CalsBurned", var_11_52)

	local var_11_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_16:RegisterAnimationSequence("CalsBurned", var_11_53)

	local var_11_54 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_18:RegisterAnimationSequence("CalsBurned", var_11_54)

	local var_11_55 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_20:RegisterAnimationSequence("CalsBurned", var_11_55)

	local function var_11_56()
		var_11_6:AnimateSequence("CalsBurned")
		var_11_8:AnimateSequence("CalsBurned")
		var_11_10:AnimateSequence("CalsBurned")
		var_11_12:AnimateSequence("CalsBurned")
		var_11_14:AnimateSequence("CalsBurned")
		var_11_16:AnimateSequence("CalsBurned")
		var_11_18:AnimateSequence("CalsBurned")
		var_11_20:AnimateSequence("CalsBurned")
	end

	var_11_0._sequences.CalsBurned = var_11_56

	local var_11_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_6:RegisterAnimationSequence("Test", var_11_57)

	local function var_11_58()
		var_11_6:AnimateSequence("Test")
	end

	var_11_0._sequences.Test = var_11_58

	local var_11_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		},
		{
			duration = 10000,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1226
		},
		{
			duration = 10000,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1026
		}
	}

	var_11_22:RegisterAnimationSequence("ScrollQuip", var_11_59)

	local function var_11_60()
		var_11_22:AnimateSequence("ScrollQuip")
	end

	var_11_0._sequences.ScrollQuip = var_11_60

	var_0_2(var_11_0, var_11_1, arg_11_1)
	ACTIONS.AnimateSequence(var_11_0, "BeatNormal")
	ACTIONS.AnimateSequence(var_11_0, "PulseNormal")

	return var_11_0
end

MenuBuilder.registerType("WatchHeartRateSlim", WatchHeartRateSlim)
LockTable(_M)
