module(..., package.seeall)

local var_0_0 = 1.037
local var_0_1 = 250
local var_0_2 = 100
local var_0_3 = 1
local var_0_4 = 1
local var_0_5 = {
	{
		showOverflow = false,
		fillPercentage = 0,
		colorBr = SWATCHES.vram.noneBr,
		colorMp = SWATCHES.vram.noneMp
	},
	{
		showOverflow = false,
		fillPercentage = 1,
		colorBr = SWATCHES.vram.highBr,
		colorMp = SWATCHES.vram.highMp
	},
	{
		showOverflow = true,
		colorBr = SWATCHES.vram.veryHighBr,
		colorMp = SWATCHES.vram.veryHighMp,
		fillPercentage = var_0_0
	}
}
local var_0_6 = {
	{
		settingName = "Monitor"
	},
	{
		settingName = "ImageQuality"
	},
	{
		settingName = "Resolution"
	},
	{
		settingName = "DisplayMode"
	},
	{
		settingName = "CachedSpotShadows",
		default = 1
	},
	{
		settingName = "CachedSunShadows",
		default = 1
	},
	{
		settingName = "AmbientOcclusion",
		default = 1
	},
	{
		settingName = "HDR",
		default = 1
	},
	{
		settingName = "DXR",
		default = 1
	},
	{
		settingName = "ParticleQuality",
		default = 1
	},
	{
		settingName = "AntiAliasing",
		default = 1
	},
	{
		settingName = "ShadowMapResolution",
		default = 1
	},
	{
		settingName = "TextureRes",
		default = 1
	},
	{
		settingName = "ContrastAdaptiveSharpener",
		default = 1
	},
	{
		settingName = "StreamingQuality"
	}
}
local var_0_7 = {
	function(arg_1_0)
		local var_1_0 = Engine.DJDAJBFCEE(arg_1_0.Monitor - 1)
		local var_1_1 = Engine.BACCFGEDED(arg_1_0.Monitor - 1)

		return OPTIONS.CalculateViewportDimensions(100, arg_1_0.DisplayMode, var_1_0, arg_1_0.ImageQuality, var_1_1)[1]
	end,
	function(arg_2_0)
		local var_2_0 = Engine.DJDAJBFCEE(arg_2_0.Monitor - 1)
		local var_2_1 = Engine.BACCFGEDED(arg_2_0.Monitor - 1)

		return OPTIONS.CalculateViewportDimensions(100, arg_2_0.DisplayMode, var_2_0, arg_2_0.ImageQuality, var_2_1)[2]
	end,
	function(arg_3_0)
		local var_3_0 = Engine.DJDAJBFCEE(arg_3_0.Monitor - 1)
		local var_3_1 = Engine.BACCFGEDED(arg_3_0.Monitor - 1)

		return OPTIONS.CalculateViewportDimensions(arg_3_0.Resolution, arg_3_0.DisplayMode, var_3_0, arg_3_0.ImageQuality, var_3_1)[1]
	end,
	function(arg_4_0)
		local var_4_0 = Engine.DJDAJBFCEE(arg_4_0.Monitor - 1)
		local var_4_1 = Engine.BACCFGEDED(arg_4_0.Monitor - 1)

		return OPTIONS.CalculateViewportDimensions(arg_4_0.Resolution, arg_4_0.DisplayMode, var_4_0, arg_4_0.ImageQuality, var_4_1)[2]
	end,
	function(arg_5_0)
		return true
	end,
	function(arg_6_0)
		return true
	end,
	function(arg_7_0)
		return arg_7_0.CachedSpotShadows == OPTIONS.disableButtonOptions.ENABLED
	end,
	function(arg_8_0)
		return arg_8_0.CachedSunShadows == OPTIONS.disableButtonOptions.ENABLED
	end,
	function(arg_9_0)
		return false
	end,
	function(arg_10_0)
		local var_10_0 = arg_10_0.AmbientOcclusion

		return var_10_0 == 2 or var_10_0 == 4
	end,
	function(arg_11_0)
		local var_11_0 = arg_11_0.AmbientOcclusion

		return var_11_0 == 3 or var_11_0 == 4
	end,
	function(arg_12_0)
		return arg_12_0.HDR == OPTIONS.disableButtonOptions.ENABLED
	end,
	function(arg_13_0)
		return arg_13_0.DXR ~= OPTIONS.disableButtonOptions.DISABLED
	end,
	function(arg_14_0)
		return arg_14_0.ParticleQuality == OPTIONS.disableButtonOptions.ENABLED
	end,
	function(arg_15_0)
		return arg_15_0.AntiAliasing - 1
	end,
	function(arg_16_0)
		return arg_16_0.ShadowMapResolution - 1
	end,
	function(arg_17_0)
		return 0
	end,
	function(arg_18_0)
		return ({
			3,
			2,
			1,
			0
		})[arg_18_0.TextureRes]
	end,
	function(arg_19_0)
		return arg_19_0.ContrastAdaptiveSharpener + 1 == OPTIONS.disableButtonOptions.ENABLED
	end,
	function(arg_20_0)
		return arg_20_0.StreamingQuality - 1
	end
}

