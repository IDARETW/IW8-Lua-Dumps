module(..., package.seeall)

function CPIntelAudio(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "CPIntelAudio"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Background"

	var_1_4:SetRGBFromInt(0, 0)
	var_1_4:SetAlpha(0.3, 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 1920, 0, _1080p * 1080)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Window"

	var_1_6:setImage(RegisterMaterial("computer_screen_windows_intel_audio"), 0)
	var_1_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1580, _1080p * 331, _1080p * 811)
	var_1_0:addElement(var_1_6)

	var_1_0.Window = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "Box"

	var_1_8:SetAlpha(0, 0)
	var_1_8:SetScale(1, 0)
	var_1_8:setImage(RegisterMaterial("computer_screen_windows_preview"), 0)
	var_1_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 862, _1080p * 1338, _1080p * 451, _1080p * 691)
	var_1_0:addElement(var_1_8)

	var_1_0.Box = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "Wave"

	var_1_10:SetPixelGridEnabled(true)
	var_1_10:SetPixelGridContrast(0.9, 0)
	var_1_10:SetPixelGridBlockWidth(4, 0)
	var_1_10:SetPixelGridBlockHeight(4, 0)
	var_1_10:SetPixelGridGutterWidth(1, 0)
	var_1_10:SetPixelGridGutterHeight(1, 0)
	var_1_10:setImage(RegisterMaterial("hud_splash_waveform"), 0)
	var_1_10:SetUMin(0.5, 0)
	var_1_10:SetVMin(0.16, 0)
	var_1_10:SetVMax(0.34, 0)
	var_1_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 860, _1080p * -584, _1080p * -139, _1080p * 13)
	var_1_0:addElement(var_1_10)

	var_1_0.Wave = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIStyledText.new()

	var_1_12.id = "CategoryText"

	var_1_12:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_1_12:setText("", 0)
	var_1_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_12:SetAlignment(LUI.Alignment.Left)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1046, _1080p * 276, _1080p * 300)
	var_1_0:addElement(var_1_12)

	var_1_0.CategoryText = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "IntelName"

	var_1_14:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_14:SetAlignment(LUI.Alignment.Right)
	var_1_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1140, _1080p * 1578, _1080p * 276, _1080p * 300)
	var_1_0:addElement(var_1_14)

	var_1_0.IntelName = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "Line"

	var_1_16:SetRGBFromInt(6250335, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 624, _1080p * 1578, _1080p * 306, _1080p * 307)
	var_1_0:addElement(var_1_16)

	var_1_0.Line = var_1_16

	local var_1_17
	local var_1_18 = LUI.UIStyledText.new()

	var_1_18.id = "TextBox"

	var_1_18:SetRGBFromTable(SWATCHES.text.secondaryText, 0)
	var_1_18:setText("", 0)
	var_1_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_18:SetAlignment(LUI.Alignment.Left)
	var_1_18:SetDecodeLetterLength(7)
	var_1_18:SetDecodeMaxRandChars(10)
	var_1_18:SetDecodeUpdatesPerLetter(10)
	var_1_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 698, _1080p * 1504, _1080p * 598, _1080p * 618)
	var_1_0:addElement(var_1_18)

	var_1_0.TextBox = var_1_18

	local var_1_19
	local var_1_20 = LUI.UIStyledText.new()

	var_1_20.id = "RemoteConnection"

	var_1_20:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_1_20:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_AUDIO_HEADER"), 0)
	var_1_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_20:SetAlignment(LUI.Alignment.Left)
	var_1_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 660, _1080p * 1160, _1080p * 331, _1080p * 351)
	var_1_0:addElement(var_1_20)

	var_1_0.RemoteConnection = var_1_20

	local var_1_21
	local var_1_22 = LUI.UIStyledText.new()

	var_1_22.id = "X"

	var_1_22:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_1_22:setText("X", 0)
	var_1_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_22:SetAlignment(LUI.Alignment.Right)
	var_1_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1527, _1080p * 1565, _1080p * 331, _1080p * 351)
	var_1_0:addElement(var_1_22)

	var_1_0.X = var_1_22

	local var_1_23
	local var_1_24 = LUI.UIStyledText.new()

	var_1_24.id = "DecryptionText"

	var_1_24:SetRGBFromTable(SWATCHES.window.titleTextColor, 0)
	var_1_24:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_AUDIO_DECRYPTION"), 0)
	var_1_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_24:SetAlignment(LUI.Alignment.Center)
	var_1_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 640, _1080p * 1535, _1080p * 562, _1080p * 590)
	var_1_0:addElement(var_1_24)

	var_1_0.DecryptionText = var_1_24

	local function var_1_25()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_25

	local var_1_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.V_Min
		},
		{
			value = 0.16,
			duration = 0,
			property = TWEEN_PROPERTY.V_Max
		},
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.U_Min
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.U_Max
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.V_Min
		},
		{
			value = 0.16,
			duration = 100,
			property = TWEEN_PROPERTY.V_Max
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.16,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.33,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.16,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.16,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.33,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.33,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.33,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.67,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.67,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.67,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.83,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.67,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.83,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.82,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 0.82,
			duration = 40,
			property = TWEEN_PROPERTY.V_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 40,
			property = TWEEN_PROPERTY.U_Min,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.U_Max,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 40,
			property = TWEEN_PROPERTY.V_Max,
			easing = LUI.EASING.snap
		}
	}

	var_1_10:RegisterAnimationSequence("Show", var_1_26)

	local function var_1_27()
		var_1_10:AnimateLoop("Show")
	end

	var_1_0._sequences.Show = var_1_27

	return var_1_0
end

MenuBuilder.registerType("CPIntelAudio", CPIntelAudio)
LockTable(_M)
