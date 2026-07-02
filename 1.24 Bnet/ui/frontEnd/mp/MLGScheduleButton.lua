module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0.ActiveMatch.NewText:GetCurrentAnchorsAndPositions()

	arg_1_0.ActiveMatch.NewText:SetTop(var_1_0.top + 2, 0)
	arg_1_0.ActiveMatch.NewText:SetBottom(var_1_0.bottom - 3, 0)
	arg_1_0.ActiveMatch.NewText:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/NEXT_MATCH_LOWER"))
	arg_1_0.ActiveMatch.Highlight:SetRGBFromTable(SWATCHES.Arena.NewPrimary)
	arg_1_0.ActiveMatch.Backer:SetRGBFromTable(SWATCHES.Arena.NewSecondary)
	arg_1_0.ActiveMatch:SetupLeftAlignment()
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0.UpdateActiveNotification = var_0_0

	arg_2_0:UpdateActiveNotification()
	arg_2_0:SubscribeToModelThroughElement(arg_2_0, "matchId", function()
		local var_3_0 = arg_2_0:GetDataSource().matchId:GetValue(arg_2_1)

		if var_3_0 and MLG.BIHFEHBCFB(arg_2_1) == var_3_0 then
			ACTIONS.AnimateSequence(arg_2_0, "IsActive")
		else
			ACTIONS.AnimateSequence(arg_2_0, "IsNotActive")
		end
	end)
	arg_2_0.MatchInfo:SubscribeToModelThroughElement(arg_2_0, "gameCount", function()
		local var_4_0 = arg_2_0:GetDataSource().matchId:GetValue(arg_2_1)
		local var_4_1 = arg_2_0:GetDataSource().gameCount:GetValue(arg_2_1)

		if var_4_0 then
			arg_2_0.MatchInfo:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_ID_LABEL") .. " #" .. var_4_0 .. " - " .. Engine.CBBHFCGDIC("MLG_GAMEBATTLES/BEST_X_OUT_OF_Y", var_4_1), 0)
		end
	end)
	arg_2_0.MatchDate:SubscribeToModelThroughElement(arg_2_0, "matchTime", function()
		local var_5_0 = arg_2_0:GetDataSource().matchTime:GetValue(arg_2_1)

		if var_5_0 then
			arg_2_0.MatchDate:setText(Engine.BADEEDFGHB(var_5_0) .. " " .. Engine.CIIGICAIFC(var_5_0))
		end
	end)
	arg_2_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_2_0, "Selected")
	end)
	arg_2_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_2_0, "NotSelected")
	end)
end

function MLGScheduleButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 126 * _1080p)

	var_8_0.id = "MLGScheduleButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "GenericButton"

	var_8_4.BackgroundDarkener:SetAlpha(0.5, 0)
	var_8_4.Text:SetLeft(_1080p * 20, 0)
	var_8_4.Text:setText(ToUpperCase(""), 0)
	var_8_4.Text:SetAlignment(LUI.Alignment.Left)
	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 126)
	var_8_0:addElement(var_8_4)

	var_8_0.GenericButton = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Logo"

	var_8_6:SetAlpha(0.3, 0)
	var_8_6:setImage(RegisterMaterial("gamebattles_logo_wide_buttons"), 0)
	var_8_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -219, 0, 0, _1080p * 126)
	var_8_0:addElement(var_8_6)

	var_8_0.Logo = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIStyledText.new()

	var_8_8.id = "MatchInfo"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_8_8:setText("", 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_8:SetStartupDelay(2000)
	var_8_8:SetLineHoldTime(400)
	var_8_8:SetAnimMoveTime(300)
	var_8_8:SetAnimMoveSpeed(50)
	var_8_8:SetEndDelay(1500)
	var_8_8:SetCrossfadeTime(750)
	var_8_8:SetFadeInTime(300)
	var_8_8:SetFadeOutTime(300)
	var_8_8:SetMaxVisibleLines(1)
	var_8_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -392, 0, _1080p * 99, _1080p * 117)
	var_8_0:addElement(var_8_8)

	var_8_0.MatchInfo = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "MatchDate"

	var_8_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_10:setText("", 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 400, _1080p * 69, _1080p * 99)
	var_8_0:addElement(var_8_10)

	var_8_0.MatchDate = var_8_10

	local var_8_11
	local var_8_12 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_8_1
	})

	var_8_12.id = "ActiveMatch"

	var_8_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 86, _1080p * 7, _1080p * 24)
	var_8_0:addElement(var_8_12)

	var_8_0.ActiveMatch = var_8_12

	local function var_8_13()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_13

	local var_8_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_10:RegisterAnimationSequence("Selected", var_8_14)

	local function var_8_15()
		var_8_10:AnimateSequence("Selected")
	end

	var_8_0._sequences.Selected = var_8_15

	local var_8_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("IsActive", var_8_16)

	local function var_8_17()
		var_8_12:AnimateSequence("IsActive")
	end

	var_8_0._sequences.IsActive = var_8_17

	local var_8_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("IsNotActive", var_8_18)

	local function var_8_19()
		var_8_12:AnimateSequence("IsNotActive")
	end

	var_8_0._sequences.IsNotActive = var_8_19

	local var_8_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_10:RegisterAnimationSequence("NotSelected", var_8_20)

	local function var_8_21()
		var_8_10:AnimateSequence("NotSelected")
	end

	var_8_0._sequences.NotSelected = var_8_21

	var_8_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOver")
	end)
	var_8_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
	end)
	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("MLGScheduleButton", MLGScheduleButton)
LockTable(_M)
