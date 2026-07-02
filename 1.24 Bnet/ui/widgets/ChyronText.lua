module(..., package.seeall)

local var_0_0 = 312
local var_0_1 = 128
local var_0_2 = -20
local var_0_3 = 10
local var_0_4 = 0.5
local var_0_5 = 5

local function var_0_6(arg_1_0)
	arg_1_0.Text:SetDecodeParams(0, 0, 0)
end

local function var_0_7(arg_2_0, arg_2_1)
	arg_2_0.Text:setText(arg_2_1)
end

local function var_0_8(arg_3_0, arg_3_1)
	arg_3_0.Text:SetPixelGridEnabled(true)
	arg_3_0.Text:SetPixelGridContrast(0.2, 0)
	arg_3_0.Text:SetPixelGridBlockWidth(2, 0)
	arg_3_0.Text:SetPixelGridBlockHeight(2, 0)
	arg_3_0.Text:SetPixelGridGutterWidth(1, 0)
	arg_3_0.Text:SetPixelGridGutterHeight(1, 0)
	arg_3_0.Text:SetDecodeParams(40, 1, 2)

	local var_3_0 = arg_3_0.Text:GetDecodeEffectTimeLength()
	local var_3_1

	if var_3_0 and var_3_0 > 0 then
		var_3_1 = var_3_0
	else
		var_3_1 = 1000
	end

	local var_3_2 = arg_3_0.Text:getText()
	local var_3_3 = arg_3_0.Text:GetCurrentFont()
	local var_3_4, var_3_5, var_3_6, var_3_7 = arg_3_0.Text:getLocalRect()
	local var_3_8, var_3_9, var_3_10, var_3_11 = GetTextDimensions(var_3_2, var_3_3, math.abs(var_3_7 - var_3_5), nil)
	local var_3_12 = math.abs(var_3_10 - var_3_8)

	arg_3_0.ChyronFX:SetAlpha(0.8)

	local var_3_13 = -(var_0_1 / 2) * _1080p
	local var_3_14 = var_0_1 / 2 * _1080p
	local var_3_15 = var_3_12 * var_0_4
	local var_3_16 = var_3_12 - var_3_15
	local var_3_17 = var_3_12 - var_3_15 - var_0_0 * _1080p
	local var_3_18 = var_3_12 + var_0_3 * _1080p

	if var_3_12 < var_0_0 then
		var_3_17 = var_0_2
		var_3_16 = var_3_17 + var_0_0 * _1080p
	end

	arg_3_0.ChyronFX:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_3_17, var_3_16, var_3_13, var_3_14)
	arg_3_0.ChyronFX:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_3_18, var_3_18, var_3_13, var_3_14, var_3_1)

	local var_3_19 = arg_3_0.Text:GetFontSize()

	arg_3_0.Cursor:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_3_12 + var_0_5, var_3_12 + var_0_5 + 2, -var_3_19 / 2 * _1080p, var_3_19 / 2 * _1080p)

	arg_3_0:Wait(var_3_1).onComplete = function()
		arg_3_0.ChyronFX:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_3_0, "CursorFlash")
	end
end

local function var_0_9(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	arg_5_0.Text:SetAlpha(arg_5_2)
	arg_5_0.Text:setText(arg_5_3)
	arg_5_0.Text:SetFont(arg_5_4)

	local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0.Text:getLocalRect()

	arg_5_0.Text:SetAnchorsAndPosition(0, 1, 0.5, 0.5, var_5_0, var_5_2, -arg_5_5 / 2 * _1080p, arg_5_5 / 2 * _1080p)
	arg_5_0.Text:SetFontSize(arg_5_5 * _1080p)
	var_0_8(arg_5_0, arg_5_1)
end

local function var_0_10(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetupChyronText = var_0_7
	arg_6_0.StartChyronEffect = var_0_9
	arg_6_0.ChyronDecodeOff = var_0_6
end

function ChyronText(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 64 * _1080p)

	var_7_0.id = "ChyronText"
	var_7_0._animationSets = {}
	var_7_0._sequences = {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIStyledText.new()

	var_7_4.id = "Text"

	var_7_4:SetAlpha(0, 0)
	var_7_4:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_7_4:setText("OPERATION WATERFALL", 0)
	var_7_4:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_7_4:SetWordWrap(false)
	var_7_4:SetAlignment(LUI.Alignment.Left)
	var_7_4:SetShadowUOffset(0, 0)
	var_7_4:SetShadowRGBFromInt(15987699, 0)
	var_7_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 690, _1080p * -15, _1080p * 15)
	var_7_0:addElement(var_7_4)

	var_7_0.Text = var_7_4

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "Cursor"

	var_7_6:SetAlpha(0, 0)
	var_7_6:SetPixelGridEnabled(true)
	var_7_6:SetPixelGridContrast(0.5, 0)
	var_7_6:SetPixelGridBlockWidth(2, 0)
	var_7_6:SetPixelGridBlockHeight(2, 0)
	var_7_6:SetPixelGridGutterWidth(1, 0)
	var_7_6:SetPixelGridGutterHeight(1, 0)
	var_7_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 634, _1080p * 637, _1080p * -20, _1080p * 22)
	var_7_0:addElement(var_7_6)

	var_7_0.Cursor = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("ChyronFX", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "ChyronFX"

	var_7_8:SetAlpha(0, 0)
	var_7_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 312, _1080p * -64, _1080p * 64)
	var_7_0:addElement(var_7_8)

	var_7_0.ChyronFX = var_7_8

	local function var_7_9()
		return
	end

	var_7_0._sequences.DefaultSequence = var_7_9

	local var_7_10 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 190,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 180,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 10,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("CursorFlash", var_7_10)

	local function var_7_11()
		var_7_6:AnimateSequence("CursorFlash")
	end

	var_7_0._sequences.CursorFlash = var_7_11

	var_0_10(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ChyronText", ChyronText)
LockTable(_M)
