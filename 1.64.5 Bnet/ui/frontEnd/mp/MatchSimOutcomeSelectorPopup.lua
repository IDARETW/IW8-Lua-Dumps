module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.WinButton)
	assert(arg_1_0.WinButtonComplete)
	assert(arg_1_0.WinButtonTier1)
	assert(arg_1_0.WinButtonTier2)
	assert(arg_1_0.WinButtonTier3)
	assert(arg_1_0.LoseButton)
	assert(arg_1_0.LoseButtonComplete)
	assert(arg_1_0.LoseButtonTier1)
	assert(arg_1_0.LoseButtonTier2)
	assert(arg_1_0.LoseButtonTier3)
	assert(arg_1_0.PlayButton)

	if arg_1_2.winAction then
		arg_1_0.WinButton:addEventHandler("button_action", arg_1_2.winAction)
	end

	if arg_1_2.winCompleteAction then
		arg_1_0.WinButtonComplete:addEventHandler("button_action", arg_1_2.winCompleteAction)
	end

	if arg_1_2.winTier1Action then
		arg_1_0.WinButtonTier1:addEventHandler("button_action", arg_1_2.winTier1Action)
	end

	if arg_1_2.winTier2Action then
		arg_1_0.WinButtonTier2:addEventHandler("button_action", arg_1_2.winTier2Action)
	end

	if arg_1_2.winTier3Action then
		arg_1_0.WinButtonTier3:addEventHandler("button_action", arg_1_2.winTier3Action)
	end

	if arg_1_2.loseAction then
		arg_1_0.LoseButton:addEventHandler("button_action", arg_1_2.loseAction)
	end

	if arg_1_2.loseCompleteAction then
		arg_1_0.LoseButtonComplete:addEventHandler("button_action", arg_1_2.loseCompleteAction)
	end

	if arg_1_2.loseTier1Action then
		arg_1_0.LoseButtonTier1:addEventHandler("button_action", arg_1_2.loseTier1Action)
	end

	if arg_1_2.loseTier2Action then
		arg_1_0.LoseButtonTier2:addEventHandler("button_action", arg_1_2.loseTier2Action)
	end

	if arg_1_2.loseTier3Action then
		arg_1_0.LoseButtonTier3:addEventHandler("button_action", arg_1_2.loseTier3Action)
	end

	if arg_1_2.playAction then
		arg_1_0.PlayButton:addEventHandler("button_action", arg_1_2.playAction)
	end

	if arg_1_2.battlePassAction1 then
		arg_1_0.BattlePassButton1:addEventHandler("button_action", arg_1_2.battlePassAction1)
	end

	if arg_1_2.battlePassAction2 then
		arg_1_0.BattlePassButton2:addEventHandler("button_action", arg_1_2.battlePassAction2)
	end

	if arg_1_2.battlePassAction3 then
		arg_1_0.BattlePassButton3:addEventHandler("button_action", arg_1_2.battlePassAction3)
	end

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_1_0, "WZSetup")
	end
end

function MatchSimOutcomeSelectorPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalNavigator.new()

	var_2_0.id = "MatchSimOutcomeSelectorPopup"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("GenericPopup", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "GenericPopup"

	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -340, _1080p * 418)
	var_2_0:addElement(var_2_4)

	var_2_0.GenericPopup = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "PointsFull"

	var_2_6:setText("Choose a match condition", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -298, _1080p * -262)
	var_2_0:addElement(var_2_6)

	var_2_0.PointsFull = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "WinButton"

	var_2_8.Text:SetLeft(_1080p * 20, 0)
	var_2_8.Text:setText("Win Game - Fail Mission", 0)
	var_2_8.Text:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -215, _1080p * -172)
	var_2_0:addElement(var_2_8)

	var_2_0.WinButton = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "WinButtonComplete"

	var_2_10.Text:SetLeft(_1080p * 20, 0)
	var_2_10.Text:setText("Win Game - Complete Mission", 0)
	var_2_10.Text:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -172, _1080p * -129)
	var_2_0:addElement(var_2_10)

	var_2_0.WinButtonComplete = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "WinButtonTier1"

	var_2_12.Text:SetLeft(_1080p * 20, 0)
	var_2_12.Text:setText("Win Game - Bronze", 0)
	var_2_12.Text:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -129, _1080p * -86)
	var_2_0:addElement(var_2_12)

	var_2_0.WinButtonTier1 = var_2_12

	local var_2_13
	local var_2_14 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_14.id = "WinButtonTier2"

	var_2_14.Text:SetLeft(_1080p * 20, 0)
	var_2_14.Text:setText("Win Game - Silver", 0)
	var_2_14.Text:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -86, _1080p * -43)
	var_2_0:addElement(var_2_14)

	var_2_0.WinButtonTier2 = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "WinButtonTier3"

	var_2_16.Text:SetLeft(_1080p * 20, 0)
	var_2_16.Text:setText("Win Game - Gold", 0)
	var_2_16.Text:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * -43, 0)
	var_2_0:addElement(var_2_16)

	var_2_0.WinButtonTier3 = var_2_16

	local var_2_17
	local var_2_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_18.id = "LoseButton"

	var_2_18.Text:SetLeft(_1080p * 20, 0)
	var_2_18.Text:setText("Lose Game - Fail Mission", 0)
	var_2_18.Text:SetAlignment(LUI.Alignment.Left)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, 0, _1080p * 43)
	var_2_0:addElement(var_2_18)

	var_2_0.LoseButton = var_2_18

	local var_2_19
	local var_2_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_20.id = "LoseButtonComplete"

	var_2_20.Text:SetLeft(_1080p * 20, 0)
	var_2_20.Text:setText("Lose Game - Complete Mission", 0)
	var_2_20.Text:SetAlignment(LUI.Alignment.Left)
	var_2_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 43, _1080p * 86)
	var_2_0:addElement(var_2_20)

	var_2_0.LoseButtonComplete = var_2_20

	local var_2_21
	local var_2_22 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_22.id = "LoseButtonTier1"

	var_2_22.Text:SetLeft(_1080p * 20, 0)
	var_2_22.Text:setText("Lose Game - Bronze", 0)
	var_2_22.Text:SetAlignment(LUI.Alignment.Left)
	var_2_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 86, _1080p * 129)
	var_2_0:addElement(var_2_22)

	var_2_0.LoseButtonTier1 = var_2_22

	local var_2_23
	local var_2_24 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_24.id = "LoseButtonTier2"

	var_2_24.Text:SetLeft(_1080p * 20, 0)
	var_2_24.Text:setText("Lose Game - Silver", 0)
	var_2_24.Text:SetAlignment(LUI.Alignment.Left)
	var_2_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -215.5, _1080p * 215.5, _1080p * 129, _1080p * 172)
	var_2_0:addElement(var_2_24)

	var_2_0.LoseButtonTier2 = var_2_24

	local var_2_25
	local var_2_26 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_26.id = "LoseButtonTier3"

	var_2_26.Text:SetLeft(_1080p * 20, 0)
	var_2_26.Text:setText("Lose Game - Gold", 0)
	var_2_26.Text:SetAlignment(LUI.Alignment.Left)
	var_2_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * 172, _1080p * 215)
	var_2_0:addElement(var_2_26)

	var_2_0.LoseButtonTier3 = var_2_26

	local var_2_27
	local var_2_28 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_28.id = "PlayButton"

	var_2_28.Text:SetLeft(_1080p * 20, 0)
	var_2_28.Text:setText("Play Game with Bots", 0)
	var_2_28.Text:SetAlignment(LUI.Alignment.Left)
	var_2_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * 215, _1080p * 258)
	var_2_0:addElement(var_2_28)

	var_2_0.PlayButton = var_2_28

	local var_2_29
	local var_2_30 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_30.id = "BattlePassButton1"

	var_2_30.Text:SetLeft(_1080p * 20, 0)
	var_2_30.Text:setText("Battle pass xp 10000", 0)
	var_2_30.Text:SetAlignment(LUI.Alignment.Left)
	var_2_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * 258, _1080p * 301)
	var_2_0:addElement(var_2_30)

	var_2_0.BattlePassButton1 = var_2_30

	local var_2_31
	local var_2_32 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_32.id = "BattlePassButton2"

	var_2_32.Text:SetLeft(_1080p * 20, 0)
	var_2_32.Text:setText(ToUpperCase("Battle pass xp 100000"), 0)
	var_2_32.Text:SetAlignment(LUI.Alignment.Left)
	var_2_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * 301, _1080p * 345)
	var_2_0:addElement(var_2_32)

	var_2_0.BattlePassButton2 = var_2_32

	local var_2_33
	local var_2_34 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_34.id = "BattlePassButton3"

	var_2_34.Text:SetLeft(_1080p * 20, 0)
	var_2_34.Text:setText(ToUpperCase("Battle pass xp 1000000"), 0)
	var_2_34.Text:SetAlignment(LUI.Alignment.Left)
	var_2_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * 345, _1080p * 389)
	var_2_0:addElement(var_2_34)

	var_2_0.BattlePassButton3 = var_2_34

	local function var_2_35()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_35

	local var_2_36
	local var_2_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_bkg_challenge"),
			child = var_2_0.GenericPopup.Box
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_2_0.GenericPopup.Background
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_2_0.GenericPopup.Box
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBorder,
			child = var_2_0.GenericPopup.Border
		}
	}

	var_2_4:RegisterAnimationSequence("WZSetup", var_2_37)

	local var_2_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_2_6:RegisterAnimationSequence("WZSetup", var_2_38)

	local function var_2_39()
		var_2_4:AnimateSequence("WZSetup")
		var_2_6:AnimateSequence("WZSetup")
	end

	var_2_0._sequences.WZSetup = var_2_39

	var_2_8:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_10:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_12:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_14:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_16:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_18:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_20:addEventHandler("button_action", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_22:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_24:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_26:addEventHandler("button_action", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_28:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_2_30:addEventHandler("button_action", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)

	function var_2_0.addButtonHelperFunction(arg_17_0, arg_17_1)
		arg_17_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_2_0:addEventHandler("menu_create", var_2_0.addButtonHelperFunction)

	local var_2_40 = LUI.UIBindButton.new()

	var_2_40.id = "selfBindButton"

	var_2_0:addElement(var_2_40)

	var_2_0.bindButton = var_2_40

	var_2_0.bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("MatchSimOutcomeSelectorPopup", MatchSimOutcomeSelectorPopup)
LockTable(_M)
