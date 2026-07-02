module(..., package.seeall)

local var_0_0 = 3

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.CacheDimensions(arg_1_0)
	arg_1_0.CurProgress:SetAnchorsAndPosition(0, 1, 0, 1, 0, (arg_1_2 + 1) * arg_1_0._slotWidth, 0, arg_1_0._widgetHeight)
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.CacheDimensions(arg_2_0)
	arg_2_0.CurRank:SetAnchorsAndPosition(0, 1, 0, 1, arg_2_2 * arg_2_0._slotWidth, (arg_2_2 + 1) * arg_2_0._slotWidth, 0, arg_2_0._widgetHeight)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.CacheDimensions(arg_3_0)

	local var_3_0 = arg_3_0._slotWidth / 2
	local var_3_1 = arg_3_0._topHighlightWidth / 2
	local var_3_2 = arg_3_2 * arg_3_0._slotWidth + var_3_0 - var_3_1
	local var_3_3 = 0 - arg_3_0._topHighlightHeight - var_0_0
	local var_3_4 = arg_3_0._bottomHighlightWidth / 2
	local var_3_5 = arg_3_2 * arg_3_0._slotWidth + var_3_0 - var_3_4
	local var_3_6 = arg_3_0._widgetHeight + var_0_0

	arg_3_0.TopHighlight:SetAnchorsAndPosition(0, 1, 0, 1, var_3_2, var_3_2 + arg_3_0._topHighlightWidth, var_3_3, var_3_3 + arg_3_0._topHighlightHeight)
	arg_3_0.BottomHighlight:SetAnchorsAndPosition(0, 1, 0, 1, var_3_5, var_3_5 + arg_3_0._bottomHighlightWidth, var_3_6, var_3_6 + arg_3_0._bottomHighlightHeight)
	arg_3_0.SetBorderPosition(arg_3_0)

	if arg_3_2 == 0 then
		arg_3_0.LeftCap:SetAlpha(0.6)
		arg_3_0.RightCap:SetAlpha(0)
	elseif arg_3_2 == arg_3_0.maxRank - 1 then
		arg_3_0.LeftCap:SetAlpha(0)
		arg_3_0.RightCap:SetAlpha(0.6)
	else
		arg_3_0.LeftCap:SetAlpha(0)
		arg_3_0.RightCap:SetAlpha(0)
	end
end

local function var_0_4(arg_4_0)
	local var_4_0 = var_0_0 + arg_4_0._topHighlightHeight
	local var_4_1 = var_0_0 + arg_4_0._bottomHighlightHeight
	local var_4_2 = var_0_0
	local var_4_3 = var_0_0 - 1
	local var_4_4 = var_0_0 + 2

	arg_4_0.Border:SetAnchorsAndPosition(0, 0, 0, 0, -var_4_2, var_4_2, -var_4_0, var_4_1)
	arg_4_0.LeftCap:SetAnchorsAndPosition(0, 1, 0, 0, -var_4_3, -(var_4_3 + 1), -var_4_0, var_4_1)
	arg_4_0.RightCap:SetAnchorsAndPosition(1, 0, 0, 0, var_4_3, var_4_3 + 1, -var_4_0, var_4_1)
	arg_4_0.HighlightCapMask:SetAnchorsAndPosition(0, 0, 0, 0, -var_4_4, var_4_4, -var_4_0, var_4_1)
end

local function var_0_5(arg_5_0)
	local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0:getLocalRect()

	arg_5_0._widgetWidth = var_5_2 - var_5_0
	arg_5_0._widgetHeight = var_5_3 - var_5_1
	arg_5_0._slotWidth = arg_5_0._widgetWidth / arg_5_0.maxRank

	local var_5_4, var_5_5, var_5_6, var_5_7 = arg_5_0.TopHighlight:getLocalRect()

	arg_5_0._topHighlightWidth = var_5_6 - var_5_4
	arg_5_0._topHighlightHeight = var_5_7 - var_5_5

	local var_5_8, var_5_9, var_5_10, var_5_11 = arg_5_0.BottomHighlight:getLocalRect()

	arg_5_0._bottomHighlightWidth = var_5_10 - var_5_8
	arg_5_0._bottomHighlightHeight = var_5_11 - var_5_9
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.maxRank = StringTable.BFHCAIIDA(CSV.progressionItems.GetFile())
	arg_6_0.SetFocusedRankSlot = var_0_2
	arg_6_0.SetRankProgressionSlot = var_0_1
	arg_6_0.SetBorderHighlightPosition = var_0_3
	arg_6_0.SetBorderPosition = var_0_4
	arg_6_0.CacheDimensions = var_0_5

	arg_6_0.Mask:SetAlpha(1)
	arg_6_0.CurRank:SetMask(arg_6_0.Mask)
	arg_6_0.CurProgress:SetMask(arg_6_0.Mask)
	arg_6_0.BG:SetMask(arg_6_0.Mask)
	arg_6_0.HighlightCapMask:SetAlpha(1)
	arg_6_0.TopHighlight:SetMask(arg_6_0.HighlightCapMask)
	arg_6_0.BottomHighlight:SetMask(arg_6_0.HighlightCapMask)
	arg_6_0.EmptyFocusable:addEventHandler("mouseenter", function(arg_7_0, arg_7_1)
		arg_7_0._mouseOver = true
	end)
	arg_6_0.EmptyFocusable:addEventHandler("mouseleave", function(arg_8_0, arg_8_1)
		arg_8_0._mouseOver = false
	end)
	arg_6_0.EmptyFocusable:addEventHandler("mousemove", function(arg_9_0, arg_9_1)
		if arg_9_0._mouseOver then
			local var_9_0, var_9_1 = LUI.WebViewManager.GetMousePositionByEvent(arg_6_0, arg_9_0, arg_9_1, false)
			local var_9_2 = arg_9_0:getWidth() / _1080p / 55
			local var_9_3 = math.floor(var_9_0 / var_9_2)

			arg_6_0._focusedSquare = var_9_3
		end
	end)
	arg_6_0.EmptyFocusable:addEventHandler("mouseup", function(arg_10_0, arg_10_1)
		if arg_6_0._focusedSquare then
			arg_6_0:dispatchEventToRoot({
				index = arg_6_0._focusedSquare,
				previousfocus,
				name = "update_display"
			})
		end
	end)
