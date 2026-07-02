module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._popupDurationMs = 3000
	arg_1_0._startShowingTime = Engine.BFBIDEGDFB()
	arg_1_0._timer = LUI.UITimer.new({
		interval = 500,
		event = "korean_rating_over"
	})

	arg_1_0:addElement(arg_1_0._timer)
	arg_1_0:registerEventHandler("korean_rating_over", function(arg_2_0, arg_2_1)
		if Engine.BFBIDEGDFB() > arg_2_0._startShowingTime + arg_2_0._popupDurationMs then
			Dvar.DHEGHJJJHI("MKRKLLSKSP", true)
			LUI.FlowManager.RequestLeaveMenu(arg_2_0:GetCurrentMenu(), true)
		end
	end)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
end

function KoreanRatingPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "KoreanRatingPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.Reticles.Black, 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "KoreanRatingLegalText"

	var_3_6:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("KOREAN_LEGAL/KOREAN_BOOT_DESCRIPTION_RANTING18"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -820, _1080p * 820, _1080p * 498, _1080p * 568)
	var_3_0:addElement(var_3_6)

	var_3_0.KoreanRatingLegalText = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("KoreanRatingsContainer", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "KoreanRatingsContainer"

	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -324, _1080p * 324, _1080p * 77, _1080p * 487)
	var_3_0:addElement(var_3_8)

	var_3_0.KoreanRatingsContainer = var_3_8

	var_3_4:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.ScaleFullscreen(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("KoreanRatingPopup", KoreanRatingPopup)
LockTable(_M)
