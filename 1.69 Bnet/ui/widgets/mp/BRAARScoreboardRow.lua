module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Game.DHEDEIHGF() or DEFAULT_TEAM
	local var_1_1 = arg_1_0.index or 0

	if Game.DGCJIFGJBD(var_1_0, arg_1_0.index, true).isMuted ~= arg_1_0.rowData.isMuted then
		arg_1_1:RefreshContent()
		arg_1_0.scoreboardMenu:UpdateHelperBarText({
			shouldHidePlayerRowActionPrompts = arg_1_0.rowData.isCurrentPlayer or arg_1_0.rowData.isBot,
			isPlayerMuted = arg_1_0.rowData.isMuted
		})
	elseif arg_1_0.refreshMuteTimer == nil then
		local var_1_2 = 100

		arg_1_0.refreshMuteTimer = LUI.UITimer.new({
			interval = var_1_2,
			event = "checkClientConnection" .. var_1_1
		})
		arg_1_0.refreshMuteTimer.id = "refreshMuteTimer" .. var_1_1

		arg_1_0:addElement(arg_1_0.refreshMuteTimer)
		arg_1_0:registerEventHandler("checkClientConnection" .. var_1_1, function(arg_2_0, arg_2_1)
			local var_2_0 = Game.DHEDEIHGF() or DEFAULT_TEAM

			if Game.DGCJIFGJBD(var_2_0, var_1_1, true).isMuted ~= arg_1_0.rowData.isMuted then
				arg_1_1:RefreshContent()
				arg_1_0.scoreboardMenu:UpdateHelperBarText({
					shouldHidePlayerRowActionPrompts = arg_1_0.rowData.isCurrentPlayer or arg_1_0.rowData.isBot,
					isPlayerMuted = arg_1_0.rowData.isMuted
				})
				arg_1_0:RemoveElement(arg_1_0.refreshMuteTimer)
				arg_1_0.refreshMuteTimer:closeTree()

				arg_1_0.refreshMuteTimer = nil
			end
		end)
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_0:getParent()

		if var_4_0 and #var_4_0:getAllFocusedChildren() > 0 or var_4_0:isInFocus() then
			local var_4_1 = arg_4_0.rowData

			DebugPrint(" \n Mute action - toggle mute ")

			if var_4_1 and var_4_1.isBot == false and not var_4_1.isCurrentPlayer then
				local var_4_2 = SCOREBOARD.IsAARScoreboard()

				if var_4_1.clientNum and not var_4_2 then
					Game.CBEICJFEHB(var_4_1.clientNum)
				elseif var_4_1.xuid and var_4_2 and Lobby.BBDICGHE() then
					Lobby.CGCFCDJBH(arg_4_1.controller, var_4_1.xuid)
				end

				if not SCOREBOARD.IsAARScoreboard() then
					var_0_0(arg_4_0, var_4_0, arg_3_1)
				else
					var_4_0:RefreshContent()
					arg_4_0.scoreboardMenu:UpdateHelperBarText({
						shouldHidePlayerRowActionPrompts = arg_4_0.rowData.isCurrentPlayer or arg_4_0.rowData.isBot,
						isPlayerMuted = arg_4_0.rowData.isMuted
					})
				end

				return true
			end
		end
	end)
end

local function var_0_2(arg_5_0, arg_5_1)
	arg_5_0.BindButton:addEventHandler("button_left", function(arg_6_0, arg_6_1)
		if arg_6_1.qualifier == "dpad" then
			local var_6_0 = arg_6_0:getParent()
			local var_6_1 = var_6_0:getParent()

			if var_6_1 and #var_6_1:getAllFocusedChildren() > 0 or var_6_1:isInFocus() then
				local var_6_2 = var_6_0.rowData

				if var_6_2 and not var_6_2.isCrossplayPlayer and Engine.HDGDBCJFG() and not CONDITIONS.IsSystemLink() and var_6_2.isBot == false and not var_6_2.isCurrentPlayer then
					local var_6_3 = SCOREBOARD.IsAARScoreboard()

					if not var_6_3 and var_6_2.clientNum then
						Engine.BJBCAJFECC(arg_6_1.controller, var_6_2.clientNum)
					elseif var_6_3 and var_6_2.xuid then
						Lobby.GICFBJBBJ(arg_6_1.controller, var_6_2.xuid)
					end
				end

				return true
			end
		end
	end)
