module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		arg_1_0[iter_1_0].button.Image:setImage(RegisterMaterial(iter_1_1.icon))
		arg_1_0[iter_1_0].button:addEventHandler("button_action", arg_1_2)
		arg_1_0[iter_1_0].button:addEventHandler("button_over", arg_1_3)

		arg_1_0[iter_1_0].button.ref = iter_1_1.ref
		arg_1_0[iter_1_0].button.name = iter_1_1.name
		arg_1_0[iter_1_0].button.desc = iter_1_1.desc
		arg_1_0[iter_1_0].button.cost = iter_1_1.scoreCost

		arg_1_0[iter_1_0].costLabel:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL", iter_1_1.scoreCost))
		arg_1_0[iter_1_0].nameLabel:setText(Engine.CBBHFCGDIC(iter_1_1.name))

		arg_1_0[iter_1_0].kills = iter_1_1.kills
		arg_1_0[iter_1_0].scoreCost = iter_1_1.scoreCost

		if arg_1_0[iter_1_0].scoreCost == "0" then
			arg_1_0[iter_1_0].costLabel:SetAlpha(0, 0)
		end
	end
end

local function var_0_1(arg_2_0)
	arg_2_0.BindButton = LUI.UIBindButton.new()
	arg_2_0.BindButton.id = "BindButton"

	arg_2_0:addElement(arg_2_0.BindButton)
	arg_2_0.BindButton:addEventHandler("button_secondary", function(arg_3_0, arg_3_1)
		ACTIONS.LeaveMenu(arg_2_0)
	end)
	arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 0,
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_2_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		priority = 1,
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("CAS/SELECT")
	})
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ButtonStreak1)
	assert(arg_4_0.LabelStreak1)
	assert(arg_4_0.NameStreak1)
	assert(arg_4_0.ButtonStreak2)
	assert(arg_4_0.LabelStreak2)
	assert(arg_4_0.NameStreak2)
	assert(arg_4_0.ButtonStreak3)
	assert(arg_4_0.LabelStreak3)
	assert(arg_4_0.NameStreak3)

	if Engine.ECHCFGDDDF() then
		assert(arg_4_2.streaks and #arg_4_2.streaks == 3)
	end

	assert(arg_4_2.selection)
	assert(arg_4_2.onReplace)

	arg_4_0.showKills = arg_4_2.showKills
	arg_4_0.selection = arg_4_2.selection
	arg_4_0.CPDataSource = LUI.DataSourceFromPlayerData.new(CoD.StatsGroup.Coop, CoD.PlayMode.Aliens)

	arg_4_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_SELECT_SLOT_DESC", arg_4_2.selection.name))
	arg_4_0.SelectionImage:setImage(RegisterMaterial(arg_4_2.selection.icon))
	arg_4_0.LabelSelection:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL", tostring(arg_4_2.selection.scoreCost)))

	local function var_4_0(arg_5_0, arg_5_1)
		local var_5_0

		if arg_5_0.id == "ButtonStreak1" then
			var_5_0 = 0
		elseif arg_5_0.id == "ButtonStreak2" then
			var_5_0 = 1
		elseif arg_5_0.id == "ButtonStreak3" then
			var_5_0 = 2
		end

		local var_5_1 = arg_4_0.CPDataSource.coopCareerStats.currency:GetValue(arg_5_1.controller)

		if CONDITIONS.IsWaveGameType() then
			var_5_1 = DataSources.alwaysLoaded.CP.loadOut.currencyWaveLua:GetValue(arg_5_1.controller)
		end

		if var_5_1 - (tonumber(arg_4_0.selection.scoreCost) - tonumber(arg_5_0.cost)) >= 0 then
			arg_4_2.onReplace(arg_5_0.ref, var_5_0)
			ACTIONS.LeaveMenu(arg_4_0)
		end
	end

	local function var_4_1(arg_6_0, arg_6_1)
		arg_4_0.UpdateFocusInfo(arg_6_0, arg_6_1.controller)
	end

	local function var_4_2(arg_7_0, arg_7_1)
		arg_4_0.ChosenPreview.Name:setText(Engine.CBBHFCGDIC(arg_4_2.selection.name))
		arg_4_0.ChosenPreview.Desc:setText(Engine.CBBHFCGDIC(arg_4_2.selection.desc))
		arg_4_0.SwapPreview.Name:setText(Engine.CBBHFCGDIC(arg_7_0.name))
		arg_4_0.SwapPreview.Desc:setText(Engine.CBBHFCGDIC(arg_7_0.desc))

		if arg_7_0.ref == "empty1" or arg_7_0.ref == "empty2" or arg_7_0.ref == "empty3" then
			ACTIONS.AnimateSequence(arg_4_0, "HideDetails")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ShowDetails")
		end

		local var_7_0 = tonumber(arg_4_0.selection.scoreCost)
		local var_7_1 = tonumber(arg_7_0.cost) - var_7_0
		local var_7_2 = arg_4_0.CPDataSource.coopCareerStats.currency:GetValue(arg_7_1)

		if CONDITIONS.IsWaveGameType() then
			var_7_2 = DataSources.alwaysLoaded.CP.loadOut.currencyWaveLua:GetValue(arg_7_1)
		end

		if var_7_1 < 0 then
			arg_4_0.Difference:SetRGBFromTable(SWATCHES.HUDWarnings.danger, 0)

			if var_7_2 + var_7_1 < 0 then
				arg_4_0.Difference:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_NOT_ENOUGH_CURRENCY"))
			else
				arg_4_0.Difference:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL", tostring(var_7_1)))
			end
		else
			arg_4_0.Difference:SetRGBFromTable(SWATCHES.icon.newIcon, 0)
			arg_4_0.Difference:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL", tostring(var_7_1)))
		end

		local var_7_3

		if arg_7_0.id == "ButtonStreak1" then
			var_7_3 = "slot0"
		elseif arg_7_0.id == "ButtonStreak2" then
			var_7_3 = "slot1"
		elseif arg_7_0.id == "ButtonStreak3" then
			var_7_3 = "slot2"
		end

		ACTIONS.AnimateSequence(arg_4_0, var_7_3)
	end

	arg_4_0.UpdateFocusInfo = var_4_2
	arg_4_0.streakElements = {
		{
			button = arg_4_0.ButtonStreak1,
			costLabel = arg_4_0.LabelStreak1,
			nameLabel = arg_4_0.NameStreak1
		},
		{
			button = arg_4_0.ButtonStreak2,
			costLabel = arg_4_0.LabelStreak2,
			nameLabel = arg_4_0.NameStreak2
		},
		{
			button = arg_4_0.ButtonStreak3,
			costLabel = arg_4_0.LabelStreak3,
			nameLabel = arg_4_0.NameStreak3
		}
	}

	var_0_0(arg_4_0.streakElements, arg_4_2.streaks, var_4_0, var_4_1)
	var_0_1(arg_4_0)
	var_4_2(arg_4_0.ButtonStreak1, arg_4_1)
end

function CPMunitionReplacePopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIHorizontalNavigator.new()

	var_8_0.id = "CPMunitionReplacePopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_4:SetScale(1, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -855, _1080p * 855, _1080p * 65, _1080p * 952)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "ChosenPreview"

	var_8_8.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SWAP_EQUIP"), 0)
	var_8_8.Kills:SetAlpha(0, 0)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -460, _1080p * -60, _1080p * 676, _1080p * 916)
	var_8_0:addElement(var_8_8)

	var_8_0.ChosenPreview = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("SwapStreakPreview", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "SwapPreview"

	var_8_10.Label:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SWAP_REPLACE"), 0)
	var_8_10.Kills:SetAlpha(0, 0)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 60, _1080p * 460, _1080p * 676, _1080p * 916)
	var_8_0:addElement(var_8_10)

	var_8_0.SwapPreview = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "Title"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_8_12:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_SWAP")), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -539, _1080p * 539, _1080p * 81, _1080p * 141)
	var_8_0:addElement(var_8_12)

	var_8_0.Title = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIText.new()

	var_8_14.id = "Message"

	var_8_14:SetAlpha(0.8, 0)
	var_8_14:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_SELECT_SLOT_DESC"), 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -640, _1080p * 640, _1080p * 155, _1080p * 179)
	var_8_0:addElement(var_8_14)

	var_8_0.Message = var_8_14

	local var_8_15
	local var_8_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_8_17 = LUI.UIBorder.new(var_8_16)

	var_8_17.id = "Border"

	var_8_17:SetRGBFromTable(SWATCHES.HUD.HUDPrimary, 0)
	var_8_17:SetAlpha(0.25, 0)
	var_8_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -258, _1080p * -166, _1080p * 538, _1080p * 630)
	var_8_0:addElement(var_8_17)

	var_8_0.Border = var_8_17

	local var_8_18
	local var_8_19 = LUI.UIImage.new()

	var_8_19.id = "SelectionImage"

	var_8_19:SetScale(0.5, 0)
	var_8_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -236, _1080p * -188, _1080p * 560, _1080p * 608)
	var_8_0:addElement(var_8_19)

	var_8_0.SelectionImage = var_8_19

	local var_8_20
	local var_8_21 = MenuBuilder.BuildRegisteredType("StreakButton", {
		controllerIndex = var_8_1
	})

	var_8_21.id = "ButtonStreak1"

	var_8_21:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -254, _1080p * -170, _1080p * 293, _1080p * 409)
	var_8_0:addElement(var_8_21)

	var_8_0.ButtonStreak1 = var_8_21

	local var_8_22
	local var_8_23 = LUI.UIText.new()

	var_8_23.id = "LabelStreak1"

	var_8_23:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_23:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_COST_LABEL"), 0)
	var_8_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_23:SetAlignment(LUI.Alignment.Center)
	var_8_23:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -318, _1080p * -106, _1080p * 422, _1080p * 440)
	var_8_0:addElement(var_8_23)

	var_8_0.LabelStreak1 = var_8_23

	local var_8_24
	local var_8_25 = LUI.UIText.new()

	var_8_25.id = "NameStreak1"

	var_8_25:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_25:setText("", 0)
	var_8_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_25:SetAlignment(LUI.Alignment.Center)
	var_8_25:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -318, _1080p * -106, _1080p * 440, _1080p * 458)
	var_8_0:addElement(var_8_25)

	var_8_0.NameStreak1 = var_8_25

	local var_8_26
	local var_8_27 = MenuBuilder.BuildRegisteredType("StreakButton", {
		controllerIndex = var_8_1
	})

	var_8_27.id = "ButtonStreak2"

	var_8_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -42, _1080p * 42, _1080p * 293, _1080p * 409)
	var_8_0:addElement(var_8_27)

	var_8_0.ButtonStreak2 = var_8_27

	local var_8_28
	local var_8_29 = LUI.UIText.new()

	var_8_29.id = "LabelStreak2"

	var_8_29:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_29:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_COST_LABEL"), 0)
	var_8_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_29:SetAlignment(LUI.Alignment.Center)
	var_8_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -106, _1080p * 106, _1080p * 422, _1080p * 440)
	var_8_0:addElement(var_8_29)

	var_8_0.LabelStreak2 = var_8_29

	local var_8_30
	local var_8_31 = LUI.UIText.new()

	var_8_31.id = "NameStreak2"

	var_8_31:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_31:setText("", 0)
	var_8_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_31:SetAlignment(LUI.Alignment.Center)
	var_8_31:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -106, _1080p * 106, _1080p * 440, _1080p * 458)
	var_8_0:addElement(var_8_31)

	var_8_0.NameStreak2 = var_8_31

	local var_8_32
	local var_8_33 = MenuBuilder.BuildRegisteredType("StreakButton", {
		controllerIndex = var_8_1
	})

	var_8_33.id = "ButtonStreak3"

	var_8_33:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 170, _1080p * 254, _1080p * 293, _1080p * 409)
	var_8_0:addElement(var_8_33)

	var_8_0.ButtonStreak3 = var_8_33

	local var_8_34
	local var_8_35 = LUI.UIText.new()

	var_8_35.id = "LabelStreak3"

	var_8_35:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_35:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_COST_LABEL"), 0)
	var_8_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_35:SetAlignment(LUI.Alignment.Center)
	var_8_35:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 106, _1080p * 318, _1080p * 422, _1080p * 440)
	var_8_0:addElement(var_8_35)

	var_8_0.LabelStreak3 = var_8_35

	local var_8_36
	local var_8_37 = LUI.UIText.new()

	var_8_37.id = "NameStreak3"

	var_8_37:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_8_37:setText("", 0)
	var_8_37:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_37:SetAlignment(LUI.Alignment.Center)
	var_8_37:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 106, _1080p * 318, _1080p * 440, _1080p * 458)
	var_8_0:addElement(var_8_37)

	var_8_0.NameStreak3 = var_8_37

	local var_8_38
	local var_8_39 = LUI.UIText.new()

	var_8_39.id = "LabelSelection"

	var_8_39:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_39:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITION_SELECTION_COST_LABEL"), 0)
	var_8_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_39:SetAlignment(LUI.Alignment.Center)
	var_8_39:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -318, _1080p * -106, _1080p * 635, _1080p * 653)
	var_8_0:addElement(var_8_39)

	var_8_0.LabelSelection = var_8_39

	local var_8_40
	local var_8_41 = LUI.UIText.new()

	var_8_41.id = "MessageLine1"

	var_8_41:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_41:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_REPLACE_TEXT"), 0)
	var_8_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_41:SetAlignment(LUI.Alignment.Center)
	var_8_41:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -462, _1080p * 462, _1080p * 212, _1080p * 232)
	var_8_0:addElement(var_8_41)

	var_8_0.MessageLine1 = var_8_41

	local var_8_42
	local var_8_43 = LUI.UIImage.new()

	var_8_43.id = "arrow"

	var_8_43:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_43:SetScale(-0.4, 0)
	var_8_43:setImage(RegisterMaterial("icon_munition_swap"), 0)
	var_8_43:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -244, _1080p * -180, _1080p * 459, _1080p * 523)
	var_8_0:addElement(var_8_43)

	var_8_0.arrow = var_8_43

	local var_8_44
	local var_8_45 = LUI.UIText.new()

	var_8_45.id = "Difference"

	var_8_45:SetRGBFromTable(SWATCHES.icon.newIcon, 0)
	var_8_45:setText("", 0)
	var_8_45:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_45:SetAlignment(LUI.Alignment.Center)
	var_8_45:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -318, _1080p * -106, _1080p * 515, _1080p * 533)
	var_8_0:addElement(var_8_45)

	var_8_0.Difference = var_8_45

	local var_8_46
	local var_8_47 = LUI.UIText.new()

	var_8_47.id = "MessageLine2"

	var_8_47:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_8_47:setText(Engine.CBBHFCGDIC("LUA_MENU/MUNITIONS_REPLACE_TEXT_2"), 0)
	var_8_47:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_47:SetAlignment(LUI.Alignment.Center)
	var_8_47:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -462, _1080p * 462, _1080p * 232, _1080p * 252)
	var_8_0:addElement(var_8_47)

	var_8_0.MessageLine2 = var_8_47

	local var_8_48
	local var_8_49 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_49.id = "ButtonHelperBar"

	var_8_49.Background:SetAlpha(0, 0)
	var_8_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 952, _1080p * 1012)
	var_8_0:addElement(var_8_49)

	var_8_0.ButtonHelperBar = var_8_49

	local function var_8_50()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_50

	local var_8_51
	local var_8_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -166
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -258
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -166
		}
	}

	var_8_17:RegisterAnimationSequence("slot0", var_8_52)

	local var_8_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -236
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -188
		}
	}

	var_8_19:RegisterAnimationSequence("slot0", var_8_53)

	local var_8_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_25:RegisterAnimationSequence("slot0", var_8_54)

	local var_8_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_31:RegisterAnimationSequence("slot0", var_8_55)

	local var_8_56 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_37:RegisterAnimationSequence("slot0", var_8_56)

	local var_8_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		}
	}

	var_8_39:RegisterAnimationSequence("slot0", var_8_57)

	local var_8_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -244
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -180
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -244
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -180
		}
	}

	var_8_43:RegisterAnimationSequence("slot0", var_8_58)

	local var_8_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -318
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -106
		}
	}

	var_8_45:RegisterAnimationSequence("slot0", var_8_59)

	local function var_8_60()
		var_8_17:AnimateSequence("slot0")
		var_8_19:AnimateSequence("slot0")
		var_8_25:AnimateSequence("slot0")
		var_8_31:AnimateSequence("slot0")
		var_8_37:AnimateSequence("slot0")
		var_8_39:AnimateSequence("slot0")
		var_8_43:AnimateSequence("slot0")
		var_8_45:AnimateSequence("slot0")
	end

	var_8_0._sequences.slot0 = var_8_60

	local var_8_61
	local var_8_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 44
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -47
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 45
		}
	}

	var_8_17:RegisterAnimationSequence("slot1", var_8_62)

	local var_8_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -25
		}
	}

	var_8_19:RegisterAnimationSequence("slot1", var_8_63)

	local var_8_64 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_25:RegisterAnimationSequence("slot1", var_8_64)

	local var_8_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_31:RegisterAnimationSequence("slot1", var_8_65)

	local var_8_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_37:RegisterAnimationSequence("slot1", var_8_66)

	local var_8_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 104
		}
	}

	var_8_39:RegisterAnimationSequence("slot1", var_8_67)

	local var_8_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 30
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -33
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 31
		}
	}

	var_8_43:RegisterAnimationSequence("slot1", var_8_68)

	local var_8_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -107
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 105
		}
	}

	var_8_45:RegisterAnimationSequence("slot1", var_8_69)

	local function var_8_70()
		var_8_17:AnimateSequence("slot1")
		var_8_19:AnimateSequence("slot1")
		var_8_25:AnimateSequence("slot1")
		var_8_31:AnimateSequence("slot1")
		var_8_37:AnimateSequence("slot1")
		var_8_39:AnimateSequence("slot1")
		var_8_43:AnimateSequence("slot1")
		var_8_45:AnimateSequence("slot1")
	end

	var_8_0._sequences.slot1 = var_8_70

	local var_8_71
	local var_8_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 257
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 166
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 258
		}
	}

	var_8_17:RegisterAnimationSequence("slot2", var_8_72)

	local var_8_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 236
		}
	}

	var_8_19:RegisterAnimationSequence("slot2", var_8_73)

	local var_8_74 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_25:RegisterAnimationSequence("slot2", var_8_74)

	local var_8_75 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_8_31:RegisterAnimationSequence("slot2", var_8_75)

	local var_8_76 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_8_37:RegisterAnimationSequence("slot2", var_8_76)

	local var_8_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 105
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 317
		}
	}

	var_8_39:RegisterAnimationSequence("slot2", var_8_77)

	local var_8_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 179
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 243
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 180
		},
		{
			duration = 10,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 244
		}
	}

	var_8_43:RegisterAnimationSequence("slot2", var_8_78)

	local var_8_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 318
		}
	}

	var_8_45:RegisterAnimationSequence("slot2", var_8_79)

	local function var_8_80()
		var_8_17:AnimateSequence("slot2")
		var_8_19:AnimateSequence("slot2")
		var_8_25:AnimateSequence("slot2")
		var_8_31:AnimateSequence("slot2")
		var_8_37:AnimateSequence("slot2")
		var_8_39:AnimateSequence("slot2")
		var_8_43:AnimateSequence("slot2")
		var_8_45:AnimateSequence("slot2")
	end

	var_8_0._sequences.slot2 = var_8_80

	local var_8_81
	local var_8_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("HideDetails", var_8_82)

	local var_8_83 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("HideDetails", var_8_83)

	local function var_8_84()
		var_8_8:AnimateSequence("HideDetails")
		var_8_10:AnimateSequence("HideDetails")
	end

	var_8_0._sequences.HideDetails = var_8_84

	local var_8_85
	local var_8_86 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_8:RegisterAnimationSequence("ShowDetails", var_8_86)

	local var_8_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ShowDetails", var_8_87)

	local function var_8_88()
		var_8_8:AnimateSequence("ShowDetails")
		var_8_10:AnimateSequence("ShowDetails")
	end

	var_8_0._sequences.ShowDetails = var_8_88

	var_8_4:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_8_1
		end

		ACTIONS.ScaleFullscreen(var_8_0)
	end)
	var_0_2(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("CPMunitionReplacePopup", CPMunitionReplacePopup)
LockTable(_M)
