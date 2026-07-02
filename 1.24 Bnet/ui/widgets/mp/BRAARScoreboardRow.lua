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
			if not var_9_0.isCurrentPlayer then
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
		ACTIONS.AnimateSequence(arg_11_0, "ModThreeStats")
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
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 283, _1080p * 740, 0, 0)
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
	local var_15_12 = LUI.UIStyledText.new()

	var_15_12.id = "Rank"

	var_15_12:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_12:setText("99", 0)
	var_15_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_12:SetAlignment(LUI.Alignment.Center)
	var_15_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 5, _1080p * 49, _1080p * -12, _1080p * 12)
	var_15_0:addElement(var_15_12)

	var_15_0.Rank = var_15_12

	local var_15_13
	local var_15_14 = LUI.UIStyledText.new()

	var_15_14.id = "Gamertag"

	var_15_14:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_14:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_15_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_15_14:SetAlignment(LUI.Alignment.Left)
	var_15_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 293, _1080p * 727, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_14)

	var_15_0.Gamertag = var_15_14

	local var_15_15
	local var_15_16 = LUI.UIImage.new()

	var_15_16.id = "ScoreBG"

	var_15_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_15_16:SetAlpha(0.25, 0)
	var_15_16:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -656, 0, 0, 0)
	var_15_0:addElement(var_15_16)

	var_15_0.ScoreBG = var_15_16

	local var_15_17
	local var_15_18 = LUI.UIStyledText.new()

	var_15_18.id = "Score1"

	var_15_18:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_18:setText("0000", 0)
	var_15_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_18:SetAlignment(LUI.Alignment.Center)
	var_15_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 757, _1080p * 878, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_18)

	var_15_0.Score1 = var_15_18

	local var_15_19
	local var_15_20 = LUI.UIStyledText.new()

	var_15_20.id = "Score2"

	var_15_20:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_20:setText("0000", 0)
	var_15_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_20:SetAlignment(LUI.Alignment.Center)
	var_15_20:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 882, _1080p * 1003, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_20)

	var_15_0.Score2 = var_15_20

	local var_15_21
	local var_15_22 = LUI.UIStyledText.new()

	var_15_22.id = "Score3"

	var_15_22:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_22:setText("0000", 0)
	var_15_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_22:SetAlignment(LUI.Alignment.Center)
	var_15_22:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1007, _1080p * 1128, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_22)

	var_15_0.Score3 = var_15_22

	local var_15_23
	local var_15_24 = LUI.UIStyledText.new()

	var_15_24.id = "Score4"

	var_15_24:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
	var_15_24:setText("0000", 0)
	var_15_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_15_24:SetAlignment(LUI.Alignment.Center)
	var_15_24:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1132, _1080p * 1253, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_24)

	var_15_0.Score4 = var_15_24

	local var_15_25

	if CONDITIONS.AlwaysFalse(var_15_0) then
		var_15_25 = LUI.UIStyledText.new()
		var_15_25.id = "Score5"

		var_15_25:SetRGBFromTable(SWATCHES.Scoreboard.secondPlace, 0)
		var_15_25:setText("0000", 0)
		var_15_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_15_25:SetAlignment(LUI.Alignment.Center)
		var_15_25:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1257, _1080p * 1378, _1080p * -15, _1080p * 15)
		var_15_0:addElement(var_15_25)

		var_15_0.Score5 = var_15_25
	end

	local var_15_26
	local var_15_27 = MenuBuilder.BuildRegisteredType("PlayerMicDisplay", {
		controllerIndex = var_15_1
	})

	var_15_27.id = "MicDisplay"

	var_15_27:SetScale(-0.3, 0)
	var_15_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -29, _1080p * 3, _1080p * 13, _1080p * 43)
	var_15_0:addElement(var_15_27)

	var_15_0.MicDisplay = var_15_27

	local var_15_28
	local var_15_29 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_15_1
	})

	var_15_29.id = "YouIndicatorRight"

	var_15_29:SetAlpha(0, 0)
	var_15_29:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -102, _1080p * -27, _1080p * -15, _1080p * 15)
	var_15_0:addElement(var_15_29)

	var_15_0.YouIndicatorRight = var_15_29

	local function var_15_30()
		return
	end

	var_15_0._sequences.DefaultSequence = var_15_30

	local var_15_31
	local var_15_32 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonOver", var_15_32)

	local var_15_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonOver", var_15_33)

	local var_15_34 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOver", var_15_34)

	local var_15_35 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.XPText
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonOver", var_15_35)

	local function var_15_36()
		var_15_4:AnimateSequence("ButtonOver")
		var_15_6:AnimateSequence("ButtonOver")
		var_15_10:AnimateSequence("ButtonOver")
		var_15_16:AnimateSequence("ButtonOver")
	end

	var_15_0._sequences.ButtonOver = var_15_36

	local var_15_37
	local var_15_38 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_4:RegisterAnimationSequence("ButtonUp", var_15_38)

	local var_15_39 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_6:RegisterAnimationSequence("ButtonUp", var_15_39)

	local var_15_40 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUp", var_15_40)

	local var_15_41 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		}
	}

	var_15_16:RegisterAnimationSequence("ButtonUp", var_15_41)

	local function var_15_42()
		var_15_4:AnimateSequence("ButtonUp")
		var_15_6:AnimateSequence("ButtonUp")
		var_15_10:AnimateSequence("ButtonUp")
		var_15_16:AnimateSequence("ButtonUp")
	end

	var_15_0._sequences.ButtonUp = var_15_42

	local var_15_43
	local var_15_44 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonUpText", var_15_44)

	local var_15_45 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonUpText", var_15_45)

	local var_15_46 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonUpText", var_15_46)

	local var_15_47 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonUpText", var_15_47)

	local var_15_48 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonUpText", var_15_48)

	local var_15_49 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonUpText", var_15_49)

	local var_15_50 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonUpText", var_15_50)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_51 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Scoreboard.secondPlace
			}
		}

		var_15_25:RegisterAnimationSequence("ButtonUpText", var_15_51)
	end

	local function var_15_52()
		var_15_10:AnimateSequence("ButtonUpText")
		var_15_12:AnimateSequence("ButtonUpText")
		var_15_14:AnimateSequence("ButtonUpText")
		var_15_18:AnimateSequence("ButtonUpText")
		var_15_20:AnimateSequence("ButtonUpText")
		var_15_22:AnimateSequence("ButtonUpText")
		var_15_24:AnimateSequence("ButtonUpText")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("ButtonUpText")
		end
	end

	var_15_0._sequences.ButtonUpText = var_15_52

	local var_15_53
	local var_15_54 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("ButtonOverText", var_15_54)

	local var_15_55 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_12:RegisterAnimationSequence("ButtonOverText", var_15_55)

	local var_15_56 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_14:RegisterAnimationSequence("ButtonOverText", var_15_56)

	local var_15_57 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_18:RegisterAnimationSequence("ButtonOverText", var_15_57)

	local var_15_58 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_20:RegisterAnimationSequence("ButtonOverText", var_15_58)

	local var_15_59 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_22:RegisterAnimationSequence("ButtonOverText", var_15_59)

	local var_15_60 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_15_24:RegisterAnimationSequence("ButtonOverText", var_15_60)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_61 = {
			{
				duration = 150,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_15_25:RegisterAnimationSequence("ButtonOverText", var_15_61)
	end

	local function var_15_62()
		var_15_10:AnimateSequence("ButtonOverText")
		var_15_12:AnimateSequence("ButtonOverText")
		var_15_14:AnimateSequence("ButtonOverText")
		var_15_18:AnimateSequence("ButtonOverText")
		var_15_20:AnimateSequence("ButtonOverText")
		var_15_22:AnimateSequence("ButtonOverText")
		var_15_24:AnimateSequence("ButtonOverText")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("ButtonOverText")
		end
	end

	var_15_0._sequences.ButtonOverText = var_15_62

	local var_15_63
	local var_15_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_10:RegisterAnimationSequence("Player", var_15_64)

	local var_15_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_12:RegisterAnimationSequence("Player", var_15_65)

	local var_15_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_14:RegisterAnimationSequence("Player", var_15_66)

	local var_15_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_18:RegisterAnimationSequence("Player", var_15_67)

	local var_15_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_20:RegisterAnimationSequence("Player", var_15_68)

	local var_15_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_22:RegisterAnimationSequence("Player", var_15_69)

	local var_15_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_15_24:RegisterAnimationSequence("Player", var_15_70)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_71 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.playerIndicator
			}
		}

		var_15_25:RegisterAnimationSequence("Player", var_15_71)
	end

	local var_15_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_29:RegisterAnimationSequence("Player", var_15_72)

	local function var_15_73()
		var_15_10:AnimateSequence("Player")
		var_15_12:AnimateSequence("Player")
		var_15_14:AnimateSequence("Player")
		var_15_18:AnimateSequence("Player")
		var_15_20:AnimateSequence("Player")
		var_15_22:AnimateSequence("Player")
		var_15_24:AnimateSequence("Player")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("Player")
		end

		var_15_29:AnimateSequence("Player")
	end

	var_15_0._sequences.Player = var_15_73

	local var_15_74
	local var_15_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -270
		}
	}

	var_15_16:RegisterAnimationSequence("ModThreeStats", var_15_75)

	local var_15_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ModThreeStats", var_15_76)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_77 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_25:RegisterAnimationSequence("ModThreeStats", var_15_77)
	end

	local function var_15_78()
		var_15_16:AnimateSequence("ModThreeStats")
		var_15_24:AnimateSequence("ModThreeStats")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("ModThreeStats")
		end
	end

	var_15_0._sequences.ModThreeStats = var_15_78

	local var_15_79
	local var_15_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -145
		}
	}

	var_15_16:RegisterAnimationSequence("ModFourStats", var_15_80)

	local var_15_81 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_24:RegisterAnimationSequence("ModFourStats", var_15_81)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_15_25:RegisterAnimationSequence("ModFourStats", var_15_82)
	end

	local function var_15_83()
		var_15_16:AnimateSequence("ModFourStats")
		var_15_24:AnimateSequence("ModFourStats")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("ModFourStats")
		end
	end

	var_15_0._sequences.ModFourStats = var_15_83

	local var_15_84
	local var_15_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_12:RegisterAnimationSequence("NonPlayer", var_15_85)

	local var_15_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_14:RegisterAnimationSequence("NonPlayer", var_15_86)

	local var_15_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_18:RegisterAnimationSequence("NonPlayer", var_15_87)

	local var_15_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_20:RegisterAnimationSequence("NonPlayer", var_15_88)

	local var_15_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_22:RegisterAnimationSequence("NonPlayer", var_15_89)

	local var_15_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.secondPlace
		}
	}

	var_15_24:RegisterAnimationSequence("NonPlayer", var_15_90)

	if CONDITIONS.AlwaysFalse(var_15_0) then
		local var_15_91 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.Scoreboard.secondPlace
			}
		}

		var_15_25:RegisterAnimationSequence("NonPlayer", var_15_91)
	end

	local var_15_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_15_29:RegisterAnimationSequence("NonPlayer", var_15_92)

	local function var_15_93()
		var_15_12:AnimateSequence("NonPlayer")
		var_15_14:AnimateSequence("NonPlayer")
		var_15_18:AnimateSequence("NonPlayer")
		var_15_20:AnimateSequence("NonPlayer")
		var_15_22:AnimateSequence("NonPlayer")
		var_15_24:AnimateSequence("NonPlayer")

		if CONDITIONS.AlwaysFalse(var_15_0) then
			var_15_25:AnimateSequence("NonPlayer")
		end

		var_15_29:AnimateSequence("NonPlayer")
	end

	var_15_0._sequences.NonPlayer = var_15_93

	PostLoadFunc(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("BRAARScoreboardRow", BRAARScoreboardRow)
LockTable(_M)