end

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")

		local var_8_0 = arg_8_0.rowData

		if var_8_0 and not var_8_0.isCurrentPlayer then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpText")
		end
	end)
	arg_7_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")

		if arg_7_0.scoreboardMenu == nil then
			arg_7_0.scoreboardMenu = arg_9_0:GetCurrentMenu()
		end

		local var_9_0 = arg_9_0.rowData

		if var_9_0 then
			if not var_9_0.isCurrentPlayer and not CONDITIONS.IsMagmaGameMode() then
				ACTIONS.AnimateSequence(arg_7_0, "ButtonOverText")
			end

			if arg_7_0.scoreboardMenu and arg_7_0.scoreboardMenu.UpdateHelperBarText then
				arg_7_0.scoreboardMenu:UpdateHelperBarText({
					shouldHidePlayerRowActionPrompts = var_9_0.isCurrentPlayer or var_9_0.isBot,
					isPlayerMuted = var_9_0.isMuted
				})
			end
		end
	end)
end

local function var_0_4(arg_10_0, arg_10_1)
	if CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_10_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_10_0, "ModFourStats")
	end
end

function PostLoadFunc(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.BindButton = LUI.UIBindButton.new()
	arg_11_0.BindButton.id = "BindButton"

	arg_11_0:addElement(arg_11_0.BindButton)
	var_0_1(arg_11_0, arg_11_1)
	var_0_2(arg_11_0, arg_11_1)
	var_0_3(arg_11_0, arg_11_1)
	var_0_4(arg_11_0, arg_11_1)
	arg_11_0:addEventHandler("br_pause_scoreboard_lose_focus", function(arg_12_0, arg_12_1)
		local var_12_0 = "ModThreeStats"

		if CONDITIONS.IsWZPayload() or CONDITIONS.IsBRMendotaGameType() then
			var_12_0 = "ModFourStats"
		end

		ACTIONS.AnimateSequence(arg_11_0, var_12_0)
	end)
	arg_11_0:registerEventHandler("kbm_button_mute_action", function(arg_13_0, arg_13_1)
		local var_13_0 = arg_13_0:getParent()

		if var_13_0 and arg_13_0.rowData.clientNum == arg_13_1.clientNum then
			var_0_0(arg_13_0, var_13_0, arg_11_1)

			return true
		end
	end)
	arg_11_0:addEventHandler("br_pause_scoreboard_on_focus", function(arg_14_0, arg_14_1)
		var_0_4(arg_11_0, arg_11_1)
	end)
end

function BRAARScoreboardRow(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIButton.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1400 * _1080p, 0, 56 * _1080p)

	var_15_0.id = "BRAARScoreboardRow"
	var_15_0._animationSets = var_15_0._animationSets or {}
	var_15_0._sequences = var_15_0._sequences or {}

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = LUI.UIImage.new()

	var_15_4.id = "NameBG"

	var_15_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_4:SetAlpha(0.25, 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 283, _1080p * 727, 0, 0)
	var_15_0:addElement(var_15_4)

	var_15_0.NameBG = var_15_4

	local var_15_5
	local var_15_6 = LUI.UIImage.new()

	var_15_6.id = "RankBG"

	var_15_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_6:SetAlpha(0.25, 0)
	var_15_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -1349, 0, 0)
	var_15_0:addElement(var_15_6)

	var_15_0.RankBG = var_15_6

	local var_15_7
	local var_15_8 = LUI.UIImage.new()

	var_15_8.id = "Pip"

	var_15_8:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 3, 0, 0)
	var_15_0:addElement(var_15_8)

	var_15_0.Pip = var_15_8

	local var_15_9
	local var_15_10 = LUI.UIImage.new()

	var_15_10.id = "Playercard"

	var_15_10:setImage(RegisterMaterial("ui_playercard_305"), 0)
	var_15_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 55, _1080p * 279, _1080p * -28, _1080p * 28)
	var_15_0:addElement(var_15_10)

	var_15_0.Playercard = var_15_10

	local var_15_11
	local var_15_12 = LUI.UIImage.new()

	var_15_12.id = "PlayercardFrame"

	var_15_12:setImage(RegisterMaterial("v_ui_elmnt_playercard_frame_002"), 0)
	var_15_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 55, _1080p * 279, _1080p * -28, _1080p * 28)
	var_15_0:addElement(var_15_12)

	var_15_0.PlayercardFrame = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIImage.new()

	var_15_14.id = "PlayercardTitleBacking"

	var_15_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_14:SetAlpha(0.5, 0)
	var_15_14:setImage(RegisterMaterial("ui_playercard_305"), 0)
	var_15_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 55, _1080p * 279, _1080p * 8, _1080p * 28)
	var_15_0:addElement(var_15_14)

	var_15_0.PlayercardTitleBacking = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIStyledText.new()

	var_15_16.id = "PlayercardTitle"

	var_15_16:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_16:setText("", 0)
	var_15_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_16:SetWordWrap(false)
	var_15_16:SetAlignment(LUI.Alignment.Left)
	var_15_16:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_16:SetStartupDelay(1000)
	var_15_16:SetLineHoldTime(400)
	var_15_16:SetAnimMoveTime(1499.99)
	var_15_16:SetAnimMoveSpeed(1500.01)
	var_15_16:SetEndDelay(1000)
	var_15_16:SetCrossfadeTime(400)
	var_15_16:SetFadeInTime(300)
	var_15_16:SetFadeOutTime(300)
	var_15_16:SetMaxVisibleLines(1)
	var_15_16:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 55, _1080p * 279, _1080p * 6, _1080p * 30)
	var_15_0:addElement(var_15_16)

	var_15_0.PlayercardTitle = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIStyledText.new()

	var_15_18.id = "Rank"

	var_15_18:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_18:setText("99", 0)
	var_15_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_18:SetAlignment(LUI.Alignment.Center)
	var_15_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 49, _1080p * -12, _1080p * 12)
	var_15_0:addElement(var_15_18)

	var_15_0.Rank = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIStyledText.new()

	var_15_20.id = "Gamertag"

	var_15_20:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_20:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_15_20:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_15_20:SetWordWrap(false)
	var_15_20:SetAlignment(LUI.Alignment.Left)
	var_15_20:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_15_20:SetStartupDelay(1000)
	var_15_20:SetLineHoldTime(400)
	var_15_20:SetAnimMoveTime(1500)
	var_15_20:SetAnimMoveSpeed(1500)
	var_15_20:SetEndDelay(1000)
	var_15_20:SetCrossfadeTime(400)
	var_15_20:SetFadeInTime(300)
	var_15_20:SetFadeOutTime(300)
	var_15_20:SetMaxVisibleLines(1)
	var_15_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 293, _1080p * 719, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_20)

	var_15_0.Gamertag = var_15_20

	local var_15_21
	local var_15_22 = LUI.UIImage.new()

	var_15_22.id = "ScoreBG"

	var_15_22:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_22:SetAlpha(0.25, 0)
	var_15_22:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -668, _1080p * -44, 0, 0)
	var_15_0:addElement(var_15_22)

	var_15_0.ScoreBG = var_15_22

	local var_15_23
	local var_15_24 = LUI.UIStyledText.new()

	var_15_24.id = "Score1"

	var_15_24:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_24:setText("0000", 0)
	var_15_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_24:SetWordWrap(false)
	var_15_24:SetAlignment(LUI.Alignment.Center)
	var_15_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 745, _1080p * 856, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_24)

	var_15_0.Score1 = var_15_24

	local var_15_25
	local var_15_26 = LUI.UIStyledText.new()

	var_15_26.id = "Score2"

	var_15_26:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_26:setText("0000", 0)
	var_15_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_26:SetWordWrap(false)
	var_15_26:SetAlignment(LUI.Alignment.Center)
	var_15_26:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 870, _1080p * 981, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_26)

	var_15_0.Score2 = var_15_26

	local var_15_27
	local var_15_28 = LUI.UIStyledText.new()

	var_15_28.id = "Score3"

	var_15_28:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_28:setText("0000", 0)
	var_15_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_28:SetWordWrap(false)
	var_15_28:SetAlignment(LUI.Alignment.Center)
	var_15_28:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 995, _1080p * 1106, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_28)

	var_15_0.Score3 = var_15_28

	local var_15_29
	local var_15_30 = LUI.UIStyledText.new()

	var_15_30.id = "Score4"

	var_15_30:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_30:setText("0000", 0)
	var_15_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_30:SetWordWrap(false)
	var_15_30:SetAlignment(LUI.Alignment.Center)
	var_15_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1120, _1080p * 1231, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_30)

	var_15_0.Score4 = var_15_30

	local var_15_31

	if CONDITIONS.AlwaysFalse() then
		var_15_31 = LUI.UIStyledText.new()
		var_15_31.id = "Score5"

		var_15_31:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
		var_15_31:setText("0000", 0)
		var_15_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_15_31:SetWordWrap(false)
		var_15_31:SetAlignment(LUI.Alignment.Center)
		var_15_31:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1245, _1080p * 1356, _1080p * -15, _1080p * 15)
		var_15_0:addElement(var_15_31)

		var_15_0.Score5 = var_15_31
	end

	local var_15_32
	local var_15_33 = MenuBuilder.BuildRegisteredType("PlayerMicDisplay", {
		controllerIndex = var_15_1
	})

	var_15_33.id = "MicDisplay"

	var_15_33:SetScale(-0.3, 0)
	var_15_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -29, _1080p * 3, _1080p * 13, _1080p * 43)
	var_15_0:addElement(var_15_33)

	var_15_0.MicDisplay = var_15_33

	local var_15_34
	local var_15_35 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_15_1
	})

	var_15_35.id = "YouIndicatorRight"

	var_15_35:SetAlpha(0, 0)
	var_15_35:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -104, _1080p * -29, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_35)

	var_15_0.YouIndicatorRight = var_15_35

	local function var_15_36()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_36

	local var_15_37
	local var_15_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOver", var_15_38)

	local var_15_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOver", var_15_39)

	local var_15_40 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_40)

	local var_15_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonOver", var_15_41)

	local function var_15_42()
		var_15_4:AnimateSequence("ButtonOver")
		var_15_6:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_22:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_42

	local var_15_43
	local var_15_44 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUp", var_15_44)

	local var_15_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUp", var_15_45)

	local var_15_46 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_46)

	local var_15_47 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonUp", var_15_47)

	local function var_15_48()
		var_15_4:AnimateSequence("ButtonUp")
		var_15_6:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
		var_15_22:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_48

	local var_15_49
	local var_15_50 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUpText", var_15_50)

	local var_15_51 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonUpText", var_15_51)

	local var_15_52 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonUpText", var_15_52)

	local var_15_53 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonUpText", var_15_53)

	local var_15_54 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonUpText", var_15_54)

	local var_15_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonUpText", var_15_55)

	local var_15_56 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_30:RegisterAnimationSequence("ButtonUpText", var_15_56)

	if CONDITIONS.AlwaysFalse() then
		local var_15_57 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Scoreboard.secondPlace
			}
		}

		var_15_31:RegisterAnimationSequence("ButtonUpText", var_15_57)
	end

	local function var_15_58()
		var_15_10:AnimateSequence("ButtonUpText")
		var_15_18:AnimateSequence("ButtonUpText")
		var_15_20:AnimateSequence("ButtonUpText")
		var_15_24:AnimateSequence("ButtonUpText")
		var_15_26:AnimateSequence("ButtonUpText")
		var_15_28:AnimateSequence("ButtonUpText")
		var_15_30:AnimateSequence("ButtonUpText")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("ButtonUpText")
		end
	end

	var_15_0._sequences.ButtonUpText = var_15_58

	local var_15_59
	local var_15_60 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOverText", var_15_60)

	local var_15_61 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonOverText", var_15_61)

	local var_15_62 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonOverText", var_15_62)

	local var_15_63 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonOverText", var_15_63)

	local var_15_64 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_26:RegisterAnimationSequence("ButtonOverText", var_15_64)

	local var_15_65 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_28:RegisterAnimationSequence("ButtonOverText", var_15_65)

	local var_15_66 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_30:RegisterAnimationSequence("ButtonOverText", var_15_66)

	if CONDITIONS.AlwaysFalse() then
		local var_15_67 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_15_31:RegisterAnimationSequence("ButtonOverText", var_15_67)
	end

	local function var_15_68()
		var_15_10:AnimateSequence("ButtonOverText")
		var_15_18:AnimateSequence("ButtonOverText")
		var_15_20:AnimateSequence("ButtonOverText")
		var_15_24:AnimateSequence("ButtonOverText")
		var_15_26:AnimateSequence("ButtonOverText")
		var_15_28:AnimateSequence("ButtonOverText")
		var_15_30:AnimateSequence("ButtonOverText")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("ButtonOverText")
		end
	end

	var_15_0._sequences.ButtonOverText = var_15_68

	local var_15_69
	local var_15_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("Player", var_15_70)

	local var_15_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_18:RegisterAnimationSequence("Player", var_15_71)

	local var_15_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_20:RegisterAnimationSequence("Player", var_15_72)

	local var_15_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_24:RegisterAnimationSequence("Player", var_15_73)

	local var_15_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_26:RegisterAnimationSequence("Player", var_15_74)

	local var_15_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_28:RegisterAnimationSequence("Player", var_15_75)

	local var_15_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_30:RegisterAnimationSequence("Player", var_15_76)

	if CONDITIONS.AlwaysFalse() then
		local var_15_77 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.playerIndicator
			}
		}

		var_15_31:RegisterAnimationSequence("Player", var_15_77)
	end

	local var_15_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -23
		}
	}

	var_15_35:RegisterAnimationSequence("Player", var_15_78)

	local function var_15_79()
		var_15_10:AnimateSequence("Player")
		var_15_18:AnimateSequence("Player")
		var_15_20:AnimateSequence("Player")
		var_15_24:AnimateSequence("Player")
		var_15_26:AnimateSequence("Player")
		var_15_28:AnimateSequence("Player")
		var_15_30:AnimateSequence("Player")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("Player")
		end

		var_15_35:AnimateSequence("Player")
	end

	var_15_0._sequences.Player = var_15_79

	local var_15_80
	local var_15_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -265
		}
	}

	var_15_22:RegisterAnimationSequence("ModThreeStats", var_15_81)

	local var_15_82 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_30:RegisterAnimationSequence("ModThreeStats", var_15_82)

	if CONDITIONS.AlwaysFalse() then
		local var_15_83 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_31:RegisterAnimationSequence("ModThreeStats", var_15_83)
	end

	local function var_15_84()
		var_15_22:AnimateSequence("ModThreeStats")
		var_15_30:AnimateSequence("ModThreeStats")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("ModThreeStats")
		end
	end

	var_15_0._sequences.ModThreeStats = var_15_84

	local var_15_85
	local var_15_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -140
		}
	}

	var_15_22:RegisterAnimationSequence("ModFourStats", var_15_86)

	local var_15_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_30:RegisterAnimationSequence("ModFourStats", var_15_87)

	if CONDITIONS.AlwaysFalse() then
		local var_15_88 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_31:RegisterAnimationSequence("ModFourStats", var_15_88)
	end

	local function var_15_89()
		var_15_22:AnimateSequence("ModFourStats")
		var_15_30:AnimateSequence("ModFourStats")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("ModFourStats")
		end
	end

	var_15_0._sequences.ModFourStats = var_15_89

	local var_15_90
	local var_15_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_18:RegisterAnimationSequence("NonPlayer", var_15_91)

	local var_15_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_20:RegisterAnimationSequence("NonPlayer", var_15_92)

	local var_15_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_24:RegisterAnimationSequence("NonPlayer", var_15_93)

	local var_15_94 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_26:RegisterAnimationSequence("NonPlayer", var_15_94)

	local var_15_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_28:RegisterAnimationSequence("NonPlayer", var_15_95)

	local var_15_96 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_30:RegisterAnimationSequence("NonPlayer", var_15_96)

	if CONDITIONS.AlwaysFalse() then
		local var_15_97 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Scoreboard.secondPlace
			}
		}

		var_15_31:RegisterAnimationSequence("NonPlayer", var_15_97)
	end

	local var_15_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_35:RegisterAnimationSequence("NonPlayer", var_15_98)

	local function var_15_99()
		var_15_18:AnimateSequence("NonPlayer")
		var_15_20:AnimateSequence("NonPlayer")
		var_15_24:AnimateSequence("NonPlayer")
		var_15_26:AnimateSequence("NonPlayer")
		var_15_28:AnimateSequence("NonPlayer")
		var_15_30:AnimateSequence("NonPlayer")

		if CONDITIONS.AlwaysFalse() then
			var_15_31:AnimateSequence("NonPlayer")
		end

		var_15_35:AnimateSequence("NonPlayer")
	end

	var_15_0._sequences.NonPlayer = var_15_99

	local var_15_100
	local var_15_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 229
		}
	}

	var_15_4:RegisterAnimationSequence("NoRank", var_15_101)

	local var_15_102 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_6:RegisterAnimationSequence("NoRank", var_15_102)

	local var_15_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_8:RegisterAnimationSequence("NoRank", var_15_103)

	local var_15_104 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 224
		}
	}

	var_15_10:RegisterAnimationSequence("NoRank", var_15_104)

	local var_15_105 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 224
		}
	}

	var_15_12:RegisterAnimationSequence("NoRank", var_15_105)

	local var_15_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 224
		}
	}

	var_15_14:RegisterAnimationSequence("NoRank", var_15_106)

	local var_15_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 224
		}
	}

	var_15_16:RegisterAnimationSequence("NoRank", var_15_107)

	local var_15_108 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_18:RegisterAnimationSequence("NoRank", var_15_108)

	local var_15_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 730
		}
	}

	var_15_20:RegisterAnimationSequence("NoRank", var_15_109)

	local function var_15_110()
		var_15_4:AnimateSequence("NoRank")
		var_15_6:AnimateSequence("NoRank")
		var_15_8:AnimateSequence("NoRank")
		var_15_10:AnimateSequence("NoRank")
		var_15_12:AnimateSequence("NoRank")
		var_15_14:AnimateSequence("NoRank")
		var_15_16:AnimateSequence("NoRank")
		var_15_18:AnimateSequence("NoRank")
		var_15_20:AnimateSequence("NoRank")
	end

	var_15_0._sequences.NoRank = var_15_110

	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("BRAARScoreboardRow", BRAARScoreboardRow)
LockTable(_M)