end

function RankProgressionSlot(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 17 * _1080p)

	var_11_0.id = "RankProgressionSlot"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "BG"

	var_11_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_11_4:SetAlpha(0.7, 0)
	var_11_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1100, 0, _1080p * 17)
	var_11_0:addElement(var_11_4)

	var_11_0.BG = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "CurProgress"

	var_11_6:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine, 0)
	var_11_6:SetAlpha(0.75, 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -712, 0, 0)
	var_11_0:addElement(var_11_6)

	var_11_0.CurProgress = var_11_6

	local var_11_7
	local var_11_8 = LUI.UIImage.new()

	var_11_8.id = "CurRank"

	var_11_8:SetRGBFromTable(SWATCHES.Tracer.yellow, 0)
	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 95, 0, _1080p * 17)
	var_11_0:addElement(var_11_8)

	var_11_0.CurRank = var_11_8

	local var_11_9
	local var_11_10 = LUI.UIImage.new()

	var_11_10.id = "Mask"

	var_11_10:SetAlpha(0, 0)
	var_11_10:setImage(RegisterMaterial("progression_slots"), 0)
	var_11_0:addElement(var_11_10)

	var_11_0.Mask = var_11_10

	local var_11_11
	local var_11_12 = LUI.UIImage.new()

	var_11_12.id = "Border"

	var_11_12:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZLineSeperator, 0)
	var_11_12:SetAlpha(0.3, 0)
	var_11_12:setImage(RegisterMaterial("ui_mp_wz_border_square"), 0)
	var_11_12:Setup3SliceHorizontalImage(_1080p * 6, 0.3)
	var_11_12:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_12)

	var_11_0.Border = var_11_12

	local var_11_13
	local var_11_14 = LUI.UIImage.new()

	var_11_14.id = "BottomHighlight"

	var_11_14:SetRGBFromTable(SWATCHES.Tracer.yellow, 0)
	var_11_14:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_11_14:Setup3SliceHorizontalImage(_1080p * 15, 0.1)
	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, _1080p * 20, _1080p * 21)
	var_11_0:addElement(var_11_14)

	var_11_0.BottomHighlight = var_11_14

	local var_11_15
	local var_11_16 = LUI.UIImage.new()

	var_11_16.id = "TopHighlight"

	var_11_16:SetRGBFromTable(SWATCHES.Tracer.yellow, 0)
	var_11_16:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_11_16:Setup3SliceHorizontalImage(_1080p * 15, 0.1)
	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, _1080p * -4, _1080p * -3)
	var_11_0:addElement(var_11_16)

	var_11_0.TopHighlight = var_11_16

	local var_11_17
	local var_11_18 = LUI.UIImage.new()

	var_11_18.id = "HighlightCapMask"

	var_11_18:SetAlpha(0, 0)
	var_11_18:setImage(RegisterMaterial("ui_mp_wz_mask_horizontal_edges"), 0)
	var_11_18:Setup9SliceImage(_1080p * 3, _1080p * 1, 0.5, 0.1)
	var_11_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_18)

	var_11_0.HighlightCapMask = var_11_18

	local var_11_19
	local var_11_20 = LUI.UIImage.new()

	var_11_20.id = "LeftCap"

	var_11_20:SetRGBFromTable(SWATCHES.Tracer.yellow, 0)
	var_11_20:SetAlpha(0, 0)
	var_11_20:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -4, _1080p * -3, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_20)

	var_11_0.LeftCap = var_11_20

	local var_11_21
	local var_11_22 = LUI.UIImage.new()

	var_11_22.id = "RightCap"

	var_11_22:SetRGBFromTable(SWATCHES.Tracer.yellow, 0)
	var_11_22:SetAlpha(0, 0)
	var_11_22:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 3, _1080p * 4, _1080p * -4, _1080p * 4)
	var_11_0:addElement(var_11_22)

	var_11_0.RightCap = var_11_22

	local var_11_23
	local var_11_24 = MenuBuilder.BuildRegisteredType("EmptyFocusable", {
		controllerIndex = var_11_1
	})

	var_11_24.id = "EmptyFocusable"

	var_11_24:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_11_0:addElement(var_11_24)

	var_11_0.EmptyFocusable = var_11_24

	var_0_6(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("RankProgressionSlot", RankProgressionSlot)
LockTable(_M)
