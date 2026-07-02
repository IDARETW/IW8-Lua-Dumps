module(..., package.seeall)

local var_0_0 = false
local var_0_1 = false
local var_0_2

local function var_0_3(arg_1_0, arg_1_1, arg_1_2)
	if not arg_1_1 then
		return
	end

	arg_1_0._isLimitedTimeOffer = arg_1_2.isLimitedTimeOffer
	arg_1_0._isExpired = arg_1_2.isExpired
	arg_1_0._purchaseEnd = arg_1_1

	local var_1_0 = Engine.DEIDGHDBHD()

	if (var_1_0 < arg_1_0._purchaseEnd and arg_1_0._purchaseEnd - var_1_0 or 0) > 0 then
		arg_1_0.LimitedTimeText.eventTimer = LUI.UITimer.new({
			interval = 1000,
			event = "update_bp_topper_timer"
		})
		arg_1_0.LimitedTimeText.eventTimer.id = "bpTopperTimer"

		arg_1_0.LimitedTimeText:addElement(arg_1_0.LimitedTimeText.eventTimer)
		arg_1_0.LimitedTimeText:addAndCallEventHandler("update_bp_topper_timer", function(arg_2_0, arg_2_1)
			local var_2_0 = ""
			local var_2_1 = Engine.DEIDGHDBHD()
			local var_2_2 = var_2_1 < arg_1_0._purchaseEnd and arg_1_0._purchaseEnd - var_2_1 or 0

			if var_2_2 == 0 then
				arg_1_0.LimitedTimeText.eventTimer:closeTree()

				arg_1_0.LimitedTimeText.eventTimer = nil
			else
				local var_2_3

				if arg_1_0._isLimitedTimeOffer then
					var_2_3 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("MENU/STORE_LIMITEDTIME_TIMER", Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_2_2))))
				elseif arg_1_0._isExpired then
					var_2_3 = Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("MENU/STORE_EXPIRED"))
				else
					var_2_3 = Engine.CBEAHDFCFC(Engine.JCBDICCAH(Engine.BJCFFHAIFA(var_2_2)))
				end

				arg_1_0.LimitedTimeText:setText(var_2_3)
			end
		end)
	end
end

local function var_0_4(arg_3_0, arg_3_1)
	if arg_3_1 then
		arg_3_0.LimitedTimeText:setText(arg_3_1)
	end
end

local function var_0_5(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetTimerString = var_0_4
	arg_4_0.SetTimer = var_0_3
end

function MPStoreBillboardLimitedTimeBanner(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 25 * _1080p)

	var_5_0.id = "MPStoreBillboardLimitedTimeBanner"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "LimitedTimeBG"

	var_5_4:SetRGBFromTable(SWATCHES.CH2.CH2BattlePassTopper, 0)
	var_5_4:setImage(RegisterMaterial("menu_highlight_backing_ch2"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.LimitedTimeBG = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "CenterOut"

	var_5_6:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_5_6:SetAlpha(0.15, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_5_0:addElement(var_5_6)

	var_5_0.CenterOut = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Highlight"

	var_5_8:SetRGBFromTable(SWATCHES.Frontend.LimitedTagPrimary, 0)
	var_5_8:SetAlpha(0.15, 0)
	var_5_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_8:SetBlendMode(BLEND_MODE.addWithAlpha)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -3, _1080p * 2, _1080p * -1)
	var_5_0:addElement(var_5_8)

	var_5_0.Highlight = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "TimerClock"

	var_5_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_10:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 6, _1080p * 22, _1080p * -8.5, _1080p * 7.5)
	var_5_0:addElement(var_5_10)

	var_5_0.TimerClock = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIStyledText.new()

	var_5_12.id = "LimitedTimeText"

	var_5_12:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_5_12:setText("", 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_12:SetWordWrap(false)
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_12:SetStartupDelay(1000)
	var_5_12:SetLineHoldTime(400)
	var_5_12:SetAnimMoveTime(150)
	var_5_12:SetAnimMoveSpeed(50)
	var_5_12:SetEndDelay(1000)
	var_5_12:SetCrossfadeTime(400)
	var_5_12:SetFadeInTime(300)
	var_5_12:SetFadeOutTime(300)
	var_5_12:SetMaxVisibleLines(1)
	var_5_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 28, _1080p * -6, _1080p * -10.5, _1080p * 9.5)
	var_5_0:addElement(var_5_12)

	var_5_0.LimitedTimeText = var_5_12

	var_0_5(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MPStoreBillboardLimitedTimeBanner", MPStoreBillboardLimitedTimeBanner)
LockTable(_M)
