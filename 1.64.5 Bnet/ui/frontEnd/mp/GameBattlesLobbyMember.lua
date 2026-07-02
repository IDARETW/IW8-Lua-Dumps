module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.LobbyMember:SetDataSource(arg_1_1, arg_1_2)
end

function PostLoadFunc(arg_2_0, arg_2_1)
	arg_2_0.SetDataSource = var_0_0
end

function GameBattlesLobbyMember(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 38 * _1080p)

	var_3_0.id = "GameBattlesLobbyMember"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("LobbyMember", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "LobbyMember"

	var_3_4.SocialPlatformPresence:SetAlpha(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 38)
	var_3_0:addElement(var_3_4)

	var_3_0.LobbyMember = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("YouIndicatorRight", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "YouIndicatorRight"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -81, _1080p * -6, _1080p * 4, _1080p * 34)
	var_3_0:addElement(var_3_6)

	var_3_0.YouIndicatorRight = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "IsReadyIcon"

	var_3_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("hud_icon_player"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -103, _1080p * -75, _1080p * -14, _1080p * 14)
	var_3_0:addElement(var_3_8)

	var_3_0.IsReadyIcon = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "GameBattlesLogo"

	var_3_10:SetAlpha(0.75, 0)
	var_3_10:setImage(RegisterMaterial("gamebattles_logo_small"), 0)
	var_3_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -31, _1080p * -9, _1080p * 8, _1080p * 30)
	var_3_0:addElement(var_3_10)

	var_3_0.GameBattlesLogo = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("IsMyPlayer", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("IsMyPlayer")
	end

	var_3_0._sequences.IsMyPlayer = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("IsNotMyPlayer", var_3_14)

	local function var_3_15()
		var_3_6:AnimateSequence("IsNotMyPlayer")
	end

	var_3_0._sequences.IsNotMyPlayer = var_3_15

	local var_3_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("IsReady", var_3_16)

	local function var_3_17()
		var_3_8:AnimateSequence("IsReady")
	end

	var_3_0._sequences.IsReady = var_3_17

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("IsNotReady", var_3_18)

	local function var_3_19()
		var_3_8:AnimateSequence("IsNotReady")
	end

	var_3_0._sequences.IsNotReady = var_3_19

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("HideIsReady", var_3_20)

	local function var_3_21()
		var_3_8:AnimateSequence("HideIsReady")
	end

	var_3_0._sequences.HideIsReady = var_3_21

	local var_3_22 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.LobbyMember.SocialPlatformPresence
		}
	}

	var_3_4:RegisterAnimationSequence("ShowPlatform", var_3_22)

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("ShowPlatform", var_3_23)

	local function var_3_24()
		var_3_4:AnimateSequence("ShowPlatform")
		var_3_10:AnimateSequence("ShowPlatform")
	end

	var_3_0._sequences.ShowPlatform = var_3_24

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			child = var_3_0.LobbyMember.SocialPlatformPresence
		}
	}

	var_3_4:RegisterAnimationSequence("HidePlatform", var_3_25)

	local var_3_26 = {
		{
			value = 0.75,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("HidePlatform", var_3_26)

	local function var_3_27()
		var_3_4:AnimateSequence("HidePlatform")
		var_3_10:AnimateSequence("HidePlatform")
	end

	var_3_0._sequences.HidePlatform = var_3_27

	var_3_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GameBattlesLobbyMember", GameBattlesLobbyMember)
LockTable(_M)
