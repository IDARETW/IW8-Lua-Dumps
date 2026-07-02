module(..., package.seeall)

local var_0_0 = 10 * _1080p

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5, arg_1_6)
	ACTIONS.AnimateSequence(arg_1_0, "ResetTags")

	local var_1_0 = {}
	local var_1_1 = 200

	if arg_1_4 then
		arg_1_0.LimitedTimeTag:SetAlpha(1)
		table.insert(var_1_0, arg_1_0.LimitedTimeTag)
	else
		arg_1_0.LimitedTimeTag:SetAlpha(0)
	end

	if arg_1_5 then
		arg_1_0.DoubleXPActive:SetAlpha(1)
		table.insert(var_1_0, arg_1_0.DoubleXPActive)
	else
		arg_1_0.DoubleXPActive:SetAlpha(0)
	end

	if arg_1_2 then
		arg_1_0.CrossplayRequiredTag:SetAlpha(1)
		table.insert(var_1_0, arg_1_0.CrossplayRequiredTag)
	else
		arg_1_0.CrossplayRequiredTag:SetAlpha(0)
	end

	if arg_1_6 then
		arg_1_0.SquadFillRequired:SetAlpha(1)
		table.insert(var_1_0, arg_1_0.SquadFillRequired)
	else
		arg_1_0.SquadFillRequired:SetAlpha(0)
	end

	if arg_1_1 then
		arg_1_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
		table.insert(var_1_0, arg_1_0.EquippedWidget)
	else
		arg_1_0.EquippedWidget:SetAlpha(0)
	end

	arg_1_0.showSplitscreen = arg_1_3

	if arg_1_3 then
		arg_1_0:Wait(var_1_1, true).onComplete = function()
			if arg_1_0.showSplitscreen then
				arg_1_0.WarningMessage:SetAlpha(1, 200)
			else
				arg_1_0.WarningMessage:SetAlpha(0)
			end
		end

		table.insert(var_1_0, arg_1_0.WarningMessage)
	else
		arg_1_0.WarningMessage:SetAlpha(0)
	end

	if arg_1_0:getParent()._isCDLTabFocused then
		table.insert(var_1_0, arg_1_0.ViewRulesPrompt)
	end

	local var_1_2 = 0

	if #var_1_0 > 0 then
		var_1_2 = LAYOUT.GetElementHeight(var_1_0[1]) + var_0_0
	end

	for iter_1_0 = 2, #var_1_0 do
		local var_1_3 = var_1_0[iter_1_0 - 1]:GetCurrentAnchorsAndPositions().bottom + var_0_0
		local var_1_4 = LAYOUT.GetElementHeight(var_1_0[iter_1_0])

		var_1_0[iter_1_0]:SetTop(var_1_3, var_1_1)
		var_1_0[iter_1_0]:SetBottom(var_1_3 + var_1_4, var_1_1)

		var_1_2 = var_1_2 + var_1_4 + var_0_0
	end

	if arg_1_0._backerHeightOriginal == nil then
		arg_1_0._backerHeightOriginal = arg_1_0.DoubleNotchedBacker:GetCurrentAnchorsAndPositions().bottom
	end

	arg_1_0.DoubleNotchedBacker:SetBottom(var_1_2 + arg_1_0._backerHeightOriginal, var_1_1)
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.PartySizeCount)
	assert(arg_3_0.ScoreLimitCount)
	assert(arg_3_0.MatchTimeCount)

	arg_3_0.UpdatePanel = var_0_1
	arg_3_0._backerHeightOriginal = arg_3_0.DoubleNotchedBacker:GetCurrentAnchorsAndPositions().bottom

	arg_3_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/SELECTED"))
	arg_3_0.CrossplayRequiredTag:SetBlueprintText(Engine.CBBHFCGDIC("LUA_MENU/CROSSPLAY_REQUIRED"))
	arg_3_0.DoubleXPActive:SetBlueprintText(Engine.CBBHFCGDIC("LUA_MENU_MP/DOUBLE_XP"))
	arg_3_0.SquadFillRequired:SetBlueprintText(Engine.CBBHFCGDIC("LUA_MENU/SQUAD_FILL_REQUIRED"))

	local function var_3_0(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_1.numRounds:GetValue(arg_3_1)

		if var_4_0 and var_4_0 > 0 then
			arg_4_0.ScoreLimitHeader:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ROUND_LIMIT"))
			arg_4_0.ScoreLimitCount:setText(var_4_0)
			arg_4_0.MatchTime:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ROUND_TIME"))
		else
			local var_4_1 = arg_4_1.scoreLimit:GetValue(arg_3_1)

			if var_4_1 ~= nil and var_4_1 > 0 then
				arg_4_0.ScoreLimitHeader:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SCORE_LIMIT"))
				arg_4_0.ScoreLimitCount:setText(var_4_1)
			else
				arg_4_0.ScoreLimitHeader:setText(Engine.CBBHFCGDIC("MENU/OBJECTIVE"))
				arg_4_0.ScoreLimitCount:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SURVIVE"))
			end

			arg_4_0.MatchTime:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/MATCH_TIME"))
		end
	end

	arg_3_0:SubscribeToDataSourceThroughElement(arg_3_0, nil, function()
		local var_5_0 = arg_3_0:GetDataSource()

		if var_5_0 then
			local var_5_1 = var_5_0.minPartySize:GetValue(arg_3_1)
			local var_5_2 = var_5_0.maxPartySize:GetValue(arg_3_1)
			local var_5_3 = Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYLIST_NUMBER", var_5_1, var_5_2)

			arg_3_0.PartySizeCount:setText(var_5_3)

			local var_5_4 = var_5_0.timeLimit:GetValue(arg_3_1)
			local var_5_5 = 0

			if var_5_4 and var_5_4 ~= nil then
				var_5_5 = var_5_4 / 60
			end

			if var_5_5 > 1 then
				arg_3_0.MatchTimeCount:setText(Engine.CBBHFCGDIC("LUA_MENU/MINUTES_GENERIC", var_5_5))
			elseif var_5_5 == 1 then
				arg_3_0.MatchTimeCount:setText(Engine.CBBHFCGDIC("LUA_MENU/MINUTE_GENERIC", var_5_5))
			elseif var_5_5 > 0 and var_5_5 < 1 then
				arg_3_0.MatchTimeCount:setText(Engine.CBBHFCGDIC("LUA_MENU/SECONDS_GENERIC", var_5_4))
			else
				arg_3_0.MatchTimeCount:setText(Engine.CBBHFCGDIC("MENU/UNLIMITED"))
			end

			if not CONDITIONS.IsMagmaGameMode() then
				var_3_0(arg_3_0, var_5_0)
			end
		end
	end)

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_3_0, "HideScoreLimit")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function PlaylistDetails(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 770 * _1080p, 0, 380 * _1080p)

	var_6_0.id = "PlaylistDetails"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "DoubleNotchedBacker"

	var_6_4:SetAlpha(0.6, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 269)
	var_6_0:addElement(var_6_4)

	var_6_0.DoubleNotchedBacker = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "PlaylistIcon"

	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 165, _1080p * 19, _1080p * 161)

	local function var_6_7()
		local var_7_0 = var_6_0:GetDataSource().image:GetValue(var_6_1)

		if var_7_0 ~= nil then
			var_6_6:setImage(RegisterMaterial(var_7_0), 0)
		end
	end

	var_6_6:SubscribeToModelThroughElement(var_6_0, "image", var_6_7)
	var_6_0:addElement(var_6_6)

	var_6_0.PlaylistIcon = var_6_6

	local var_6_8
	local var_6_9 = LUI.UIStyledText.new()

	var_6_9.id = "PlaylistName"

	var_6_9:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_9:SetAlignment(LUI.Alignment.Left)
	var_6_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_9:SetStartupDelay(1000)
	var_6_9:SetLineHoldTime(400)
	var_6_9:SetAnimMoveTime(150)
	var_6_9:SetAnimMoveSpeed(50)
	var_6_9:SetEndDelay(1000)
	var_6_9:SetCrossfadeTime(400)
	var_6_9:SetFadeInTime(300)
	var_6_9:SetFadeOutTime(300)
	var_6_9:SetMaxVisibleLines(1)
	var_6_9:SetDecodeLetterLength(20)
	var_6_9:SetDecodeMaxRandChars(6)
	var_6_9:SetDecodeUpdatesPerLetter(4)
	var_6_9:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 174, _1080p * -16, _1080p * 20, _1080p * 70)

	local function var_6_10()
		local var_8_0 = var_6_0:GetDataSource().name:GetValue(var_6_1)

		if var_8_0 ~= nil then
			var_6_9:setText(ToUpperCase(var_8_0), 0)
		end
	end

	var_6_9:SubscribeToModelThroughElement(var_6_0, "name", var_6_10)
	var_6_0:addElement(var_6_9)

	var_6_0.PlaylistName = var_6_9

	local var_6_11
	local var_6_12 = LUI.UIStyledText.new()

	var_6_12.id = "PlaylistDescription"

	var_6_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Left)
	var_6_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_12:SetShadowRGBFromInt(0, 0)
	var_6_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 174, _1080p * -106, _1080p * 70, _1080p * 90)

	local function var_6_13()
		local var_9_0 = var_6_0:GetDataSource().desc:GetValue(var_6_1)

		if var_9_0 ~= nil then
			var_6_12:setText(var_9_0, 0)
		end
	end

	var_6_12:SubscribeToModelThroughElement(var_6_0, "desc", var_6_13)
	var_6_0:addElement(var_6_12)

	var_6_0.PlaylistDescription = var_6_12

	local var_6_14
	local var_6_15 = LUI.UIImage.new()

	var_6_15.id = "TeamIcon"

	var_6_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_15:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_6_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 523, _1080p * 587, _1080p * 174, _1080p * 238)
	var_6_0:addElement(var_6_15)

	var_6_0.TeamIcon = var_6_15

	local var_6_16
	local var_6_17 = LUI.UIImage.new()

	var_6_17.id = "TimeIcon"

	var_6_17:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_17:setImage(RegisterMaterial("icon_playlist_match_time"), 0)
	var_6_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 87, _1080p * 174, _1080p * 238)
	var_6_0:addElement(var_6_17)

	var_6_0.TimeIcon = var_6_17

	local var_6_18
	local var_6_19 = LUI.UIStyledText.new()

	var_6_19.id = "PartySizeHeader"

	var_6_19:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_19:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PARTYSIZE"), 0)
	var_6_19:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_19:SetWordWrap(false)
	var_6_19:SetAlignment(LUI.Alignment.Left)
	var_6_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_19:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_19:SetStartupDelay(1000)
	var_6_19:SetLineHoldTime(400)
	var_6_19:SetAnimMoveTime(150)
	var_6_19:SetAnimMoveSpeed(50)
	var_6_19:SetEndDelay(1000)
	var_6_19:SetCrossfadeTime(400)
	var_6_19:SetFadeInTime(300)
	var_6_19:SetFadeOutTime(300)
	var_6_19:SetMaxVisibleLines(1)
	var_6_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 720, _1080p * 182, _1080p * 206)
	var_6_0:addElement(var_6_19)

	var_6_0.PartySizeHeader = var_6_19

	local var_6_20
	local var_6_21 = LUI.UIStyledText.new()

	var_6_21.id = "MatchTime"

	var_6_21:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_21:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_TIME_LABEL"), 0)
	var_6_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_21:SetWordWrap(false)
	var_6_21:SetAlignment(LUI.Alignment.Left)
	var_6_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_21:SetStartupDelay(1000)
	var_6_21:SetLineHoldTime(400)
	var_6_21:SetAnimMoveTime(150)
	var_6_21:SetAnimMoveSpeed(50)
	var_6_21:SetEndDelay(1000)
	var_6_21:SetCrossfadeTime(400)
	var_6_21:SetFadeInTime(300)
	var_6_21:SetFadeOutTime(300)
	var_6_21:SetMaxVisibleLines(1)
	var_6_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 93, _1080p * 264, _1080p * 182, _1080p * 206)
	var_6_0:addElement(var_6_21)

	var_6_0.MatchTime = var_6_21

	local var_6_22
	local var_6_23 = MenuBuilder.BuildRegisteredType("LimitedTimeItem", {
		controllerIndex = var_6_1
	})

	var_6_23.id = "LimitedTimeTag"

	var_6_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 324, _1080p * 254, _1080p * 284)
	var_6_0:addElement(var_6_23)

	var_6_0.LimitedTimeTag = var_6_23

	local var_6_24
	local var_6_25 = LUI.UIText.new()

	var_6_25.id = "PartySizeCount"

	var_6_25:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_25:setText("", 0)
	var_6_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_25:SetWordWrap(false)
	var_6_25:SetAlignment(LUI.Alignment.Left)
	var_6_25:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 593, _1080p * 735, _1080p * 210, _1080p * 234)
	var_6_0:addElement(var_6_25)

	var_6_0.PartySizeCount = var_6_25

	local var_6_26
	local var_6_27 = LUI.UIText.new()

	var_6_27.id = "MatchTimeCount"

	var_6_27:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_27:setText("", 0)
	var_6_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_27:SetWordWrap(false)
	var_6_27:SetAlignment(LUI.Alignment.Left)
	var_6_27:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 93, _1080p * 235, _1080p * 210, _1080p * 234)
	var_6_0:addElement(var_6_27)

	var_6_0.MatchTimeCount = var_6_27

	local var_6_28
	local var_6_29 = LUI.UIImage.new()

	var_6_29.id = "PlayersIcon"

	var_6_29:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_6_29:setImage(RegisterMaterial("icon_playlist_score"), 0)
	var_6_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 273, _1080p * 337, _1080p * 174, _1080p * 238)
	var_6_0:addElement(var_6_29)

	var_6_0.PlayersIcon = var_6_29

	local var_6_30
	local var_6_31 = LUI.UIStyledText.new()

	var_6_31.id = "ScoreLimitHeader"

	var_6_31:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_6_31:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/RULES_SCORE_LIMIT"), 0)
	var_6_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_31:SetWordWrap(false)
	var_6_31:SetAlignment(LUI.Alignment.Left)
	var_6_31:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_31:SetStartupDelay(1000)
	var_6_31:SetLineHoldTime(400)
	var_6_31:SetAnimMoveTime(150)
	var_6_31:SetAnimMoveSpeed(50)
	var_6_31:SetEndDelay(1000)
	var_6_31:SetCrossfadeTime(400)
	var_6_31:SetFadeInTime(300)
	var_6_31:SetFadeOutTime(300)
	var_6_31:SetMaxVisibleLines(1)
	var_6_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 343, _1080p * 485, _1080p * 182, _1080p * 206)
	var_6_0:addElement(var_6_31)

	var_6_0.ScoreLimitHeader = var_6_31

	local var_6_32
	local var_6_33 = LUI.UIText.new()

	var_6_33.id = "ScoreLimitCount"

	var_6_33:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_6_33:setText("", 0)
	var_6_33:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_33:SetWordWrap(false)
	var_6_33:SetAlignment(LUI.Alignment.Left)
	var_6_33:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 343, _1080p * 485, _1080p * 210, _1080p * 234)
	var_6_0:addElement(var_6_33)

	var_6_0.ScoreLimitCount = var_6_33

	local var_6_34
	local var_6_35 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_6_1
	})

	var_6_35.id = "EquippedWidget"

	var_6_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 161, _1080p * 254, _1080p * 284)
	var_6_0:addElement(var_6_35)

	var_6_0.EquippedWidget = var_6_35

	local var_6_36
	local var_6_37 = LUI.UIStyledText.new()

	var_6_37.id = "WarningMessage"

	var_6_37:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_6_37:setText("", 0)
	var_6_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_37:SetAlignment(LUI.Alignment.Left)
	var_6_37:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_37:SetShadowRGBFromInt(0, 0)
	var_6_37:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 25, _1080p * -28, _1080p * 254, _1080p * 274)
	var_6_0:addElement(var_6_37)

	var_6_0.WarningMessage = var_6_37

	local var_6_38
	local var_6_39 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_6_1
	})

	var_6_39.id = "CrossplayRequiredTag"

	var_6_39.Backer:SetAlpha(0, 0)
	var_6_39.BlueprintIcon:SetScale(0.5, 0)
	var_6_39.BlueprintIcon:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_6_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 159, _1080p * 254, _1080p * 284)
	var_6_0:addElement(var_6_39)

	var_6_0.CrossplayRequiredTag = var_6_39

	local var_6_40
	local var_6_41 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_6_1
	})

	var_6_41.id = "DoubleXPActive"

	var_6_41.Backer:SetAlpha(0, 0)
	var_6_41.BlueprintIcon:SetScale(0.5, 0)
	var_6_41.BlueprintIcon:setImage(RegisterMaterial("icon_double_xp"), 0)
	var_6_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 159, _1080p * 254, _1080p * 284)
	var_6_0:addElement(var_6_41)

	var_6_0.DoubleXPActive = var_6_41

	local var_6_42
	local var_6_43 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_6_1
	})

	var_6_43.id = "ViewRulesPrompt"

	if CONDITIONS.AlwaysFalse(var_6_0) then
		var_6_43.Label:setText(Engine.CBBHFCGDIC("MENU/CDL_RULES_PROMPT"), 0)
	end

	var_6_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 193, _1080p * 253, _1080p * 284)
	var_6_0:addElement(var_6_43)

	var_6_0.ViewRulesPrompt = var_6_43

	local var_6_44
	local var_6_45 = MenuBuilder.BuildRegisteredType("BlueprintTag", {
		controllerIndex = var_6_1
	})

	var_6_45.id = "SquadFillRequired"

	var_6_45.Backer:SetAlpha(0, 0)
	var_6_45.BlueprintIcon:SetScale(0.5, 0)
	var_6_45.BlueprintIcon:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_6_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 24, _1080p * 160, _1080p * 289, _1080p * 319)
	var_6_0:addElement(var_6_45)

	var_6_0.SquadFillRequired = var_6_45

	local function var_6_46()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_46

	local var_6_47
	local var_6_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		}
	}

	var_6_12:RegisterAnimationSequence("AR", var_6_48)

	local var_6_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 214
		}
	}

	var_6_19:RegisterAnimationSequence("AR", var_6_49)

	local var_6_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 214
		}
	}

	var_6_21:RegisterAnimationSequence("AR", var_6_50)

	local var_6_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 242
		}
	}

	var_6_25:RegisterAnimationSequence("AR", var_6_51)

	local var_6_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 242
		}
	}

	var_6_27:RegisterAnimationSequence("AR", var_6_52)

	local var_6_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 214
		}
	}

	var_6_31:RegisterAnimationSequence("AR", var_6_53)

	local var_6_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 242
		}
	}

	var_6_33:RegisterAnimationSequence("AR", var_6_54)

	local function var_6_55()
		var_6_12:AnimateSequence("AR")
		var_6_19:AnimateSequence("AR")
		var_6_21:AnimateSequence("AR")
		var_6_25:AnimateSequence("AR")
		var_6_27:AnimateSequence("AR")
		var_6_31:AnimateSequence("AR")
		var_6_33:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_55

	local var_6_56
	local var_6_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 284
		}
	}

	var_6_23:RegisterAnimationSequence("ResetTags", var_6_57)

	local var_6_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 284
		}
	}

	var_6_35:RegisterAnimationSequence("ResetTags", var_6_58)

	local var_6_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 274
		}
	}

	var_6_37:RegisterAnimationSequence("ResetTags", var_6_59)

	local var_6_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 254
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 284
		}
	}

	var_6_39:RegisterAnimationSequence("ResetTags", var_6_60)

	local var_6_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 253
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 284
		}
	}

	var_6_43:RegisterAnimationSequence("ResetTags", var_6_61)

	local function var_6_62()
		var_6_23:AnimateSequence("ResetTags")
		var_6_35:AnimateSequence("ResetTags")
		var_6_37:AnimateSequence("ResetTags")
		var_6_39:AnimateSequence("ResetTags")
		var_6_43:AnimateSequence("ResetTags")
	end

	var_6_0._sequences.ResetTags = var_6_62

	local var_6_63
	local var_6_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_43:RegisterAnimationSequence("HidePrompt", var_6_64)

	local function var_6_65()
		var_6_43:AnimateSequence("HidePrompt")
	end

	var_6_0._sequences.HidePrompt = var_6_65

	local var_6_66
	local var_6_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_43:RegisterAnimationSequence("ShowPrompt", var_6_67)

	local function var_6_68()
		var_6_43:AnimateSequence("ShowPrompt")
	end

	var_6_0._sequences.ShowPrompt = var_6_68

	local var_6_69
	local var_6_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 273
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 337
		}
	}

	var_6_15:RegisterAnimationSequence("HideScoreLimit", var_6_70)

	local var_6_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 470
		}
	}

	var_6_19:RegisterAnimationSequence("HideScoreLimit", var_6_71)

	local var_6_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 343
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 485
		}
	}

	var_6_25:RegisterAnimationSequence("HideScoreLimit", var_6_72)

	local var_6_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_29:RegisterAnimationSequence("HideScoreLimit", var_6_73)

	local var_6_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_31:RegisterAnimationSequence("HideScoreLimit", var_6_74)

	local var_6_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_33:RegisterAnimationSequence("HideScoreLimit", var_6_75)

	local function var_6_76()
		var_6_15:AnimateSequence("HideScoreLimit")
		var_6_19:AnimateSequence("HideScoreLimit")
		var_6_25:AnimateSequence("HideScoreLimit")
		var_6_29:AnimateSequence("HideScoreLimit")
		var_6_31:AnimateSequence("HideScoreLimit")
		var_6_33:AnimateSequence("HideScoreLimit")
	end

	var_6_0._sequences.HideScoreLimit = var_6_76

	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("PlaylistDetails", PlaylistDetails)
LockTable(_M)
