module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._isEven then
		ACTIONS.AnimateSequence(arg_1_0, "Light")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Dark")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._isEven = arg_2_1

	var_0_0(arg_2_0)
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_4_0:getParent()

		if var_4_0 and #var_4_0:getAllFocusedChildren() > 0 or var_4_0:isInFocus() then
			local var_4_1 = arg_4_0.rowData

			if var_4_1 and var_4_1.isBot == false and not var_4_1.isCurrentPlayer then
				local var_4_2 = SCOREBOARD.IsAARScoreboard()

				if var_4_1.clientNum and not var_4_2 then
					Game.CBEICJFEHB(var_4_1.clientNum)
				elseif var_4_1.xuid and var_4_2 and Lobby.BBDICGHE() then
					Lobby.CGCFCDJBH(arg_4_1.controller, var_4_1.xuid)
				end

				var_4_0:RefreshContent()

				return true
			end
		end
	end)
end

local function var_0_3(arg_5_0, arg_5_1)
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

local function var_0_4(arg_7_0, arg_7_1)
	arg_7_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonUp")

		local var_8_0 = arg_8_0.rowData

		if var_8_0 and not var_8_0.isCurrentPlayer then
			ACTIONS.AnimateSequence(arg_7_0, "ButtonUpText")
		end
	end)
	arg_7_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_7_0, "ButtonOver")

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

		if arg_7_0.scoreboardMenu == nil then
			arg_7_0.scoreboardMenu = arg_9_0:GetCurrentMenu()
		end
	end)
end

local function var_0_5(arg_10_0, arg_10_1)
	if CONDITIONS.AreTabletsFilteredOut() then
		ACTIONS.AnimateSequence(arg_10_0, "ModThreeStats")
	else
		ACTIONS.AnimateSequence(arg_10_0, "ModFourStats")
	end
end

