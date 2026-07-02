module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.WZWipSnipeIcon:UpdateSnipeIcon({
		selected = true,
		gameSourceID = arg_1_1.gameSourceID
	})

	local var_1_0 = arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE and SWATCHES.CH2.SnipeOverlayModernWarfare or SWATCHES.CH2.SnipeOverlayBOColdWar

	var_1_0 = arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD and SWATCHES.WZCH3.WZCH3VanguardGold or var_1_0

	arg_1_0.ProgressableMessage:SetRGBFromTable(var_1_0)

	if arg_1_1.isZombiesTab then
		if arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
			arg_1_0.ProgressableMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ345/PROGRESSABLE_MESSAGE_VG_ZOMBIE"))
			ACTIONS.AnimateSequence(arg_1_0, "VG")
		elseif arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.COLD_WAR then
			arg_1_0.ProgressableMessage:setText(Engine.CBBHFCGDIC("LUA_MENU_ACTOR/PROGRESSABLE_MESSAGE_ZOMBIES"))
		else
			local var_1_1 = "Attempting to access zombie camo tab screen for unsupported GameSourceID: " .. tostring(arg_1_1.gameSourceID)

			DebugPrint(var_1_1)

			if not CONDITIONS.IsQABotSkipActive() then
				LUI.FlowManager.RequestDevErrorPopup(Engine.CBBHFCGDIC("MENU/ERROR"), var_1_1)
			end
		end
	elseif arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.VANGUARD then
		local var_1_2 = Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_VANGUARD")
		local var_1_3 = arg_1_1.isRankedCategory and "WZ_TU_TANGO/PROGESSABLE_MESSAGE" or "WZ_TU_TANGO/PROGRESSABLE_MESSAGE_2"

		arg_1_0.ProgressableMessage:setText(Engine.CBBHFCGDIC(var_1_3, Engine.JCBDICCAH(var_1_2)))
		ACTIONS.AnimateSequence(arg_1_0, "VG")
	else
		local var_1_4 = arg_1_1.gameSourceID == LUI.GAME_SOURCE_ID.MODERN_WARFARE and Engine.CBBHFCGDIC("LUA_MENU/TEXTCHAT_GAMENAME_MW") or Engine.CBBHFCGDIC("WZ_TU_TANGO/BLACK_OPS")

		arg_1_0.ProgressableMessage:setText(Engine.CBBHFCGDIC("WZ_TU_TANGO/PROGRESSABLE_MESSAGE_2", Engine.JCBDICCAH(var_1_4)))
	end

	ACTIONS.AnimateSequence(arg_1_0, "Show")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateMessage = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Hide")
end

function WZSnipeProgressableMessage(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 480 * _1080p, 0, 32 * _1080p)

	var_3_0.id = "WZSnipeProgressableMessage"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "WZWipSnipeIcon"

	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -30, _1080p * 98, 0, _1080p * 32)
	var_3_0:addElement(var_3_4)

	var_3_0.WZWipSnipeIcon = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "ProgressableMessage"

	var_3_6:setText("", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 480, _1080p * 6, _1080p * 26)
	var_3_0:addElement(var_3_6)

	var_3_0.ProgressableMessage = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8
	local var_3_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Show", var_3_9)

	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Show", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("Show")
		var_3_6:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_13)

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_14)

	local function var_3_15()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 89
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 497
		}
	}

	var_3_6:RegisterAnimationSequence("VG", var_3_17)

	local function var_3_18()
		var_3_6:AnimateSequence("VG")
	end

	var_3_0._sequences.VG = var_3_18

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZSnipeProgressableMessage", WZSnipeProgressableMessage)
LockTable(_M)