local function var_0_8(arg_21_0)
	local var_21_0 = 0
	local var_21_1 = 1

	for iter_21_0, iter_21_1 in pairs(var_0_5) do
		if arg_21_0 >= var_0_5[iter_21_0].fillPercentage and var_21_0 <= arg_21_0 then
			var_21_1 = iter_21_0
			var_21_0 = var_0_5[iter_21_0].fillPercentage
		end
	end

	return var_21_1
end

local function var_0_9(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6)
	arg_22_1:SetRight(arg_22_4, var_0_1, 2)
	arg_22_1:SetRGBFromTable(arg_22_5, var_0_1, 2)
	arg_22_2:SetRGBFromTable(arg_22_5, var_0_1, 2)

	if arg_22_6 then
		arg_22_3:SetAlpha(1, var_0_1, 2)
	else
		arg_22_3:SetAlpha(0, var_0_1, 2)
	end
end

local function var_0_10(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1 / arg_23_0._maxVram
	local var_23_1 = var_0_5[var_0_8(var_23_0)].showOverflow
	local var_23_2 = arg_23_0:GetRightPosition(var_23_0)
	local var_23_3 = var_23_0 <= var_0_0 and arg_23_0:GetRightPosition(var_23_0) or arg_23_0:GetRightPosition(var_0_0)
	local var_23_4 = arg_23_1 / arg_23_0._maxRecommended
	local var_23_5 = var_0_8(var_23_4)

	if arg_23_2 then
		var_0_9(arg_23_0, arg_23_0.FillBr, arg_23_0.LabelBr, arg_23_0.OptionsGraphicsSliderBarOverflowBr, var_23_3, var_0_5[var_23_5].colorBr, var_23_1)
	else
		var_0_9(arg_23_0, arg_23_0.FillMp, arg_23_0.LabelMp, arg_23_0.OptionsGraphicsSliderBarOverflowMp, var_23_3, var_0_5[var_23_5].colorMp, var_23_1)
	end
end

local function var_0_11(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(var_0_6) do
		if arg_24_0._stockedSettings[iter_24_1.settingName] == nil then
			return false
		end
	end

	return true
end

local function var_0_12(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in ipairs(var_0_7) do
		local var_25_1 = iter_25_1(arg_25_0._stockedSettings)

		table.insert(var_25_0, var_25_1)
	end

	return var_25_0
end

local function var_0_13(arg_26_0, arg_26_1)
	arg_26_0._stockedSettings = {}
	arg_26_0._stockedSettingsStates = {}

	local var_26_0 = arg_26_0:GetCurrentMenu().optionsList

	for iter_26_0, iter_26_1 in ipairs(var_0_6) do
		local var_26_1 = var_26_0[iter_26_1.settingName]

		if var_26_1 ~= nil then
			arg_26_0._stockedSettings[iter_26_1.settingName] = OPTIONS.GetOptionValueFromValueGetter(arg_26_1, var_26_1)
		else
			arg_26_0._stockedSettings[iter_26_1.settingName] = iter_26_1.default
		end

		arg_26_0._stockedSettingsStates[iter_26_1.settingName] = true
	end
end

local function var_0_14(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_1 then
		if arg_27_0._stockedSettingsStates[arg_27_1] ~= nil then
			arg_27_0._stockedSettings[arg_27_1] = arg_27_2

			return true
		else
			return false
		end
	else
		return false
	end
end

local function var_0_15(arg_28_0, arg_28_1, arg_28_2)
	arg_28_1 = arg_28_1 >= 0 and arg_28_1 or 0

	local var_28_0 = string.format("%d / %d MB", arg_28_1, arg_28_0._maxVram)

	if arg_28_2 then
		arg_28_0._currentVramBr = arg_28_1

		arg_28_0.VramInfoBr:setText(var_28_0, 0)
	else
		arg_28_0._currentVramMp = arg_28_1

		arg_28_0.VramInfoMp:setText(var_28_0, 0)
	end

	var_0_10(arg_28_0, arg_28_1, arg_28_2)
end

local function var_0_16(arg_29_0, arg_29_1)
	if var_0_11(arg_29_0) then
		local var_29_0 = var_0_12(arg_29_0)

		table.insert(var_29_0, arg_29_1)

		return Engine.CACFIACEGH(unpack(var_29_0))
	else
		return 0
	end
end

local function var_0_17(arg_30_0, arg_30_1)
	arg_30_0._maxVram = arg_30_1
end

local function var_0_18()
	return Engine.BBFCJEFFAH()
end

local function var_0_19(arg_32_0)
	arg_32_0:SetAlpha(1, var_0_2)
end

local function var_0_20(arg_33_0, arg_33_1)
	local var_33_0, var_33_1, var_33_2, var_33_3 = arg_33_0.BGBr:getLocalRect()

	if arg_33_1 == var_0_0 then
		return var_33_2
	end

	return (var_33_2 - var_33_0) * arg_33_1 / var_0_0 + var_33_0
end

local function var_0_21(arg_34_0)
	arg_34_0._maxRecommended = Engine.DBEGFBHAIH()

	local var_34_0 = arg_34_0._maxRecommended / arg_34_0._maxVram
	local var_34_1 = arg_34_0:GetRightPosition(var_34_0)

	arg_34_0.TickMarker:SetRight(var_34_1, 0)
	arg_34_0.TickMarker:SetLeft(var_34_1 - var_0_3, 0)
	arg_34_0.MaxLabel:SetLeft(var_34_1 + var_0_4, 0)
	arg_34_0.MaxLabel:SetRight(var_34_1 + var_0_4 + arg_34_0._maxLabelSize, 0)
end

local function var_0_22(arg_35_0)
	arg_35_0:SetAlpha(0, var_0_2)
end

local function var_0_23(arg_36_0)
	return arg_36_0._maxVram
end

local function var_0_24(arg_37_0)
	arg_37_0.BGBr:SetAlpha(0)
	arg_37_0.LabelBr:SetAlpha(0)
	arg_37_0.VramInfoBr:SetAlpha(0)
	arg_37_0.FillBr:SetAlpha(0)
	arg_37_0.OptionsGraphicsSliderBarOverflowBr:SetAlpha(0)
end

local function var_0_25(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.GetRightPosition = var_0_20
	arg_38_0._controllerIndex = arg_38_1

	arg_38_0:registerEventHandler("refresh_vram", function(arg_39_0, arg_39_1)
		var_0_13(arg_39_0, arg_38_1)
		var_0_17(arg_39_0, var_0_18())
		var_0_21(arg_39_0)
		var_0_15(arg_39_0, 0, true)

		if Engine.CFHBIHABCB(arg_38_0._controllerIndex) then
			var_0_15(arg_39_0, 0, false)
		end
	end)

	local var_38_0, var_38_1, var_38_2, var_38_3 = arg_38_0.MaxLabel:getLocalRect()

	arg_38_0._maxLabelSize = var_38_2 - var_38_0

	arg_38_0:registerEventHandler("update_vram", function(arg_40_0, arg_40_1)
		if var_0_23(arg_40_0) and var_0_14(arg_40_0, arg_40_1.changedSetting, arg_40_1.changedSettingValue) then
			var_0_21(arg_40_0)
			var_0_15(arg_40_0, var_0_16(arg_40_0, true), true)

			if Engine.CFHBIHABCB(arg_38_0._controllerIndex) then
				var_0_15(arg_40_0, var_0_16(arg_40_0, false), false)
			end
		end
	end)
	arg_38_0:registerEventHandler("show", function(arg_41_0, arg_41_1)
		var_0_19(arg_41_0)
	end)
	arg_38_0:registerEventHandler("hide", function(arg_42_0, arg_42_1)
		var_0_22(arg_42_0)
	end)

	function arg_38_0.isOverMaxRecommended(arg_43_0)
		if var_0_23(arg_43_0) then
			return arg_43_0._currentVramBr >= arg_43_0._maxRecommended or Engine.CFHBIHABCB(arg_43_0._controllerIndex) and arg_43_0._currentVramMp >= arg_43_0._maxRecommended
		else
			return false
		end
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_38_0, "AR")
	end

	if not Engine.CFHBIHABCB(arg_38_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_38_0, "F2P")
	end

	if CONDITIONS.IsLazeOrOutrun() then
		var_0_24(arg_38_0)
	end
end

function OptionsGraphicsSliderBar(arg_44_0, arg_44_1)
	local var_44_0 = LUI.UIElement.new()

	var_44_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 720 * _1080p, 0, 66 * _1080p)

	var_44_0.id = "OptionsGraphicsSliderBar"
	var_44_0._animationSets = var_44_0._animationSets or {}
	var_44_0._sequences = var_44_0._sequences or {}

	local var_44_1 = arg_44_1 and arg_44_1.controllerIndex

	if not var_44_1 and not Engine.DDJFBBJAIG() then
		var_44_1 = var_44_0:getRootController()
	end

	assert(var_44_1)

	local var_44_2 = var_44_0
	local var_44_3
	local var_44_4 = LUI.UIImage.new()

	var_44_4.id = "BGMp"

	var_44_4:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_44_4:SetAlpha(0.5, 0)
	var_44_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 599, _1080p * 41, _1080p * 56)
	var_44_0:addElement(var_44_4)

	var_44_0.BGMp = var_44_4

	local var_44_5
	local var_44_6 = LUI.UIImage.new()

	var_44_6.id = "BGBr"

	var_44_6:SetRGBFromTable(SWATCHES.text.overText, 0)
	var_44_6:SetAlpha(0.5, 0)
	var_44_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 599, _1080p * 25, _1080p * 40)
	var_44_0:addElement(var_44_6)

	var_44_0.BGBr = var_44_6

	local var_44_7
	local var_44_8 = LUI.UIImage.new()

	var_44_8.id = "FillMp"

	var_44_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_44_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 73, _1080p * 41, _1080p * 56)
	var_44_0:addElement(var_44_8)

	var_44_0.FillMp = var_44_8

	local var_44_9
	local var_44_10 = LUI.UIImage.new()

	var_44_10.id = "FillBr"

	var_44_10:SetRGBFromTable(SWATCHES.CAC.yellowDark, 0)
	var_44_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 73, _1080p * 25, _1080p * 40)
	var_44_0:addElement(var_44_10)

	var_44_0.FillBr = var_44_10

	local var_44_11
	local var_44_12 = LUI.UIText.new()

	var_44_12.id = "MaxLabel"

	var_44_12:setText(Engine.CBBHFCGDIC("LUA_MENU/MAX"), 0)
	var_44_12:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_44_12:SetAlignment(LUI.Alignment.Left)
	var_44_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_44_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_44_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 617, _1080p * 720, _1080p * 54, _1080p * 66)
	var_44_0:addElement(var_44_12)

	var_44_0.MaxLabel = var_44_12

	local var_44_13
	local var_44_14 = LUI.UIImage.new()

	var_44_14.id = "TickMarker"

	var_44_14:SetRGBFromTable(SWATCHES.genericMenu.socialFeedAccent, 0)
	var_44_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 578, _1080p * 579, _1080p * 25, _1080p * 66)
	var_44_0:addElement(var_44_14)

	var_44_0.TickMarker = var_44_14

	local var_44_15
	local var_44_16 = MenuBuilder.BuildRegisteredType("OptionsGraphicsSliderBarOverflow", {
		controllerIndex = var_44_1
	})

	var_44_16.id = "OptionsGraphicsSliderBarOverflowMp"

	var_44_16:SetAlpha(0, 0)
	var_44_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 599, _1080p * 614, _1080p * 41, _1080p * 56)
	var_44_0:addElement(var_44_16)

	var_44_0.OptionsGraphicsSliderBarOverflowMp = var_44_16

	local var_44_17
	local var_44_18 = MenuBuilder.BuildRegisteredType("OptionsGraphicsSliderBarOverflow", {
		controllerIndex = var_44_1
	})

	var_44_18.id = "OptionsGraphicsSliderBarOverflowBr"

	var_44_18:SetAlpha(0, 0)
	var_44_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 599, _1080p * 614, _1080p * 25, _1080p * 40)
	var_44_0:addElement(var_44_18)

	var_44_0.OptionsGraphicsSliderBarOverflowBr = var_44_18

	local var_44_19
	local var_44_20 = LUI.UIText.new()

	var_44_20.id = "Title"

	var_44_20:setText(Engine.CBBHFCGDIC("LUA_MENU/VRAM_USAGE"), 0)
	var_44_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_44_20:SetAlignment(LUI.Alignment.Left)
	var_44_20:SetOptOutRightToLeftAlignmentFlip(true)
	var_44_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 256, 0, _1080p * 17)
	var_44_0:addElement(var_44_20)

	var_44_0.Title = var_44_20

	local var_44_21
	local var_44_22 = LUI.UIText.new()

	var_44_22.id = "VramInfoMp"

	var_44_22:setText("", 0)
	var_44_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_44_22:SetAlignment(LUI.Alignment.Left)
	var_44_22:SetOptOutRightToLeftAlignmentFlip(true)
	var_44_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 614, _1080p * 720, _1080p * 41, _1080p * 54)
	var_44_0:addElement(var_44_22)

	var_44_0.VramInfoMp = var_44_22

	local var_44_23
	local var_44_24 = LUI.UIText.new()

	var_44_24.id = "VramInfoBr"

	var_44_24:setText("", 0)
	var_44_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_44_24:SetAlignment(LUI.Alignment.Left)
	var_44_24:SetOptOutRightToLeftAlignmentFlip(true)
	var_44_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 614, _1080p * 720, _1080p * 26, _1080p * 39)
	var_44_0:addElement(var_44_24)

	var_44_0.VramInfoBr = var_44_24

	local var_44_25
	local var_44_26 = LUI.UIImage.new()

	var_44_26.id = "Separator"

	var_44_26:SetRGBFromTable(SWATCHES.genericMenu.socialFeedAccent, 0)
	var_44_26:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 72, 0, _1080p * 40, _1080p * 41)
	var_44_0:addElement(var_44_26)

	var_44_0.Separator = var_44_26

	local var_44_27
	local var_44_28 = LUI.UIText.new()

	var_44_28.id = "LabelBr"

	var_44_28:setText(Engine.CBBHFCGDIC("LUA_MENU/WARZONE"), 0)
	var_44_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_44_28:SetAlignment(LUI.Alignment.Right)
	var_44_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -18, _1080p * 70, _1080p * 23, _1080p * 39)
	var_44_0:addElement(var_44_28)

	var_44_0.LabelBr = var_44_28

	local var_44_29
	local var_44_30 = LUI.UIStyledText.new()

	var_44_30.id = "LabelMp"

	var_44_30:setText(Engine.CBBHFCGDIC("MENU/MULTIPLAYER"), 0)
	var_44_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_44_30:SetWordWrap(false)
	var_44_30:SetAlignment(LUI.Alignment.Right)
	var_44_30:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_44_30:SetStartupDelay(1000)
	var_44_30:SetLineHoldTime(400)
	var_44_30:SetAnimMoveTime(1500)
	var_44_30:SetAnimMoveSpeed(1500)
	var_44_30:SetEndDelay(1000)
	var_44_30:SetCrossfadeTime(400)
	var_44_30:SetFadeInTime(300)
	var_44_30:SetFadeOutTime(300)
	var_44_30:SetMaxVisibleLines(1)
	var_44_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -18, _1080p * 70, _1080p * 41, _1080p * 57)
	var_44_0:addElement(var_44_30)

	var_44_0.LabelMp = var_44_30

	local function var_44_31()
		return
	end

	var_44_0._sequences.DefaultSequence = var_44_31

	local var_44_32
	local var_44_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_44_4:RegisterAnimationSequence("F2P", var_44_33)

	local var_44_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		}
	}

	var_44_6:RegisterAnimationSequence("F2P", var_44_34)

	local var_44_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_44_8:RegisterAnimationSequence("F2P", var_44_35)

	local var_44_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 3
		}
	}

	var_44_10:RegisterAnimationSequence("F2P", var_44_36)

	local var_44_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		}
	}

	var_44_12:RegisterAnimationSequence("F2P", var_44_37)

	local var_44_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 51
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 577
		}
	}

	var_44_14:RegisterAnimationSequence("F2P", var_44_38)

	local var_44_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 186
		}
	}

	var_44_20:RegisterAnimationSequence("F2P", var_44_39)

	local var_44_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_44_24:RegisterAnimationSequence("F2P", var_44_40)

	local var_44_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_44_26:RegisterAnimationSequence("F2P", var_44_41)

	local var_44_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_44_28:RegisterAnimationSequence("F2P", var_44_42)

	local var_44_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_44_30:RegisterAnimationSequence("F2P", var_44_43)

	local function var_44_44()
		var_44_4:AnimateSequence("F2P")
		var_44_6:AnimateSequence("F2P")
		var_44_8:AnimateSequence("F2P")
		var_44_10:AnimateSequence("F2P")
		var_44_12:AnimateSequence("F2P")
		var_44_14:AnimateSequence("F2P")
		var_44_20:AnimateSequence("F2P")
		var_44_24:AnimateSequence("F2P")
		var_44_26:AnimateSequence("F2P")
		var_44_28:AnimateSequence("F2P")
		var_44_30:AnimateSequence("F2P")
	end

	var_44_0._sequences.F2P = var_44_44

	local function var_44_45()
		return
	end

	var_44_0._sequences.AR = var_44_45

	var_0_25(var_44_0, var_44_1, arg_44_1)

	return var_44_0
end

MenuBuilder.registerType("OptionsGraphicsSliderBar", OptionsGraphicsSliderBar)
LockTable(_M)
