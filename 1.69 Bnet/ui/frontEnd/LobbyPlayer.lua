module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = arg_1_0:GetCurrentMenu()

	if var_1_0 and var_1_0.PlayerInfoMouse then
		var_1_0.PlayerInfoMouse:closeTree()

		var_1_0.PlayerInfoMouse = nil
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_0:getParent()

		var_3_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
		var_3_0:dispatchEventToRoot({
			name = "lobby_member_on_over",
			dataSource = var_3_0:GetDataSource(),
			controller = arg_2_1
		})
		var_3_0:SetHandleMouse(true)

		local var_3_1 = arg_2_0:GetCurrentMenu()

		if var_3_1 then
			var_0_0(var_3_0)

			local var_3_2, var_3_3 = var_3_0:getRect()
			local var_3_4, var_3_5 = arg_3_1.root:PixelsToUnits(var_3_2, var_3_3)
			local var_3_6
			local var_3_7 = MenuBuilder.BuildRegisteredType("LobbyGamertagPlayerMouse", {
				controllerIndex = arg_2_1
			})

			var_3_7.id = "PlayerInfoMouse"

			var_3_7:SetDataSourceThroughElement(arg_2_0, nil)
			var_3_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 600, _1080p * 1200, var_3_5, var_3_5 + _1080p * 100)
			var_3_1:addElement(var_3_7)

			var_3_1.PlayerInfoMouse = var_3_7

			ACTIONS.AnimateSequence(var_3_7, "Show")
		end
	end

	local function var_2_1(arg_4_0, arg_4_1)
		arg_4_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)

		if arg_4_0.LobbyGamertagPlayer then
			ACTIONS.AnimateSequence(arg_4_0.LobbyGamertagPlayer, "ButtonUp")
		end

		if arg_4_0.LobbyGamertagPlayerLong then
			ACTIONS.AnimateSequence(arg_4_0.LobbyGamertagPlayerLong, "ButtonUp")
		end

		arg_4_0:SetHandleMouse(false)
		var_0_0(arg_4_0)
	end

	local function var_2_2(arg_5_0, arg_5_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			arg_5_0:dispatchEventToRoot({
				name = "lobby_member_on_over",
				dataSource = arg_5_0:GetDataSource(),
				controller = arg_2_1
			})
			arg_5_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 130)
			ACTIONS.AnimateSequence(arg_5_0, "Expand")

			if arg_5_0.LobbyGamertagPlayer then
				ACTIONS.AnimateSequence(arg_5_0.LobbyGamertagPlayer, "ButtonOver")
			end
		end
	end

	local function var_2_3(arg_6_0, arg_6_1)
		if not LUI.IsLastInputMouseNavigation(arg_2_1) then
			arg_6_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
			ACTIONS.AnimateSequence(arg_6_0, "Contract")

			if arg_6_0.LobbyGamertagPlayer then
				ACTIONS.AnimateSequence(arg_6_0.LobbyGamertagPlayer, "ButtonUp")
			end

			if arg_6_0.LobbyGamertagPlayerLong then
				ACTIONS.AnimateSequence(arg_6_0.LobbyGamertagPlayerLong, "ButtonUp")
			end
		end
	end

	local function var_2_4(arg_7_0, arg_7_1)
		if LUI.IsLastInputMouseNavigation(arg_2_1) then
			arg_7_0.gainFocusSFX = nil
			arg_7_0.shouldPlayButtonSound = false

			arg_7_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)
			ACTIONS.AnimateSequence(arg_7_0, "Contract")

			if arg_7_0.LobbyGamertagPlayer then
				arg_7_0.LobbyGamertagPlayer:SetHandleMouse(false)
			end
		else
			arg_7_0.gainFocusSFX = SOUND_SETS.default.gainFocus
			arg_7_0.shouldPlayButtonSound = true

			if arg_7_0.LobbyGamertagPlayerLong then
				ACTIONS.AnimateSequence(arg_7_0.LobbyGamertagPlayerLong, "ButtonUp")
			end

			ACTIONS.AnimateSequence(arg_7_0, "HidePlayerInfoMouse")

			if arg_7_0.LobbyGamertagPlayer then
				arg_7_0.LobbyGamertagPlayer:SetHandleMouse(true)
			end
		end

		var_0_0(arg_7_0)
	end

	local function var_2_5(arg_8_0, arg_8_1)
		assert(arg_2_1)

		local var_8_0 = arg_8_0:GetDataSource()
		local var_8_1 = var_8_0.memberIndex:GetValue(arg_2_1)
		local var_8_2 = Lobby.CCHEBJJJEB(var_8_1)
		local var_8_3 = var_8_0.isCrossplayPlayer:GetValue(arg_2_1)

		assert(var_8_2)
		LUI.FlowManager.RequestPopupMenu(nil, "LobbyMemberActions", true, arg_2_1, false, {
			xuid = var_8_2,
			isCrossplayPlayer = var_8_3
		})
	end

	arg_2_0.LobbyGamertagPlayerLong:registerEventHandler("mouseenter", var_2_0)
	arg_2_0.LobbyGamertagPlayerLong:registerEventHandler("button_action", var_2_5)
	arg_2_0:registerEventHandler("button_action", function(arg_9_0, arg_9_1)
		if arg_9_1.mouse then
			return true
		end
	end)
	arg_2_0:registerEventHandler("mouseleave", var_2_1)
	arg_2_0:registerEventHandler("update_input_type", var_2_4)
	arg_2_0:registerEventHandler("button_over", var_2_2)
	arg_2_0:registerEventHandler("button_up", var_2_3)
	arg_2_0:registerEventHandler("on_close", var_0_0)
