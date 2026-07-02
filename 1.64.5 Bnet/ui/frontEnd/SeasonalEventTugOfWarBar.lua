module(..., package.seeall)

local var_0_0 = 50

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = 0.5
	local var_1_1 = 2 * math.max(arg_1_1, arg_1_2)

	if var_1_1 > 0 then
		var_1_0 = 0.5 + (arg_1_1 - arg_1_2) / var_1_1
	end

	local var_1_2 = LUI.EASING.outQuadratic

	arg_1_0.ToWBar:SetProgress(var_1_0, arg_1_3, var_1_2)

	local var_1_3, var_1_4, var_1_5, var_1_6 = arg_1_0.ToWBar:getLocalRect()
	local var_1_7 = math.abs(var_1_3 - var_1_5)

	arg_1_0.EffectBar:SetLeft(var_1_7 * (var_1_0 - 1), arg_1_3, var_1_2)
	arg_1_0.EffectBar:SetRight(var_1_7 * var_1_0, arg_1_3, var_1_2)

	if arg_1_3 > var_0_0 then
		arg_1_0._leftVal = 0
		arg_1_0._rightVal = 0

		local var_1_8 = 0
		local var_1_9 = LUI.UITimer.new({
			event = "update_text_values",
			interval = var_0_0
		})

		var_1_9.id = "towTextUpdater"

		if arg_1_0._textUpdateTimer then
			arg_1_0._textUpdateTimer:closeTree()

			arg_1_0._textUpdateTimer = nil
		end

		arg_1_0:addElement(var_1_9)

		arg_1_0._textUpdateTimer = var_1_9

		arg_1_0:registerEventHandler("update_text_values", function(arg_2_0, arg_2_1)
			var_1_8 = var_1_8 + var_0_0
			arg_2_0._leftVal = math.ceil(LUI.Lerp(arg_2_0._leftVal, arg_1_1, var_1_8 / arg_1_3))
			arg_2_0._rightVal = math.ceil(LUI.Lerp(arg_2_0._rightVal, arg_1_2, var_1_8 / arg_1_3))

			arg_2_0.LeftVal:setText(FormatLargeNumberForCurrentLanguage(arg_2_0._leftVal), 0)
			arg_2_0.RightVal:setText(FormatLargeNumberForCurrentLanguage(arg_2_0._rightVal), 0)

			if arg_2_0._leftVal == arg_1_1 and arg_2_0._rightVal == arg_1_2 and arg_2_0._textUpdateTimer then
				arg_2_0._textUpdateTimer:closeTree()

				arg_2_0._textUpdateTimer = nil
			end
		end)
	else
		arg_1_0._leftVal = arg_1_1
		arg_1_0._rightVal = arg_1_2

		arg_1_0.LeftVal:setText(FormatLargeNumberForCurrentLanguage(arg_1_1), 0)
		arg_1_0.RightVal:setText(FormatLargeNumberForCurrentLanguage(arg_1_2), 0)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.EffectBar:SetMask(arg_3_0.Mask)
	arg_3_0.Mask:SetAlpha(1)

	arg_3_0.SetValues = var_0_1

	arg_3_0:SetValues(0, 0, 0)
end

function SeasonalEventTugOfWarBar(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 315 * _1080p)

	var_4_0.id = "SeasonalEventTugOfWarBar"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "DarkBG"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_4:SetAlpha(0.2, 0)
	var_4_4:setImage(RegisterMaterial("hud_bkgd_glow"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 52, _1080p * 1150, _1080p * 104, _1080p * 216)
	var_4_0:addElement(var_4_4)

	var_4_0.DarkBG = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ToWBar"

	var_4_6.Overlay:SetRGBFromTable(SWATCHES.EventPromos.HvVRed, 0)
	var_4_6.Fill:SetRGBFromTable(SWATCHES.EventPromos.HvVBlue, 0)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -400, _1080p * 400, _1080p * 20.5, _1080p * -19.5)
	var_4_0:addElement(var_4_6)

	var_4_0.ToWBar = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "LeftVal"

	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 65, _1080p * 335, _1080p * 73, _1080p * 123)
	var_4_0:addElement(var_4_8)

	var_4_0.LeftVal = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "RightVal"

	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 865, _1080p * 1135, _1080p * 73, _1080p * 123)
	var_4_0:addElement(var_4_10)

	var_4_0.RightVal = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "MiddleIndicator"

	var_4_12:SetAlpha(0.55, 0)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -25.5, _1080p * 25.5)
	var_4_0:addElement(var_4_12)

	var_4_0.MiddleIndicator = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "EffectBar"

	var_4_14:setImage(RegisterMaterial("ui_seasonal_event_hvv_bareffect"), 0)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -480, _1080p * 480, _1080p * -63.5, _1080p * 64.5)
	var_4_0:addElement(var_4_14)

	var_4_0.EffectBar = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Mask"

	var_4_16:setImage(RegisterMaterial("wdg_large_mask"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 197, _1080p * 1003, _1080p * 77, _1080p * 239)
	var_4_0:addElement(var_4_16)

	var_4_0.Mask = var_4_16

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SeasonalEventTugOfWarBar", SeasonalEventTugOfWarBar)
LockTable(_M)