function PostLoadFunc(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetIsEvenIndex = var_0_1
	arg_11_0._isEven = false
	arg_11_0.BindButton = LUI.UIBindButton.new()
	arg_11_0.BindButton.id = "BindButton"

	arg_11_0:addElement(arg_11_0.BindButton)
	var_0_2(arg_11_0, arg_11_1)
	var_0_3(arg_11_0, arg_11_1)
	var_0_4(arg_11_0, arg_11_1)
	var_0_5(arg_11_0, arg_11_1)
	arg_11_0:addEventHandler("br_pause_scoreboard_lose_focus", function(arg_12_0, arg_12_1)
		ACTIONS.AnimateSequence(arg_11_0, "ModThreeStats")
	end)
	arg_11_0:addEventHandler("br_pause_scoreboard_on_focus", function(arg_13_0, arg_13_1)
		var_0_5(arg_11_0, arg_11_1)
	end)
end

function BRTeamScoreboardRow(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 46 * _1080p)

	var_14_0.id = "BRTeamScoreboardRow"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = LUI.UIImage.new()

	var_14_4.id = "BG"

	var_14_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_14_4:SetAlpha(0.7, 0)
	var_14_4:SetPixelGridEnabled(true)
	var_14_4:SetPixelGridContrast(0.2, 0)
	var_14_4:SetPixelGridBlockWidth(2, 0)
	var_14_4:SetPixelGridBlockHeight(2, 0)
	var_14_4:SetPixelGridGutterWidth(1, 0)
	var_14_4:SetPixelGridGutterHeight(1, 0)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 125, 0, _1080p * -1)
	var_14_0:addElement(var_14_4)

	var_14_0.BG = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "TextureLayer"

	var_14_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_14_6:SetAlpha(0, 0)
	var_14_6:SetPixelGridEnabled(true)
	var_14_6:SetPixelGridContrast(0.8, 0)
	var_14_6:SetPixelGridBlockWidth(2, 0)
	var_14_6:SetPixelGridBlockHeight(2, 0)
	var_14_6:SetPixelGridGutterWidth(1, 0)
	var_14_6:SetPixelGridGutterHeight(1, 0)
	var_14_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_14_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 125, 0, 0)
	var_14_0:addElement(var_14_6)

	var_14_0.TextureLayer = var_14_6

	local var_14_7
	local var_14_8 = LUI.UIImage.new()

	var_14_8.id = "Gradient"

	var_14_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_14_8:SetAlpha(0, 0)
	var_14_8:SetPixelGridEnabled(true)
	var_14_8:SetPixelGridContrast(0.2, 0)
	var_14_8:SetPixelGridBlockWidth(2, 0)
	var_14_8:SetPixelGridBlockHeight(2, 0)
	var_14_8:SetPixelGridGutterWidth(1, 0)
	var_14_8:SetPixelGridGutterHeight(1, 0)
	var_14_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_14_8:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * 125, 0, 0)
	var_14_0:addElement(var_14_8)

	var_14_0.Gradient = var_14_8

	local var_14_9
	local var_14_10 = LUI.UIImage.new()

	var_14_10.id = "Glow"

	var_14_10:SetRGBFromTable(SWATCHES.genericButton.backgroundFocus, 0)
	var_14_10:SetAlpha(0, 0)
	var_14_10:SetPixelGridEnabled(true)
	var_14_10:SetPixelGridContrast(0.5, 0)
	var_14_10:SetPixelGridBlockWidth(2, 0)
	var_14_10:SetPixelGridBlockHeight(2, 0)
	var_14_10:SetPixelGridGutterWidth(1, 0)
	var_14_10:SetPixelGridGutterHeight(1, 0)
	var_14_10:setImage(RegisterMaterial("button_glow"), 0)
	var_14_10:Setup9SliceImage(_1080p * 12, _1080p * 12, 0.25, 0.25)
	var_14_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -7, _1080p * -119, _1080p * -7, _1080p * 7)
	var_14_0:addElement(var_14_10)

	var_14_0.Glow = var_14_10

	local var_14_11
	local var_14_12 = LUI.UIText.new()

	var_14_12.id = "PlayerName"

	var_14_12:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_14_12:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_14_12:SetAlignment(LUI.Alignment.Left)
	var_14_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_14_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 140, _1080p * 526, _1080p * -13, _1080p * 13)
	var_14_0:addElement(var_14_12)

	var_14_0.PlayerName = var_14_12

	local var_14_13
	local var_14_14 = LUI.UIImage.new()

	var_14_14.id = "PlayerIcon"

	var_14_14:SetAlpha(0, 0)
	var_14_14:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * 29, _1080p * 86, _1080p * 3, _1080p * -4)
	var_14_0:addElement(var_14_14)

	var_14_0.PlayerIcon = var_14_14

	local var_14_15
	local var_14_16 = LUI.UIText.new()

	var_14_16.id = "Stat5"

	var_14_16:setText("15", 0)
	var_14_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_16:SetAlignment(LUI.Alignment.Center)
	var_14_16:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -125, 0, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_16)

	var_14_0.Stat5 = var_14_16

	local var_14_17
	local var_14_18 = LUI.UIText.new()

	var_14_18.id = "Stat4"

	var_14_18:setText("15", 0)
	var_14_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_18:SetAlignment(LUI.Alignment.Center)
	var_14_18:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -250, _1080p * -125, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_18)

	var_14_0.Stat4 = var_14_18

	local var_14_19
	local var_14_20 = LUI.UIText.new()

	var_14_20.id = "Stat3"

	var_14_20:setText("15", 0)
	var_14_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_20:SetAlignment(LUI.Alignment.Center)
	var_14_20:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -375, _1080p * -250, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_20)

	var_14_0.Stat3 = var_14_20

	local var_14_21
	local var_14_22 = LUI.UIText.new()

	var_14_22.id = "Stat2"

	var_14_22:setText("15", 0)
	var_14_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_22:SetAlignment(LUI.Alignment.Center)
	var_14_22:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -500, _1080p * -375, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_22)

	var_14_0.Stat2 = var_14_22

	local var_14_23
	local var_14_24 = LUI.UIText.new()

	var_14_24.id = "Stat1"

	var_14_24:setText("15", 0)
	var_14_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_24:SetAlignment(LUI.Alignment.Center)
	var_14_24:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -625, _1080p * -500, _1080p * -15, _1080p * 15)
	var_14_0:addElement(var_14_24)

	var_14_0.Stat1 = var_14_24

	local var_14_25
	local var_14_26 = LUI.UIImage.new()

	var_14_26.id = "RightSelectionBracket"

	var_14_26:SetAlpha(0, 0)
	var_14_26:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * 127, _1080p * 129, _1080p * 10, _1080p * -10)
	var_14_0:addElement(var_14_26)

	var_14_0.RightSelectionBracket = var_14_26

	local var_14_27
	local var_14_28 = LUI.UIImage.new()

	var_14_28.id = "LeftSelectionBracket"

	var_14_28:SetAlpha(0, 0)
	var_14_28:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -5, _1080p * -3, _1080p * 9, _1080p * -11)
	var_14_0:addElement(var_14_28)

	var_14_0.LeftSelectionBracket = var_14_28

	local var_14_29
	local var_14_30 = LUI.UIText.new()

	var_14_30.id = "RankText"

	var_14_30:setText("15", 0)
	var_14_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_14_30:SetWordWrap(false)
	var_14_30:SetAlignment(LUI.Alignment.Left)
	var_14_30:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 97, _1080p * 139, _1080p * -14, _1080p * 16)
	var_14_0:addElement(var_14_30)

	var_14_0.RankText = var_14_30

	local var_14_31
	local var_14_32 = LUI.UIImage.new()

	var_14_32.id = "RankIcon"

	var_14_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 64, _1080p * 94, _1080p * 9, _1080p * 39)
	var_14_0:addElement(var_14_32)

	var_14_0.RankIcon = var_14_32

	local var_14_33
	local var_14_34 = LUI.UIImage.new()

	var_14_34.id = "PlayerNumberBg"

	var_14_34:SetRGBFromTable(SWATCHES.HUD.background, 0)
	var_14_34:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 45)
	var_14_0:addElement(var_14_34)

	var_14_0.PlayerNumberBg = var_14_34

	local var_14_35

	if CONDITIONS.AlwaysFalse(var_14_0) then
		var_14_35 = LUI.UIText.new()
		var_14_35.id = "ExtraStatVal"

		var_14_35:setText("15", 0)
		var_14_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_35:SetAlignment(LUI.Alignment.Center)
		var_14_35:SetAnchorsAndPosition(1, 0, 0.5, 0.5, 0, _1080p * 125, _1080p * -15, _1080p * 15)
		var_14_0:addElement(var_14_35)

		var_14_0.ExtraStatVal = var_14_35
	end

	local var_14_36
	local var_14_37 = MenuBuilder.BuildRegisteredType("PlayerMicDisplay", {
		controllerIndex = var_14_1
	})

	var_14_37.id = "MicDisplay"

	var_14_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 75, _1080p * 8, _1080p * 38)
	var_14_0:addElement(var_14_37)

	var_14_0.MicDisplay = var_14_37

	local var_14_38
	local var_14_39 = LUI.UIImage.new()

	var_14_39.id = "TitleDividerTop"

	var_14_39:SetRGBFromInt(7590652, 0)
	var_14_39:SetAlpha(0, 0)
	var_14_39:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 975, _1080p * -24, _1080p * -23)
	var_14_0:addElement(var_14_39)

	var_14_0.TitleDividerTop = var_14_39

	local var_14_40
	local var_14_41 = LUI.UIImage.new()

	var_14_41.id = "TitleDividerCopy0"

	var_14_41:SetRGBFromInt(7590652, 0)
	var_14_41:SetAlpha(0, 0)
	var_14_41:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 975, _1080p * 45, _1080p * 46)
	var_14_0:addElement(var_14_41)

	var_14_0.TitleDividerCopy0 = var_14_41

	local var_14_42
	local var_14_43 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_14_1
	})

	var_14_43.id = "YouIndicatorRight"

	var_14_43:SetAlpha(0, 0)
	var_14_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -81, _1080p * -6, _1080p * 9, _1080p * 39)
	var_14_0:addElement(var_14_43)

	var_14_0.YouIndicatorRight = var_14_43

	local function var_14_44()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_44

	local var_14_45
	local var_14_46 = {
		{
			value = 3092271,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("Dark", var_14_46)

	local function var_14_47()
		var_14_4:AnimateSequence("Dark")
	end

	var_14_0._sequences.Dark = var_14_47

	local var_14_48
	local var_14_49 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.15,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("Light", var_14_49)

	local function var_14_50()
		var_14_4:AnimateSequence("Light")
	end

	var_14_0._sequences.Light = var_14_50

	local var_14_51
	local var_14_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.friendlyTeamDark
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonOver", var_14_52)

	local var_14_53 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonOver", var_14_53)

	local var_14_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonOver", var_14_54)

	local var_14_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonOver", var_14_55)

	local var_14_56 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOver", var_14_56)

	local var_14_57 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonOver", var_14_57)

	local var_14_58 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOver", var_14_58)

	local var_14_59 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOver", var_14_59)

	local var_14_60 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOver", var_14_60)

	local var_14_61 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOver", var_14_61)

	local var_14_62 = {
		{
			value = 5218520,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("ButtonOver", var_14_62)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_63 = {
			{
				value = 5218520,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_14_35:RegisterAnimationSequence("ButtonOver", var_14_63)
	end

	local var_14_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_39:RegisterAnimationSequence("ButtonOver", var_14_64)

	local var_14_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_41:RegisterAnimationSequence("ButtonOver", var_14_65)

	local function var_14_66()
		var_14_4:AnimateSequence("ButtonOver")
		var_14_6:AnimateSequence("ButtonOver")
		var_14_8:AnimateSequence("ButtonOver")
		var_14_10:AnimateSequence("ButtonOver")
		var_14_12:AnimateSequence("ButtonOver")
		var_14_16:AnimateSequence("ButtonOver")
		var_14_18:AnimateSequence("ButtonOver")
		var_14_20:AnimateSequence("ButtonOver")
		var_14_22:AnimateSequence("ButtonOver")
		var_14_24:AnimateSequence("ButtonOver")
		var_14_30:AnimateSequence("ButtonOver")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ButtonOver")
		end

		var_14_39:AnimateSequence("ButtonOver")
		var_14_41:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_66

	local var_14_67
	local var_14_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_14_4:RegisterAnimationSequence("ModFiveStats", var_14_68)

	local var_14_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_14_6:RegisterAnimationSequence("ModFiveStats", var_14_69)

	local var_14_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_14_8:RegisterAnimationSequence("ModFiveStats", var_14_70)

	local var_14_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 10
		}
	}

	var_14_26:RegisterAnimationSequence("ModFiveStats", var_14_71)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_72 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_35:RegisterAnimationSequence("ModFiveStats", var_14_72)
	end

	local function var_14_73()
		var_14_4:AnimateSequence("ModFiveStats")
		var_14_6:AnimateSequence("ModFiveStats")
		var_14_8:AnimateSequence("ModFiveStats")
		var_14_26:AnimateSequence("ModFiveStats")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ModFiveStats")
		end
	end

	var_14_0._sequences.ModFiveStats = var_14_73

	local var_14_74
	local var_14_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_6:RegisterAnimationSequence("ButtonUp", var_14_75)

	local var_14_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_8:RegisterAnimationSequence("ButtonUp", var_14_76)

	local var_14_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_10:RegisterAnimationSequence("ButtonUp", var_14_77)

	local var_14_78 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUp", var_14_78)

	local var_14_79 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonUp", var_14_79)

	local var_14_80 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonUp", var_14_80)

	local var_14_81 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUp", var_14_81)

	local var_14_82 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUp", var_14_82)

	local var_14_83 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUp", var_14_83)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_84 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_14_35:RegisterAnimationSequence("ButtonUp", var_14_84)
	end

	local var_14_85 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_39:RegisterAnimationSequence("ButtonUp", var_14_85)

	local var_14_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_41:RegisterAnimationSequence("ButtonUp", var_14_86)

	local function var_14_87()
		var_14_6:AnimateSequence("ButtonUp")
		var_14_8:AnimateSequence("ButtonUp")
		var_14_10:AnimateSequence("ButtonUp")
		var_14_12:AnimateSequence("ButtonUp")
		var_14_16:AnimateSequence("ButtonUp")
		var_14_18:AnimateSequence("ButtonUp")
		var_14_20:AnimateSequence("ButtonUp")
		var_14_22:AnimateSequence("ButtonUp")
		var_14_24:AnimateSequence("ButtonUp")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ButtonUp")
		end

		var_14_39:AnimateSequence("ButtonUp")
		var_14_41:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_87

	local var_14_88
	local var_14_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -125
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom
		}
	}

	var_14_4:RegisterAnimationSequence("ModFourStats", var_14_89)

	local var_14_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -125
		}
	}

	var_14_6:RegisterAnimationSequence("ModFourStats", var_14_90)

	local var_14_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -125
		}
	}

	var_14_8:RegisterAnimationSequence("ModFourStats", var_14_91)

	local var_14_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ModFourStats", var_14_92)

	local var_14_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -120
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -122
		}
	}

	var_14_26:RegisterAnimationSequence("ModFourStats", var_14_93)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_94 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_35:RegisterAnimationSequence("ModFourStats", var_14_94)
	end

	local function var_14_95()
		var_14_4:AnimateSequence("ModFourStats")
		var_14_6:AnimateSequence("ModFourStats")
		var_14_8:AnimateSequence("ModFourStats")
		var_14_16:AnimateSequence("ModFourStats")
		var_14_26:AnimateSequence("ModFourStats")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ModFourStats")
		end
	end

	var_14_0._sequences.ModFourStats = var_14_95

	local var_14_96
	local var_14_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_14_26:RegisterAnimationSequence("ModIsLocalPlayer", var_14_97)

	local var_14_98 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_14_28:RegisterAnimationSequence("ModIsLocalPlayer", var_14_98)

	local var_14_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		}
	}

	var_14_43:RegisterAnimationSequence("ModIsLocalPlayer", var_14_99)

	local function var_14_100()
		var_14_26:AnimateSequence("ModIsLocalPlayer")
		var_14_28:AnimateSequence("ModIsLocalPlayer")
		var_14_43:AnimateSequence("ModIsLocalPlayer")
	end

	var_14_0._sequences.ModIsLocalPlayer = var_14_100

	local var_14_101
	local var_14_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -252
		}
	}

	var_14_4:RegisterAnimationSequence("ModThreeStats", var_14_102)

	local var_14_103 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -250
		}
	}

	var_14_6:RegisterAnimationSequence("ModThreeStats", var_14_103)

	local var_14_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -251
		}
	}

	var_14_8:RegisterAnimationSequence("ModThreeStats", var_14_104)

	local var_14_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -247
		}
	}

	var_14_10:RegisterAnimationSequence("ModThreeStats", var_14_105)

	local var_14_106 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_16:RegisterAnimationSequence("ModThreeStats", var_14_106)

	local var_14_107 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_18:RegisterAnimationSequence("ModThreeStats", var_14_107)

	local var_14_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -248
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -250
		}
	}

	var_14_26:RegisterAnimationSequence("ModThreeStats", var_14_108)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_109 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_35:RegisterAnimationSequence("ModThreeStats", var_14_109)
	end

	local var_14_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 848
		}
	}

	var_14_39:RegisterAnimationSequence("ModThreeStats", var_14_110)

	local var_14_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 848
		}
	}

	var_14_41:RegisterAnimationSequence("ModThreeStats", var_14_111)

	local function var_14_112()
		var_14_4:AnimateSequence("ModThreeStats")
		var_14_6:AnimateSequence("ModThreeStats")
		var_14_8:AnimateSequence("ModThreeStats")
		var_14_10:AnimateSequence("ModThreeStats")
		var_14_16:AnimateSequence("ModThreeStats")
		var_14_18:AnimateSequence("ModThreeStats")
		var_14_26:AnimateSequence("ModThreeStats")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ModThreeStats")
		end

		var_14_39:AnimateSequence("ModThreeStats")
		var_14_41:AnimateSequence("ModThreeStats")
	end

	var_14_0._sequences.ModThreeStats = var_14_112

	local var_14_113
	local var_14_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_26:RegisterAnimationSequence("ModIsNotLocalPlayer", var_14_114)

	local var_14_115 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_28:RegisterAnimationSequence("ModIsNotLocalPlayer", var_14_115)

	local var_14_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -85
		}
	}

	var_14_43:RegisterAnimationSequence("ModIsNotLocalPlayer", var_14_116)

	local function var_14_117()
		var_14_26:AnimateSequence("ModIsNotLocalPlayer")
		var_14_28:AnimateSequence("ModIsNotLocalPlayer")
		var_14_43:AnimateSequence("ModIsNotLocalPlayer")
	end

	var_14_0._sequences.ModIsNotLocalPlayer = var_14_117

	local var_14_118
	local var_14_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_12:RegisterAnimationSequence("Player", var_14_119)

	local var_14_120 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_16:RegisterAnimationSequence("Player", var_14_120)

	local var_14_121 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_18:RegisterAnimationSequence("Player", var_14_121)

	local var_14_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_20:RegisterAnimationSequence("Player", var_14_122)

	local var_14_123 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_22:RegisterAnimationSequence("Player", var_14_123)

	local var_14_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_24:RegisterAnimationSequence("Player", var_14_124)

	local var_14_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.playerIndicator
		}
	}

	var_14_30:RegisterAnimationSequence("Player", var_14_125)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_126 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.HUD.playerIndicator
			}
		}

		var_14_35:RegisterAnimationSequence("Player", var_14_126)
	end

	local var_14_127 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_43:RegisterAnimationSequence("Player", var_14_127)

	local function var_14_128()
		var_14_12:AnimateSequence("Player")
		var_14_16:AnimateSequence("Player")
		var_14_18:AnimateSequence("Player")
		var_14_20:AnimateSequence("Player")
		var_14_22:AnimateSequence("Player")
		var_14_24:AnimateSequence("Player")
		var_14_30:AnimateSequence("Player")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("Player")
		end

		var_14_43:AnimateSequence("Player")
	end

	var_14_0._sequences.Player = var_14_128

	local var_14_129
	local var_14_130 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonOverText", var_14_130)

	local var_14_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonOverText", var_14_131)

	local var_14_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonOverText", var_14_132)

	local var_14_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonOverText", var_14_133)

	local var_14_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonOverText", var_14_134)

	local var_14_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonOverText", var_14_135)

	local var_14_136 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_14_30:RegisterAnimationSequence("ButtonOverText", var_14_136)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_137 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericButton.textFocus
			}
		}

		var_14_35:RegisterAnimationSequence("ButtonOverText", var_14_137)
	end

	local function var_14_138()
		var_14_12:AnimateSequence("ButtonOverText")
		var_14_16:AnimateSequence("ButtonOverText")
		var_14_18:AnimateSequence("ButtonOverText")
		var_14_20:AnimateSequence("ButtonOverText")
		var_14_22:AnimateSequence("ButtonOverText")
		var_14_24:AnimateSequence("ButtonOverText")
		var_14_30:AnimateSequence("ButtonOverText")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ButtonOverText")
		end
	end

	var_14_0._sequences.ButtonOverText = var_14_138

	local var_14_139
	local var_14_140 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_12:RegisterAnimationSequence("ButtonUpText", var_14_140)

	local var_14_141 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_16:RegisterAnimationSequence("ButtonUpText", var_14_141)

	local var_14_142 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_18:RegisterAnimationSequence("ButtonUpText", var_14_142)

	local var_14_143 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_20:RegisterAnimationSequence("ButtonUpText", var_14_143)

	local var_14_144 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_22:RegisterAnimationSequence("ButtonUpText", var_14_144)

	local var_14_145 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_24:RegisterAnimationSequence("ButtonUpText", var_14_145)

	local var_14_146 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_14_30:RegisterAnimationSequence("ButtonUpText", var_14_146)

	if CONDITIONS.AlwaysFalse(var_14_0) then
		local var_14_147 = {
			{
				value = 16777215,
				duration = 0,
				property = TWEEN_PROPERTY.RGB
			}
		}

		var_14_35:RegisterAnimationSequence("ButtonUpText", var_14_147)
	end

	local function var_14_148()
		var_14_12:AnimateSequence("ButtonUpText")
		var_14_16:AnimateSequence("ButtonUpText")
		var_14_18:AnimateSequence("ButtonUpText")
		var_14_20:AnimateSequence("ButtonUpText")
		var_14_22:AnimateSequence("ButtonUpText")
		var_14_24:AnimateSequence("ButtonUpText")
		var_14_30:AnimateSequence("ButtonUpText")

		if CONDITIONS.AlwaysFalse(var_14_0) then
			var_14_35:AnimateSequence("ButtonUpText")
		end
	end

	var_14_0._sequences.ButtonUpText = var_14_148

	PostLoadFunc(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("BRTeamScoreboardRow", BRTeamScoreboardRow)
LockTable(_M)