end

local function var_0_2(arg_10_0, arg_10_1, arg_10_2)
	if CONDITIONS.IsThirdGameMode() then
		local function var_10_0()
			local var_11_0 = arg_10_0:GetDataSource().cpFieldUpgrade:GetValue(arg_10_1)

			if var_11_0 and #var_11_0 > 0 then
				local var_11_1 = StringTable.DIFCHIGDFB(CSV.cpFieldUpgrades.file, CSV.cpFieldUpgrades.cols.ref, var_11_0, CSV.cpFieldUpgrades.cols.uiImageSmall)

				arg_10_0.LobbyGamertagPlayer:UpdateRoleIcon(arg_10_1, var_11_1)
				arg_10_0.LobbyGamertagPlayerLong:UpdateRoleIcon(arg_10_1, var_11_1)
			end
		end

		arg_10_0:SubscribeToModelThroughElement(arg_10_0, "cpFieldUpgrade", var_10_0)
	end

	if LUI.IsLastInputMouseNavigation(arg_10_1) then
		arg_10_0.gainFocusSFX = nil
		arg_10_0.shouldPlayButtonSound = false
	else
		arg_10_0.gainFocusSFX = SOUND_SETS.default.gainFocus
		arg_10_0.shouldPlayButtonSound = true
	end

	FRIENDS.SetupLobbyMemberContextualMenu(arg_10_0.LobbyGamertagPlayerLong, arg_10_0, arg_10_1)
	var_0_1(arg_10_0, arg_10_1)
end

function LobbyPlayer(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 989 * _1080p, 0, 40 * _1080p)

	var_12_0.id = "LobbyPlayer"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("LobbyGamertagPlayer", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "LobbyGamertagPlayer"

	var_12_4:SetAlpha(0, 0)
	var_12_4:SetDataSourceThroughElement(var_12_0, nil)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 600, 0, _1080p * 130)
	var_12_0:addElement(var_12_4)

	var_12_0.LobbyGamertagPlayer = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("LobbyGamertagPlayerLong", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "LobbyGamertagPlayerLong"

	var_12_6:SetDataSourceThroughElement(var_12_0, nil)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 545, 0, _1080p * 40)
	var_12_0:addElement(var_12_6)

	var_12_0.LobbyGamertagPlayerLong = var_12_6

	local function var_12_7()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_7

	local var_12_8 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Expand", var_12_8)

	local var_12_9 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Expand", var_12_9)

	local function var_12_10()
		var_12_4:AnimateSequence("Expand")
		var_12_6:AnimateSequence("Expand")
	end

	var_12_0._sequences.Expand = var_12_10

	local var_12_11 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Contract", var_12_11)

	local var_12_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("Contract", var_12_12)

	local function var_12_13()
		var_12_4:AnimateSequence("Contract")
		var_12_6:AnimateSequence("Contract")
	end

	var_12_0._sequences.Contract = var_12_13

	var_12_4:SetDataSourceThroughElement(var_12_0, nil)
	var_12_6:SetDataSourceThroughElement(var_12_0, nil)
	var_0_2(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("LobbyPlayer", LobbyPlayer)
LockTable(_M)
