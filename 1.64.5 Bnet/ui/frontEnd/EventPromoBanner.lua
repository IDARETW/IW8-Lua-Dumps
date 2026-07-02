module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 ~= arg_1_0._isVisible then
		arg_1_0._isVisible = arg_1_1

		arg_1_0:SetAlpha(arg_1_1 and 1 or 0)
	end
end

local function var_0_1(arg_2_0)
	local var_2_0 = false

	if CONDITIONS.IsEventPromoActive() then
		if Dvar.IBEGCHEFE("lui_event_promo_banner_forced") then
			var_2_0 = true
		else
			local var_2_1 = Dvar.CFHDGABACF("RNNNLLQMN")

			if var_2_1 and var_2_1 ~= arg_2_0._eventPromoID then
				local var_2_2 = tonumber(StringTable.BJJBBCJGEJ(CSV.eventPromos.file, CSV.eventPromos.cols.id, var_2_1))

				if var_2_2 and var_2_2 >= 0 then
					local var_2_3 = CSV.ReadRow({
						file = CSV.eventPromos.file,
						cols = CSV.eventPromos.cols
					}, var_2_2)
					local var_2_4 = var_2_3.image

					if var_2_4 and #var_2_4 > 0 then
						if Engine.DFEIGFBEH(RegisterMaterial(var_2_4)) > 1 then
							ACTIONS.AnimateSequence(arg_2_0, "Image2x1")
						else
							ACTIONS.AnimateSequence(arg_2_0, "Image1x1")
						end

						arg_2_0.Image:setImage(RegisterMaterial(var_2_4))
					else
						ACTIONS.AnimateSequence(arg_2_0, "HideImage")
					end

					local var_2_5 = var_2_3.text

					if var_2_5 and #var_2_5 > 0 then
						arg_2_0.Label:setText(Engine.CBBHFCGDIC(var_2_5))
					end

					local var_2_6 = var_2_3.gradientColor

					if var_2_6 and #var_2_6 > 0 then
						local var_2_7 = SWATCHES.EventPromos[var_2_6]

						if var_2_7 then
							arg_2_0.Gradient:SetRGBFromTable(var_2_7)
						else
							DebugPrint(arg_2_0.id .. ": Color " .. var_2_6 .. " does not exist in swatch: EventPromos")
						end
					end

					local var_2_8 = var_2_3.barColor

					if var_2_8 and #var_2_8 > 0 then
						local var_2_9 = SWATCHES.EventPromos[var_2_8]

						if var_2_9 then
							arg_2_0.Bar:SetRGBFromTable(var_2_9)
						else
							DebugPrint(arg_2_0.id .. ": Color " .. var_2_8 .. " does not exist in swatch: EventPromos")
						end
					end

					if var_2_3.showSeasonalEventProgress == "1" and CONDITIONS.IsSeasonalEventActive() then
						local var_2_10, var_2_11 = SEASONAL_EVENT.GetOverallWZProgress(arg_2_0._controllerIndex)

						if var_2_10 and var_2_11 then
							ACTIONS.AnimateSequence(arg_2_0, "ShowProgress")
							arg_2_0.Progress:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", var_2_10, var_2_11))

							if var_2_10 == var_2_11 then
								arg_2_0.Checkbox:SetValue(true)
								ACTIONS.AnimateSequence(arg_2_0.Checkbox, "CheckInstant")
							end
						end
					end

					var_2_0 = true
				else
					DebugPrint(arg_2_0.id .. ": Failed to find event promo id " .. var_2_1 .. ". Does it exist in event_promos.csv?")
				end
			end
		end
	else
		arg_2_0._eventPromoID = 0
	end

	var_0_0(arg_2_0, var_2_0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_1
	arg_3_0._eventPromoID = 0
	arg_3_0._isVisible = false
	arg_3_0._controllerIndex = arg_3_1

	ACTIONS.AnimateSequence(arg_3_0.Checkbox, "UnCheckInstant")
end

function EventPromoBanner(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 30 * _1080p)

	var_4_0.id = "EventPromoBanner"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Gradient"

	var_4_4:SetAlpha(0.65, 0)
	var_4_4:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 30)
	var_4_0:addElement(var_4_4)

	var_4_0.Gradient = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Bar"

	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 5, 0, 0, _1080p * 30)
	var_4_0:addElement(var_4_6)

	var_4_0.Bar = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Image"

	var_4_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 9, _1080p * 45, _1080p * -18, _1080p * 18)
	var_4_0:addElement(var_4_8)

	var_4_0.Image = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "Label"

	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetWordWrap(false)
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_10:SetStartupDelay(2000)
	var_4_10:SetLineHoldTime(400)
	var_4_10:SetAnimMoveTime(2000)
	var_4_10:SetAnimMoveSpeed(150)
	var_4_10:SetEndDelay(2000)
	var_4_10:SetCrossfadeTime(250)
	var_4_10:SetFadeInTime(300)
	var_4_10:SetFadeOutTime(300)
	var_4_10:SetMaxVisibleLines(1)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 424, _1080p * 5, _1080p * 25)
	var_4_0:addElement(var_4_10)

	var_4_0.Label = var_4_10

	local var_4_11
	local var_4_12 = MenuBuilder.BuildRegisteredType("GenericCheckBox", {
		controllerIndex = var_4_1
	})

	var_4_12.id = "Checkbox"

	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 377, _1080p * 399, _1080p * 4, _1080p * 26)
	var_4_0:addElement(var_4_12)

	var_4_0.Checkbox = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "Progress"

	var_4_14:SetAlpha(0, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetWordWrap(false)
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 402, _1080p * 447, _1080p * 5, _1080p * 25)
	var_4_0:addElement(var_4_14)

	var_4_0.Progress = var_4_14

	local function var_4_15()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideImage", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 9
		}
	}

	var_4_10:RegisterAnimationSequence("HideImage", var_4_18)

	local function var_4_19()
		var_4_8:AnimateSequence("HideImage")
		var_4_10:AnimateSequence("HideImage")
	end

	var_4_0._sequences.HideImage = var_4_19

	local var_4_20
	local var_4_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 373
		}
	}

	var_4_10:RegisterAnimationSequence("ShowProgress", var_4_21)

	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ShowProgress", var_4_22)

	local var_4_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ShowProgress", var_4_23)

	local function var_4_24()
		var_4_10:AnimateSequence("ShowProgress")
		var_4_12:AnimateSequence("ShowProgress")
		var_4_14:AnimateSequence("ShowProgress")
	end

	var_4_0._sequences.ShowProgress = var_4_24

	local var_4_25
	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 45
		}
	}

	var_4_8:RegisterAnimationSequence("Image1x1", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 51
		}
	}

	var_4_10:RegisterAnimationSequence("Image1x1", var_4_27)

	local function var_4_28()
		var_4_8:AnimateSequence("Image1x1")
		var_4_10:AnimateSequence("Image1x1")
	end

	var_4_0._sequences.Image1x1 = var_4_28

	local var_4_29
	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 81
		}
	}

	var_4_8:RegisterAnimationSequence("Image2x1", var_4_30)

	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 87
		}
	}

	var_4_10:RegisterAnimationSequence("Image2x1", var_4_31)

	local function var_4_32()
		var_4_8:AnimateSequence("Image2x1")
		var_4_10:AnimateSequence("Image2x1")
	end

	var_4_0._sequences.Image2x1 = var_4_32

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("EventPromoBanner", EventPromoBanner)
LockTable(_M)
