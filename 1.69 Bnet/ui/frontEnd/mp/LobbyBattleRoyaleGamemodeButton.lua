module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._playlistNum = arg_1_1
	arg_1_0._mode = arg_1_2

	arg_1_0.Title:setText(Engine.CBBHFCGDIC(Lobby.BRLobbyPlaylistTitle[arg_1_2]))
	arg_1_0.Desc:setText(Engine.CBBHFCGDIC(Lobby.BRLobbyPlaylistDesc[arg_1_2]))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetDetails = var_0_0

	local function var_2_0(arg_3_0, arg_3_1)
		if arg_2_0._playlistNum then
			DataSources.frontEnd.lobby.battleRoyale.playlist:SetValue(arg_2_1, arg_2_0._playlistNum)
			DataSources.frontEnd.lobby.battleRoyale.selectedMode:SetValue(arg_2_1, arg_2_0._mode)
		end
	end

	arg_2_0:addEventHandler("button_action", var_2_0)
end

function LobbyBattleRoyaleGamemodeButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 200 * _1080p)

	var_4_0.id = "LobbyBattleRoyaleGamemodeButton"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Backer"

	var_4_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_4_4:SetAlpha(0.8, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_4_0:addElement(var_4_4)

	var_4_0.Backer = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("FrameCorners", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "FrameCorners"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.brackets, 0)
	var_4_6:SetAlpha(0.7, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9, _1080p * -9, _1080p * 9, _1080p * -9)
	var_4_0:addElement(var_4_6)

	var_4_0.FrameCorners = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 525, _1080p * 79, _1080p * 109)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIText.new()

	var_4_10.id = "Desc"

	var_4_10:setText("", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Left)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 525, _1080p * 125, _1080p * 147)
	var_4_0:addElement(var_4_10)

	var_4_0.Desc = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "HighlightBottom"

	var_4_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_12:SetAlpha(0, 0)
	var_4_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 3, _1080p * -3, _1080p * -7, _1080p * -3)
	var_4_0:addElement(var_4_12)

	var_4_0.HighlightBottom = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIImage.new()

	var_4_14.id = "HighlightTop"

	var_4_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_14:SetAlpha(0, 0)
	var_4_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * 7)
	var_4_0:addElement(var_4_14)

	var_4_0.HighlightTop = var_4_14

	local var_4_15
	local var_4_16 = LUI.UIImage.new()

	var_4_16.id = "Foreground"

	var_4_16:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_16:SetAlpha(0.4, 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 550, 0, _1080p * 200)
	var_4_0:addElement(var_4_16)

	var_4_0.Foreground = var_4_16

	local function var_4_17()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_17

	local var_4_18 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonOver", var_4_18)

	local var_4_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonOver", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ButtonOver", var_4_20)

	local function var_4_21()
		var_4_12:AnimateSequence("ButtonOver")
		var_4_14:AnimateSequence("ButtonOver")
		var_4_16:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_21

	local var_4_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("ButtonUp", var_4_22)

	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("ButtonUp", var_4_23)

	local var_4_24 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("ButtonUp", var_4_24)

	local function var_4_25()
		var_4_12:AnimateSequence("ButtonUp")
		var_4_14:AnimateSequence("ButtonUp")
		var_4_16:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_25

	var_4_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("LobbyBattleRoyaleGamemodeButton", LobbyBattleRoyaleGamemodeButton)
LockTable(_M)
